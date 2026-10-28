using System.Collections.Generic;
using UnityEngine;

/// <summary>
/// One craft object. Direct children named 0_MainImage..3_ColorResult form a
/// part; extra groups (e.g. 轮子 / 炮筒) are extra parts. Missing stages are skipped.
/// 4_GlueResult, if present, is the last shared step and hides every part.
/// </summary>
public class CraftObjectState : MonoBehaviour
{
    private class Part
    {
        public Transform root;
        public GameObject main;
        public GameObject line;
        public GameObject cut;
        public GameObject color;
        public readonly List<CraftToolType> tools = new List<CraftToolType>();
        public int stage;
        public bool started;

        public bool IsComplete => stage >= tools.Count;
        public CraftToolType RequiredTool => IsComplete ? CraftToolType.Glue : tools[stage];
    }

    private readonly List<Part> _parts = new List<Part>();
    private GameObject _glueResult;
    private int _partIndex;
    private bool _glueApplied;
    private bool _glueUnlocked;

    public bool IsComplete => AllPartsComplete && (_glueResult == null || _glueApplied);
    public bool PartsComplete => AllPartsComplete;
    public bool HasGlueResult => _glueResult != null;
    public bool NeedsNextPart => CurrentPart != null && CurrentPart.IsComplete && _partIndex < _parts.Count - 1;
    public bool AwaitingGlue => _glueUnlocked && AllPartsComplete && _glueResult != null && !_glueApplied;
    public string CurrentPartName => CurrentPart != null && CurrentPart.root != null ? CurrentPart.root.name : name;

    public CraftToolType RequiredTool
    {
        get
        {
            if (AwaitingGlue) return CraftToolType.Glue;
            Part part = CurrentPart;
            return part == null || part.IsComplete ? CraftToolType.Glue : part.RequiredTool;
        }
    }

    public RectTransform ActiveDropArea
    {
        get
        {
            Part part = CurrentPart;
            GameObject active = ActiveImage(part);
            if (active != null) return active.GetComponent<RectTransform>();
            if (_glueResult != null) return _glueResult.GetComponent<RectTransform>();
            return GetComponent<RectTransform>();
        }
    }

    private Part CurrentPart => _partIndex >= 0 && _partIndex < _parts.Count ? _parts[_partIndex] : null;
    private bool AllPartsComplete
    {
        get
        {
            if (_parts.Count == 0) return true;
            for (int i = 0; i < _parts.Count; i++)
                if (!_parts[i].IsComplete) return false;
            return true;
        }
    }

    public void Initialize()
    {
        CollectHierarchy();
        _partIndex = 0;
        _glueApplied = false;
        _glueUnlocked = false;
        for (int i = 0; i < _parts.Count; i++)
        {
            _parts[i].stage = 0;
            _parts[i].started = i == 0;
        }
        ShowCurrent();
    }

    public bool HasWork => _parts.Count > 0 || _glueResult != null;

    public void BeginNextPart()
    {
        if (!NeedsNextPart) return;
        _partIndex++;
        CurrentPart.started = true;
        CurrentPart.stage = 0;
        ShowCurrent();
    }

    public void UnlockGlue()
    {
        if (_glueResult == null) return;
        _glueUnlocked = true;
        ShowCurrent();
    }

    public void HidePartsForGlue()
    {
        _glueApplied = true;
        ShowCurrent();
    }

    public bool TryApply(CraftToolType tool)
    {
        if (AwaitingGlue)
        {
            if (tool != CraftToolType.Glue) return false;
            _glueApplied = true;
            ShowCurrent();
            return true;
        }

        Part part = CurrentPart;
        if (part == null || part.IsComplete || tool != part.RequiredTool) return false;
        part.stage++;
        ShowCurrent();
        return true;
    }

    private void CollectHierarchy()
    {
        _parts.Clear();
        _glueResult = FindDirectNamed(transform, "4_GlueResult") ?? FindNamed(transform, "4_GlueResult");

        Transform wheel = FindPartRoot("轮子");
        Transform barrel = FindPartRoot("炮筒");

        if (wheel != null)
        {
            Part part = BuildPart(wheel);
            if (!PartHasArt(part)) FillPartFromDirectStates(part, transform);
            _parts.Add(part);
        }

        if (barrel != null)
            _parts.Add(BuildPart(barrel));

        if (_parts.Count == 0)
        {
            List<Transform> looseStates = new List<Transform>();
            for (int i = 0; i < transform.childCount; i++)
            {
                Transform child = transform.GetChild(i);
                if (child.name == "4_GlueResult") continue;
                if (IsStateName(child.name)) looseStates.Add(child);
                else if (LooksLikePart(child)) _parts.Add(BuildPart(child));
            }
            if (_parts.Count == 0 && looseStates.Count > 0)
                _parts.Add(BuildPart(transform));
        }
    }

