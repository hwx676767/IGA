using UnityEngine;
using DG.Tweening;

public class CollectibleItem : MonoBehaviour
{
    public GameObject uiPrefab;  // UI物品预制体
    public int itemID;           // 物品ID
    private bool isCollected = false;

    private void OnMouseDown()
    {
        if (isCollected) return;
        isCollected = true;

        CollectItem();
    }

    void CollectItem()
    {
        // 获取场景中物品的世界坐标
        Vector3 worldPos = transform.position;

        // 将世界坐标转换为屏幕坐标
        Vector3 screenPos = Camera.main.WorldToScreenPoint(worldPos);

        // 创建UI实例，放置在屏幕坐标（而非世界坐标）上
        GameObject uiInstance = Instantiate(uiPrefab, screenPos, Quaternion.identity, GameManager.Instance.uiCanvasTransform);

        // 获取目标UI位置
        Vector3 targetPosition = GameManager.Instance.GetUIPosition(itemID);

        // 禁用场景物品显示
        GetComponent<SpriteRenderer>().enabled = false;

        // 动画移动
        uiInstance.transform.DOMove(targetPosition, 0.5f).SetEase(Ease.InOutQuad).OnComplete(() =>
        {
            // 销毁UI物品
            Destroy(uiInstance);

            // 更新UI数字
            GameManager.Instance.UpdateUI(itemID);

            // 销毁场景物品
            Destroy(gameObject);
        });
    }

}
