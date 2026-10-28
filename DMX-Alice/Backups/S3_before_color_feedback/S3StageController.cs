using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

/// <summary>
/// Scene 3 stage-management loop. All prop cards, target hints and actor art are
/// authored in S3; this script only supplies the cue timeline and evaluation.
/// </summary>
public class S3StageController : MonoBehaviour
{
    private class PropPlan
    {
        public readonly string name;
        public readonly string targetLabel;
        public Vector2 target;
        public readonly float placeOpen;
        public readonly float placeDeadline;
        public readonly float removeOpen;
        public readonly float removeDeadline;

        public S3StagePropDraggable instance;
        public S3CueVisual cardVisual;
        public S3CueVisual hintVisual;
        public bool placedOnTime;
        public bool removedOnTime;
        public bool placementDeadlineRecorded;
        public bool removalDeadlineRecorded;
        public bool blockingActor;
        public bool wrongPlacementRecorded;
        public bool earlyPlacementRecorded;
        public bool earlyRemovalRecorded;
        public bool routeIncidentRecorded;

        public PropPlan(string name, string targetLabel, float placeOpen, float placeDeadline, float removeOpen, float removeDeadline)
        {
            this.name = name;
            this.targetLabel = targetLabel;
            this.placeOpen = placeOpen;
            this.placeDeadline = placeDeadline;
            this.removeOpen = removeOpen;
            this.removeDeadline = removeDeadline;
        }
    }

    private class ActorVisual
    {
        public RectTransform rect;
        public Text routeText;
        public float direction;
    }

    private readonly List<PropPlan> _plans = new List<PropPlan>();
    private readonly List<ActorVisual> _actors = new List<ActorVisual>();
    private readonly Dictionary<string, RectTransform> _hints = new Dictionary<string, RectTransform>();

    private RectTransform _stage;
    private RectTransform _trayContent;
    private RectTransform _dragLayer;
    private Text _instruction;
    private Text _status;
    private Text _routeStatus;
    private Text _result;
    private float _elapsed;
    private float _actorTime;
    private int _wrongPlacementCount;
    private int _timingAccidentCount;
    private int _routeBlockCount;
    private bool _showedFinalResult;
    private string _lastCueKey;

    private const float ShowEndTime = 58f;

    public RectTransform TrayContent => _trayContent;

    private void Start()
    {
        BindAuthoredScene();
    }

    private void Update()
    {
        if (_stage == null || _showedFinalResult) return;

        _elapsed += Time.deltaTime;
        _actorTime += Time.deltaTime;
        UpdateActorMovement();
        EvaluateDeadlines();
        CheckActorObstructions();
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
        _stage = FindRect(root, "StageFrame/SideViewStage");
        _trayContent = FindRect(root, "PropTray/PropTrayContent");
        _dragLayer = FindRect(root, "DragLayer");
        _instruction = FindText(root, "InstructionPanel/Instruction");
        _status = FindText(root, "PerformanceScore");
        _routeStatus = FindText(root, "StageFrame/SideViewStage/RouteStatus");
        _result = FindText(root, "PreviewResult");

        if (_stage == null || _trayContent == null || _dragLayer == null || _instruction == null || _status == null || _result == null)
        {
            Debug.LogError("S3 scene hierarchy is incomplete.", this);
            enabled = false;
            return;
        }

        _plans.Clear();
        _actors.Clear();
        _hints.Clear();
        ConfigureTimeline();

        foreach (PropPlan plan in _plans)
        {
            Transform propTransform = root.Find("PropTray/PropTrayContent/Prop_" + plan.name);
            if (propTransform == null)
            {
                Debug.LogError("Missing authored prop: " + plan.name, this);
                continue;
            }

            S3StagePropDraggable prop = propTransform.GetComponent<S3StagePropDraggable>();
            if (prop == null) prop = propTransform.gameObject.AddComponent<S3StagePropDraggable>();

            RectTransform propRect = propTransform.GetComponent<RectTransform>();
            RectTransform hintRect = FindRect(_stage, "Hint_" + plan.name);
            if (hintRect != null)
            {
                plan.target = hintRect.anchorMin;
                _hints[plan.name] = hintRect;
                plan.hintVisual = hintRect.GetComponent<S3CueVisual>();
                if (plan.hintVisual == null) plan.hintVisual = hintRect.gameObject.AddComponent<S3CueVisual>();
            }

            prop.SetStateLabel(FindText(propTransform, "State"));
            prop.Configure(this, plan.name, propRect.anchorMin, propRect.sizeDelta, propTransform.GetComponent<Image>().color);
            plan.instance = prop;
            plan.cardVisual = propTransform.GetComponent<S3CueVisual>();
            if (plan.cardVisual == null) plan.cardVisual = propTransform.gameObject.AddComponent<S3CueVisual>();
        }

        BindActor("Actor_Aileen", 1f);
        HideAllRecommendedPositions();
        BindButton(root, "InstructionPanel/PreviewButton", ShowCurrentOrFinalReport);
        BindButton(root, "InstructionPanel/ResetButton", RestartPerformance);
        SetButtonLabel(root, "InstructionPanel/PreviewButton", "演出报告");
        SetButtonLabel(root, "InstructionPanel/ResetButton", "重新演出");
        _result.text = string.Empty;
        UpdateTaskPrompt(true);
        UpdateStatusText();
    }

