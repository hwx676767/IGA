using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine;
using UnityEngine.UI;

/// <summary>
/// Converts hybrid stretch RectTransforms (anchors + large AnchoredPosition/SizeDelta)
/// into pure fractional anchors so UI stays put when the game view is resized.
/// Layout at the Canvas reference resolution is preserved.
/// </summary>
public static class CampusUiAnchorRebaker
{
    private const string ScenePath = "Assets/Scenes/SampleScene.unity";

    [MenuItem("Tools/Campus Shop/Rebake UI Anchors From Current Layout")]
    public static void RebakeFromMenu()
    {
        var scene = EditorSceneManager.OpenScene(ScenePath);
        var root = GameObject.Find("CampusGameUI");
        if (root == null)
        {
            Debug.LogError("CampusGameUI was not found.");
            return;
        }

        var scaler = root.GetComponent<CanvasScaler>();
        if (scaler != null)
        {
            scaler.uiScaleMode = CanvasScaler.ScaleMode.ScaleWithScreenSize;
            scaler.referenceResolution = new Vector2(1920f, 1080f);
            scaler.screenMatchMode = CanvasScaler.ScreenMatchMode.MatchWidthOrHeight;
            scaler.matchWidthOrHeight = 0.5f;
            EditorUtility.SetDirty(scaler);
        }

        // Force a layout pass at reference resolution before reading corners.
        Canvas.ForceUpdateCanvases();

        var trade = root.transform.Find("ClassroomTradePanel");
        if (trade != null)
        {
            RebakeToParentFraction(trade.GetComponent<RectTransform>());
            RebakeToParentFraction(trade.Find("CustomerArea")?.GetComponent<RectTransform>());
            RebakeToParentFraction(trade.Find("CustomerArea/CustomerPortrait")?.GetComponent<RectTransform>());
            RebakeToParentFraction(trade.Find("ShopBag")?.GetComponent<RectTransform>());
            RebakeToParentFraction(trade.Find("ShopBag/InventoryScrollView")?.GetComponent<RectTransform>());
            RebakeToParentFraction(trade.Find("TradeInteract")?.GetComponent<RectTransform>());
            RebakeToParentFraction(trade.Find("TradeInteract/CustomerRequest")?.GetComponent<RectTransform>());
            // SampleScene keeps Chinese object names for trade / refresh buttons.
            RebakePointButton(trade.Find("TradeInteract/同意")?.GetComponent<RectTransform>());
            RebakePointButton(trade.Find("TradeInteract/拒绝")?.GetComponent<RectTransform>());
            RebakePointButton(trade.Find("ShopPanel/刷新顾客")?.GetComponent<RectTransform>());
        }

        // SampleScene map button is still named "地图".
        var mapButtonRect = root.transform.Find("地图")?.GetComponent<RectTransform>();
        RebakePointButton(mapButtonRect);
        var mapReveal = mapButtonRect != null ? mapButtonRect.GetComponent<MapButtonReveal>() : null;
        if (mapButtonRect != null && mapReveal != null)
        {
            var pos = mapButtonRect.anchoredPosition;
            pos.y = mapReveal.RestOffsetY;
            mapButtonRect.anchoredPosition = pos;
            EditorUtility.SetDirty(mapButtonRect);
        }

        var mapOverlay = root.transform.Find("MapOverlay");
        var campusMap = mapOverlay != null ? mapOverlay.Find("CampusMap") : null;
        if (campusMap != null)
        {
            RebakeToParentFraction(campusMap.GetComponent<RectTransform>());
            foreach (Transform child in campusMap)
            {
                var childRect = child.GetComponent<RectTransform>();
                if (childRect == null)
                    continue;
                var isPoint = Mathf.Approximately(childRect.anchorMin.x, childRect.anchorMax.x)
                              && Mathf.Approximately(childRect.anchorMin.y, childRect.anchorMax.y);
                if (isPoint)
                    RebakePointButton(childRect);
                else
                    RebakeToParentFraction(childRect);
            }
        }

        var dialogue = root.transform.Find("DialoguePanel");
        if (dialogue != null)
        {
            RebakeToParentFraction(dialogue.GetComponent<RectTransform>());
            foreach (Transform child in dialogue)
            {
                var childRect = child.GetComponent<RectTransform>();
                if (childRect == null)
                    continue;

                // Point-anchored buttons keep pixel size; stretch panels bake to fractions.
                var isPoint = Mathf.Approximately(childRect.anchorMin.x, childRect.anchorMax.x)
                              && Mathf.Approximately(childRect.anchorMin.y, childRect.anchorMax.y);
                if (isPoint)
                    RebakePointButton(childRect);
                else
                    RebakeToParentFraction(childRect);
            }
        }

        EditorSceneManager.MarkSceneDirty(scene);
        EditorSceneManager.SaveScene(scene);
        Debug.Log("UI anchors rebaked from current layout. Resize the Game view to verify.");
    }

