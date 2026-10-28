using System.Collections.Generic;
using System.Collections;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

/// <summary>
/// Scene 3 stage-management loop. Binds the authored S3 hierarchy, then runs the
/// rehearsal libretto, multi-point actor path, and prop timing evaluation.
/// </summary>
public class S3StageController : MonoBehaviour
{
    private class PropPlan
    {
        public readonly string name;
        public readonly string targetLabel;
        public readonly string placeLine;
        public readonly string holdLine;
        public readonly string removeLine;
        public Vector2 target;
        public RectTransform targetHint;
        public readonly float placeOpen;
        public readonly float placeDeadline;
        public readonly float removeOpen;
        public readonly float removeDeadline;

        public S3StagePropDraggable instance;
        public S3CueVisual cardVisual;
        public S3CueVisual hintVisual;
        public S3FallingLeaves leaves;
        public bool placedOnTime;
        public bool removedOnTime;
        public bool placementDeadlineRecorded;
        public bool removalDeadlineRecorded;
        public bool blockingActor;
        public bool wrongPlacementRecorded;
        public bool earlyPlacementRecorded;
        public bool earlyRemovalRecorded;
        public bool routeIncidentRecorded;

        public PropPlan(string name, string targetLabel, float placeOpen, float placeDeadline, float removeOpen, float removeDeadline, string placeLine, string holdLine, string removeLine)
        {
            this.name = name;
            this.targetLabel = targetLabel;
            this.placeOpen = placeOpen;
            this.placeDeadline = placeDeadline;
            this.removeOpen = removeOpen;
            this.removeDeadline = removeDeadline;
            this.placeLine = placeLine;
            this.holdLine = holdLine;
            this.removeLine = removeLine;
        }
    }

    private class ActorVisual
    {
        public string objectName;
        public RectTransform rect;
        public Text routeText;
        public Vector3 authoredScale;
        public float authoredLocalZ;
        public S3WaypointPath path;
        public Vector2 lastPlanarPosition;
    }

    private class PathKey
    {
        public float time;
        public int point;
        public string state;
    }

    private class LibrettoBeat
    {
        public float from;
        public float to;
        public string line;
    }

    private readonly List<PropPlan> _plans = new List<PropPlan>();
    private readonly List<ActorVisual> _actors = new List<ActorVisual>();
    private readonly Dictionary<string, RectTransform> _hints = new Dictionary<string, RectTransform>();
    private readonly List<PathKey> _aileenKeys = new List<PathKey>();
    private readonly List<LibrettoBeat> _libretto = new List<LibrettoBeat>();

    private RectTransform _stage;
    private RectTransform _trayContent;
    private RectTransform _dragLayer;
    private Text _instruction;
    private Text _status;
    private Text _routeStatus;
    private Text _result;
    private Canvas _canvas;
    private float _elapsed;
    private int _wrongPlacementCount;
    private int _timingAccidentCount;
    private int _routeBlockCount;
    private bool _showedFinalResult;
    private bool _transitionStarted;
    private bool _leafBurstPlayed;
    private string _lastCueKey;

    private const float ShowEndTime = 64f;

    public RectTransform TrayContent => _trayContent;

    private void Start()
    {
        BindAuthoredScene();
    }

    private void Update()
    {
        if (_stage == null || _showedFinalResult) return;

        _elapsed += Time.deltaTime;
        UpdateActorMovement();
        EvaluateDeadlines();
        CheckActorObstructions();
        UpdateTreeLeaves();
        UpdateTaskPrompt(false);
        UpdateStatusText();

        if (_elapsed >= ShowEndTime)
            FinishPerformance();
    }

