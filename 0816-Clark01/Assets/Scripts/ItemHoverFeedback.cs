using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.InputSystem;
using UnityEngine.UI;

/// <summary>Visual feedback for a classroom inventory icon authored in the scene.</summary>
public sealed class ItemHoverFeedback : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler
{
    public string ItemName;
    public RectTransform Tooltip;
    public Text TooltipText;
    public float HoverScale = 1.12f;

    private Canvas rootCanvas;
    private Vector3 originalScale;
    private bool isHovering;

    private void Awake()
    {
        rootCanvas = GetComponentInParent<Canvas>();
        originalScale = transform.localScale;
    }

    private void OnDisable()
    {
        isHovering = false;
        transform.localScale = originalScale;
        if (Tooltip != null)
            Tooltip.gameObject.SetActive(false);
    }

    private void Update()
    {
        if (isHovering && Mouse.current != null)
            PositionTooltip(Mouse.current.position.ReadValue());
    }

    public void OnPointerEnter(PointerEventData eventData)
    {
        isHovering = true;
        originalScale = transform.localScale;
        transform.localScale = originalScale * HoverScale;
        if (TooltipText != null)
            TooltipText.text = ItemName;
        if (Tooltip != null)
        {
            Tooltip.gameObject.SetActive(true);
            Tooltip.SetAsLastSibling();
            PositionTooltip(eventData.position);
        }
    }

    public void OnPointerExit(PointerEventData eventData)
    {
        isHovering = false;
        transform.localScale = originalScale;
        if (Tooltip != null)
            Tooltip.gameObject.SetActive(false);
    }

    private void PositionTooltip(Vector2 screenPosition)
    {
        if (Tooltip == null || rootCanvas == null)
            return;

        var tooltipParent = Tooltip.parent as RectTransform;
        if (tooltipParent == null)
            return;
        var camera = rootCanvas.renderMode == RenderMode.ScreenSpaceOverlay ? null : rootCanvas.worldCamera;
        if (RectTransformUtility.ScreenPointToLocalPointInRectangle(tooltipParent, screenPosition, camera, out var localPoint))
            Tooltip.anchoredPosition = localPoint + new Vector2(18f, -28f);
    }
}
