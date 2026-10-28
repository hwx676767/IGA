using System;
using UnityEngine;
using UnityEngine.EventSystems;

/// <summary>
/// UI noodle-pull prototype. Hold left mouse and drag upward; releasing resets.
/// Completes after enough full pulls so the story can continue.
/// </summary>
public class NoodleDragController : MonoBehaviour
{
    [SerializeField, Min(1f)] private float maxPullDistance = 180f;
    [SerializeField, Min(1)] private int pullsToFinish = 2;
    [SerializeField] private bool showDebugOverlay;

    private RectTransform rectTransform;
    private RectTransform chopstickRect;
    private Vector2 defaultAnchoredPosition;
    private Vector2 chopstickDefaultAnchoredPosition;
    private float dragStartMouseY;
    private bool isDragging;
    private float currentPullDistance;
    private int completedPulls;
    private bool finished;

    public event Action EatingCompleted;

    public bool IsDragging => isDragging;
    public float CurrentPullDistance => currentPullDistance;
    public float PullPercent => maxPullDistance <= 0f ? 0f : currentPullDistance / maxPullDistance;

    private void Awake()
    {
        rectTransform = transform as RectTransform;
        defaultAnchoredPosition = rectTransform != null ? rectTransform.anchoredPosition : Vector2.zero;

        var parent = transform.parent;
        if (parent != null)
        {
            var chopstick = parent.Find("chopstick");
            if (chopstick != null)
            {
                chopstickRect = chopstick as RectTransform;
                if (chopstickRect != null)
                {
                    chopstickDefaultAnchoredPosition = chopstickRect.anchoredPosition;
                }
            }
        }
    }

    private void OnEnable()
    {
        ResetSession();
    }

    private void OnDisable()
    {
        ResetPull();
    }

    private void Update()
    {
        if (finished || rectTransform == null) return;
        if (IsPointerOverButton()) return;

        if (Input.GetMouseButtonDown(0))
        {
            isDragging = true;
            dragStartMouseY = Input.mousePosition.y;
        }

        if (isDragging && Input.GetMouseButton(0))
        {
            var dragPixels = (Input.mousePosition.y - dragStartMouseY) / GetCanvasScale();
            currentPullDistance = Mathf.Clamp(dragPixels, 0f, maxPullDistance);
            ApplyPull(currentPullDistance);
        }

        if (isDragging && Input.GetMouseButtonUp(0))
        {
            var reachedTop = currentPullDistance >= maxPullDistance * 0.95f;
            ResetPull();

            if (reachedTop)
            {
                completedPulls++;
                if (completedPulls >= pullsToFinish)
                {
                    finished = true;
                    EatingCompleted?.Invoke();
                }
            }
        }
    }

    public void ResetSession()
    {
        finished = false;
        completedPulls = 0;
        ResetPull();
    }

    private void ApplyPull(float distance)
    {
        var offset = Vector2.up * distance;
        rectTransform.anchoredPosition = defaultAnchoredPosition + offset;
        if (chopstickRect != null)
        {
            chopstickRect.anchoredPosition = chopstickDefaultAnchoredPosition + offset;
        }
    }

    private float GetCanvasScale()
    {
        var canvas = GetComponentInParent<Canvas>();
        return canvas != null && canvas.scaleFactor > 0.01f ? canvas.scaleFactor : 1f;
    }

    private void ResetPull()
    {
        isDragging = false;
        currentPullDistance = 0f;
        ApplyPull(0f);
    }

    private static bool IsPointerOverButton()
    {
        var eventSystem = EventSystem.current;
        if (eventSystem == null) return false;

        var pointer = new PointerEventData(eventSystem) { position = Input.mousePosition };
        var results = new System.Collections.Generic.List<RaycastResult>();
        eventSystem.RaycastAll(pointer, results);

        for (var i = 0; i < results.Count; i++)
        {
            if (results[i].gameObject.GetComponent<UnityEngine.UI.Button>() != null)
            {
                return true;
            }
        }

        return false;
    }

    private void OnGUI()
    {
        if (!showDebugOverlay || !isActiveAndEnabled) return;

        GUI.Box(new Rect(24f, 24f, 420f, 150f), "吃面交互");
        GUI.Label(new Rect(42f, 60f, 370f, 24f), "按住左键向上拉面，拉满两次后进入下一幕");
        GUI.Label(new Rect(42f, 88f, 370f, 24f), $"状态：{(isDragging ? "正在拉面" : "等待拖拽")}  {completedPulls}/{pullsToFinish}");
        GUI.Box(new Rect(42f, 124f, 350f, 18f), string.Empty);
        GUI.Box(new Rect(42f, 124f, 350f * PullPercent, 18f), string.Empty);
    }
}