    private void BindAuthoredScene()
    {
        Canvas canvas = GetComponentInChildren<Canvas>(true);
        if (canvas == null)
        {
            Debug.LogError("S3StageController requires S3StageCanvas.", this);
            enabled = false;
            return;
        }

        Transform root = canvas.transform;
        _canvas = canvas;
        Canvas.ForceUpdateCanvases();
        _stage = FindRectDeep(root, "SideViewStage");
        _trayContent = FindRectDeep(root, "Content") ?? FindRectDeep(root, "PropTrayContent");
        _dragLayer = FindRectDeep(root, "DragLayer");
        _instruction = FindTextDeep(root, "Instruction");
        _status = FindTextDeep(root, "PerformanceScore");
        _routeStatus = FindTextDeep(root, "RouteStatus");
        _result = FindTextDeep(root, "PreviewResult");

        if (_stage == null || _dragLayer == null || _instruction == null || _status == null || _result == null)
        {
            Debug.LogError("S3 scene hierarchy is incomplete.", this);
            enabled = false;
            return;
        }

        _plans.Clear();
        _actors.Clear();
        _hints.Clear();
        ConfigureLibretto();
        ConfigureTimeline();
        ConfigureActorKeys();

        foreach (PropPlan plan in _plans)
        {
            Transform propTransform = FindDeep(root, "Prop_" + plan.name);
            if (propTransform == null)
            {
                Debug.LogError("Missing authored prop: " + plan.name, this);
                continue;
            }

            S3StagePropDraggable prop = propTransform.GetComponent<S3StagePropDraggable>();
            if (prop == null) prop = propTransform.gameObject.AddComponent<S3StagePropDraggable>();

            Transform trayCell = propTransform.parent;
            RectTransform hintRect = FindRectDeep(_stage, "Hint_" + plan.name);
            if (hintRect != null)
            {
                plan.targetHint = hintRect;
                plan.target = GetHintNormalizedPosition(hintRect);
                _hints[plan.name] = hintRect;
                plan.hintVisual = hintRect.GetComponent<S3CueVisual>();
                if (plan.hintVisual == null) plan.hintVisual = hintRect.gameObject.AddComponent<S3CueVisual>();
            }

            prop.SetStateLabel(FindTextDeep(propTransform, "State"));
            prop.Configure(this, plan.name, trayCell);
            if (hintRect != null) prop.SetStagePresentation(hintRect.sizeDelta, hintRect.localScale);
            plan.instance = prop;
            plan.cardVisual = propTransform.GetComponent<S3CueVisual>();
            if (plan.cardVisual == null) plan.cardVisual = propTransform.gameObject.AddComponent<S3CueVisual>();

            if (plan.name == "树")
            {
                plan.leaves = propTransform.GetComponent<S3FallingLeaves>();
                if (plan.leaves == null) plan.leaves = propTransform.gameObject.AddComponent<S3FallingLeaves>();
                plan.leaves.BindFromHint(hintRect);
            }
        }

        BindActor("Actor_Aileen");
        BindActor("Actor_Lorne");
        HideAllRecommendedPositions();
        BindButton(root, "PreviewButton", ShowCurrentOrFinalReport);
        BindButton(root, "ResetButton", RestartPerformance);
        _result.text = string.Empty;
        UpdateTaskPrompt(true);
        UpdateStatusText();
    }

    private void ConfigureLibretto()
    {
        _libretto.Clear();
        _libretto.Add(new LibrettoBeat { from = 0f, to = 8f, line = "Act 1, Night at the Treeline: plant the old tree upstage left. The tryst is not in the lamps; it is in the shadow of the tree." });
        _libretto.Add(new LibrettoBeat { from = 8f, to = 16f, line = "Aileen loops along the treeline to the tree. When the wind comes, leaves should fall — if the tree isn't set, this beat is empty stage." });
        _libretto.Add(new LibrettoBeat { from = 16f, to = 24f, line = "Act 2, Moonlit Tryst: table, chair, and vase are the bones of the meeting. The apple is her token. Set it on the table edge, and don't block her seat." });
        _libretto.Add(new LibrettoBeat { from = 24f, to = 34f, line = "The tryst is ending. Clear the downstage first: table, chair, vase, and apple, so she has room to loop through." });
        _libretto.Add(new LibrettoBeat { from = 34f, to = 44f, line = "Act 3, Wind and Reset: swap the wings for a crate and a draped crate. She will cross from center to stage right. Don't park the crates in the aisle." });
        _libretto.Add(new LibrettoBeat { from = 44f, to = 54f, line = "Act 4, Distant Shock: the cannon is only a shadow upstage right. When the shock hits, the leaves should fall again, and she withdraws behind the tree." });
        _libretto.Add(new LibrettoBeat { from = 54f, to = 64f, line = "Act 5, Curtain Clear: strike cannon, crates, then the tree. She walks to center downstage. The deck should be clean." });
    }

