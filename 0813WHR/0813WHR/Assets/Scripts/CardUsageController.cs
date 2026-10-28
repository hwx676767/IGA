using UnityEngine;
using UnityEngine.UI;
using System.Collections.Generic;
using System.Linq;

public class CardUsageController : MonoBehaviour
{
    private PlotController plotController;
    private CardGenerator cardGenerator;
    private List<CardController> cards;
    private int replaceCardCount = 2;
    [SerializeField] private InteractiveObject currentPlot;
    [SerializeField] private Toggle confirmToggle;
    private int currentPlotIndex;

    void Start()
    {
        cards = FindObjectsOfType<CardController>().ToList();
        cardGenerator = FindObjectOfType<CardGenerator>();
        plotController = FindObjectOfType<PlotController>();
        if (plotController == null)
        {
            Debug.LogError("未找到 PlotController！");
        }
    }

    public void SetCurrentPlot(InteractiveObject plot, GameObject uiPanel, int plotIndex)
    {
        currentPlot = plot;
        currentPlotIndex = plotIndex;
        confirmToggle = uiPanel.GetComponentInChildren<Toggle>();
        if (confirmToggle == null)
        {
            Debug.LogError("UI面板中必须有一个Toggle！");
            return;
        }
        confirmToggle.onValueChanged.AddListener(OnConfirmToggleChanged);
    }

    private void OnConfirmToggleChanged(bool isOn)
    {
        Debug.Log($"Confirm Toggle is {(isOn ? "On" : "Off")}");
        if (!isOn)
        {
            //DestroyCurrentPlot();
            DisableCurrentPlot();
        }
    }

    private void ClearExistingPrefab(int plotIndex)
    {
        if (plotController == null) return;
        GameObject existingPrefab = plotController.GetPrefab(plotIndex);
        if (existingPrefab != null)
        {
            Destroy(existingPrefab);
            plotController.SetPrefab(plotIndex, null);
            Debug.Log($"地块 {plotIndex} 的旧预制体已删除");
        }
    }

    public void SpawnCard()
{
    if (!confirmToggle || !confirmToggle.isOn || currentPlot == null || plotController == null)
    {
        Debug.LogWarning("无法生成卡牌：Toggle未开启或未选择地块！");
        return;
    }

    List<CardController> selectedCards = cards.Where(c => c.IsSelected).ToList();
    if (selectedCards.Count != 1)
    {
        Debug.LogWarning("Spawn需要选中1张卡牌！");
        return;
    }

    CardController selectedCard = selectedCards[0];
    if (selectedCard.SpawnPrefab != null)
    {
        ClearExistingPrefab(currentPlotIndex);
        GameObject spawnedObject = Instantiate(
            selectedCard.SpawnPrefab,
            currentPlot.GetPosition(),
            Quaternion.identity,
            currentPlot.transform.parent
        );

        // Get the SpriteRenderer of the currentPlot to retrieve its sorting layer
        SpriteRenderer currentPlotRenderer = currentPlot.GetComponent<SpriteRenderer>();
        if (currentPlotRenderer == null)
        {
            Debug.LogWarning("当前地块缺少 SpriteRenderer 组件！");
            return;
        }
        string currentSortingLayer = currentPlotRenderer.sortingLayerName;
        int currentSortingOrder = currentPlotRenderer.sortingOrder;

        // Set the sorting layer and order for the spawned prefab
        SpriteRenderer spawnedRenderer = spawnedObject.GetComponent<SpriteRenderer>();
        if (spawnedRenderer != null)
        {
            spawnedRenderer.sortingLayerName = currentSortingLayer;
            spawnedRenderer.sortingOrder = currentSortingOrder-100;
        }
        else
        {
            Debug.LogWarning("生成的对象缺少 SpriteRenderer 组件！");
        }

        // Find and set sorting layers for HoverImage and Overline
        Transform hoverImage = spawnedObject.transform.Find("HoverImage");
        Transform overline = spawnedObject.transform.Find("Overline");

        if (hoverImage != null)
        {
            SpriteRenderer hoverRenderer = hoverImage.GetComponent<SpriteRenderer>();
            if (hoverRenderer != null)
            {
                hoverRenderer.sortingLayerName = currentSortingLayer;
                hoverRenderer.sortingOrder = spawnedRenderer.sortingOrder + 1;
            }
            else
            {
                Debug.LogWarning("HoverImage 缺少 SpriteRenderer 组件！");
            }
        }
        else
        {
            Debug.LogWarning("未找到 HoverImage 子物体！");
        }

        if (overline != null)
        {
            SpriteRenderer overlineRenderer = overline.GetComponent<SpriteRenderer>();
            if (overlineRenderer != null)
            {
                overlineRenderer.sortingLayerName = currentSortingLayer;
                overlineRenderer.sortingOrder = spawnedRenderer.sortingOrder - 1;
            }
            else
            {
                Debug.LogWarning("Overline 缺少 SpriteRenderer 组件！");
            }
        }
        else
        {
            Debug.LogWarning("未找到 Overline 子物体！");
        }

        plotController.SetPrefab(currentPlotIndex, spawnedObject);
        Debug.Log($"在 {currentPlot.GetPosition()} 卡牌生成！");

        selectedCard.ResetCard();
        cardGenerator.ReorderCards();
    }
    else
    {
        Debug.LogWarning("选中的卡牌没有分配SpawnPrefab！");
    }
}

