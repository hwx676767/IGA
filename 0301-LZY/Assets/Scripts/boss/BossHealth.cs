using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class BossHealth : MonoBehaviour
{
    [Header("血量设置")]
    public int maxHealth = 100;
    public int currentHealth;
    
    [Header("伤害反馈")]
    public float flashDuration = 0.1f;      // 闪红持续时间
    public Color flashColor = Color.red;    // 闪红颜色
    
    [Header("伤害数字显示")]
    public GameObject damageNumberPrefab;    // 伤害数字预制体
    public float floatHeight = 2f;           // 上浮高度
    public float floatDuration = 0.5f;       // 上浮动持续时间
    public float startScale = 0.5f;           // 起始缩放
    public float endScale = 1.5f;             // 结束缩放
    public Vector3 prefabScale = new Vector3(0.03f, 0.03f, 0.03f); // 预制体默认缩放
    
    [Header("死亡效果")]
    //public GameObject deathEffect;           // 死亡特效
    public float deathDelay = 1f;            // 死亡延迟
    
    [Header("击退设置")]
    public bool enableKnockback = false;      // 是否启用击退（默认关闭）
    public float knockbackForce = 5f;         // 击退力度
    
    // 组件引用
    private SpriteRenderer spriteRenderer;
    private Color originalColor;
    private BossController bossController;
    private Rigidbody2D rb;
    
    // 当前激活的伤害数字
    private GameObject activeDamageNumber;
    private Coroutine activeNumberCoroutine;
    
    // 事件
    public System.Action OnHealthChanged;
    public System.Action OnBossDeath;
    
    void Start()
    {
        // 获取组件
        spriteRenderer = GetComponentInChildren<SpriteRenderer>();
        if (spriteRenderer == null)
            spriteRenderer = GetComponent<SpriteRenderer>();
            
        bossController = GetComponent<BossController>();
        rb = GetComponent<Rigidbody2D>();
        
        // 保存原始颜色
        if (spriteRenderer != null)
        {
            originalColor = spriteRenderer.color;
        }
        
        // 初始化血量
        currentHealth = maxHealth;
        
        // 预创建伤害数字对象
        if (damageNumberPrefab != null)
        {
            activeDamageNumber = Instantiate(damageNumberPrefab, transform.position, Quaternion.identity);
            activeDamageNumber.transform.SetParent(transform);
            activeDamageNumber.transform.localScale = prefabScale; // 设置默认缩放
            activeDamageNumber.SetActive(false);
        }
        
        Debug.Log($"Boss血量初始化: {currentHealth}/{maxHealth}");
    }
    
    // 受到伤害的方法
    public void TakeDamage(int damage)
    {
        if (currentHealth <= 0) return;
        
        // 减少血量
        currentHealth -= damage;
        currentHealth = Mathf.Max(0, currentHealth);
        
        Debug.Log($"Boss受到伤害: {damage}, 当前血量: {currentHealth}/{maxHealth}");
        
        // 触发血量变化事件
        OnHealthChanged?.Invoke();
        
        // 闪红效果
        StartCoroutine(FlashRed());
        
        // 显示伤害数字
        ShowDamageNumber(damage);
        
        // 检查是否死亡
        if (currentHealth <= 0)
        {
            Die();
        }
    }
    
    // 受到伤害（带击退）
    public void TakeDamage(int damage, Vector2 hitDirection)
    {
        TakeDamage(damage);
        
        // 如果启用了击退，应用击退效果
        if (enableKnockback && rb != null)
        {
            // 标准化击退方向
            Vector2 knockbackDir = hitDirection.normalized;
            // 添加向上的力，让Boss有点浮空效果
            knockbackDir.y = Mathf.Abs(knockbackDir.y) + 0.5f;
            
            rb.velocity = knockbackDir * knockbackForce;
            
            Debug.Log($"应用击退: 方向 {knockbackDir}, 力度 {knockbackForce}");
        }
    }
    
    // 闪红协程
    IEnumerator FlashRed()
    {
        if (spriteRenderer != null)
        {
            spriteRenderer.color = flashColor;
            yield return new WaitForSeconds(flashDuration);
            spriteRenderer.color = originalColor;
        }
    }
    
    // 显示伤害数字
    void ShowDamageNumber(int damage)
    {
        if (damageNumberPrefab == null || activeDamageNumber == null)
        {
            Debug.LogWarning("伤害数字预制体未设置！");
            return;
        }
        
        // 如果之前有动画正在运行，先停止并隐藏
        if (activeNumberCoroutine != null)
        {
            StopCoroutine(activeNumberCoroutine);
            activeDamageNumber.SetActive(false);
        }
        
        // 设置位置（在Boss头顶附近，带随机偏移）
        Vector3 spawnPos = transform.position + Vector3.up * 1.5f;
        spawnPos.x += Random.Range(-0.5f, 0.5f); // 随机水平偏移
        activeDamageNumber.transform.position = spawnPos;
        
        // 确保缩放正确
        activeDamageNumber.transform.localScale = prefabScale;
        
        // 设置伤害数值
        TMPro.TextMeshPro tmpComp = activeDamageNumber.GetComponent<TMPro.TextMeshPro>();
        if (tmpComp != null)
        {
            tmpComp.text = damage.ToString();
        }
        else
        {
            // 如果没有TMP，尝试查找TextMesh
            TextMesh textMesh = activeDamageNumber.GetComponent<TextMesh>();
            if (textMesh != null)
            {
                textMesh.text = damage.ToString();
            }
        }
        
        // 激活并开始动画
        activeDamageNumber.SetActive(true);
        activeNumberCoroutine = StartCoroutine(AnimateDamageNumber());
    }
    
    // 伤害数字动画协程
    IEnumerator AnimateDamageNumber()
    {
        float elapsed = 0f;
        Vector3 startPos = activeDamageNumber.transform.position;
        Vector3 endPos = startPos + Vector3.up * floatHeight;
        
        // 设置初始缩放（基于prefabScale）
        Vector3 startScaleVec = prefabScale * startScale;
        Vector3 endScaleVec = prefabScale * endScale;
        activeDamageNumber.transform.localScale = startScaleVec;
        
        while (elapsed < floatDuration)
        {
            elapsed += Time.deltaTime;
            float t = elapsed / floatDuration;
            
            // 使用ease-out曲线让动画更自然
            float smoothT = 1f - Mathf.Pow(1f - t, 3f);
            
            // 移动
            activeDamageNumber.transform.position = Vector3.Lerp(startPos, endPos, smoothT);
            
            // 缩放
            activeDamageNumber.transform.localScale = Vector3.Lerp(startScaleVec, endScaleVec, t);
            
            yield return null;
        }
        
        // 动画结束，隐藏对象
        activeDamageNumber.SetActive(false);
        activeNumberCoroutine = null;
    }
    
    // 死亡
    void Die()
    {
        Debug.Log("Boss死亡");
        
        // 触发死亡事件
        OnBossDeath?.Invoke();
        
        // 播放死亡特效
        /*
        if (deathEffect != null)
        {
            Instantiate(deathEffect, transform.position, Quaternion.identity);
        }*/
        
        // 禁用Boss控制器
        if (bossController != null)
        {
            bossController.enabled = false;
        }
        
        // 禁用碰撞器
        Collider2D col = GetComponent<Collider2D>();
        if (col != null)
        {
            col.enabled = false;
        }
        
        // 停止所有运动
        if (rb != null)
        {
            rb.velocity = Vector2.zero;
            rb.isKinematic = true;
        }
        
        // 销毁伤害数字
        if (activeDamageNumber != null)
        {
            Destroy(activeDamageNumber);
        }
        
        // 延迟销毁
        Destroy(gameObject, deathDelay);
    }
    
    // 治疗（如果需要）
    public void Heal(int amount)
    {
        currentHealth += amount;
        currentHealth = Mathf.Min(currentHealth, maxHealth);
        
        OnHealthChanged?.Invoke();
        
        Debug.Log($"Boss治疗: {amount}, 当前血量: {currentHealth}/{maxHealth}");
    }
    
    // 获取血量百分比
    public float GetHealthPercentage()
    {
        return (float)currentHealth / maxHealth;
    }
}