using UnityEngine;

public class UISlidePanel : MonoBehaviour
{
    [Header("面板设置")]
    public RectTransform panelRect;          // 要移动的UI面板
    public float animationDuration = 0.3f;   // 动画时长
    
    [Header("位置设置")]
    public float shownPosY = 0f;             // 显示时的Y坐标
    public float hiddenPosY = -500f;         // 隐藏时的Y坐标（屏幕下方）
    public bool startHidden = true;           // 开始时是否隐藏
    
    [Header("按键设置")]
    public KeyCode toggleKey = KeyCode.C;     // 开关按键
    
    private bool isShown = false;
    private float timer = 0f;
    private bool isAnimating = false;
    private float startY;
    private float targetY;
    
    void Start()
    {
        if (panelRect == null)
            panelRect = GetComponent<RectTransform>();
        
        // 设置初始位置
        if (startHidden)
        {
            panelRect.anchoredPosition = new Vector2(panelRect.anchoredPosition.x, hiddenPosY);
            isShown = false;
        }
        else
        {
            panelRect.anchoredPosition = new Vector2(panelRect.anchoredPosition.x, shownPosY);
            isShown = true;
        }
    }
    
    void Update()
    {
        if (Input.GetKeyDown(toggleKey))
        {
            TogglePanel();
        }
        
        // 执行动画
        if (isAnimating)
        {
            timer += Time.deltaTime / animationDuration;
            
            if (timer >= 1f)
            {
                panelRect.anchoredPosition = new Vector2(panelRect.anchoredPosition.x, targetY);
                isAnimating = false;
            }
            else
            {
                float currentY = Mathf.Lerp(startY, targetY, timer);
                panelRect.anchoredPosition = new Vector2(panelRect.anchoredPosition.x, currentY);
            }
        }
    }
    
    public void TogglePanel()
    {
        if (isAnimating) return;
        
        if (isShown)
            HidePanel();
        else
            ShowPanel();
    }
    
    public void ShowPanel()
    {
        if (isAnimating || isShown) return;
        
        startY = hiddenPosY;
        targetY = shownPosY;
        timer = 0f;
        isAnimating = true;
        isShown = true;
    }
    
    public void HidePanel()
    {
        if (isAnimating || !isShown) return;
        
        startY = shownPosY;
        targetY = hiddenPosY;
        timer = 0f;
        isAnimating = true;
        isShown = false;
    }
    
}