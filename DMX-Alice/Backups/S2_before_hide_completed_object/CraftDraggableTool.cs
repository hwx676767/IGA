using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

[RequireComponent(typeof(RectTransform), typeof(CanvasGroup))]
public class CraftDraggableTool : MonoBehaviour, IBeginDragHandler, IDragHandler, IEndDragHandler
{
    [SerializeField] private CraftToolType toolType;

    private RectTransform _rect;
    private CanvasGroup _canvasGroup;
    private Vector2 _homePosition;
    private Transform _homeParent;
    private int _homeSiblingIndex;
    private CraftingFlowController _controller;

    public CraftToolType ToolType => toolType;

    public void Configure(CraftToolType type, CraftingFlowController controller)
    {
        toolType = type;
        _controller = controller;
    }

    private void Awake()
    {
        _rect = GetComponent<RectTransform>();
        _canvasGroup = GetComponent<CanvasGroup>();
    }

    public void OnBeginDrag(PointerEventData eventData)
    {
        if (_controller == null || !_controller.CanUseTools) return;
        _homeParent = transform.parent;
        _homePosition = _rect.anchoredPosition;
        _homeSiblingIndex = transform.GetSiblingIndex();
        transform.SetAsLastSibling();
        _canvasGroup.blocksRaycasts = false;
    }

    public void OnDrag(PointerEventData eventData)
    {
        if (_controller == null || !_controller.CanUseTools) return;
        _rect.position = eventData.position;
    }

    public void OnEndDrag(PointerEventData eventData)
    {
        if (_controller == null) return;
        _canvasGroup.blocksRaycasts = true;
        _controller.TryUseTool(this, eventData.position);
        transform.SetParent(_homeParent, false);
        transform.SetSiblingIndex(_homeSiblingIndex);
        _rect.anchoredPosition = _homePosition;
    }
}
