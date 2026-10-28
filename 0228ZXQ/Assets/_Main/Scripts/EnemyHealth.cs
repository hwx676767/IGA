using UnityEngine;

public class EnemyHealth : MonoBehaviour
{
    public int health = 100; // Enemy 的生命值

    public void TakeDamage(int damage)
    {
        health -= damage;
        if (health <= 0)
        {
            Die();
        }
    }

    void Die()
    {
        // 处理 Enemy 死亡逻辑
        Destroy(gameObject);
    }
}