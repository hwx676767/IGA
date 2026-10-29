using UnityEngine;

public class ArrowProjectile : MonoBehaviour
{
    private Vector3 direction;
    private float speed;
    private float damage;
    private PlayerHealth targetHealth;
    private bool hasHit = false;

    public void Initialize(Vector3 shootDirection, float arrowSpeed, float arrowDamage, PlayerHealth playerHealth)
    {
        direction = shootDirection;
        speed = arrowSpeed;
        damage = arrowDamage;
        targetHealth = playerHealth;
    }

    void Update()
    {
        if (!hasHit)
        {
            transform.position += direction * speed * Time.deltaTime;
        }
    }

    void OnTriggerEnter(Collider other)
    {
        if (hasHit) return;

        // 检测是否击中玩家
        if (other.CompareTag("Player") && targetHealth != null)
        {
            PlayerBlock blockSystem = other.GetComponent<PlayerBlock>();
            float damageMultiplier = 1f;

            // 如果有格挡系统，计算伤害倍率
            if (blockSystem != null)
            {
                damageMultiplier = blockSystem.ProcessAttack();
            }

            // 造成伤害
            targetHealth.TakeDamage(damage * damageMultiplier);
            hasHit = true;
            Destroy(gameObject);
            Debug.Log($"箭矢击中玩家，造成 {damage * damageMultiplier} 点伤害");
        }
        // 击中其他物体
        else if (!other.isTrigger)
        {
            hasHit = true;
            Destroy(gameObject, 2f); // 2秒后销毁
        }
    }
}