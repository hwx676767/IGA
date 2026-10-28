using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

/// <summary>
/// Connects the existing S2 UI without changing its authored layout.
/// CraftObject_* may contain sequential parts (轮子, 炮筒, …). Missing named
/// states are skipped. NextPropButton / NextSceneButton are scene-authored.
/// </summary>
public class CraftingFlowController : MonoBehaviour
{
    [Header("Optional authored UI")]
    [SerializeField] private Button nextPropButton;
    [SerializeField] private Button nextSceneButton;
    [SerializeField] private Button nextButton;
    [SerializeField] private Text instructionText;
    [SerializeField] private string nextSceneName = "SampleScene";

    private readonly List<CraftObjectState> _objects = new List<CraftObjectState>();
    private CraftObjectState _current;
    private int _currentIndex;
    private Canvas _canvas;
    private bool _canUseTools;
    private Text _runtimeInstruction;

    public bool CanUseTools => _canUseTools;

    private void Start()
    {
        _canvas = GetComponent<Canvas>();
        if (_canvas == null) _canvas = GetComponentInParent<Canvas>();
        if (_canvas == null) _canvas = FindObjectOfType<Canvas>();

        BindWorkspaceObjects();
        for (int i = 0; i < _objects.Count; i++)
            _objects[i].gameObject.SetActive(i == 0);
        BindTools();
        BindButtons();
        StartObject(0);
    }

    private void BindWorkspaceObjects()
    {
        Transform workspace = transform.Find("Workspace");
        if (workspace == null)
        {
            Debug.LogError("CraftingFlowController could not find the Workspace object.", this);
            return;
        }

        for (int i = 0; i < workspace.childCount; i++)
        {
            Transform child = workspace.GetChild(i);
            if (!child.name.StartsWith("CraftObject_")) continue;

            CraftObjectState state = child.GetComponent<CraftObjectState>();
            if (state == null) state = child.gameObject.AddComponent<CraftObjectState>();
            _objects.Add(state);
        }
    }

    private void BindTools()
    {
        BindTool("ScissorsTool", CraftToolType.Scissors);
        BindTool("BrushTool", CraftToolType.Brush);
        BindTool("GlueTool", CraftToolType.Glue);
    }

    private void BindTool(string objectName, CraftToolType type)
    {
        Transform toolTransform = FindChildRecursive(transform, objectName);
        if (toolTransform == null)
        {
            Debug.LogWarning($"CraftingFlowController could not find {objectName}.", this);
            return;
        }

        if (toolTransform.GetComponent<CanvasGroup>() == null)
            toolTransform.gameObject.AddComponent<CanvasGroup>();

        CraftDraggableTool tool = toolTransform.GetComponent<CraftDraggableTool>();
        if (tool == null) tool = toolTransform.gameObject.AddComponent<CraftDraggableTool>();
        tool.Configure(type, this);
    }

    private void BindButtons()
    {
        if (nextPropButton == null)
        {
            Transform found = FindChildRecursive(transform, "NextPropButton");
            if (found != null) nextPropButton = found.GetComponent<Button>();
        }
        if (nextSceneButton == null)
        {
            Transform found = FindChildRecursive(transform, "NextSceneButton");
            if (found != null) nextSceneButton = found.GetComponent<Button>();
        }
        if (nextButton == null)
        {
            Transform found = FindChildRecursive(transform, "NextButton");
            if (found != null) nextButton = found.GetComponent<Button>();
        }

        if (nextPropButton == null && nextSceneButton == null)
            nextPropButton = nextSceneButton = nextButton;

        BindClick(nextPropButton, AdvancePartOrObject);
        BindClick(nextSceneButton, GoToNextScene);
        if (nextButton != null && nextButton != nextPropButton && nextButton != nextSceneButton)
            BindClick(nextButton, AdvanceAfterCompletion);

        HideAdvanceButtons();
    }

    private static void BindClick(Button button, UnityEngine.Events.UnityAction action)
    {
        if (button == null) return;
        button.onClick.RemoveAllListeners();
        button.onClick.AddListener(action);
    }

    private void StartObject(int index)
    {
        if (_objects.Count == 0)
        {
            SetInstruction("No CraftObject is ready in the workspace.", Color.red);
            return;
        }

        _currentIndex = index;
        _current = _objects[index];
        _current.gameObject.SetActive(true);
        _current.Initialize();
        if (!_current.HasWork)
        {
            if (index < _objects.Count - 1) StartObject(index + 1);
            else ShowCompletionButton();
            return;
        }
        _canUseTools = true;
        HideAdvanceButtons();
        SetInstruction(PromptForCurrentTool(), Color.white);
    }

    public void TryUseTool(CraftDraggableTool tool, Vector2 screenPosition)
    {
        if (!_canUseTools || _current == null || tool == null) return;

        RectTransform targetRect = _current.ActiveDropArea;
        if (targetRect == null || !RectTransformUtility.RectangleContainsScreenPoint(targetRect, screenPosition, null))
        {
            SetInstruction("Drag the tool onto the current prop image.", new Color(1f, .65f, .4f));
            return;
        }

        if (!_current.TryApply(tool.ToolType))
        {
            SetInstruction("This step doesn't need that tool yet. Think again.", new Color(1f, .55f, .55f));
            return;
        }

        if (_current.IsComplete)
        {
            _canUseTools = false;
            SetInstruction("This piece is done.", new Color(.55f, 1f, .65f));
            ShowCompletionButton();
            return;
        }

        if (_current.NeedsNextPart)
        {
            _canUseTools = false;
            SetInstruction("\"" + CraftPartDisplay(_current.CurrentPartName) + "\" is done. Leave it on the bench. Tap the next part.", new Color(.55f, 1f, .65f));
            ShowNextPropButton();
            return;
        }

        if (_current.PartsComplete && _current.HasGlueResult)
        {
            _current.UnlockGlue();
            SetInstruction(PromptForCurrentTool(), Color.white);
            return;
        }

        SetInstruction(PromptForCurrentTool(), Color.white);
    }