    // Each time value is seconds from the beginning of the performance.
    private void ConfigureTimeline()
    {
        _plans.Add(new PropPlan("树", "左后场 · 森林入口", 0f, 12f, 40f, 48f));
        _plans.Add(new PropPlan("桌子", "左侧 · 会面区", 0f, 12f, 20f, 30f));
        _plans.Add(new PropPlan("椅子", "桌旁 · 会面区", 0f, 12f, 20f, 30f));
        _plans.Add(new PropPlan("花瓶", "桌面 · 会面区", 0f, 12f, 20f, 30f));
        _plans.Add(new PropPlan("木箱", "右侧翼 · 待运区", 20f, 30f, 48f, 56f));
        _plans.Add(new PropPlan("盖白布木箱", "左侧翼 · 备用坐具", 20f, 30f, 48f, 56f));
        _plans.Add(new PropPlan("大炮", "右后场 · 战事远景", 30f, 40f, 48f, 56f));
    }

    private void BindActor(string objectName, float direction)
    {
        Transform actor = _stage.Find(objectName);
        if (actor == null || !actor.gameObject.activeInHierarchy) return;

        Text route = FindText(actor, "ActorRoute");
        _actors.Add(new ActorVisual { rect = actor.GetComponent<RectTransform>(), routeText = route, direction = direction });
    }

