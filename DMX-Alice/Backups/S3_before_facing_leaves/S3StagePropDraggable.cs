using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

/// <summary>
/// One temporary S3 prop card. It can live in its tray cell or on the stage;
/// clicking an already placed prop returns it to the tray.
/// Tray layout is authored in the scene and is never rewritten on bind.
/// </summary>
[RequireComponent(typeof(RectTransform), typeof(CanvasGroup), typeof(Image))]
public class S3StagePropDraggable : MonoBehaviour, IBeginDragHandler, IDragHandler, IEndDragHandler, IPointerClickHandler, IPointerDownHandler
{
    private S3StageController _controller;
    private RectTransform _rect;
    private CanvasGroup _canvasGroup;
    private Image _image;
    private Text _stateLabel;
    private Color _defaultColor;
    private Transform _trayParent;
    private Vector2 _trayAnchorMin;
    private Vector2 _trayAnchorMax;
    private Vector2 _trayPivot;
    private Vector2 _traySize;
    private Vector2 _trayPosition;
    private Vector2 _stageSize;
    private Vector3 _trayScale;
    private Vector3 _stageScale;
    private bool _isDragging;
    private bool _trayLayoutCaptured;

    public string DisplayName { get; private set; }
    public bool IsPlaced { get; private set; }
    public bool IsCorrect { get; private set; }

    public void Configure(S3StageController controller, string displayName, Transform trayParent)
    {
        _controller = controller;
        DisplayName = displayName;
        _rect = GetComponent<RectTransform>();
        _canvasGroup = GetComponent<CanvasGroup>();
        _image = GetComponent<Image>();
        _defaultColor = _image.color;
        CaptureTrayLayout(trayParent);
    }

    public void SetStateLabel(Text label) => _stateLabel = label;

    public void SetStagePresentation(Vector2 size, Vector3 scale)
    {
        if (size.x > 0f && size.y > 0f) _stageSize = size;
        _stageScale = scale;
    }

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
        _rect.sizeDelta = _stageSize;
        transform.localScale = _stageScale;
        SyncCueVisualScale(_stageScale);
        _rect.anchoredPosition = stagePosition;
        IsPlaced = true;
        IsCorrect = correct;
        if (_stateLabel != null) _stateLabel.text = correct ? "✓ In place" : "! Off mark";
        _image.color = _defaultColor;
    }

    public void ReturnToTray()
    {
        if (_controller == null) return;
        Transform parent = _trayParent != null ? _trayParent : _controller.TrayContent;
        if (parent == null) return;
        transform.SetParent(parent, false);
        if (_trayLayoutCaptured)
        {
            _rect.anchorMin = _trayAnchorMin;
            _rect.anchorMax = _trayAnchorMax;
            _rect.pivot = _trayPivot;
            _rect.sizeDelta = _traySize;
            transform.localScale = _trayScale;
            _rect.anchoredPosition = _trayPosition;
        }
        SyncCueVisualScale(_trayScale);
        IsPlaced = false;
        IsCorrect = false;
        if (_stateLabel != null) _stateLabel.text = "Drag onto stage";
        if (_image != null) _image.color = _defaultColor;
    }

    private void CaptureTrayLayout(Transform trayParent)
    {
        _trayParent = trayParent != null ? trayParent : transform.parent;
        _trayAnchorMin = _rect.anchorMin;
        _trayAnchorMax = _rect.anchorMax;
        _trayPivot = _rect.pivot;
        _traySize = _rect.sizeDelta;
        _trayScale = transform.localScale;
        _trayPosition = _rect.anchoredPosition;
        _stageSize = _traySize;
        _stageScale = _trayScale;
        _trayLayoutCaptured = true;
    }

    private void SyncCueVisualScale(Vector3 scale)
    {
        S3CueVisual cueVisual = GetComponent<S3CueVisual>();
        if (cueVisual != null) cueVisual.SetBaseScale(scale);
    }
}