    private void ConfigureTimeline()
    {
        _plans.Add(new PropPlan("树", "Upstage left · treeline", 0f, 12f, 54f, 62f,
            "Set the old tree at the treeline. Its children are leaves; once it's placed they will fall with the wind.",
            "Keep the tree. She still has to return behind it.",
            "Strike the old tree before curtain. The leaves go back to the tray with it."));
        _plans.Add(new PropPlan("桌子", "Center-left · tryst table", 0f, 14f, 26f, 34f,
            "Place the tryst table center-left, edge toward the path. Don't block the aisle.",
            "The table is still on stage. The token will sit on its edge later.",
            "The tryst is over. Strike the table and open the loop."));
        _plans.Add(new PropPlan("椅子", "Beside the table · seat", 0f, 14f, 26f, 34f,
            "Keep the chair on the outside of the table so she can pass when she sits.",
            "Leave the chair. Strike it when the tryst ends.",
            "Clear the chair too. Downstage needs to be empty."));
        _plans.Add(new PropPlan("花瓶", "On the table · night flowers", 0f, 14f, 26f, 34f,
            "Set the vase inward on the table and leave the edge for the apple.",
            "The vase still dresses this beat. Hold it.",
            "The night flowers leave with the table."));
        _plans.Add(new PropPlan("苹果", "Table edge · token", 12f, 22f, 26f, 34f,
            "Put the apple on the table edge as the token she brought.",
            "The token is still on the table. Take it when she rises.",
            "Take the token with the rest of the tryst."));
        _plans.Add(new PropPlan("木箱", "Stage right wing · reset", 32f, 42f, 54f, 62f,
            "Park the crate in the right wing and leave a gap for the center cross.",
            "Don't let the crate block stage right. She still walks that way.",
            "Clear: crate off."));
        _plans.Add(new PropPlan("盖白布木箱", "Stage left wing · reset", 32f, 42f, 54f, 62f,
            "Set the draped crate in the left wing like a temp cover. Don't let it spill into the aisle.",
            "Hold the left wing like this for now.",
            "Strike the draped crate too."));
        _plans.Add(new PropPlan("大炮", "Upstage right · distant", 42f, 52f, 54f, 62f,
            "The cannon is only far scenery — back and right, not on her retreat.",
            "Leave the distant gun. The shock is brief.",
            "Cannon off. Curtain wants an empty deck."));
    }

    private void ConfigureActorKeys()
    {
        _aileenKeys.Clear();
        _aileenKeys.Add(new PathKey { time = 0f, point = 0, state = "Waiting in the wing" });
        _aileenKeys.Add(new PathKey { time = 4f, point = 1, state = "Looping to the tree" });
        _aileenKeys.Add(new PathKey { time = 14f, point = 1, state = "Listening under the tree" });
        _aileenKeys.Add(new PathKey { time = 18f, point = 2, state = "To the table" });
        _aileenKeys.Add(new PathKey { time = 28f, point = 2, state = "Moonlit Tryst" });
        _aileenKeys.Add(new PathKey { time = 33f, point = 3, state = "Crossing center" });
        _aileenKeys.Add(new PathKey { time = 38f, point = 4, state = "Watching stage right" });
        _aileenKeys.Add(new PathKey { time = 44f, point = 5, state = "Back behind the tree" });
        _aileenKeys.Add(new PathKey { time = 52f, point = 5, state = "Holding still" });
        _aileenKeys.Add(new PathKey { time = 58f, point = 6, state = "Curtain, downstage" });
    }

    private void BindActor(string objectName)
    {
        Transform actor = FindDeep(_stage, objectName);
        if (actor == null || !actor.gameObject.activeInHierarchy) return;

        RectTransform actorRect = actor.GetComponent<RectTransform>();
        S3WaypointPath path = FindPathForActor(objectName);
        if (path == null) path = CreateDefaultWaypoints(objectName, actorRect);
        _actors.Add(new ActorVisual
        {
            objectName = objectName,
            rect = actorRect,
            routeText = FindTextDeep(actor, "ActorRoute"),
            authoredScale = actorRect.localScale,
            authoredLocalZ = actorRect.localPosition.z,
            path = path,
            lastPlanarPosition = StagePlanarPoint(actorRect)
        });
        if (objectName == "Actor_Aileen")
            actorRect.SetAsLastSibling();
    }

    private S3WaypointPath FindPathForActor(string actorName)
    {
        string pathName = "ActorWaypoints_" + actorName.Replace("Actor_", string.Empty);
        Transform existing = FindDeep(_stage, pathName);
        if (existing != null)
        {
            S3WaypointPath path = existing.GetComponent<S3WaypointPath>();
            if (path == null) path = existing.gameObject.AddComponent<S3WaypointPath>();
            return path;
        }

        return null;
    }

    private S3WaypointPath CreateDefaultWaypoints(string actorName, RectTransform actorRect)
    {
        string shortName = actorName.Replace("Actor_", string.Empty);
        GameObject root = new GameObject("ActorWaypoints_" + shortName, typeof(RectTransform), typeof(S3WaypointPath));
        root.transform.SetParent(_stage, false);
        RectTransform rootRect = root.GetComponent<RectTransform>();
        rootRect.anchorMin = Vector2.zero;
        rootRect.anchorMax = Vector2.one;
        rootRect.offsetMin = rootRect.offsetMax = Vector2.zero;

        Vector2[] points =
        {
            new Vector2(.10f, .22f),
            new Vector2(.24f, .42f),
            new Vector2(.36f, .24f),
            new Vector2(.50f, .20f),
            new Vector2(.74f, .26f),
            new Vector2(.22f, .32f),
            new Vector2(.50f, .16f)
        };
        string[] labels = { "01_侧幕入口", "02_树下", "03_桌边密约", "04_中场绕行", "05_右翼", "06_树后隐蔽", "07_谢幕前区" };

        if (actorRect != null)
        {
            Vector3 actorInStage = _stage.InverseTransformPoint(actorRect.position);
            points[0] = new Vector2(actorInStage.x / _stage.rect.width + .5f, actorInStage.y / _stage.rect.height + .5f);
        }

        for (int i = 0; i < points.Length; i++)
        {
            GameObject point = new GameObject(labels[i], typeof(RectTransform), typeof(CanvasRenderer), typeof(Image));
            point.transform.SetParent(root.transform, false);
            RectTransform rect = point.GetComponent<RectTransform>();
            rect.anchorMin = rect.anchorMax = points[i];
            rect.sizeDelta = new Vector2(36f, 36f);
            rect.anchoredPosition = Vector2.zero;
            Image image = point.GetComponent<Image>();
            image.color = new Color(1f, .82f, .28f, .7f);
            image.raycastTarget = false;
        }

        return root.GetComponent<S3WaypointPath>();
    }

