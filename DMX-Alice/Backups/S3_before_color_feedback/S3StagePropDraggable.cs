using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

/// <summary>
/// One temporary S3 prop card. It can live in the prop tray or on the stage;
/// clicking an already placed prop returns it to the tray.
/// </summary>
[RequireComponent(typeof(RectTransform), typeof(CanvasGroup), typeof(Image))]
public class S3StagePropDraggable : MonoBehaviour, IBeginDragHandler, IDragHandler, IEndDragHandler, IPointerClickHandler, IPointerDownHandler
{
    private S3StageController _controller;
    private RectTransform _rect;
    private CanvasGroup _canvasGroup;
    private Image _image;
    private Text _stateLabel;
    private Vector2 _trayAnchor;
    private Vector2 _size;
    private bool _isDragging;

    public string DisplayName { get; private set; }
    public bool IsPlaced { get; private set; }
    public bool IsCorrect { get; private set; }

    public void Configure(S3StageController controller, string displayName, Vector2 trayAnchor, Vector2 size, Color color)
    {
        _controller = controller;
        DisplayName = displayName;
        _trayAnchor = trayAnchor;
        _size = size;
        _rect = GetComponent<RectTransform>();
        _canvasGroup = GetComponent<CanvasGroup>();
        _image = GetComponent<Image>();
        _image.color = color;
        ReturnToTray();
    }

    public void SetStateLabel(Text label) => _stateLabel = label;

    public void OnBeginDrag(PointerEventData eventData)
    {
        if (_controller == null) return;
        _isDragging = true;
        _controller.BeginPropDrag(this);
        _canvasGroup.blocksRaycasts = false;
    }

    public void OnPointerDown(PointerEventData eventData)
    {
        if (_controller != null)
            _controller.ShowRecommendedPosition(this);
    }

    public void OnDrag(PointerEventData eventData)
    {
        if (_controller == null) return;
        _rect.position = eventData.position;
    }

    public void OnEndDrag(PointerEventData eventData)
    {
        if (_controller == null) return;
        _canvasGroup.blocksRaycasts = true;
        _controller.EndPropDrag(this, eventData.position);
        _isDragging = false;
    }

    public void OnPointerClick(PointerEventData eventData)
    {
        if (!_isDragging && IsPlaced)
            _controller.ReturnPropToTray(this);
    }

    public void PlaceOnStage(RectTransform stage, Vector2 stagePosition, bool correct)
    {
        transform.SetParent(stage, false);
        _rect.anchorMin = _rect.anchorMax = new Vector2(.5f, .5f);
        _rect.sizeDelta = _size;
        _rect.anchoredPosition = stagePosition;
        IsPlaced = true;
        IsCorrect = correct;
        if (_stateLabel != null) _stateLabel.text = correct ? "✓ 到位" : "! 偏位";
        _image.color = correct ? new Color(.33f, .72f, .52f, 1f) : new Color(.83f, .31f, .29f, 1f);
    }

    public void ReturnToTray()
    {
        if (_controller == null) return;
        transform.SetParent(_controller.TrayContent, false);
        _rect.anchorMin = _rect.anchorMax = _trayAnchor;
        _rect.sizeDelta = _size;
        _rect.anchoredPosition = Vector2.zero;
        IsPlaced = false;
        IsCorrect = false;
        if (_stateLabel != null) _stateLabel.text = "拖入舞台";
        if (_image != null) _image.color = new Color(.2f, .43f, .57f, 1f);
    }
}
