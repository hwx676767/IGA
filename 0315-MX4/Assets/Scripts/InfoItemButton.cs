using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class InfoItemButton : MonoBehaviour
{
    [Header("UI组件")]
    public Text titleText;     // 显示标题的文本
    
    [Header("数据")]
    public InfoData infoData;              // 关联的数据文件
    
    private Button button;
    
    void Awake()
    {
        button = GetComponent<Button>();
        if (button != null)
        {
            button.onClick.AddListener(OnItemClick);
        }
    }
    
    void Start()
    {
        // 初始化显示
        if (infoData != null && titleText != null)
        {
            titleText.text = infoData.infoTitle;
        }
    }
    
    // 初始化方法（用于动态生成时设置数据）
    public void Initialize(InfoData data)
    {
        infoData = data;
        
        if (titleText != null)
        {
            titleText.text = data.infoTitle;
        }
    }
    
    // 点击事件 - 显示详情页
    private void OnItemClick()
    {
        if (infoData != null)
        {
            // 调用UIManager显示详情页
            if (UIManager.Instance != null)
            {
                UIManager.Instance.ShowDetailPanel(infoData);
            }
            else
            {
                Debug.LogError("UIManager不存在！");
            }
        }
    }
    
    // 在编辑器下更新显示
    void OnValidate()
    {
        if (infoData != null && titleText != null)
        {
            titleText.text = infoData.infoTitle;
        }
    }
}