    public void BeginPropDrag(S3StagePropDraggable prop)
    {
        if (_showedFinalResult) return;

        PropPlan plan = FindPlan(prop);
        if (plan == null) return;

        if (IsRemovalWindow(plan))
        {
            HideAllRecommendedPositions();
            SetInstruction(plan.removeLine, new Color(.93f, .84f, .52f));
        }
        else
        {
            ShowRecommendedPosition(prop);
            SetInstruction(plan.placeLine, new Color(.85f, .93f, 1f));
        }

        prop.transform.SetParent(_dragLayer, true);
        prop.transform.SetAsLastSibling();
    }

    public void EndPropDrag(S3StagePropDraggable prop, Vector2 screenPosition)
    {
        HideAllRecommendedPositions();
        if (_showedFinalResult) return;

        if (_stage == null || !RectTransformUtility.RectangleContainsScreenPoint(_stage, screenPosition, null))
        {
            ReturnPropToTray(prop);
            return;
        }

        PropPlan plan = FindPlan(prop);
        if (plan == null) return;

        RectTransformUtility.ScreenPointToLocalPointInRectangle(_stage, screenPosition, null, out Vector2 localPosition);
        Vector2 normalized = new Vector2(localPosition.x / _stage.rect.width + .5f, localPosition.y / _stage.rect.height + .5f);
        bool rightPosition = IsWithinTargetRange(plan, screenPosition);
        if (rightPosition) normalized = GetHintNormalizedPosition(plan.targetHint);

        Vector2 anchored = new Vector2((normalized.x - .5f) * _stage.rect.width, (normalized.y - .5f) * _stage.rect.height);
        prop.PlaceOnStage(_stage, anchored, rightPosition);

        if (!rightPosition)
        {
            if (!plan.wrongPlacementRecorded)
            {
                plan.wrongPlacementRecorded = true;
                _wrongPlacementCount++;
            }
            if (plan.cardVisual != null) plan.cardVisual.ShowErrorOutline();
            SetInstruction("\"" + PropDisplay(plan.name) + "\" is off its mark. It can stay, but it will rewrite the picture and may block the path.", new Color(1f, .62f, .4f));
        }
        else if (_elapsed < plan.placeOpen)
        {
            if (!plan.earlyPlacementRecorded)
            {
                plan.earlyPlacementRecorded = true;
                RegisterTimingAccident(plan, "early entrance");
            }
            SetInstruction("The spot is right, but this beat hasn't called for \"" + PropDisplay(plan.name) + "\" yet. It will leak the later turn.", new Color(1f, .74f, .42f));
        }
        else if (_elapsed > plan.placeDeadline)
        {
            if (!plan.placementDeadlineRecorded)
            {
                plan.placementDeadlineRecorded = true;
                RegisterTimingAccident(plan, "late entrance");
            }
            SetInstruction("\"" + PropDisplay(plan.name) + "\" is finally in, but the cue has passed. The rest of the show will have to live with it.", new Color(1f, .62f, .4f));
        }
        else
        {
            plan.placedOnTime = true;
            SetInstruction("\"" + PropDisplay(plan.name) + "\" hit its cue. " + plan.holdLine, new Color(.55f, 1f, .67f));
        }

        UpdateTaskPrompt(true);
    }

