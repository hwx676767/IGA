using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class InteractiveObject : MonoBehaviour
{
    public GameObject infoPanelPrefab; // UI面板Prefab
    public Vector2 offset = new Vector2(100f, 100f); // 面板偏移
    [SerializeField] private int plotIndex; // 地块索引（0-35）
    //public bool isWalkable = true; 

    private SpriteRenderer hoverImage;
    private SpriteRenderer overline;
    private GameObject infoPanelInstance;
    private RectTransform panelRect;
    private Camera mainCamera;
    private Canvas canvas;
    private bool isHovering = false;
    private bool isSelected = false;
    private CardUsageController cardUsageController;
    private PlotController plotController;
    private SpriteRenderer mainRenderer;
    private Dictionary<SpriteRenderer, int> originalSortingOrders = new Dictionary<SpriteRenderer, int>();

    void Start()
    {
        mainCamera = Camera.main;
        canvas = FindObjectOfType<Canvas>();
        if (canvas == null)
        {
            Debug.LogError("场景中必须有一个Canvas！");
            return;
        }

        cardUsageController = FindObjectOfType<CardUsageController>();
        plotController = FindObjectOfType<PlotController>();
        if (cardUsageController == null)
        {
            Debug.LogWarning("未找到 CardUsageController！");
        }
        if (plotController == null)
        {
            Debug.LogWarning("未找到 PlotController！");
        }

        mainRenderer = GetComponent<SpriteRenderer>();
        if (mainRenderer != null)
        {
            originalSortingOrders[mainRenderer] = mainRenderer.sortingOrder;
        }
        else
        {
            Debug.LogWarning($"地块 {gameObject.name} 缺少 SpriteRenderer 组件");
        }

        Transform hoverTransform = transform.Find("HoverImage");
        if (hoverTransform != null)
        {
            hoverImage = hoverTransform.GetComponent<SpriteRenderer>();
            if (hoverImage != null)
            {
                hoverImage.enabled = false;
                originalSortingOrders[hoverImage] = hoverImage.sortingOrder;
            }
            else
            {
                Debug.LogWarning($"地块 {gameObject.name} 的 HoverImage 缺少 SpriteRenderer 组件");
            }
        }
        else
        {
            Debug.LogWarning($"在 {gameObject.name} 下未找到 HoverImage (SpriteRenderer)");
        }

        Transform overlineTransform = transform.Find("Overline");
        if (overlineTransform != null)
        {
            overline = overlineTransform.GetComponent<SpriteRenderer>();
            if (overline != null)
            {
                overline.enabled = false;
                originalSortingOrders[overline] = overline.sortingOrder;
            }
            else
            {
                Debug.LogWarning($"地块 {gameObject.name} 的 Overline 缺少 SpriteRenderer 组件");
            }
        }
        else
        {
            Debug.LogWarning($"在 {gameObject.name} 下未找到 Overline (SpriteRenderer)");
        }

        foreach (SpriteRenderer renderer in GetComponentsInChildren<SpriteRenderer>())
        {
            if (!originalSortingOrders.ContainsKey(renderer))
            {
                originalSortingOrders[renderer] = renderer.sortingOrder;
            }
        }
        
        // 初始化 isWalkable（例如根据是否为 nullPlotPrefab 设置）
        /*
        MapGenerator mapGenerator = FindObjectOfType<MapGenerator>();
        if (mapGenerator != null && gameObject == mapGenerator.nullPlotPrefab)
        {
            isWalkable = false;
            Debug.Log($"地块 {gameObject.name} at index {plotIndex} set to isWalkable: {isWalkable}");
        }*/
    }

    void Update()
    {
        if (EventSystem.current.IsPointerOverGameObject())
        {
            if (isHovering)
            {
                isHovering = false;
                if (hoverImage != null)
                {
                    hoverImage.enabled = false;
                }
                if (overline != null && !isSelected)
                {
                    overline.enabled = false;
                }
            }
            return;
        }

        Vector2 mousePos = mainCamera.ScreenToWorldPoint(Input.mousePosition);
        RaycastHit2D hit = Physics2D.Raycast(mousePos, Vector2.zero);

        if (hit.collider != null && hit.collider.transform == transform)
        {
            if (!isHovering)
            {
                isHovering = true;
                if (hoverImage != null)
                {
                    hoverImage.enabled = true;
                }
                if (overline != null && isSelected)
                {
                    overline.enabled = true;
                }
            }

            if (Input.GetMouseButtonDown(0))
            {
                isSelected = true;
                if (overline != null)
                {
                    overline.enabled = true;
                }
                foreach (var renderer in originalSortingOrders.Keys)
                {
                    renderer.sortingOrder = originalSortingOrders[renderer] + 100;
                }
                ShowInfoPanel();
            }
        }
        else
        {
            if (isHovering)
            {
                isHovering = false;
                if (hoverImage != null)
                {
                    hoverImage.enabled = false;
                }
                if (overline != null && !isSelected)
                {
                    overline.enabled = false;
                }
            }
        }

        if (Input.GetMouseButtonDown(1))
        {
            isSelected = false;
            if (overline != null)
            {
                overline.enabled = false;
            }
            foreach (var renderer in originalSortingOrders.Keys)
            {
                renderer.sortingOrder = originalSortingOrders[renderer];
            }
            CloseInfoPanel();
        }
    }

    void ShowInfoPanel()
    {
        if (infoPanelPrefab == null || canvas == null) return;

        if (infoPanelInstance != null)
        {
            Destroy(infoPanelInstance);
        }

        infoPanelInstance = Instantiate(infoPanelPrefab, canvas.transform);
        panelRect = infoPanelInstance.GetComponent<RectTransform>();
        if (panelRect == null)
        {
            Debug.LogError("InfoPanelPrefab 必须有一个 RectTransform！");
            Destroy(infoPanelInstance);
            return;
        }

        Vector2 panelSize = new Vector2(329f, 415f) / canvas.scaleFactor;
        Vector3 objectScreenPos = mainCamera.WorldToScreenPoint(transform.position);
        Vector2 adjustedOffset = offset / canvas.scaleFactor;
        Vector2 panelPos = new Vector2(objectScreenPos.x, objectScreenPos.y) + adjustedOffset;
        
        panelRect.pivot = new Vector2(0f, 0f);
        panelPos.x = Mathf.Clamp(panelPos.x, 0f, Screen.width - panelSize.x);
        panelPos.y = Mathf.Clamp(panelPos.y, 0f, Screen.height - panelSize.y);
        panelRect.position = new Vector3(panelPos.x, panelPos.y, 0f);

        Debug.Log($"世界坐标: {transform.position}, 屏幕坐标: {objectScreenPos}, 偏移: {adjustedOffset}, 面板尺寸: {panelSize}, 最终位置: {panelRect.anchoredPosition}");

        Text panelText = panelRect.GetComponentInChildren<Text>();
        if (panelText != null)
        {
            panelText.text = $"点击了 {gameObject.name} 在 {transform.position}";
        }

        Button closeButton = panelRect.GetComponentInChildren<Button>();
        if (closeButton != null)
        {
            closeButton.onClick.RemoveAllListeners();
            closeButton.onClick.AddListener(CloseInfoPanel);
        }

        Button spawnButton = panelRect.Find("SpawnButton")?.GetComponent<Button>();
        if (spawnButton != null)
        {
            spawnButton.onClick.RemoveAllListeners();
            spawnButton.onClick.AddListener(cardUsageController.SpawnCard);
        }

        Button replaceButton = panelRect.Find("ReplaceButton")?.GetComponent<Button>();
        if (replaceButton != null)
        {
            replaceButton.onClick.RemoveAllListeners();
            replaceButton.onClick.AddListener(cardUsageController.ReplaceCard);
        }
        
        if (cardUsageController != null)
        {
            cardUsageController.SetCurrentPlot(this, infoPanelInstance, plotIndex);
        }
    }

    void CloseInfoPanel()
    {
        if (infoPanelInstance != null)
        {
            Destroy(infoPanelInstance);
            infoPanelInstance = null;
        }
        isSelected = false;
        if (overline != null)
        {
            overline.enabled = false;
        }
        foreach (var renderer in originalSortingOrders.Keys)
        {
            renderer.sortingOrder = originalSortingOrders[renderer];
            Debug.Log($"地块 {gameObject.name} 的 {renderer.gameObject.name} 恢复 sortingOrder: {renderer.sortingOrder}");
        }
    }

    void OnDestroy()
    {
        if (infoPanelInstance != null)
        {
            Destroy(infoPanelInstance);
        }
        if (plotController != null)
        {
            plotController.ClearPrefab(plotIndex);
        }
    }

    public Vector3 GetPosition()
    {
        return transform.position;
    }

    public int GetPlotIndex()
    {
        return plotIndex;
    }
    
    /*
    public bool IsWalkable()
    {
        return isWalkable;
    }*/
}