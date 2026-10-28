using UnityEngine;

public class CollectibleItem : MonoBehaviour
{
    public int value = 1; // 每个收集物的分值

    private void OnTriggerEnter(Collider other)
    {
        // 检查碰撞对象是否是玩家
        if (other.CompareTag("Player"))
        {
            // 通知游戏管理器增加收集物数量
            GameManager.Instance.CollectItem(value);

            // 销毁收集物
            Destroy(gameObject);
        }
    }
}