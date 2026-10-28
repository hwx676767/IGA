using UnityEngine;

public class GameManager : MonoBehaviour
{
    public static GameManager Instance;
    public Transform uiCanvasTransform;  // UI 父容器
    public UIItemDisplay uiDisplay;     // 显示 UI 的脚本

    private void Awake()
    {
        Instance = this;
    }

    public Vector3 GetUIPosition(int itemID)
    {
        // 返回UI中对应位置
        return uiDisplay.GetPosition(itemID);
    }

    public void UpdateUI(int itemID)
    {
        // 根据物品ID更新数字
        uiDisplay.DecreaseItemCount(itemID);
    }
}
