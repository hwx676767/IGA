using UnityEngine;

public class DoorDebug : MonoBehaviour
{
    void Start()
    {
        Collider2D col = GetComponent<Collider2D>();
        if (col == null)
        {
            Debug.LogError($"Door {gameObject.name} 没有Collider2D组件！");
        }
        else
        {
            Debug.Log($"Door {gameObject.name} Collider设置:");
            Debug.Log($"- IsTrigger: {col.isTrigger}");
            Debug.Log($"- Layer: {LayerMask.LayerToName(gameObject.layer)}");
            Debug.Log($"- Bounds: {col.bounds}");
            Debug.Log($"- Enabled: {col.enabled}");
        }
    }
    
    void OnCollisionEnter2D(Collision2D collision)
    {
        Debug.Log($"Door碰撞检测: {collision.gameObject.name}");
    }
    
    void OnTriggerEnter2D(Collider2D other)
    {
        Debug.Log($"Door触发器检测: {other.gameObject.name}");
    }
}