    public void BeginPropDrag(S3StagePropDraggable prop)
    {
        if (_showedFinalResult) return;

        PropPlan plan = FindPlan(prop);
        if (plan == null) return;

        if (IsRemovalWindow(plan))
        {
            HideAllRecommendedPositions();
            SetInstruction("撤场提示：现在请将「" + plan.name + "」拖回道具栏。", new Color(.9f, .82f, .5f));
        }
        else
        {
            ShowRecommendedPosition(prop);
            SetInstruction("上场提示：将「" + plan.name + "」放到发光推荐位置。", new Color(.85f, .93f, 1f));
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
        bool rightPosition = Vector2.Distance(normalized, plan.target) <= .075f;
        if (rightPosition) normalized = plan.target;

        Vector2 anchored = new Vector2((normalized.x - .5f) * _stage.rect.width, (normalized.y - .5f) * _stage.rect.height);
        prop.PlaceOnStage(_stage, anchored, rightPosition);

        if (!rightPosition)
        {
            if (!plan.wrongPlacementRecorded)
            {
                plan.wrongPlacementRecorded = true;
                _wrongPlacementCount++;
            }
            SetInstruction("「" + plan.name + "」位置不对，且可能挡住演员动线。可以再次拖动调整。", new Color(1f, .62f, .4f));
        }
        else if (_elapsed < plan.placeOpen)
        {
            if (!plan.earlyPlacementRecorded)
            {
                plan.earlyPlacementRecorded = true;
                RegisterTimingAccident(plan, "提前上场");
            }
            SetInstruction("「" + plan.name + "」位置正确，但现在还未到上场时间。", new Color(1f, .74f, .42f));
        }
        else if (_elapsed > plan.placeDeadline)
        {
            if (!plan.placementDeadlineRecorded)
            {
                plan.placementDeadlineRecorded = true;
                RegisterTimingAccident(plan, "上场迟到");
            }
            SetInstruction("「" + plan.name + "」已放好，但错过了上场节点。", new Color(1f, .62f, .4f));
        }
        else
        {
            plan.placedOnTime = true;
            SetInstruction("「" + plan.name + "」已按时就位。留意后续的撤场提示。", new Color(.55f, 1f, .67f));
        }

        UpdateTaskPrompt(true);
    }

    public void ReturnPropToTray(S3StagePropDraggable prop)
    {
        HideAllRecommendedPositions();
        if (prop == null) return;

        PropPlan plan = FindPlan(prop);
        bool wasPlaced = prop.IsPlaced;
        prop.ReturnToTray();

        if (plan == null || !wasPlaced || _showedFinalResult) return;

        if (_elapsed >= plan.removeOpen && _elapsed <= plan.removeDeadline)
        {
            plan.removedOnTime = true;
            SetInstruction("「" + plan.name + "」已按时撤下，转场通道保持安全。", new Color(.55f, 1f, .67f));
        }
        else if (_elapsed < plan.removeOpen)
        {
            if (!plan.earlyRemovalRecorded)
            {
                plan.earlyRemovalRecorded = true;
                RegisterTimingAccident(plan, "提前撤场");
            }
            SetInstruction("「" + plan.name + "」撤得太早，会造成舞台画面缺失。", new Color(1f, .74f, .42f));
        }
        else
        {
            if (!plan.removalDeadlineRecorded)
            {
                plan.removalDeadlineRecorded = true;
                RegisterTimingAccident(plan, "撤场迟到");
            }
            SetInstruction("「" + plan.name + "」已撤下，但它刚才影响了演出。", new Color(1f, .62f, .4f));
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
                RegisterTimingAccident(plan, "未按时上场");
            }

            if (_elapsed > plan.removeDeadline && plan.instance != null && plan.instance.IsPlaced && !plan.removalDeadlineRecorded)
            {
                plan.removalDeadlineRecorded = true;
                RegisterTimingAccident(plan, "未按时撤场");
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
                if (RectanglesOverlapWithinStage(propRect, actor.rect))
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
                SetInstruction("动线事故：「" + plan.name + "」挡住了演员，请立即移动或撤下。", new Color(1f, .45f, .35f));
            }
            else if (!blocking)
            {
                plan.blockingActor = false;
            }

            anyBlocking |= blocking;
        }

        if (_routeStatus != null)
        {
            _routeStatus.text = anyBlocking ? "演员动线：受阻，请清理舞台前区" : "演员动线：畅通";
            _routeStatus.color = anyBlocking ? new Color(1f, .55f, .35f) : new Color(.55f, 1f, .66f);
        }
    }

