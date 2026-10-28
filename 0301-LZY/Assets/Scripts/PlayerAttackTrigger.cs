using UnityEngine;

public class PlayerAttackTrigger : MonoBehaviour
{
    [Header("攻击设置")]
    public int attackDamage = 10;           // 攻击伤害值
    public LayerMask targetLayer;            // 目标层级（Boss层）
    
    [Header("击退设置")]
    public bool enableKnockback = false;     // 是否启用击退
    public float knockbackForce = 5f;        // 击退力度
    
    void OnTriggerEnter2D(Collider2D other)
    {
        // 检查是否在目标层级中
        if (!IsInLayerMask(other.gameObject, targetLayer))
            return;
        
        // 获取Boss血量组件
        BossHealth bossHealth = other.GetComponent<BossHealth>();
        if (bossHealth == null)
            bossHealth = other.GetComponentInParent<BossHealth>();
        
        if (bossHealth != null)
        {
            // 计算击退方向（从玩家指向Boss）
            Vector2 knockbackDirection = (other.transform.position - transform.position).normalized;
            
            // 造成伤害
            if (enableKnockback)
            {
                bossHealth.TakeDamage(attackDamage, knockbackDirection);
            }
            else
            {
                bossHealth.TakeDamage(attackDamage);
            }
            
            Debug.Log($"玩家攻击命中Boss！伤害: {attackDamage}");
        }
    }
    
    // 检查游戏对象是否在指定层级中
    bool IsInLayerMask(GameObject obj, LayerMask layerMask)
    {
        return ((1 << obj.layer) & layerMask) != 0;
    }
}