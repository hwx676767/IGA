using UnityEngine;
using UnityEngine.UI;

/// <summary>
/// 挂载在UI按钮上，负责关联一个ItemData，并响应点击事件
/// </summary>
public class ItemButton : MonoBehaviour
{
    public ItemData itemData;

    private Button button;
    private UIDisplayManager displayManager;
    private bool wired;

    void Start()
    {
        EnsureWired();
    }

    public void Setup(ItemData data)
    {
        itemData = data;
        wired = false;
        EnsureWired();
    }

    private void EnsureWired()
    {
        if (wired) return;

        if (button == null)
            button = GetComponent<Button>();
        if (displayManager == null)
            displayManager = FindObjectOfType<UIDisplayManager>();

        if (displayManager == null)
        {
            Debug.LogError("场景中找不到UIDisplayManager组件！");
            return;
        }

        if (button != null && itemData != null)
        {
            button.onClick.RemoveAllListeners();
            button.onClick.AddListener(() => displayManager.DisplayItem(itemData));
            wired = true;
        }
        else if (itemData == null && enabled)
        {
            Debug.LogWarning($"按钮 {gameObject.name} 尚未绑定 ItemData。");
        }
    }
}