    private Transform FindPartRoot(string key)
    {
        for (int i = 0; i < transform.childCount; i++)
        {
            Transform child = transform.GetChild(i);
            if (child.name.Contains(key)) return child;
        }
        return null;
    }

    private static bool PartHasArt(Part part)
    {
        return part.main != null || part.line != null || part.cut != null || part.color != null;
    }

    private void FillPartFromDirectStates(Part part, Transform owner)
    {
        part.main = FindDirectNamed(owner, "0_MainImage");
        part.line = FindDirectNamed(owner, "1_LineGuide");
        part.cut = FindDirectNamed(owner, "2_CutResult");
        part.color = FindDirectNamed(owner, "3_ColorResult");
        part.tools.Clear();
        if (part.line != null || part.cut != null) part.tools.Add(CraftToolType.Scissors);
        if (part.color != null) part.tools.Add(CraftToolType.Brush);
    }

    private static GameObject FindDirectNamed(Transform root, string objectName)
    {
        Transform found = root.Find(objectName);
        return found == null ? null : found.gameObject;
    }

    private static bool LooksLikePart(Transform root)
    {
        if (root.name.Contains("轮子") || root.name.Contains("炮筒") || root.name.StartsWith("Part_"))
            return true;
        return FindNamed(root, "0_MainImage") != null || FindNamed(root, "1_LineGuide") != null;
    }

    private static bool IsStateName(string objectName)
    {
        return objectName.StartsWith("0_") || objectName.StartsWith("1_") ||
               objectName.StartsWith("2_") || objectName.StartsWith("3_");
    }

    private Part BuildPart(Transform root)
    {
        Part part = new Part
        {
            root = root,
            main = FindNamed(root, "0_MainImage"),
            line = FindNamed(root, "1_LineGuide"),
            cut = FindNamed(root, "2_CutResult"),
            color = FindNamed(root, "3_ColorResult")
        };
        if (part.line != null || part.cut != null) part.tools.Add(CraftToolType.Scissors);
        if (part.color != null) part.tools.Add(CraftToolType.Brush);
        return part;
    }

    private void ShowCurrent()
    {
        if (_glueResult != null) _glueResult.SetActive(_glueApplied);

        for (int i = 0; i < _parts.Count; i++)
        {
            Part part = _parts[i];
            bool showRoot = part.started && !_glueApplied;
            if (part.root != transform) part.root.gameObject.SetActive(showRoot);
            if (!showRoot)
            {
                HidePartImages(part);
                continue;
            }
            ShowPart(part);
        }
    }

    private void ShowPart(Part part)
    {
        HidePartImages(part);
        if (part.IsComplete)
        {
            GameObject kept = part.color != null ? part.color : part.cut != null ? part.cut : part.main;
            if (kept != null) kept.SetActive(true);
            return;
        }

        if (part.stage == 0)
        {
            if (part.main != null) part.main.SetActive(true);
            if (part.line != null) part.line.SetActive(true);
            return;
        }

        CraftToolType lastTool = part.tools[part.stage - 1];
        if (lastTool == CraftToolType.Scissors)
        {
            if (part.cut != null) part.cut.SetActive(true);
            else if (part.main != null) part.main.SetActive(true);
        }
        else if (lastTool == CraftToolType.Brush && part.color != null)
        {
            part.color.SetActive(true);
        }
    }

    private static void HidePartImages(Part part)
    {
        if (part.main != null) part.main.SetActive(false);
        if (part.line != null) part.line.SetActive(false);
        if (part.cut != null) part.cut.SetActive(false);
        if (part.color != null) part.color.SetActive(false);
    }

    private static GameObject ActiveImage(Part part)
    {
        if (part == null) return null;
        if (part.IsComplete)
            return part.color != null ? part.color : part.cut != null ? part.cut : part.main;
        if (part.stage == 0) return part.line != null ? part.line : part.main;
        CraftToolType lastTool = part.tools[part.stage - 1];
        if (lastTool == CraftToolType.Scissors) return part.cut != null ? part.cut : part.main;
        return part.color != null ? part.color : part.main;
    }

    private static GameObject FindNamed(Transform root, string objectName)
    {
        if (root.name == objectName) return root.gameObject;
        Transform found = root.Find(objectName);
        if (found != null) return found.gameObject;
        for (int i = 0; i < root.childCount; i++)
        {
            Transform child = root.GetChild(i);
            if (child.name == "4_GlueResult") continue;
            if (child != root && (child.name.Contains("轮子") || child.name.Contains("炮筒") || child.name.StartsWith("Part_")))
                continue;
            GameObject nested = FindNamed(child, objectName);
            if (nested != null) return nested;
        }
        return null;
    }
}
