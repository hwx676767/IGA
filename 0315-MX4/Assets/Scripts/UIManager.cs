using UnityEngine;
using UnityEngine.UI;

public class UIManager : MonoBehaviour
{
    public static UIManager Instance { get; private set; }
    
    [Header("主界面")]
    //public GameObject searchPanel;      // 搜索主界面
    
    [Header("详情页")]
    public GameObject detailPanel;      // 详情页Panel
    public Text detailTitleText;
    public Text detailContentText;
    public Image detailImage;
    public Button closeDetailButton;
    //public Button backButton;           // 返回按钮
    
    void Awake()
    {
        // 单例设置
        if (Instance == null)
        {
            Instance = this;
            DontDestroyOnLoad(gameObject); // 如果需要跨场景保留
        }
        else
        {
            Destroy(gameObject);
        }
    }
    
    void Start()
    {
        if (detailPanel != null)
            detailPanel.SetActive(false);
            
        // 添加按钮监听
        if (closeDetailButton != null)
            closeDetailButton.onClick.AddListener(HideDetailPanel);
        /*    
        if (backButton != null)
            backButton.onClick.AddListener(HideDetailPanel);*/
    }
    
    // 显示详情页并加载数据
    public void ShowDetailPanel(InfoData data)
    {
        if (data == null)
        {
            Debug.LogError("数据为空！");
            return;
        }
        
        // 显示详情页
        if (detailPanel != null)
            detailPanel.SetActive(true);
            
        // 加载数据到UI
        LoadDetailData(data);
    }
    
    // 加载详情数据
    private void LoadDetailData(InfoData data)
    {
        if (detailTitleText != null)
            detailTitleText.text = data.infoTitle;
            
        if (detailContentText != null)
            detailContentText.text = data.infoContent;
            
        if (detailImage != null)
            detailImage.sprite = data.infoImage;
    }
    
    // 隐藏详情页
    public void HideDetailPanel()
    {
        if (detailPanel != null)
            detailPanel.SetActive(false);
    }
    
    // 切换面板（可选）
    public void TogglePanel(GameObject panel)
    {
        if (panel != null)
            panel.SetActive(!panel.activeSelf);
    }
}