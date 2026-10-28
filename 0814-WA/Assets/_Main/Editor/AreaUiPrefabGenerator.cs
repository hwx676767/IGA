using UnityEditor;
using UnityEngine;
using UnityEngine.UI;

/// <summary>
/// Creates the two editable UI prefabs with Unity's own serializer.
/// It runs once after scripts compile, then can be run again from Tools if needed.
/// </summary>
[InitializeOnLoad]
internal static class AreaUiPrefabGenerator
{
    private const string BuildVersionKey = "WA.AreaUiPrefabGenerator.Version";
    private const int BuildVersion = 2;
    private const string PanelPath = "Assets/_Main/Prefabs/AreaDetailPanel.prefab";
    private const string MarkerPath = "Assets/_Main/Resources/AreaRegionMarker.prefab";

    static AreaUiPrefabGenerator()
    {
        EditorApplication.delayCall += BuildOnce;
    }

    [MenuItem("Tools/WA/Rebuild Area UI Prefabs")]
    private static void RebuildFromMenu()
    {
        BuildPrefabs();
        EditorPrefs.SetInt(BuildVersionKey, BuildVersion);
    }

    private static void BuildOnce()
    {
        if (EditorApplication.isPlayingOrWillChangePlaymode || EditorPrefs.GetInt(BuildVersionKey, 0) >= BuildVersion)
        {
            return;
        }

        BuildPrefabs();
        EditorPrefs.SetInt(BuildVersionKey, BuildVersion);
    }

    private static void BuildPrefabs()
    {
        BuildAreaDetailPanel();
        BuildAreaRegionMarker();
        AssetDatabase.SaveAssets();
        AssetDatabase.Refresh();
    }

    private static void BuildAreaDetailPanel()
    {
        var root = CreateUiObject("AreaDetailPanel", null);
        var rootRect = root.GetComponent<RectTransform>();
        rootRect.anchorMin = rootRect.anchorMax = new Vector2(0.5f, 0.5f);
        rootRect.sizeDelta = new Vector2(620f, 430f);
        root.AddComponent<CanvasRenderer>();
        var background = root.AddComponent<Image>();
        background.color = new Color(0.035f, 0.06f, 0.10f, 0.96f);
        var panel = root.AddComponent<AreaDetailPanel>();

        var title = CreateText("Title", root.transform, 26, TextAnchor.MiddleLeft, Color.white);
        SetTopLeft(title.rectTransform, new Vector2(26f, -26f), new Vector2(500f, 42f));
        title.text = "Area - Political Support";

        var close = CreateImage("CloseButton", root.transform, new Color(0.85f, 0.25f, 0.22f));
        SetTopRight(close.rectTransform, new Vector2(-28f, -26f), new Vector2(42f, 38f));
        var closeLabel = CreateText("Label", close.transform, 24, TextAnchor.MiddleCenter, Color.white);
        Stretch(closeLabel.rectTransform);
        closeLabel.text = "X";

        var chart = CreateUiObject("PieChart", root.transform).GetComponent<RectTransform>();
        SetTopLeft(chart, new Vector2(38f, -86f), new Vector2(245f, 245f));
        var sliceColors = new[]
        {
            new Color(0.25f, 0.63f, 0.95f), new Color(0.94f, 0.53f, 0.24f), new Color(0.40f, 0.80f, 0.48f),
            new Color(0.78f, 0.38f, 0.78f), new Color(0.94f, 0.78f, 0.28f)
        };
        var slices = new AreaPieSliceGraphic[sliceColors.Length];
        for (var i = 0; i < slices.Length; i++)
        {
            var sliceObject = CreateUiObject($"Slice_{i + 1}", chart);
            var sliceRect = sliceObject.GetComponent<RectTransform>();
            Stretch(sliceRect);
            sliceObject.AddComponent<CanvasRenderer>();
            slices[i] = sliceObject.AddComponent<AreaPieSliceGraphic>();
            slices[i].color = sliceColors[i];
            slices[i].raycastTarget = false;
        }

        var legendRoot = CreateUiObject("Legend", root.transform).GetComponent<RectTransform>();
        SetTopRight(legendRoot, new Vector2(-32f, -92f), new Vector2(270f, 220f));
        var legendLabels = new Text[slices.Length];
        var legendMarkers = new Image[slices.Length];
        for (var i = 0; i < slices.Length; i++)
        {
            var row = CreateUiObject($"LegendRow_{i + 1}", legendRoot.transform).GetComponent<RectTransform>();
            row.anchorMin = row.anchorMax = new Vector2(0f, 1f);
            row.pivot = new Vector2(0f, 1f);
            row.anchoredPosition = new Vector2(0f, -i * 40f);
            row.sizeDelta = new Vector2(270f, 32f);

            legendMarkers[i] = CreateImage("ColorMarker", row.transform, sliceColors[i]);
            var markerRect = legendMarkers[i].rectTransform;
            markerRect.anchorMin = markerRect.anchorMax = new Vector2(0f, 0.5f);
            markerRect.pivot = new Vector2(0f, 0.5f);
            markerRect.anchoredPosition = Vector2.zero;
            markerRect.sizeDelta = new Vector2(20f, 20f);
            legendMarkers[i].raycastTarget = false;

            legendLabels[i] = CreateText("PartyNameAndSupport", row.transform, 20, TextAnchor.MiddleLeft, new Color(0.92f, 0.95f, 0.98f));
            var labelRect = legendLabels[i].rectTransform;
            labelRect.anchorMin = labelRect.anchorMax = new Vector2(0f, 0.5f);
            labelRect.pivot = new Vector2(0f, 0.5f);
            labelRect.anchoredPosition = new Vector2(32f, 0f);
            labelRect.sizeDelta = new Vector2(235f, 30f);
            legendLabels[i].text = "Party  0%";
        }

        var summary = CreateText("Summary", root.transform, 17, TextAnchor.UpperLeft, new Color(0.70f, 0.80f, 0.88f));
        summary.rectTransform.anchorMin = new Vector2(0f, 0f);
        summary.rectTransform.anchorMax = new Vector2(1f, 0f);
        summary.rectTransform.pivot = new Vector2(0.5f, 0.5f);
        summary.rectTransform.anchoredPosition = new Vector2(0f, 50f);
        summary.rectTransform.sizeDelta = new Vector2(-54f, 58f);
        summary.verticalOverflow = VerticalWrapMode.Overflow;
        summary.text = "Stability  0%";

        var serializedPanel = new SerializedObject(panel);
        serializedPanel.FindProperty("titleText").objectReferenceValue = title;
        serializedPanel.FindProperty("summaryText").objectReferenceValue = summary;
        serializedPanel.FindProperty("closeButton").objectReferenceValue = close.rectTransform;
        serializedPanel.FindProperty("pieChart").objectReferenceValue = chart;
        var sliceProperty = serializedPanel.FindProperty("chartSlices");
        sliceProperty.arraySize = slices.Length;
        for (var i = 0; i < slices.Length; i++)
        {
            sliceProperty.GetArrayElementAtIndex(i).objectReferenceValue = slices[i];
        }
        var legendValueProperty = serializedPanel.FindProperty("legendValues");
        var legendMarkerProperty = serializedPanel.FindProperty("legendColorMarkers");
        legendValueProperty.arraySize = legendLabels.Length;
        legendMarkerProperty.arraySize = legendMarkers.Length;
        for (var i = 0; i < legendLabels.Length; i++)
        {
            legendValueProperty.GetArrayElementAtIndex(i).objectReferenceValue = legendLabels[i];
            legendMarkerProperty.GetArrayElementAtIndex(i).objectReferenceValue = legendMarkers[i];
        }
        serializedPanel.ApplyModifiedPropertiesWithoutUndo();

        PrefabUtility.SaveAsPrefabAsset(root, PanelPath);
        Object.DestroyImmediate(root);
    }