    private string PromptForCurrentTool()
    {
        if (_current == null) return string.Empty;
        if (_current.AwaitingGlue)
            return "The parts are ready. Drag glue on so the wheel and barrel lock into the finished prop.";
        switch (_current.RequiredTool)
        {
            case CraftToolType.Scissors:
                return "Hint: drag the scissors onto the dashed area of \"" + CraftPartDisplay(_current.CurrentPartName) + "\".";
            case CraftToolType.Brush:
                return "Cut done: drag the brush onto \"" + CraftPartDisplay(_current.CurrentPartName) + "\" to paint.";
            default:
                return "Drag glue onto the prop to finish the join.";
        }
    }

    private void AdvancePartOrObject()
    {
        if (_current != null && _current.NeedsNextPart)
        {
            _current.BeginNextPart();
            _canUseTools = true;
            HideAdvanceButtons();
            SetInstruction(PromptForCurrentTool(), Color.white);
            return;
        }
        AdvanceAfterCompletion();
    }

    private void AdvanceAfterCompletion()
    {
        if (_current != null && _current.NeedsNextPart)
        {
            _current.BeginNextPart();
            _canUseTools = true;
            HideAdvanceButtons();
            SetInstruction(PromptForCurrentTool(), Color.white);
            return;
        }

        if (_current != null && _current.IsComplete && _currentIndex < _objects.Count - 1)
        {
            _current.gameObject.SetActive(false);
            StartObject(_currentIndex + 1);
            return;
        }

        if (_current == null || !_current.IsComplete) return;
        GoToNextScene();
    }

    private void GoToNextScene()
    {
        if (_current != null && !_current.IsComplete) return;
        if (!string.IsNullOrWhiteSpace(nextSceneName) && Application.CanStreamedLevelBeLoaded(nextSceneName))
            SceneTransition.LoadScene(nextSceneName, "Set Dressing");
        else
            SetInstruction("Scene 2 is complete. Set Next Scene Name on CraftingFlowController.", Color.yellow);
    }

    private void ShowNextPropButton()
    {
        HideAdvanceButtons();
        Button button = nextPropButton != null ? nextPropButton : nextButton;
        if (button != null) button.gameObject.SetActive(true);
    }

    private void ShowCompletionButton()
    {
        HideAdvanceButtons();
        bool moreObjects = _currentIndex < _objects.Count - 1;
        if (moreObjects)
        {
            Button button = nextPropButton != null ? nextPropButton : nextButton;
            if (button != null) button.gameObject.SetActive(true);
            return;
        }

        Button sceneButton = nextSceneButton != null ? nextSceneButton : nextButton;
        if (sceneButton != null) sceneButton.gameObject.SetActive(true);
    }

    private void HideAdvanceButtons()
    {
        if (nextPropButton != null) nextPropButton.gameObject.SetActive(false);
        if (nextSceneButton != null) nextSceneButton.gameObject.SetActive(false);
        if (nextButton != null && nextButton != nextPropButton && nextButton != nextSceneButton)
            nextButton.gameObject.SetActive(false);
    }

    private static string CraftPartDisplay(string partName)
    {
        if (string.IsNullOrEmpty(partName)) return partName;
        if (partName.Contains("轮子")) return "Wheel";
        if (partName.Contains("炮筒")) return "Barrel";
        return partName;
    }

    private void SetInstruction(string message, Color color)
    {
        if (instructionText == null)
            instructionText = _runtimeInstruction != null ? _runtimeInstruction : CreateRuntimeInstruction();
        if (instructionText == null) return;
        instructionText.text = message;
        instructionText.color = color;
    }

    private Text CreateRuntimeInstruction()
    {
        if (_canvas == null) return null;

        GameObject go = new GameObject("CraftInstruction_Fallback", typeof(RectTransform), typeof(Text));
        go.transform.SetParent(_canvas.transform, false);
        RectTransform rect = go.GetComponent<RectTransform>();
        rect.anchorMin = new Vector2(.15f, .88f);
        rect.anchorMax = new Vector2(.85f, .96f);
        rect.offsetMin = rect.offsetMax = Vector2.zero;

        Text text = go.GetComponent<Text>();
        text.font = RuntimeMonaFont.Load();
        text.fontSize = 28;
        text.alignment = TextAnchor.MiddleCenter;
        text.raycastTarget = false;
        _runtimeInstruction = text;
        return text;
    }

    private static Transform FindChildRecursive(Transform root, string objectName)
    {
        if (root.name == objectName) return root;
        for (int i = 0; i < root.childCount; i++)
        {
            Transform result = FindChildRecursive(root.GetChild(i), objectName);
            if (result != null) return result;
        }
        return null;
    }
}
