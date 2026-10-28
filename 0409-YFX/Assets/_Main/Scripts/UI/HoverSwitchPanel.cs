using UnityEngine;
using UnityEngine.EventSystems;

public class HoverSwitchPanel : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler
{
    [Header("子物体名称")]
    [Tooltip("默认显示的子物体名称")]
    public string outsidePanelName = "outside";
    
    [Tooltip("鼠标悬浮时显示的子物体名称")]
    public string insidePanelName = "inside";
    
    [Header("可选设置")]
    [Tooltip("鼠标离开后是否恢复显示outside")]
    public bool restoreOnExit = true;
    
    private Transform outsidePanel;
    private Transform insidePanel;
    
    private void Start()
    {
        // 查找子物体
        outsidePanel = transform.Find(outsidePanelName);
        insidePanel = transform.Find(insidePanelName);
        
        if (outsidePanel == null)
            Debug.LogError($"未找到名为 {outsidePanelName} 的子物体！请检查物体：{gameObject.name}");
        
        if (insidePanel == null)
            Debug.LogError($"未找到名为 {insidePanelName} 的子物体！请检查物体：{gameObject.name}");
        
        // 初始状态：显示outside，隐藏inside
        if (outsidePanel != null)
            outsidePanel.gameObject.SetActive(true);
        
        if (insidePanel != null)
            insidePanel.gameObject.SetActive(false);
    }
    
    public void OnPointerEnter(PointerEventData eventData)
    {
        // 鼠标进入：隐藏outside，显示inside
        if (outsidePanel != null)
            outsidePanel.gameObject.SetActive(false);
        
        if (insidePanel != null)
            insidePanel.gameObject.SetActive(true);
    }
    
    public void OnPointerExit(PointerEventData eventData)
    {
        if (restoreOnExit)
        {
            // 鼠标离开：恢复显示outside，隐藏inside
            if (outsidePanel != null)
                outsidePanel.gameObject.SetActive(true);
            
            if (insidePanel != null)
                insidePanel.gameObject.SetActive(false);
        }
    }
    
    // 手动切换面板（供外部调用）
    public void SetInsidePanelActive(bool showInside)
    {
        if (showInside)
        {
            if (outsidePanel != null)
                outsidePanel.gameObject.SetActive(false);
            if (insidePanel != null)
                insidePanel.gameObject.SetActive(true);
        }
        else
        {
            if (outsidePanel != null)
                outsidePanel.gameObject.SetActive(true);
            if (insidePanel != null)
                insidePanel.gameObject.SetActive(false);
        }
    }
}