    public void ReturnPropToTray(S3StagePropDraggable prop)
    {
        HideAllRecommendedPositions();
        if (prop == null) return;

        PropPlan plan = FindPlan(prop);
        bool wasPlaced = prop.IsPlaced;
        if (plan != null && plan.leaves != null) plan.leaves.SetFalling(false);
        prop.ReturnToTray();

        if (plan == null || !wasPlaced || _showedFinalResult) return;

        if (_elapsed >= plan.removeOpen && _elapsed <= plan.removeDeadline)
        {
            plan.removedOnTime = true;
            SetInstruction("\"" + PropDisplay(plan.name) + "\" is struck clean. " + plan.removeLine, new Color(.55f, 1f, .67f));
        }
        else if (_elapsed < plan.removeOpen)
        {
            if (!plan.earlyRemovalRecorded)
            {
                plan.earlyRemovalRecorded = true;
                RegisterTimingAccident(plan, "early strike");
            }
            SetInstruction("\"" + PropDisplay(plan.name) + "\" left too early. The stage will miss a piece, and the audience will see the hole first.", new Color(1f, .74f, .42f));
        }
        else
        {
            if (!plan.removalDeadlineRecorded)
            {
                plan.removalDeadlineRecorded = true;
                RegisterTimingAccident(plan, "late strike");
            }
            SetInstruction("\"" + PropDisplay(plan.name) + "\" is only leaving now. Those last seconds already snagged the path.", new Color(1f, .62f, .4f));
        }

        UpdateTaskPrompt(true);
    }

    public void ShowRecommendedPosition(S3StagePropDraggable prop)
    {
        HideAllRecommendedPositions();
        PropPlan plan = FindPlan(prop);
        if (plan != null && !IsRemovalWindow(plan) && _hints.TryGetValue(plan.name, out RectTransform hint))
        {
            hint.gameObject.SetActive(true);
            HideHintChildren(hint);
            if (plan.hintVisual != null) plan.hintVisual.SetHighlighted(true);
        }
    }

    private void EvaluateDeadlines()
    {
        foreach (PropPlan plan in _plans)
        {
            if (_elapsed > plan.placeDeadline && !plan.placedOnTime && !plan.placementDeadlineRecorded)
            {
                plan.placementDeadlineRecorded = true;
                RegisterTimingAccident(plan, "missed entrance");
            }

            if (_elapsed > plan.removeDeadline && plan.instance != null && plan.instance.IsPlaced && !plan.removalDeadlineRecorded)
            {
                plan.removalDeadlineRecorded = true;
                RegisterTimingAccident(plan, "missed strike");
            }
        }
    }

    private void CheckActorObstructions()
    {
        bool anyBlocking = false;
        foreach (PropPlan plan in _plans)
        {
            if (plan.instance == null || !plan.instance.IsPlaced) continue;

            bool blocking = false;
            RectTransform propRect = plan.instance.GetComponent<RectTransform>();
            foreach (ActorVisual actor in _actors)
            {
                if (actor.rect == null || actor.rect.name != "Actor_Aileen") continue;
                if (ActorAnchorBlockedByProp(actor.rect, propRect))
                {
                    blocking = true;
                    break;
                }
            }

            if (blocking && !plan.blockingActor)
            {
                plan.blockingActor = true;
                if (!plan.routeIncidentRecorded)
                {
                    plan.routeIncidentRecorded = true;
                    _routeBlockCount++;
                }
                SetInstruction("Her path is blocked by \"" + PropDisplay(plan.name) + "\". Move it, or strike it, before she stops in front of a prop.", new Color(1f, .45f, .35f));
            }
            else if (!blocking)
            {
                plan.blockingActor = false;
            }

            anyBlocking |= blocking;
        }

        if (_routeStatus != null)
        {
            _routeStatus.text = anyBlocking ? "Path: blocked" : "Path: clear";
            _routeStatus.color = anyBlocking ? new Color(1f, .55f, .35f) : new Color(.55f, 1f, .66f);
        }
    }

    private void UpdateActorMovement()
    {
        for (int i = 0; i < _actors.Count; i++)
        {
            ActorVisual actor = _actors[i];
            if (actor.path == null || actor.path.Count == 0) continue;

            EvaluatePath(actor, _aileenKeys);
        }
    }

