using UnityEngine;
using UnityEngine.EventSystems;

/// <summary>
/// Map entry button: rests partly off-screen, slides up on hover, opens map on click.
/// </summary>
public sealed class MapButtonReveal : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler
{
    public float RestOffsetY = -130f;
    public float ShownOffsetY = 0f;
    public float MoveSpeed = 14f;

    private RectTransform rect;
    private float targetY;
    private bool pointerInside;

    private void Awake()
    {
        rect = GetComponent<RectTransform>();
        var pos = rect.anchoredPosition;
        pos.y = RestOffsetY;
        rect.anchoredPosition = pos;
        targetY = RestOffsetY;
    }

    private void OnEnable()
    {
        if (rect == null)
            rect = GetComponent<RectTransform>();
        if (!pointerInside)
            SnapTo(RestOffsetY);
    }

    private void Update()
    {
        if (rect == null)
            return;

        var pos = rect.anchoredPosition;
        if (Mathf.Abs(pos.y - targetY) < 0.05f)
        {
            if (pos.y != targetY)
            {
                pos.y = targetY;
                rect.anchoredPosition = pos;
            }
            return;
        }

        pos.y = Mathf.Lerp(pos.y, targetY, 1f - Mathf.Exp(-MoveSpeed * Time.unscaledDeltaTime));
        rect.anchoredPosition = pos;
    }

    public void OnPointerEnter(PointerEventData eventData)
    {
        pointerInside = true;
        targetY = ShownOffsetY;
    }

    public void OnPointerExit(PointerEventData eventData)
    {
        pointerInside = false;
        targetY = RestOffsetY;
    }

    public void SnapShown()
    {
        SnapTo(ShownOffsetY);
        targetY = ShownOffsetY;
    }

    public void SnapRest()
    {
        pointerInside = false;
        SnapTo(RestOffsetY);
        targetY = RestOffsetY;
    }

    private void SnapTo(float y)
    {
        if (rect == null)
            return;
        var pos = rect.anchoredPosition;
        pos.y = y;
        rect.anchoredPosition = pos;
    }
}