    private void UpdateActorMovement()
    {
        float x;
        string state;
        if (_elapsed < 3f)
        {
            x = Mathf.Lerp(.1f, .31f, _elapsed / 3f);
            state = "入场中";
        }
        else if (_elapsed < 20f)
        {
            x = .31f;
            state = "停留表演";
        }
        else if (_elapsed < 23f)
        {
            x = Mathf.Lerp(.31f, .7f, (_elapsed - 20f) / 3f);
            state = "转场移动";
        }
        else if (_elapsed < 40f)
        {
            x = .7f;
            state = "停留表演";
        }
        else if (_elapsed < 43f)
        {
            x = Mathf.Lerp(.7f, .28f, (_elapsed - 40f) / 3f);
            state = "谢幕走位";
        }
        else
        {
            x = .28f;
            state = "停留谢幕";
        }

        for (int i = 0; i < _actors.Count; i++)
        {
            ActorVisual actor = _actors[i];
            // Keep the performer on the front walking lane; correctly placed set
            // pieces sit slightly upstage and should not create a false collision.
            SetNormalizedPosition(actor.rect, new Vector2(actor.direction > 0f ? x : 1f - x, .14f));
            if (actor.routeText != null) actor.routeText.text = state;
        }
    }

    private void UpdateTaskPrompt(bool force)
    {
        PropPlan cue = FindPriorityPlan();
        string key;
        string message;
        Color color;

        if (cue == null)
        {
            key = "waiting";
            message = "当前没有紧急任务。留意下一次上场或撤场提示，并保持演员动线畅通。";
            color = Color.white;
        }
        else if (cue.instance == null || !cue.instance.IsPlaced)
        {
            if (_elapsed < cue.placeOpen)
            {
                key = "standby_" + cue.name;
                message = "待命：下一件道具是「" + cue.name + "」，请在 " + TimeLabel(cue.placeOpen) + " 后上场。";
                color = new Color(.78f, .87f, 1f);
            }
            else
            {
                key = "place_" + cue.name;
                message = "当前任务：将「" + cue.name + "」放到推荐位置；截止 " + TimeLabel(cue.placeDeadline) + "。";
                color = new Color(1f, .9f, .5f);
            }
        }
        else if (!cue.removedOnTime && _elapsed < cue.removeOpen)
        {
            key = "hold_" + cue.name;
            message = "保持「" + cue.name + "」在台上；到 " + TimeLabel(cue.removeOpen) + " 后撤下。";
            color = new Color(.75f, .91f, 1f);
        }
        else
        {
            key = "remove_" + cue.name;
            message = "当前任务：将「" + cue.name + "」撤回道具栏；截止 " + TimeLabel(cue.removeDeadline) + "。";
            color = new Color(1f, .82f, .48f);
        }

        if (force || key != _lastCueKey)
        {
            _lastCueKey = key;
            SetInstruction(message, color);
            SetCueHighlight(cue);
        }
    }