    /// <summary>
    /// Bake the current on-screen rectangle into fractional anchors of the parent,
    /// with AnchoredPosition=(0,0) and SizeDelta=(0,0).
    /// </summary>
    public static void RebakeToParentFraction(RectTransform rect)
    {
        if (rect == null)
            return;

        var parent = rect.parent as RectTransform;
        if (parent == null)
            return;

        var parentRect = parent.rect;
        if (parentRect.width < 1f || parentRect.height < 1f)
            return;

        // Corners in parent local space.
        var corners = new Vector3[4];
        rect.GetWorldCorners(corners);
        for (var i = 0; i < 4; i++)
            corners[i] = parent.InverseTransformPoint(corners[i]);

        var min = new Vector2(
            Mathf.Min(corners[0].x, corners[2].x),
            Mathf.Min(corners[0].y, corners[2].y));
        var max = new Vector2(
            Mathf.Max(corners[0].x, corners[2].x),
            Mathf.Max(corners[0].y, corners[2].y));

        var anchorMin = new Vector2(
            (min.x - parentRect.xMin) / parentRect.width,
            (min.y - parentRect.yMin) / parentRect.height);
        var anchorMax = new Vector2(
            (max.x - parentRect.xMin) / parentRect.width,
            (max.y - parentRect.yMin) / parentRect.height);

        Undo.RecordObject(rect, "Rebake UI Anchors");
        // Fold non-uniform scale into the baked rectangle so resize stays stable.
        if (rect.localScale != Vector3.one)
            rect.localScale = Vector3.one;
        rect.anchorMin = anchorMin;
        rect.anchorMax = anchorMax;
        rect.anchoredPosition = Vector2.zero;
        rect.sizeDelta = Vector2.zero;
        rect.pivot = new Vector2(0.5f, 0.5f);
        EditorUtility.SetDirty(rect);
    }

    /// <summary>
    /// Keep point-anchor buttons, but bake their center into fractional anchors
    /// and keep only pixel size (so position scales, size stays readable).
    /// </summary>
    public static void RebakePointButton(RectTransform rect)
    {
        if (rect == null)
            return;

        var parent = rect.parent as RectTransform;
        if (parent == null)
            return;

        var parentRect = parent.rect;
        if (parentRect.width < 1f || parentRect.height < 1f)
            return;

        var size = rect.rect.size;
        var corners = new Vector3[4];
        rect.GetWorldCorners(corners);
        for (var i = 0; i < 4; i++)
            corners[i] = parent.InverseTransformPoint(corners[i]);

        var center = new Vector2(
            (corners[0].x + corners[2].x) * 0.5f,
            (corners[0].y + corners[2].y) * 0.5f);

        var anchor = new Vector2(
            (center.x - parentRect.xMin) / parentRect.width,
            (center.y - parentRect.yMin) / parentRect.height);

        Undo.RecordObject(rect, "Rebake Button Anchors");
        rect.anchorMin = anchor;
        rect.anchorMax = anchor;
        rect.pivot = new Vector2(0.5f, 0.5f);
        rect.anchoredPosition = Vector2.zero;
        rect.sizeDelta = size;
        EditorUtility.SetDirty(rect);
    }
}
