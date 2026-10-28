using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class PlayerHealth : MonoBehaviour
{
    [Header("血量设置")]
    public int maxHealth = 100;
    public int currentHealth;
    
    [Header("伤害反馈")]
    public float flashDuration = 0.1f;      // 闪红持续时间
    public Color flashColor = Color.red;    // 闪红颜色
    public SpriteRenderer playerSprite;      // 玩家精灵渲染器（用于闪红）
    
    [Header("血条UI")]
    public Slider healthSlider;              // 血条Slider
    public Image fillImage;                  // 血条填充图片（可选，用于变色）
    public Gradient healthGradient;          // 血条颜色渐变
    
    [Header("死亡效果")]
    //public GameObject deathEffect;           // 死亡特效
    public float deathDelay = 1f;            // 死亡延迟
    
    [Header("无敌时间")]
    public bool invincibleOnHit = true;      // 受伤后是否无敌
    public float invincibleDuration = 1f;    // 无敌时间
    public float invincibleFlashInterval = 0.1f; // 无敌闪烁间隔
    
    // 组件引用
    private Color originalColor;
    private bool isInvincible = false;
    private Collider2D playerCollider;
    private Rigidbody2D rb;
    private PlayerController playerController;
    
    // 事件
    public System.Action OnHealthChanged;
    public System.Action OnPlayerDeath;
    
    void Start()
    {
        // 获取组件
        if (playerSprite == null)
            playerSprite = GetComponentInChildren<SpriteRenderer>();
        if (playerSprite == null)
            playerSprite = GetComponent<SpriteRenderer>();
            
        playerCollider = GetComponent<Collider2D>();
        rb = GetComponent<Rigidbody2D>();
        playerController = GetComponent<PlayerController>();
        
        // 保存原始颜色
        if (playerSprite != null)
        {
            originalColor = playerSprite.color;
        }
        
        // 初始化血量
        currentHealth = maxHealth;
        
        // 初始化血条
        UpdateHealthUI();
        
        Debug.Log($"玩家血量初始化: {currentHealth}/{maxHealth}");
    }
    
    // 受到伤害的方法
    public void TakeDamage(int damage)
    {
        // 无敌状态不受伤害
        if (isInvincible || currentHealth <= 0) return;
        
        // 减少血量
        currentHealth -= damage;
        currentHealth = Mathf.Max(0, currentHealth);
        
        Debug.Log($"玩家受到伤害: {damage}, 当前血量: {currentHealth}/{maxHealth}");
        
        // 触发血量变化事件
        OnHealthChanged?.Invoke();
        
        // 更新血条UI
        UpdateHealthUI();
        
        // 闪红效果
        StartCoroutine(FlashRed());
        
        // 受伤后无敌
        if (invincibleOnHit && currentHealth > 0)
        {
            StartCoroutine(InvincibilityFrames());
        }
        
        // 检查是否死亡
        if (currentHealth <= 0)
        {
            Die();
        }
    }
    
    // 受到伤害（带击退）
    public void TakeDamage(int damage, Vector2 hitDirection, float knockbackForce = 5f)
    {
        TakeDamage(damage);
        
        // 应用击退
        if (rb != null && currentHealth > 0)
        {
            Vector2 knockbackDir = hitDirection.normalized;
            knockbackDir.y = Mathf.Abs(knockbackDir.y) + 0.5f; // 稍微向上
            rb.velocity = knockbackDir * knockbackForce;
        }
    }
    
    // 治疗
    public void Heal(int amount)
    {
        currentHealth += amount;
        currentHealth = Mathf.Min(currentHealth, maxHealth);
        
        OnHealthChanged?.Invoke();
        UpdateHealthUI();
        
        Debug.Log($"玩家治疗: {amount}, 当前血量: {currentHealth}/{maxHealth}");
    }
    
    // 更新血条UI
    void UpdateHealthUI()
    {
        if (healthSlider != null)
        {
            healthSlider.maxValue = maxHealth;
            healthSlider.value = currentHealth;
        }
        
        // 更新血条颜色
        if (fillImage != null && healthGradient != null)
        {
            float healthPercent = (float)currentHealth / maxHealth;
            fillImage.color = healthGradient.Evaluate(healthPercent);
        }
    }
    
    // 闪红协程
    IEnumerator FlashRed()
    {
        if (playerSprite != null)
        {
            playerSprite.color = flashColor;
            yield return new WaitForSeconds(flashDuration);
            
            // 如果不是无敌状态，恢复原色
            if (!isInvincible)
            {
                playerSprite.color = originalColor;
            }
        }
    }
    
    // 无敌帧协程
    IEnumerator InvincibilityFrames()
    {
        isInvincible = true;
        
        // 可选：禁用碰撞器
        // if (playerCollider != null)
        //     playerCollider.enabled = false;
        
        float elapsed = 0f;
        while (elapsed < invincibleDuration)
        {
            // 闪烁效果
            if (playerSprite != null)
            {
                playerSprite.enabled = !playerSprite.enabled;
            }
            
            yield return new WaitForSeconds(invincibleFlashInterval);
            elapsed += invincibleFlashInterval;
        }
        
        // 确保最后是可见的
        if (playerSprite != null)
        {
            playerSprite.enabled = true;
            playerSprite.color = originalColor;
        }
        
        // 重新启用碰撞器
        // if (playerCollider != null)
        //     playerCollider.enabled = true;
        
        isInvincible = false;
    }
    
    // 死亡
    void Die()
    {
        Debug.Log("玩家死亡");
        
        // 触发死亡事件
        OnPlayerDeath?.Invoke();
        
        // 播放死亡特效
        /*
        if (deathEffect != null)
        {
            Instantiate(deathEffect, transform.position, Quaternion.identity);
        }*/
        
        // 禁用玩家控制器
        if (playerController != null)
        {
            playerController.enabled = false;
        }
        
        // 禁用碰撞器
        if (playerCollider != null)
        {
            playerCollider.enabled = false;
        }
        
        // 停止运动
        if (rb != null)
        {
            rb.velocity = Vector2.zero;
            rb.isKinematic = true;
        }
        
        // 隐藏玩家（可选）
        if (playerSprite != null)
        {
            playerSprite.enabled = false;
        }
        
        // 延迟销毁或重新开始
        // Destroy(gameObject, deathDelay);
        
        // 或者调用游戏管理器重新开始
        // GameManager.Instance.GameOver();
    }
    
    // 重置血量（用于重新开始）
    public void ResetHealth()
    {
        currentHealth = maxHealth;
        UpdateHealthUI();
        
        if (playerSprite != null)
        {
            playerSprite.color = originalColor;
            playerSprite.enabled = true;
        }
        
        if (playerController != null)
        {
            playerController.enabled = true;
        }
        
        if (playerCollider != null)
        {
            playerCollider.enabled = true;
        }
        
        if (rb != null)
        {
            rb.isKinematic = false;
        }
        
        isInvincible = false;
        
        Debug.Log("玩家血量重置");
    }
    
    // 获取血量百分比
    public float GetHealthPercentage()
    {
        return (float)currentHealth / maxHealth;
    }
}