    public void ReplaceCard()
{
    Debug.Log("ReplaceCard");
    if (!confirmToggle || !confirmToggle.isOn || currentPlot == null || plotController == null)
    {
        Debug.LogWarning("无法替换卡牌：Toggle未开启或未选择地块！");
        return;
    }

    List<CardController> selectedCards = cards.Where(c => c.IsSelected).ToList();
    if (selectedCards.Count != replaceCardCount)
    {
        Debug.LogWarning($"Replace需要选中{replaceCardCount}张卡牌！");
        return;
    }

    string firstCardId = selectedCards[0].CardId;
    if (selectedCards.Any(c => c.CardId != firstCardId))
    {
        Debug.LogWarning("Replace需要所有卡牌相同！");
        return;
    }

    if (plotController.CanAddCard(currentPlotIndex))
    {
        plotController.AddCard(currentPlotIndex);
        if (selectedCards[0].SpawnPrefab != null)
        {
            ClearExistingPrefab(currentPlotIndex);
            GameObject spawnedObject = Instantiate(
                selectedCards[0].SpawnPrefab,
                currentPlot.GetPosition(),
                Quaternion.identity,
                currentPlot.transform.parent
            );

            // Get the SpriteRenderer of the currentPlot to retrieve its sorting layer
            SpriteRenderer currentPlotRenderer = currentPlot.GetComponent<SpriteRenderer>();
            if (currentPlotRenderer == null)
            {
                Debug.LogWarning("当前地块缺少 SpriteRenderer 组件！");
                return;
            }
            string currentSortingLayer = currentPlotRenderer.sortingLayerName;
            int currentSortingOrder = currentPlotRenderer.sortingOrder;

            // Set the sorting layer and order for the spawned prefab
            SpriteRenderer spawnedRenderer = spawnedObject.GetComponent<SpriteRenderer>();
            if (spawnedRenderer != null)
            {
                spawnedRenderer.sortingLayerName = currentSortingLayer;
                spawnedRenderer.sortingOrder = currentSortingOrder-100;
            }
            else
            {
                Debug.LogWarning("生成的对象缺少 SpriteRenderer 组件！");
            }

            // Find and set sorting layers for HoverImage and Overline
            Transform hoverImage = spawnedObject.transform.Find("HoverImage");
            Transform overline = spawnedObject.transform.Find("Overline");

            if (hoverImage != null)
            {
                SpriteRenderer hoverRenderer = hoverImage.GetComponent<SpriteRenderer>();
                if (hoverRenderer != null)
                {
                    hoverRenderer.sortingLayerName = currentSortingLayer;
                    hoverRenderer.sortingOrder = spawnedRenderer.sortingOrder + 1;
                }
                else
                {
                    Debug.LogWarning("HoverImage 缺少 SpriteRenderer 组件！");
                }
            }
            else
            {
                Debug.LogWarning("未找到 HoverImage 子物体！");
            }

            if (overline != null)
            {
                SpriteRenderer overlineRenderer = overline.GetComponent<SpriteRenderer>();
                if (overlineRenderer != null)
                {
                    overlineRenderer.sortingLayerName = currentSortingLayer;
                    overlineRenderer.sortingOrder = spawnedRenderer.sortingOrder - 1;
                }
                else
                {
                    Debug.LogWarning("Overline 缺少 SpriteRenderer 组件！");
                }
            }
            else
            {
                Debug.LogWarning("未找到 Overline 子物体！");
            }

            plotController.SetPrefab(currentPlotIndex, spawnedObject);
            Debug.Log($"在 {currentPlot.GetPosition()} 卡牌替换并生成预制体！");

            foreach (var card in selectedCards)
            {
                card.ResetCard();
            }
            cardGenerator.ReorderCards();
        }
        else
        {
            Debug.LogWarning("选中的卡牌没有分配SpawnPrefab！");
        }
    }
    else
    {
        Debug.LogWarning($"无法替换卡牌：地块 {currentPlotIndex} 已满！");
    }
}

    public void DestroyCurrentPlot()
    {
        if (currentPlot != null)
        {
            Destroy(currentPlot.gameObject,1f);
        }
    }

    private void DisableCurrentPlot()
    {
        if (currentPlot != null)
        {
            // 关闭 UI 面板
            InteractiveObject interactive = currentPlot.GetComponent<InteractiveObject>();
            if (interactive != null)
            {
                System.Reflection.MethodInfo closeInfoPanelMethod = typeof(InteractiveObject).GetMethod("CloseInfoPanel", System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance);
                if (closeInfoPanelMethod != null)
                {
                    closeInfoPanelMethod.Invoke(interactive, null);
                }
            }
            

            // 禁用渲染和交互
            SpriteRenderer renderer = currentPlot.GetComponent<SpriteRenderer>();
            if (renderer != null)
            {
                renderer.enabled = false;
                Debug.Log($"地块 {currentPlot.gameObject.name} 的 SpriteRenderer 已禁用");
            }
            if (interactive != null)
            {
                interactive.enabled = false;
                Debug.Log($"地块 {currentPlot.gameObject.name} 的 InteractiveObject 已禁用");
            }

            // 清除引用
            currentPlot = null;
            currentPlotIndex = -1;
            confirmToggle = null;
        }
    }

    public InteractiveObject GetCurrentPlot()
    {
        return currentPlot;
    }

    public void ClearCurrentPlot()
    {
        currentPlot = null;
        currentPlotIndex = -1;
        confirmToggle = null;
    }
}