using UnityEngine;
using UnityEngine.UI;

public class UILine : MonoBehaviour
{
    private RectTransform rect;
    private Image image;

    private RectTransform start;
    private RectTransform end;

    private RectTransform contentRect;
    private RectTransform viewportRect;

    private Vector2 lastStart;
    private Vector2 lastEnd;
    private bool hasLast;

    public void Init(RectTransform s, RectTransform e, Color color, float width, RectTransform content, RectTransform viewport)
    {
        rect = GetComponent<RectTransform>();
        image = GetComponent<Image>();

        start = s;
        end = e;

        contentRect = content;
        viewportRect = viewport;

        image.color = color;
        image.raycastTarget = false;
        rect.pivot = new Vector2(0, 0.5f);
        rect.sizeDelta = new Vector2(0, width);

        hasLast = false;
        UpdateLine();
    }

    void LateUpdate()
    {
        // Only live-follow mouse for the temporary in-progress line
        if (end == null)
            UpdateLine();
    }

    public void UpdateLine()
    {
        if (start == null || contentRect == null || rect == null) return;

        Vector2 startPos = start.anchoredPosition;
        Vector2 endPos = end != null ? end.anchoredPosition : GetMouseInContentSpace();

        // Skip canvas dirties when nothing moved (stops left-panel flicker)
        if (hasLast &&
            (startPos - lastStart).sqrMagnitude < 0.01f &&
            (endPos - lastEnd).sqrMagnitude < 0.01f)
            return;

        lastStart = startPos;
        lastEnd = endPos;
        hasLast = true;

        Vector2 dir = endPos - startPos;
        float length = dir.magnitude;

        rect.sizeDelta = new Vector2(length, rect.sizeDelta.y);
        rect.anchoredPosition = startPos;

        if (length > 0.01f)
        {
            float angle = Mathf.Atan2(dir.y, dir.x) * Mathf.Rad2Deg;
            rect.localRotation = Quaternion.Euler(0, 0, angle);
        }
    }

    private Vector2 GetMouseInContentSpace()
    {
        if (viewportRect == null) return Vector2.zero;

        Canvas canvas = viewportRect.GetComponentInParent<Canvas>();
        Camera cam = (canvas != null && canvas.renderMode != RenderMode.ScreenSpaceOverlay) ? canvas.worldCamera : null;

        RectTransformUtility.ScreenPointToLocalPointInRectangle(
            viewportRect,
            Input.mousePosition,
            cam,
            out Vector2 localToViewport);

        Vector3 worldPoint = viewportRect.TransformPoint(localToViewport);
        return contentRect.InverseTransformPoint(worldPoint);
    }
}