    private PropPlan FindPriorityPlan()
    {
        foreach (PropPlan plan in _plans)
            if (plan.instance != null && plan.instance.IsPlaced && !plan.removedOnTime &&
                _elapsed >= plan.removeOpen && _elapsed <= plan.removeDeadline) return plan;

        foreach (PropPlan plan in _plans)
            if (plan.instance != null && !plan.instance.IsPlaced &&
                _elapsed >= plan.placeOpen && _elapsed <= plan.placeDeadline) return plan;

        foreach (PropPlan plan in _plans)
            if (plan.instance != null && !plan.instance.IsPlaced && _elapsed < plan.placeOpen) return plan;

        foreach (PropPlan plan in _plans)
            if (plan.instance != null && plan.instance.IsPlaced && !plan.removedOnTime && _elapsed < plan.removeOpen) return plan;

        return null;
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

    private void RegisterTimingAccident(PropPlan plan, string reason)
    {
        _timingAccidentCount++;
        Debug.Log("S3 timing accident: " + plan.name + " - " + reason, this);
    }

    private void UpdateStatusText()
    {
        _status.text = "演出时间 " + TimeLabel(_elapsed) + "  ·  事故 " + TotalAccidents + " 次";
        _status.color = TotalAccidents == 0 ? new Color(.65f, .92f, 1f) : new Color(1f, .69f, .42f);
    }

    private int TotalAccidents => _wrongPlacementCount + _timingAccidentCount + _routeBlockCount;

    private void ShowCurrentOrFinalReport()
    {
        if (_showedFinalResult) return;
        _result.text = "演出仍在进行：目前记录到 " + TotalAccidents + " 次事故。完成全部时间节点后将自动结算。";
        _result.color = new Color(.9f, .83f, .52f);
    }

    private void FinishPerformance()
    {
        _showedFinalResult = true;
        HideAllRecommendedPositions();

        string title;
        string detail;
        Color color;
        if (TotalAccidents == 0)
        {
            title = "最棒的演出";
            detail = "所有道具均按时上下场，演员动线全程畅通。";
            color = new Color(.55f, 1f, .67f);
        }
        else if (TotalAccidents <= 3)
        {
            title = "有点小事故，但非常不错";
            detail = "演出完成了，但有 " + TotalAccidents + " 次调度事故需要复盘。";
            color = new Color(1f, .84f, .43f);
        }
        else
        {
            title = "还需要努力";
            detail = "本场记录到 " + TotalAccidents + " 次事故；重点练习时间节点、撤场与动线判断。";
            color = new Color(1f, .56f, .4f);
        }

        _result.text = title + "\n" + detail;
        _result.color = color;
        SetInstruction("演出结束。点击“重新演出”可以从开场重新练习。", color);
        _status.text = "结算完成 · 事故 " + TotalAccidents + " 次";
    }

    private void RestartPerformance()
    {
        foreach (PropPlan plan in _plans)
        {
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
        _actorTime = 0f;
        _wrongPlacementCount = 0;
        _timingAccidentCount = 0;
        _routeBlockCount = 0;
        _showedFinalResult = false;
        _lastCueKey = null;
        _result.text = string.Empty;
        HideAllRecommendedPositions();
        UpdateTaskPrompt(true);
        UpdateStatusText();
    }

    private static bool RectanglesOverlapWithinStage(RectTransform first, RectTransform second)
    {
        Vector3[] firstCorners = new Vector3[4];
        Vector3[] secondCorners = new Vector3[4];
        first.GetWorldCorners(firstCorners);
        second.GetWorldCorners(secondCorners);
        Rect firstRect = ToScreenRect(firstCorners);
        Rect secondRect = ToScreenRect(secondCorners);
        return firstRect.Overlaps(secondRect);
    }

    private static Rect ToScreenRect(Vector3[] corners)
    {
        Vector3 bottomLeft = corners[0];
        Vector3 topRight = corners[2];
        return Rect.MinMaxRect(bottomLeft.x, bottomLeft.y, topRight.x, topRight.y);
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

    private static RectTransform FindRect(Transform root, string path)
    {
        Transform found = root.Find(path);
        return found == null ? null : found.GetComponent<RectTransform>();
    }

    private static Text FindText(Transform root, string path)
    {
        Transform found = root.Find(path);
        return found == null ? null : found.GetComponent<Text>();
    }

    private static void BindButton(Transform root, string path, UnityEngine.Events.UnityAction action)
    {
        Transform found = root.Find(path);
        Button button = found == null ? null : found.GetComponent<Button>();
        if (button != null)
        {
            button.onClick.RemoveAllListeners();
            button.onClick.AddListener(action);
        }
    }

    private static void SetButtonLabel(Transform root, string path, string label)
    {
        Transform found = root.Find(path);
        Text text = found == null ? null : found.GetComponentInChildren<Text>(true);
        if (text != null) text.text = label;
    }

    private void SetInstruction(string message, Color color)
    {
        _instruction.text = message;
        _instruction.color = color;
    }

    private static void SetNormalizedPosition(RectTransform rect, Vector2 normalized)
    {
        rect.anchorMin = rect.anchorMax = normalized;
        rect.anchoredPosition = Vector2.zero;
    }

    private static string TimeLabel(float seconds)
    {
        int wholeSeconds = Mathf.Max(0, Mathf.CeilToInt(seconds));
        return "00:" + wholeSeconds.ToString("00");
    }
}
