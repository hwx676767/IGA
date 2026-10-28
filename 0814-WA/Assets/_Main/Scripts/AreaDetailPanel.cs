using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.UI;

/// <summary>
/// Updates the editable UGUI children in AreaDetailPanel.prefab with one area's values.
/// </summary>
[RequireComponent(typeof(RectTransform), typeof(Image))]
public sealed class AreaDetailPanel : MonoBehaviour
{
    private static readonly string[] PartyNames =
    {
        "Establishment", "Unity Party", "New Future Party", "Moh National Party", "Left People's Front"
    };

    [Header("Editable Prefab UI")]
    [SerializeField] private Text titleText;
    [SerializeField] private Text summaryText;
    [SerializeField] private RectTransform closeButton;
    [SerializeField] private RectTransform pieChart;
    [SerializeField] private AreaPieSliceGraphic[] chartSlices;
    [SerializeField] private Text[] legendValues;
    [SerializeField] private Image[] legendColorMarkers;

    private Canvas parentCanvas;
    private Vector3[] sliceBaseScales;
    private Vector2[] sliceBasePositions;
    private float[] sliceMiddleAngles;
    private float[] supportValues;

    private void Awake()
    {
        parentCanvas = GetComponentInParent<Canvas>();
        if (pieChart == null)
        {
            pieChart = transform.Find("PieChart") as RectTransform;
        }

        if (chartSlices != null)
        {
            sliceBaseScales = new Vector3[chartSlices.Length];
            sliceBasePositions = new Vector2[chartSlices.Length];
            sliceMiddleAngles = new float[chartSlices.Length];
            for (var i = 0; i < chartSlices.Length; i++)
            {
                if (chartSlices[i] == null)
                {
                    continue;
                }

                var sliceRect = chartSlices[i].rectTransform;
                sliceBaseScales[i] = sliceRect.localScale;
                sliceBasePositions[i] = sliceRect.anchoredPosition;
            }
        }
    }

    private void Update()
    {
        if (Mouse.current == null)
        {
            return;
        }

        var eventCamera = parentCanvas != null && parentCanvas.worldCamera != null ? parentCanvas.worldCamera : Camera.main;
        var pointer = Mouse.current.position.ReadValue();
        UpdatePieChartHover(pointer, eventCamera);

        if (closeButton != null && Mouse.current.leftButton.wasPressedThisFrame
            && RectTransformUtility.RectangleContainsScreenPoint(closeButton, pointer, eventCamera))
        {
            Hide();
        }
    }

    public void Show(string areaName)
    {
        if (!HasRequiredReferences())
        {
            Debug.LogError("AreaDetailPanel prefab has missing UI references.", this);
            return;
        }

        gameObject.SetActive(true);
        var areaNumber = ExtractAreaNumber(areaName);
        var support = GetSupportValues(areaNumber);
        supportValues = support;
        titleText.text = $"{areaName.ToUpperInvariant()}  ·  Political Support";
        summaryText.text = $"Stability  {GetStability(areaNumber)}%\nWhen any party's support exceeds 30%, that party's route conditions can be triggered.";

        var rotation = 90f;
        for (var i = 0; i < support.Length; i++)
        {
            var amount = support[i] / 100f;
            chartSlices[i].SetSlice(rotation, -amount * 360f);
            sliceMiddleAngles[i] = rotation - amount * 180f;
            legendValues[i].text = $"{PartyNames[i]}  {support[i]:0}%";
            legendColorMarkers[i].color = chartSlices[i].color;
            rotation -= amount * 360f;
        }
    }

    public void Hide()
    {
        gameObject.SetActive(false);
    }

    private bool HasRequiredReferences()
    {
        return titleText != null
               && summaryText != null
               && closeButton != null
               && chartSlices != null
               && chartSlices.Length == PartyNames.Length
               && legendValues != null
               && legendValues.Length == PartyNames.Length
               && legendColorMarkers != null
               && legendColorMarkers.Length == PartyNames.Length;
    }

    private void UpdatePieChartHover(Vector2 pointer, Camera eventCamera)
    {
        if (pieChart == null)
        {
            return;
        }

        var hoveredSlice = FindHoveredSlice(pointer, eventCamera);
        for (var i = 0; i < chartSlices.Length; i++)
        {
            var sliceRect = chartSlices[i].rectTransform;
            var isHovered = i == hoveredSlice;
            var radians = sliceMiddleAngles[i] * Mathf.Deg2Rad;
            var offset = isHovered ? new Vector2(Mathf.Cos(radians), Mathf.Sin(radians)) * 8f : Vector2.zero;
            var targetScale = isHovered ? sliceBaseScales[i] * 1.08f : sliceBaseScales[i];
            var lerp = 1f - Mathf.Exp(-12f * Time.unscaledDeltaTime);
            sliceRect.localScale = Vector3.Lerp(sliceRect.localScale, targetScale, lerp);
            sliceRect.anchoredPosition = Vector2.Lerp(sliceRect.anchoredPosition, sliceBasePositions[i] + offset, lerp);
        }
    }

    private int FindHoveredSlice(Vector2 pointer, Camera eventCamera)
    {
        if (pieChart == null || supportValues == null
            || !RectTransformUtility.ScreenPointToLocalPointInRectangle(pieChart, pointer, eventCamera, out var localPoint))
        {
            return -1;
        }

        var rect = pieChart.rect;
        var fromCenter = localPoint - rect.center;
        var radius = Mathf.Min(rect.width, rect.height) * 0.5f;
        if (fromCenter.sqrMagnitude > radius * radius)
        {
            return -1;
        }

        var angle = Mathf.Atan2(fromCenter.y, fromCenter.x) * Mathf.Rad2Deg;
        var start = 90f;
        for (var i = 0; i < supportValues.Length; i++)
        {
            var sweep = supportValues[i] * 3.6f;
            if (Mathf.Repeat(start - angle, 360f) <= sweep)
            {
                return i;
            }

            start -= sweep;
        }

        return -1;
    }

    private static int ExtractAreaNumber(string areaName)
    {
        var value = 0;
        foreach (var character in areaName)
        {
            if (char.IsDigit(character))
            {
                value = value * 10 + (character - '0');
            }
        }

        return Mathf.Max(1, value);
    }

    private static float[] GetSupportValues(int areaNumber)
    {
        var values = new[] { 35f, 25f, 18f, 13f, 9f };
        var lead = (areaNumber - 1) % values.Length;
        var challenger = (lead + 2) % values.Length;
        values[lead] += 7f;
        values[challenger] -= 4f;
        values[(lead + 1) % values.Length] -= 3f;
        return values;
    }

    private static int GetStability(int areaNumber)
    {
        return Mathf.Clamp(64 + ((areaNumber * 7) % 19) - 9, 35, 90);
    }
}

/// <summary>Editable visual marker displayed on a map area.</summary>
public sealed class AreaRegionMarker : MonoBehaviour
{
    [SerializeField] private AreaPieSliceGraphic circle;
    [SerializeField] private Text numberText;

    public void SetArea(string areaName)
    {
        var number = 0;
        foreach (var character in areaName)
        {
            if (char.IsDigit(character))
            {
                number = number * 10 + (character - '0');
            }
        }

        if (numberText != null)
        {
            numberText.text = Mathf.Max(1, number).ToString();
        }

        circle?.SetSlice(90f, 360f);
    }

    public void Configure(AreaPieSliceGraphic circleGraphic, Text label)
    {
        circle = circleGraphic;
        numberText = label;
    }
}
