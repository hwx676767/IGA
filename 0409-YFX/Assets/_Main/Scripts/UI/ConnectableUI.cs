using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;
using System;
using System.Collections.Generic;

/// <summary>
/// Mind-map node. Left-click A then left-click B to connect.
/// Drag a node only when no connection is in progress (or drag with right button intent avoided).
/// </summary>
public class ConnectableUI : MonoBehaviour,
    IDragHandler, IBeginDragHandler, IEndDragHandler,
    IPointerClickHandler, IPointerDownHandler
{
    [Header("连线设置")]
    public Color lineColor = Color.white;
    public float lineWidth = 5f;

    [Header("线索 ID")]
    public string clueId;

    public static event Action<ConnectableUI, ConnectableUI> OnNodesConnected;

    private static ConnectableUI pendingConnectSource = null;
    private static UILine tempLine = null;

    private List<LineConnection> connections = new List<LineConnection>();
    public IReadOnlyList<LineConnection> Connections => connections;

    private RectTransform rectTransform;
    private RectTransform contentRect;
    private RectTransform viewportRect;

    private Vector2 dragOffset;
    private bool isDraggingNode;
    private bool suppressClick;
    private Vector2 pointerDownPos;

    void Awake()
    {
        rectTransform = GetComponent<RectTransform>();
        contentRect = rectTransform.parent as RectTransform;
        if (contentRect == null)
        {
            Debug.LogError("ConnectableUI 必须直接放在 ScrollView 的 Content 下！");
            return;
        }

        ScrollRect scrollRect = contentRect.GetComponentInParent<ScrollRect>();
        if (scrollRect != null && scrollRect.viewport != null)
            viewportRect = scrollRect.viewport;
    }

    void Start()
    {
        Image img = GetComponent<Image>();
        if (img != null) img.raycastTarget = true;
    }

    void Update()
    {
        if (Input.GetMouseButtonDown(1))
            CancelPendingConnection();
    }

    public void OnPointerDown(PointerEventData eventData)
    {
        pointerDownPos = eventData.position;
        suppressClick = false;

        if (eventData.button == PointerEventData.InputButton.Right)
        {
            if (pendingConnectSource != null)
                CancelPendingConnection();
            else
                RemoveAllConnectionsFromThis();
        }
    }

    public void OnBeginDrag(PointerEventData eventData)
    {
        if (eventData.button != PointerEventData.InputButton.Left) return;

        // While drawing a link, do NOT move the node / cancel the link / swallow the click
        if (pendingConnectSource != null)
            return;

        isDraggingNode = true;
        suppressClick = true;

        RectTransformUtility.ScreenPointToLocalPointInRectangle(
            contentRect, eventData.position, eventData.pressEventCamera, out Vector2 localPoint);
        dragOffset = rectTransform.anchoredPosition - localPoint;
    }

    public void OnDrag(PointerEventData eventData)
    {
        if (!isDraggingNode) return;

        RectTransformUtility.ScreenPointToLocalPointInRectangle(
            contentRect, eventData.position, eventData.pressEventCamera, out Vector2 localPoint);
        rectTransform.anchoredPosition = localPoint + dragOffset;
        UpdateAllConnections();
    }

    public void OnEndDrag(PointerEventData eventData)
    {
        if (isDraggingNode)
        {
            isDraggingNode = false;
            return;
        }

        // Drawing a link: drop onto another node to finish
        if (pendingConnectSource != null && pendingConnectSource == this)
        {
            ConnectableUI target = FindConnectableUnderPointer(eventData);
            if (target != null && target != this)
                CompleteConnection(pendingConnectSource, target);
        }
    }

    public void OnPointerClick(PointerEventData eventData)
    {
        if (eventData.button != PointerEventData.InputButton.Left) return;

        // Completing a pending link always wins (small pointer jitter must not cancel it)
        if (pendingConnectSource != null && pendingConnectSource != this)
        {
            CompleteConnection(pendingConnectSource, this);
            return;
        }

        if (suppressClick) return;
        if (Vector2.Distance(pointerDownPos, eventData.position) > 12f) return;

        HandleClick();
    }

    private void HandleClick()
    {
        if (pendingConnectSource == null)
        {
            StartConnection();
            Debug.Log($"[MindMap] Selected clue '{clueId}'. Click another node to connect.");
        }
        else if (pendingConnectSource != this)
        {
            CompleteConnection(pendingConnectSource, this);
        }
        else
        {
            CancelPendingConnection();
        }
    }

    /// <summary>Programmatic link (debug / auto-solve). Returns true if a new link was made.</summary>
    public bool ForceConnect(ConnectableUI other)
    {
        if (other == null || other == this) return false;
        if (HasConnection(other)) return false;
        CompleteConnection(this, other);
        return true;
    }

    /// <summary>Remove every line attached to this node.</summary>
    public void ClearConnections()
    {
        RemoveAllConnectionsFromThis();
    }

    private void StartConnection()
    {
        CancelPendingConnection();
        pendingConnectSource = this;

        GameObject obj = CreateLineObject("TempLine");
        tempLine = obj.AddComponent<UILine>();
        tempLine.Init(rectTransform, null, lineColor, lineWidth, contentRect, viewportRect);
    }

    private void CompleteConnection(ConnectableUI start, ConnectableUI end)
    {
        if (start == null || end == null || start == end)
        {
            CancelPendingConnection();
            return;
        }

        if (start.HasConnection(end))
        {
            CancelPendingConnection();
            return;
        }

        if (start.contentRect == null) start.contentRect = start.transform.parent as RectTransform;
        if (end.contentRect == null) end.contentRect = end.transform.parent as RectTransform;

        RectTransform lineParent = start.contentRect != null ? start.contentRect : contentRect;
        GameObject obj = CreateLineObject($"Line_{start.name}_{end.name}", lineParent);

        UILine line = obj.AddComponent<UILine>();
        RectTransform vp = start.viewportRect != null ? start.viewportRect : viewportRect;
        line.Init(start.rectTransform, end.rectTransform, lineColor, lineWidth, lineParent, vp);

        LineConnection conn = new LineConnection
        {
            line = line,
            start = start,
            end = end,
            obj = obj
        };

        start.connections.Add(conn);
        end.connections.Add(conn);

        CancelPendingConnection();
        Debug.Log($"[MindMap] Linked '{start.clueId}' ↔ '{end.clueId}'");
        OnNodesConnected?.Invoke(start, end);
    }

    private static ConnectableUI FindConnectableUnderPointer(PointerEventData eventData)
    {
        var results = new List<RaycastResult>();
        EventSystem.current.RaycastAll(eventData, results);
        foreach (var r in results)
        {
            var c = r.gameObject.GetComponentInParent<ConnectableUI>();
            if (c != null) return c;
        }
        return null;
    }

    private GameObject CreateLineObject(string name, RectTransform parent = null)
    {
        if (parent == null) parent = contentRect;
        GameObject obj = new GameObject(name);
        obj.transform.SetParent(parent, false);

        RectTransform rt = obj.AddComponent<RectTransform>();
        rt.pivot = new Vector2(0, 0.5f);

        Image img = obj.AddComponent<Image>();
        img.color = lineColor;
        img.raycastTarget = false;

        obj.transform.SetAsFirstSibling();
        return obj;
    }

    private void CancelPendingConnection()
    {
        if (tempLine != null)
        {
            Destroy(tempLine.gameObject);
            tempLine = null;
        }
        pendingConnectSource = null;
    }

    private bool HasConnection(ConnectableUI other)
    {
        foreach (var c in connections)
        {
            if (c.start == other || c.end == other)
                return true;
        }
        return false;
    }

    private void UpdateAllConnections()
    {
        foreach (var c in connections)
            c.line.UpdateLine();
    }

    private void RemoveAllConnectionsFromThis()
    {
        // Copy because we mutate
        var copy = new List<LineConnection>(connections);
        foreach (var c in copy)
        {
            if (c.start != null) c.start.connections.Remove(c);
            if (c.end != null) c.end.connections.Remove(c);
            if (c.obj != null) Destroy(c.obj);
        }
        connections.Clear();
    }

    void OnDestroy()
    {
        RemoveAllConnectionsFromThis();
        if (pendingConnectSource == this)
            CancelPendingConnection();
    }

    public class LineConnection
    {
        public UILine line;
        public ConnectableUI start;
        public ConnectableUI end;
        public GameObject obj;
    }
}
