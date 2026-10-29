using UnityEngine;
using UnityEngine.Events;

public class PlayerHealth : MonoBehaviour
{
    [Header("血量设置")]
    public float maxHealth = 3f;
    public float currentHealth;

    [Header("事件")]
    public UnityEvent onDamageTaken;
    public UnityEvent onDeath;
    public UnityEvent<float> onHealthChanged; // 参数：当前血量

    private void Start()
    {
        currentHealth = maxHealth;
        onHealthChanged?.Invoke(currentHealth);
    }

    // 受到伤害
    public void TakeDamage(float damageAmount)
    {
        if (currentHealth <= 0) return;

        currentHealth -= damageAmount;
        currentHealth = Mathf.Clamp(currentHealth, 0, maxHealth);

        onHealthChanged?.Invoke(currentHealth);
        onDamageTaken?.Invoke();

        Debug.Log($"玩家受到 {damageAmount} 点伤害，剩余血量: {currentHealth}");

        if (currentHealth <= 0)
        {
            Die();
        }
    }

    // 治疗
    public void Heal(float healAmount)
    {
        currentHealth += healAmount;
        currentHealth = Mathf.Clamp(currentHealth, 0, maxHealth);
        onHealthChanged?.Invoke(currentHealth);
    }

    // 死亡
    private void Die()
    {
        Debug.Log("玩家死亡");
        onDeath?.Invoke();
        // 这里可以添加死亡动画、游戏结束逻辑等
    }
}