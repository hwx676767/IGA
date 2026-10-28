using UnityEngine;
using UnityEngine.EventSystems;

public class UIController : MonoBehaviour
{
    public GameObject classPanel; 
    public GameObject eatPanel; 
    public GameObject drawPanel; // 新增的绘画面板
    private FirstPersonLook playerLook; // 引用相机控制脚本
    
    void Start()
    {
        // 获取玩家相机控制脚本
        playerLook = FindObjectOfType<FirstPersonLook>();
        
        // 初始状态：面板关闭
        if (classPanel != null)
            classPanel.SetActive(false);
        if (eatPanel != null)
            eatPanel.SetActive(false);
        if (drawPanel != null) // 初始化新增的面板
            drawPanel.SetActive(false);
    }
    
    void Update()
    {
        // 按1键打开/关闭classPanel
        if (Input.GetKeyDown(KeyCode.Alpha1))
        {
            TogglePanel(classPanel);
        }
        
        // 按2键打开/关闭eatPanel
        if (Input.GetKeyDown(KeyCode.Alpha2))
        {
            TogglePanel(eatPanel);
        }
        
        // 按3键打开/关闭drawPanel
        if (Input.GetKeyDown(KeyCode.Alpha3))
        {
            TogglePanel(drawPanel);
        }
    }
    
    public void TogglePanel(GameObject panel)
    {
        if (panel == null) return;
        
        bool isActive = !panel.activeSelf;
        
        // 如果要打开新面板，先关闭所有其他面板
        if (isActive)
        {
            CloseAllPanels();
            panel.SetActive(true);
            
            // 打开面板时：显示鼠标，解锁鼠标，禁止相机旋转
            Cursor.lockState = CursorLockMode.None;
            Cursor.visible = true;
            
            if (playerLook != null)
                playerLook.SetLookEnabled(false);
        }
        else
        {
            panel.SetActive(false);
            
            // 检查是否还有其他面板打开（现在要检查三个面板）
            if ((classPanel == null || !classPanel.activeSelf) && 
                (eatPanel == null || !eatPanel.activeSelf) && 
                (drawPanel == null || !drawPanel.activeSelf))
            {
                // 关闭所有面板时：隐藏鼠标，锁定鼠标，允许相机旋转
                Cursor.lockState = CursorLockMode.Locked;
                Cursor.visible = false;
                
                if (playerLook != null)
                    playerLook.SetLookEnabled(true);
            }
        }
    }
    
    // 关闭所有面板（现在包括drawPanel）
    private void CloseAllPanels()
    {
        if (classPanel != null)
            classPanel.SetActive(false);
        if (eatPanel != null)
            eatPanel.SetActive(false);
        if (drawPanel != null) // 新增的drawPanel
            drawPanel.SetActive(false);
    }
    
    // 这个方法和FirstPersonLook中的一样，用于检测UI悬停
    public static bool IsPointerOverUI()
    {
        if (EventSystem.current == null)
            return false;
            
        PointerEventData eventData = new PointerEventData(EventSystem.current);
        eventData.position = Input.mousePosition;
        var results = new System.Collections.Generic.List<RaycastResult>();
        EventSystem.current.RaycastAll(eventData, results);
        return results.Count > 0;
    }
}