    private void EvaluatePath(ActorVisual actor, List<PathKey> keys)
    {
        if (keys == null || keys.Count == 0) return;

        PathKey current = keys[0];
        PathKey next = keys[keys.Count - 1];
        for (int i = 0; i < keys.Count - 1; i++)
        {
            if (_elapsed >= keys[i].time && _elapsed <= keys[i + 1].time)
            {
                current = keys[i];
                next = keys[i + 1];
                break;
            }
            if (_elapsed > keys[i + 1].time)
            {
                current = keys[i + 1];
                next = keys[i + 1];
            }
        }

        RectTransform from = actor.path.GetPoint(Mathf.Clamp(current.point, 0, actor.path.Count - 1));
        RectTransform to = actor.path.GetPoint(Mathf.Clamp(next.point, 0, actor.path.Count - 1));
        if (from == null) return;
        if (to == null) to = from;

        float span = Mathf.Max(.0001f, next.time - current.time);
        float t = current == next ? 1f : Mathf.Clamp01((_elapsed - current.time) / span);
        t = t * t * (3f - 2f * t);
        Vector3 fromPlanar = PlanarWorldPoint(from.position);
        Vector3 toPlanar = PlanarWorldPoint(to.position);
        actor.rect.position = Vector3.Lerp(fromPlanar, toPlanar, t);
        Vector3 local = actor.rect.localPosition;
        local.z = actor.authoredLocalZ;
        actor.rect.localPosition = local;
        if (actor.objectName == "Actor_Aileen")
            actor.rect.SetAsLastSibling();

        Vector2 fromXY = StagePlanarPoint(from);
        Vector2 toXY = StagePlanarPoint(to);
        float travelX = toXY.x - fromXY.x;
        if (Mathf.Abs(travelX) > .4f)
        {
            float magnitude = Mathf.Abs(actor.authoredScale.x);
            if (magnitude < .001f) magnitude = 1f;
            actor.rect.localScale = new Vector3(
                travelX > 0f ? -magnitude : magnitude,
                actor.authoredScale.y,
                actor.authoredScale.z);
        }
        actor.lastPlanarPosition = StagePlanarPoint(actor.rect);

        string state = next.state;
        if (actor.routeText != null) actor.routeText.text = state;
    }

    private void UpdateTreeLeaves()
    {
        foreach (PropPlan plan in _plans)
        {
            if (plan.leaves == null || plan.instance == null) continue;
            bool onStage = plan.instance.IsPlaced;
            plan.leaves.SetFalling(onStage && _elapsed >= 6f);
            if (onStage && _elapsed >= 8f && _elapsed < 42f) plan.leaves.SetWind(1f);
            if (onStage && _elapsed >= 42f && _elapsed < 52f)
            {
                plan.leaves.SetWind(2.2f);
                if (!_leafBurstPlayed)
                {
                    plan.leaves.Burst();
                    _leafBurstPlayed = true;
                }
            }
        }
    }

    private void UpdateTaskPrompt(bool force)
    {
        PropPlan cue = FindPriorityPlan();
        string key;
        string message;
        Color color;

        bool blocking = false;
        foreach (PropPlan plan in _plans)
            if (plan.blockingActor) blocking = true;

        if (blocking)
        {
            key = "block";
            message = "Clear the path first. A prop can be off its mark, but she cannot stop in front of an obstacle.";
            color = new Color(1f, .5f, .38f);
        }
        else if (cue != null && cue.instance != null && !cue.instance.IsPlaced && _elapsed >= cue.placeOpen)
        {
            key = "place_" + cue.name;
            message = cue.placeLine + "  Due " + TimeLabel(cue.placeDeadline) + ".";
            color = new Color(1f, .9f, .5f);
        }
        else if (cue != null && cue.instance != null && cue.instance.IsPlaced && _elapsed >= cue.removeOpen)
        {
            key = "remove_" + cue.name;
            message = cue.removeLine + "  Due " + TimeLabel(cue.removeDeadline) + ".";
            color = new Color(1f, .82f, .48f);
        }
        else
        {
            LibrettoBeat beat = CurrentLibretto();
            key = beat == null ? "waiting" : "libretto_" + beat.from;
            message = beat == null ? "Between cues. Watch where she goes next, then decide what to move." : beat.line;
            color = new Color(.86f, .91f, 1f);
        }

        if (force || key != _lastCueKey)
        {
            _lastCueKey = key;
            SetInstruction(message, color);
            SetCueHighlight(cue);
        }
    }

    private LibrettoBeat CurrentLibretto()
    {
        foreach (LibrettoBeat beat in _libretto)
            if (_elapsed >= beat.from && _elapsed < beat.to) return beat;
        return _libretto.Count > 0 ? _libretto[_libretto.Count - 1] : null;
    }

    private PropPlan FindPriorityPlan()
    {
        PropPlan removeCue = null;
        int removeRank = int.MaxValue;
        foreach (PropPlan plan in _plans)
        {
            if (plan.instance == null || !plan.instance.IsPlaced || plan.removedOnTime) continue;
            if (_elapsed < plan.removeOpen || _elapsed > plan.removeDeadline) continue;
            int rank = RemovalPriority(plan.name);
            if (rank < removeRank)
            {
                removeRank = rank;
                removeCue = plan;
            }
        }
        if (removeCue != null) return removeCue;

        foreach (PropPlan plan in _plans)
            if (plan.instance != null && !plan.instance.IsPlaced &&
                _elapsed >= plan.placeOpen && _elapsed <= plan.placeDeadline) return plan;

        return null;
    }

    private static int RemovalPriority(string name)
    {
        switch (name)
        {
            case "苹果": return 0;
            case "花瓶": return 1;
            case "椅子": return 2;
            case "桌子": return 3;
            default: return 10;
        }
    }

