using UnityEngine;
using UnityEngine.UI;

public class ItemInteraction : MonoBehaviour
{
    public enum ItemType { Battery, Magnet, Transformer, Detector, Door }
    public ItemType itemType;

    // UI元素缓存
    private static GameObject itemPanel;
    private static Button yesButton;
    private static Button noButton;
    private bool isWaitingForConfirm;
    private int currentLayer;
    private static bool isUIOpen = false;

    void Start()
    {
        // 只需在第一次时初始化UI
        if (yesButton == null || noButton == null)
        {
            FindUIElements();
        }
    }

    void FindUIElements()
    {
        string panelName = itemType.ToString() + "Panel";
        Transform canvasTransform = GameObject.Find("InteractCanvas")?.transform;
        
        if (canvasTransform != null)
        {
            itemPanel = canvasTransform.Find(panelName)?.gameObject;
            
            // 门特殊处理：使用通用确认面板
            /*Transform confirmPanel = itemType == ItemType.Door 
                ? canvasTransform.Find("CommonConfirmPanel")
                : canvasTransform.Find(panelName);*/
            
            Transform confirmPanel = canvasTransform.Find(panelName);

            if (confirmPanel != null)
            {
                yesButton = confirmPanel.Find("YesButton")?.GetComponent<Button>();
                noButton = confirmPanel.Find("NoButton")?.GetComponent<Button>();

                // 清除旧监听（避免重复绑定）
                if (yesButton != null) yesButton.onClick.RemoveAllListeners();
                if (noButton != null) noButton.onClick.RemoveAllListeners();
                
                // 添加新监听
                if (yesButton != null) yesButton.onClick.AddListener(OnConfirmCollect);
                if (noButton != null) noButton.onClick.AddListener(OnCancelCollect);
            }
        }
    }

    void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player") && !isWaitingForConfirm && !isUIOpen)
        {
            currentLayer = Mathf.RoundToInt(transform.position.y / MapManager.Instance.layerHeight);
            
            // 显示UI
            itemPanel?.SetActive(true);
            yesButton?.transform.parent.gameObject.SetActive(true);
            
            // 暂停游戏（门不暂停）
            if(itemType != ItemType.Door) Time.timeScale = 0f;
            
            isWaitingForConfirm = true;
            isUIOpen = true;
        }
    }

    void OnConfirmCollect()
    {
        if (!isWaitingForConfirm) return;
        
        // 非门物品执行收集逻辑
        if(itemType != ItemType.Door)
        {
            Debug.Log("不是门");
            LevelDataManager.Instance.RemoveItem(currentLayer, gameObject);
            LevelDataManager.Instance.UpdateDisplay(MapManager.Instance.CurrentCenterLayer);
            Destroy(gameObject);
        }
        
        CloseUI();
    }

    void OnCancelCollect()
    {
        CloseUI();
    }

    void CloseUI()
    {
        itemPanel?.SetActive(false);
        yesButton?.transform.parent.gameObject.SetActive(false);
        
        // 确保恢复时间（无论是否门）
        Time.timeScale = 1f;
        
        isWaitingForConfirm = false;
        isUIOpen = false;
    }

    void OnDestroy()
    {
        // 额外安全措施
        if (isUIOpen) CloseUI();
    }
}