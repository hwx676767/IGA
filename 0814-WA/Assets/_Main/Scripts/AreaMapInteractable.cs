using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

/// <summary>
/// Handles hover and click input for one map area in CanvasUI.
/// </summary>
[RequireComponent(typeof(RectTransform))]
public sealed class AreaMapInteractable : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler, IPointerClickHandler
{
    [SerializeField, Min(1f)] private float hoverScale = 1.08f;
    [SerializeField, Min(0f)] private float scaleSpeed = 12f;

    private RectTransform rectTransform;
    private Image image;
    private Vector3 restingScale;
    private bool isHovered;
    private MapAreaInteractionController controller;

    private void Awake()
    {
        rectTransform = GetComponent<RectTransform>();
        restingScale = rectTransform.localScale;

        // The area sprites have transparent pixels outside their borders. This makes
        // only the visible part clickable instead of the whole rectangular image.
        image = GetComponent<Image>();
        if (image != null && image.sprite != null && image.sprite.texture != null && image.sprite.texture.isReadable)
        {
            image.alphaHitTestMinimumThreshold = 0.1f;
        }
    }

    private void Update()
    {
        var targetScale = isHovered ? restingScale * hoverScale : restingScale;
        rectTransform.localScale = Vector3.Lerp(
            rectTransform.localScale,
            targetScale,
            1f - Mathf.Exp(-scaleSpeed * Time.unscaledDeltaTime));
    }

    public void Initialize(MapAreaInteractionController owner, float configuredHoverScale)
    {
        controller = owner;
        hoverScale = Mathf.Max(1f, configuredHoverScale);
    }

    public void SetHovered(bool hovered)
    {
        isHovered = hovered;
    }

    public bool ContainsScreenPoint(Vector2 screenPoint, Camera eventCamera)
    {
        if (!isActiveAndEnabled || !RectTransformUtility.RectangleContainsScreenPoint(rectTransform, screenPoint, eventCamera))
        {
            return false;
        }

        return image == null || image.IsRaycastLocationValid(screenPoint, eventCamera);
    }

    public void OnPointerEnter(PointerEventData eventData)
    {
        isHovered = true;
    }

    public void OnPointerExit(PointerEventData eventData)
    {
        isHovered = false;
    }

    public void OnPointerClick(PointerEventData eventData)
    {
        controller?.ShowArea(name);
    }
}