    private PropPlan FindPlan(S3StagePropDraggable prop)
    {
        foreach (PropPlan plan in _plans)
            if (plan.instance == prop) return plan;
        return null;
    }

    private bool IsRemovalWindow(PropPlan plan)
    {
        return plan != null && plan.instance != null && plan.instance.IsPlaced && _elapsed >= plan.removeOpen;
    }

    private static bool IsWithinTargetRange(PropPlan plan, Vector2 screenPosition)
    {
        if (plan == null || plan.targetHint == null) return false;

        RectTransformUtility.ScreenPointToLocalPointInRectangle(plan.targetHint, screenPosition, null, out Vector2 localPoint);
        Rect acceptedArea = plan.targetHint.rect;
        const float dropPadding = 32f;
        acceptedArea.xMin -= dropPadding;
        acceptedArea.xMax += dropPadding;
        acceptedArea.yMin -= dropPadding;
        acceptedArea.yMax += dropPadding;
        return acceptedArea.Contains(localPoint);
    }

    private Vector2 GetHintNormalizedPosition(RectTransform hint)
    {
        if (hint == null || _stage == null) return Vector2.zero;
        Vector3 hintCenterInWorld = hint.TransformPoint(hint.rect.center);
        hintCenterInWorld.z = _stage.position.z;
        Vector3 hintCenterInStage = _stage.InverseTransformPoint(hintCenterInWorld);
        return new Vector2(
            hintCenterInStage.x / _stage.rect.width + .5f,
            hintCenterInStage.y / _stage.rect.height + .5f);
    }

    private void RegisterTimingAccident(PropPlan plan, string reason)
    {
        _timingAccidentCount++;
        Debug.Log("S3 timing accident: " + plan.name + " - " + reason, this);
    }

    private void UpdateStatusText()
    {
        _status.text = "Show time " + TimeLabel(_elapsed) + "  ·  " + TotalAccidents + " incidents";
        _status.color = TotalAccidents == 0 ? new Color(.65f, .92f, 1f) : new Color(1f, .69f, .42f);
    }

    private int TotalAccidents => _wrongPlacementCount + _timingAccidentCount + _routeBlockCount;

    private void ShowCurrentOrFinalReport()
    {
        if (_showedFinalResult) return;
        _result.text = "Still running: " + TotalAccidents + " incidents so far. The show will score itself at the end.";
        _result.color = new Color(.9f, .83f, .52f);
    }

    private void FinishPerformance()
    {
        _showedFinalResult = true;
        HideAllRecommendedPositions();

        string title;
        string detail;
        Color color;
        bool requiresAttention = TotalAccidents > 3;
        if (TotalAccidents == 0)
        {
            title = "Best performance";
            detail = "Cues landed on the beat, and her path stayed open. The tryst kept the tree-shadow until the end.";
            color = new Color(.55f, 1f, .67f);
        }
        else if (TotalAccidents <= 3)
        {
            title = "A few incidents, still strong";
            detail = "The play finished, with " + TotalAccidents + " calls worth a second look.";
            color = new Color(1f, .84f, .43f);
        }
        else
        {
            title = "Needs more work";
            detail = "This run had " + TotalAccidents + " incidents. Next time watch the tree, the apple on the table edge, then the reset cross.";
            color = new Color(1f, .56f, .4f);
        }

        _result.text = title + "\n" + detail;
        _result.color = color;
        SetInstruction("The show is over. Press Replay to run it from the top.", color);
        _status.text = "Scored  ·  " + TotalAccidents + " incidents";
        StageEndingResult.Set(title, detail, TotalAccidents, requiresAttention);
        if (!_transitionStarted) StartCoroutine(TransitionToS4());
    }

    private IEnumerator TransitionToS4()
    {
        _transitionStarted = true;
        if (_canvas == null || !Application.CanStreamedLevelBeLoaded("S4")) yield break;

        Image blackout = CreateBlackout(_canvas.transform, "S3Blackout");
        yield return FadeBlackout(blackout, 0f, 1f, .55f);
        SceneManager.LoadScene("S4");
    }

    private static Image CreateBlackout(Transform parent, string objectName)
    {
        GameObject go = new GameObject(objectName, typeof(RectTransform), typeof(Image));
        go.transform.SetParent(parent, false);
        RectTransform rect = go.GetComponent<RectTransform>();
        rect.anchorMin = Vector2.zero;
        rect.anchorMax = Vector2.one;
        rect.offsetMin = rect.offsetMax = Vector2.zero;
        Image image = go.GetComponent<Image>();
        image.color = new Color(0f, 0f, 0f, 0f);
        image.raycastTarget = true;
        go.transform.SetAsLastSibling();
        return image;
    }