    private static void BuildAreaRegionMarker()
    {
        var root = CreateUiObject("AreaRegionMarker", null);
        var rootRect = root.GetComponent<RectTransform>();
        rootRect.sizeDelta = new Vector2(52f, 52f);
        root.AddComponent<CanvasRenderer>();
        var circle = root.AddComponent<AreaPieSliceGraphic>();
        circle.color = new Color(0.95f, 0.70f, 0.20f, 0.96f);
        circle.raycastTarget = false;
        circle.SetSlice(90f, 360f);
        var marker = root.AddComponent<AreaRegionMarker>();

        var label = CreateText("Number", root.transform, 22, TextAnchor.MiddleCenter, Color.white);
        Stretch(label.rectTransform);
        label.text = "1";
        marker.Configure(circle, label);

        PrefabUtility.SaveAsPrefabAsset(root, MarkerPath);
        Object.DestroyImmediate(root);
    }

    private static GameObject CreateUiObject(string objectName, Transform parent)
    {
        var gameObject = new GameObject(objectName, typeof(RectTransform));
        gameObject.layer = 5;
        gameObject.GetComponent<RectTransform>().SetParent(parent, false);
        return gameObject;
    }

    private static Image CreateImage(string objectName, Transform parent, Color color)
    {
        var gameObject = CreateUiObject(objectName, parent);
        gameObject.AddComponent<CanvasRenderer>();
        var image = gameObject.AddComponent<Image>();
        image.color = color;
        return image;
    }

    private static Text CreateText(string objectName, Transform parent, int fontSize, TextAnchor alignment, Color color)
    {
        var gameObject = CreateUiObject(objectName, parent);
        gameObject.AddComponent<CanvasRenderer>();
        var text = gameObject.AddComponent<Text>();
        text.font = Resources.GetBuiltinResource<Font>("LegacyRuntime.ttf");
        text.fontSize = fontSize;
        text.alignment = alignment;
        text.color = color;
        text.horizontalOverflow = HorizontalWrapMode.Overflow;
        text.verticalOverflow = VerticalWrapMode.Overflow;
        return text;
    }

    private static void SetTopLeft(RectTransform rect, Vector2 anchoredPosition, Vector2 size)
    {
        rect.anchorMin = rect.anchorMax = new Vector2(0f, 1f);
        rect.pivot = new Vector2(0f, 1f);
        rect.anchoredPosition = anchoredPosition;
        rect.sizeDelta = size;
    }

    private static void SetTopRight(RectTransform rect, Vector2 anchoredPosition, Vector2 size)
    {
        rect.anchorMin = rect.anchorMax = new Vector2(1f, 1f);
        rect.pivot = new Vector2(1f, 1f);
        rect.anchoredPosition = anchoredPosition;
        rect.sizeDelta = size;
    }

    private static void Stretch(RectTransform rect)
    {
        rect.anchorMin = Vector2.zero;
        rect.anchorMax = Vector2.one;
        rect.offsetMin = Vector2.zero;
        rect.offsetMax = Vector2.zero;
    }
}