    private static IEnumerator FadeBlackout(Image image, float from, float to, float duration)
    {
        float elapsed = 0f;
        while (elapsed < duration)
        {
            elapsed += Time.unscaledDeltaTime;
            Color color = image.color;
            color.a = Mathf.Lerp(from, to, elapsed / duration);
            image.color = color;
            yield return null;
        }
    }

    private void RestartPerformance()
    {
        foreach (PropPlan plan in _plans)
        {
            if (plan.leaves != null) plan.leaves.SetFalling(false);
            if (plan.instance != null) plan.instance.ReturnToTray();
            plan.placedOnTime = false;
            plan.removedOnTime = false;
            plan.placementDeadlineRecorded = false;
            plan.removalDeadlineRecorded = false;
            plan.blockingActor = false;
            plan.wrongPlacementRecorded = false;
            plan.earlyPlacementRecorded = false;
            plan.earlyRemovalRecorded = false;
            plan.routeIncidentRecorded = false;
        }

        _elapsed = 0f;
        _wrongPlacementCount = 0;
        _timingAccidentCount = 0;
        _routeBlockCount = 0;
        _showedFinalResult = false;
        _leafBurstPlayed = false;
        _lastCueKey = null;
        _result.text = string.Empty;
        HideAllRecommendedPositions();
        UpdateTaskPrompt(true);
        UpdateStatusText();
    }

    private const float AileenAnchorBlockRadius = 48f;

    /// <summary>
    /// Aileen is blocked only when another object's pivot sits inside a small
    /// radius around her own pivot. Large sprite overlap is ignored.
    /// </summary>
    private bool ActorAnchorBlockedByProp(RectTransform actor, RectTransform prop)
    {
        if (actor == null || prop == null || _stage == null) return false;
        return Vector2.Distance(StagePlanarPoint(actor), StagePlanarPoint(prop)) <= AileenAnchorBlockRadius;
    }

    private Vector3 PlanarWorldPoint(Vector3 world)
    {
        if (_stage != null) world.z = _stage.position.z;
        return world;
    }

    private Vector2 StagePlanarPoint(RectTransform rect)
    {
        if (rect == null || _stage == null) return Vector2.zero;
        Vector3 world = PlanarWorldPoint(rect.position);
        Vector3 local = _stage.InverseTransformPoint(world);
        return new Vector2(local.x, local.y);
    }

    private static void HideHintChildren(RectTransform hint)
    {
        if (hint == null) return;
        for (int i = 0; i < hint.childCount; i++)
            hint.GetChild(i).gameObject.SetActive(false);
    }

    private void HideAllRecommendedPositions()
    {
        foreach (PropPlan plan in _plans)
            if (plan.hintVisual != null) plan.hintVisual.SetHighlighted(false);

        foreach (RectTransform hint in _hints.Values)
            if (hint != null) hint.gameObject.SetActive(false);
    }

    private void SetCueHighlight(PropPlan cue)
    {
        foreach (PropPlan plan in _plans)
            if (plan.cardVisual != null) plan.cardVisual.SetHighlighted(false);

        if (cue != null && cue.cardVisual != null)
            cue.cardVisual.SetHighlighted(true);
    }

    private static Transform FindDeep(Transform root, string objectName)
    {
        if (root == null) return null;
        if (root.name == objectName) return root;
        for (int i = 0; i < root.childCount; i++)
        {
            Transform found = FindDeep(root.GetChild(i), objectName);
            if (found != null) return found;
        }
        return null;
    }

    private static RectTransform FindRectDeep(Transform root, string objectName)
    {
        Transform found = FindDeep(root, objectName);
        return found == null ? null : found.GetComponent<RectTransform>();
    }

    private static Text FindTextDeep(Transform root, string objectName)
    {
        Transform found = FindDeep(root, objectName);
        return found == null ? null : found.GetComponent<Text>();
    }

    private static void BindButton(Transform root, string objectName, UnityEngine.Events.UnityAction action)
    {
        Transform found = FindDeep(root, objectName);
        Button button = found == null ? null : found.GetComponent<Button>();
        if (button != null)
        {
            button.onClick.RemoveAllListeners();
            button.onClick.AddListener(action);
        }
    }

    private static string PropDisplay(string name)
    {
        switch (name)
        {
            case "树": return "Tree";
            case "桌子": return "Table";
            case "椅子": return "Chair";
            case "花瓶": return "Vase";
            case "苹果": return "Apple";
            case "木箱": return "Crate";
            case "盖白布木箱": return "Draped Crate";
            case "大炮": return "Cannon";
            default: return name;
        }
    }

    private void SetInstruction(string message, Color color)
    {
        _instruction.text = message;
        _instruction.color = color;
    }

    private static string TimeLabel(float seconds)
    {
        int wholeSeconds = Mathf.Max(0, Mathf.CeilToInt(seconds));
        return "00:" + wholeSeconds.ToString("00");
    }
}
