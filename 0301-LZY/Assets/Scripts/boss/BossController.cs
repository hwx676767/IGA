using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class BossController : MonoBehaviour
{
    [Header("移动设置")]
    public float undergroundSpeed = 5f;
    public float jumpForce = 12f;        // 跳跃力度
    public float gravityScale = 3f;      // 重力系数
    public float jumpHeight = 3f;        // 跳跃高度
    public LayerMask groundLayer;
    public float groundCheckDistance = 0.5f;
    
    [Header("攻击设置")]
    public GameObject trashProjectile;    // 垃圾预制体
    public Transform throwPoint;          // 投掷点
    public float throwForce = 10f;
    public Vector2 trashCountRange = new Vector2(2, 5); // 每次投掷垃圾数量范围
    public float trashSpreadAngle = 45f;   // 垃圾扩散角度
    public Sprite[] trashSprites;          // 垃圾精灵数组
    
    [Header("状态时间设置")]
    public Vector2 undergroundDuration = new Vector2(2f, 4f);
    public Vector2 abovegroundDuration = new Vector2(3f, 6f);
    public Vector2 idleDuration = new Vector2(0.5f, 1.5f);
    
    [Header("行为概率设置")]
    [Range(0, 100)]
    public float throwProbability = 70f;
    [Range(0, 100)]
    public float idleProbability = 20f;
    [Range(0, 100)]
    public float moveProbability = 10f;
    
    [Header("随机位置范围")]
    public float minX = -5f;
    public float maxX = 5f;
    public float groundY;
    
    [Header("视觉对象控制")]
    public GameObject bossVisual;
    public GameObject undergroundIndicator;
    
    // 组件引用
    private Animator animator;
    private Rigidbody2D rb;
    private SpriteRenderer spriteRenderer;
    private Collider2D bossCollider;
    
    // 状态枚举
    private enum BossState
    {
        Underground,
        Emerging,
        Falling,
        Idle,
        Throwing,
        GoingUnderground
    }
    
    private BossState currentState;
    private Vector2 targetPosition;
    private bool isFacingRight = true;
    private bool isGrounded = false;
    private bool canThrow = false;
    private bool hasThrownOnAppear = false;
    
    void Start()
    {
        // 获取组件
        if (bossVisual != null)
        {
            animator = bossVisual.GetComponent<Animator>();
            spriteRenderer = bossVisual.GetComponent<SpriteRenderer>();
        }
        else
        {
            Debug.LogError("BossVisual 没有赋值！");
        }
        
        rb = GetComponent<Rigidbody2D>();
        bossCollider = GetComponent<Collider2D>();
        
        // 检查必要组件
        if (rb == null)
            Debug.LogError("Rigidbody2D 组件缺失！");
        
        if (bossCollider == null)
            Debug.LogError("Collider2D 组件缺失！");
        
        // 检查垃圾预制体
        if (trashProjectile == null)
            Debug.LogError("垃圾预制体没有赋值！");
        else
            Debug.Log($"垃圾预制体: {trashProjectile.name}");
        
        // 检查投掷点
        if (throwPoint == null)
            Debug.LogError("投掷点没有赋值！");
        else
            Debug.Log($"投掷点位置: {throwPoint.position}");
        
        // 检查垃圾精灵
        if (trashSprites == null || trashSprites.Length == 0)
            Debug.LogWarning("没有设置垃圾精灵数组！");
        else
            Debug.Log($"有 {trashSprites.Length} 个垃圾精灵可用");
        
        // 设置重力
        rb.gravityScale = gravityScale;
        rb.freezeRotation = true;
        rb.collisionDetectionMode = CollisionDetectionMode2D.Continuous;
        
        // 初始化位置
        Vector3 startPos = transform.position;
        startPos.y = groundY;
        transform.position = startPos;
        
        // 初始化状态
        currentState = BossState.Underground;
        InitializeUndergroundState();
        
        // 开始行为循环
        StartCoroutine(BossBehaviourLoop());
        
        Debug.Log("Boss控制器初始化完成");
    }
    
    void InitializeUndergroundState()
    {
        if (bossVisual != null)
            bossVisual.SetActive(false);
        
        if (undergroundIndicator != null)
            undergroundIndicator.SetActive(true);
        
        if (bossCollider != null)
            bossCollider.enabled = false;
        
        rb.velocity = Vector2.zero;
        rb.angularVelocity = 0f;
        
        if (animator != null)
        {
            animator.SetBool("IsUnderground", true);
            animator.SetBool("IsGrounded", false);
        }
        
        targetPosition = new Vector2(
            Random.Range(minX, maxX),
            groundY
        );
        transform.position = new Vector2(targetPosition.x, groundY);
        
        Debug.Log("Boss初始化：地下状态");
    }
    
    void Update()
    {
        if (currentState != BossState.Underground)
        {
            CheckGrounded();
        }
        else
        {
            isGrounded = false;
        }
        
        UpdateAnimationParameters();
        
        switch (currentState)
        {
            case BossState.Underground:
                HandleUndergroundMovement();
                break;
        }
    }
    
    IEnumerator BossBehaviourLoop()
    {
        yield return new WaitForSeconds(0.5f);
        
        while (true)
        {
            // 地下移动
            SetUndergroundState(true);
            currentState = BossState.Underground;
            canThrow = false;
            
            float undergroundTime = Random.Range(undergroundDuration.x, undergroundDuration.y);
            float startTime = Time.time;
            
            while (Time.time - startTime < undergroundTime)
            {
                targetPosition = new Vector2(
                    Random.Range(minX, maxX),
                    groundY
                );
                
                yield return StartCoroutine(MoveToTarget(undergroundTime / 2f));
                yield return new WaitForSeconds(Random.Range(0.5f, 1.5f));
            }
            
            // 跳出地面
            yield return StartCoroutine(JumpOut());
            
            // 地面行为
            yield return StartCoroutine(AbovegroundBehaviour());
            
            // 跳回地下
            yield return StartCoroutine(JumpBack());
        }
    }
    
    IEnumerator JumpOut()
    {
        currentState = BossState.Emerging;
        hasThrownOnAppear = false;
        
        Vector3 pos = transform.position;
        pos.y = groundY;
        transform.position = pos;
        
        if (bossVisual != null)
            bossVisual.SetActive(true);
        
        if (undergroundIndicator != null)
            undergroundIndicator.SetActive(false);
        
        if (bossCollider != null)
            bossCollider.enabled = true;
        
        animator.SetTrigger("Emerge");
        rb.velocity = new Vector2(0f, jumpForce);
        
        Debug.Log($"Boss跳出！位置: {transform.position}, 速度: {rb.velocity.y}");
        
        yield return new WaitForFixedUpdate();
        
        while (rb.velocity.y > 0.5f)
        {
            yield return null;
        }
        
        currentState = BossState.Falling;
        
        float timeout = 5f;
        float timer = 0f;
        
        while (!isGrounded && timer < timeout)
        {
            timer += Time.deltaTime;
            yield return null;
        }
        
        if (timer >= timeout)
        {
            Debug.LogWarning("Boss下落超时，强制落地");
            Vector3 forcePos = transform.position;
            forcePos.y = groundY;
            transform.position = forcePos;
            rb.velocity = Vector2.zero;
        }
        
        rb.velocity = new Vector2(0, 0);
        Debug.Log("Boss落地");
        
        currentState = BossState.Idle;
        canThrow = true;
        animator.SetTrigger("Idle");
        
        // 落地后立即有很高概率扔垃圾
        if (Random.value * 100 < throwProbability && !hasThrownOnAppear)
        {
            yield return new WaitForSeconds(0.2f);
            yield return StartCoroutine(PerformThrow());
            hasThrownOnAppear = true;
        }
    }
    
    IEnumerator AbovegroundBehaviour()
    {
        bool shouldGoUnderground = false;
        float abovegroundStartTime = Time.time;
        float maxAbovegroundTime = Random.Range(abovegroundDuration.x, abovegroundDuration.y);
        
        while (!shouldGoUnderground && (Time.time - abovegroundStartTime) < maxAbovegroundTime)
        {
            if (!isGrounded)
            {
                yield return null;
                continue;
            }
            
            float randomValue = Random.value * 100;
            
            if (randomValue < throwProbability)
            {
                if (canThrow)
                {
                    yield return StartCoroutine(PerformThrow());
                }
            }
            else if (randomValue < throwProbability + idleProbability)
            {
                currentState = BossState.Idle;
                animator.SetTrigger("Idle");
                
                float idleTime = Random.Range(idleDuration.x, idleDuration.y);
                yield return new WaitForSeconds(idleTime);
            }
            else
            {
                float targetX = Random.Range(minX, maxX);
                
                rb.velocity = new Vector2(
                    (targetX > transform.position.x ? 1 : -1) * 5f,
                    jumpForce * 0.6f
                );
                
                float jumpTimeout = 3f;
                float jumpTimer = 0f;
                while (!isGrounded && jumpTimer < jumpTimeout)
                {
                    jumpTimer += Time.deltaTime;
                    yield return null;
                }
                
                rb.velocity = new Vector2(0, 0);
                yield return new WaitForSeconds(0.5f);
            }
            
            if (Random.value > 0.8f && !shouldGoUnderground)
            {
                shouldGoUnderground = true;
            }
            
            if (Random.value > 0.7f)
            {
                Flip();
            }
        }
    }
    
    IEnumerator PerformThrow()
    {
        currentState = BossState.Throwing;
        animator.SetTrigger("Throw");
        
        yield return new WaitForSeconds(0.2f);
        
        int trashToThrow = Random.Range((int)trashCountRange.x, (int)trashCountRange.y + 1);
        Debug.Log($"准备投掷 {trashToThrow} 个垃圾");
        
        // 检查是否可以投掷
        if (trashProjectile == null)
        {
            Debug.LogError("无法投掷：垃圾预制体为空！");
            yield break;
        }
        
        if (throwPoint == null)
        {
            Debug.LogError("无法投掷：投掷点为空！");
            yield break;
        }
        
        for (int i = 0; i < trashToThrow; i++)
        {
            bool success = ThrowTrash(i, trashToThrow);
            if (!success)
            {
                Debug.LogError($"第 {i+1} 个垃圾投掷失败");
            }
            
            if (trashToThrow > 1 && i < trashToThrow - 1)
            {
                yield return new WaitForSeconds(0.1f);
            }
        }
        
        Debug.Log($"Boss扔了 {trashToThrow} 个垃圾");
        
        yield return new WaitForSeconds(0.5f);
        
        currentState = BossState.Idle;
        animator.SetTrigger("Idle");
    }
    
    bool ThrowTrash(int index, int totalCount)
    {
        try
        {
            if (trashProjectile == null)
            {
                Debug.LogError("trashProjectile 为空！");
                return false;
            }
            
            if (throwPoint == null)
            {
                Debug.LogError("throwPoint 为空！");
                return false;
            }
            
            // 实例化垃圾
            GameObject trash = Instantiate(trashProjectile, throwPoint.position, Quaternion.identity);
            
            if (trash == null)
            {
                Debug.LogError("实例化垃圾失败！");
                return false;
            }
            
            Debug.Log($"垃圾实例化成功: {trash.name}, 位置: {trash.transform.position}");
            
            // 获取组件
            Rigidbody2D trashRb = trash.GetComponent<Rigidbody2D>();
            SpriteRenderer trashSprite = trash.GetComponent<SpriteRenderer>();
            
            if (trashRb != null)
            {
                // 计算投掷方向
                Vector2 baseDirection = isFacingRight ? Vector2.left  : Vector2.right;
                
                float angleOffset = 0f;
                if (totalCount > 1)
                {
                    float angleStep = trashSpreadAngle / (totalCount - 1);
                    angleOffset = -trashSpreadAngle / 2f + angleStep * index;
                    angleOffset += Random.Range(-5f, 5f);
                }
                
                Quaternion rotation = Quaternion.Euler(0, 0, angleOffset);
                Vector2 throwDirection = rotation * baseDirection;
                throwDirection.y = Mathf.Abs(throwDirection.y) + Random.Range(0.2f, 0.5f);
                
                float randomForce = throwForce * Random.Range(0.8f, 1.2f);
                trashRb.velocity = throwDirection * randomForce;
                trashRb.angularVelocity = Random.Range(-300f, 300f);
                
                Debug.Log($"垃圾 {index+1}: 方向 {throwDirection}, 力度 {randomForce}");
            }
            else
            {
                Debug.LogError("垃圾预制体没有 Rigidbody2D 组件！");
            }
            
            // 设置精灵
            if (trashSprite != null && trashSprites != null && trashSprites.Length > 0)
            {
                Sprite randomSprite = trashSprites[Random.Range(0, trashSprites.Length)];
                trashSprite.sprite = randomSprite;
                Debug.Log($"垃圾 {index+1} 设置精灵: {randomSprite.name}");
            }
            
            // 随机缩放
            float randomScale = Random.Range(0.7f, 1.3f);
            trash.transform.localScale = Vector3.one * randomScale;
            
            // 随机旋转
            trash.transform.rotation = Quaternion.Euler(0, 0, Random.Range(0f, 360f));
            
            return true;
        }
        catch (System.Exception e)
        {
            Debug.LogError($"投掷垃圾时出错: {e.Message}");
            return false;
        }
    }
    
    IEnumerator JumpBack()
    {
        currentState = BossState.GoingUnderground;
        animator.SetTrigger("GoUnderground");
        canThrow = false;
        
        rb.velocity = new Vector2(0f, -jumpForce * 0.8f);
        Debug.Log("Boss跳回地下");
        
        float targetY = groundY - 1f;
        float timeout = 1f;
        float timer = 0f;
        
        while (transform.position.y > targetY && timer < timeout)
        {
            timer += Time.deltaTime;
            yield return null;
        }
        
        if (bossVisual != null)
            bossVisual.SetActive(false);
        
        if (undergroundIndicator != null)
            undergroundIndicator.SetActive(true);
        
        if (bossCollider != null)
            bossCollider.enabled = false;
        
        SetUndergroundState(true);
        currentState = BossState.Underground;
        
        Vector3 pos = transform.position;
        pos.y = groundY;
        transform.position = pos;
        
        rb.velocity = Vector2.zero;
        rb.angularVelocity = 0f;
        
        Debug.Log("Boss已回到地下");
    }
    
    void SetUndergroundState(bool underground)
    {
        if (animator != null)
            animator.SetBool("IsUnderground", underground);
    }
    
    void CheckGrounded()
    {
        RaycastHit2D hit = Physics2D.Raycast(transform.position, Vector2.down, groundCheckDistance, groundLayer);
        bool wasGrounded = isGrounded;
        isGrounded = hit.collider != null && Mathf.Abs(rb.velocity.y) < 0.5f;
        
        if (!wasGrounded && isGrounded && currentState != BossState.Underground && currentState != BossState.GoingUnderground)
        {
            OnLand();
        }
        
        Debug.DrawRay(transform.position, Vector2.down * groundCheckDistance, isGrounded ? Color.green : Color.red);
        
        if (animator != null)
            animator.SetBool("IsGrounded", isGrounded);
    }
    
    void OnLand()
    {
        Debug.Log("Boss落地！");
    }
    
    void HandleUndergroundMovement()
    {
        Vector2 direction = (targetPosition - (Vector2)transform.position).normalized;
        rb.velocity = new Vector2(direction.x * undergroundSpeed, 0);
        
        RaycastHit2D hit = Physics2D.Raycast(transform.position, direction, 1f, groundLayer);
        if (hit.collider != null)
        {
            targetPosition = GetRandomPosition();
        }
    }
    
    IEnumerator MoveToTarget(float duration)
    {
        float elapsed = 0;
        Vector2 startPos = transform.position;
        
        while (elapsed < duration)
        {
            elapsed += Time.deltaTime;
            float t = elapsed / duration;
            float newX = Mathf.Lerp(startPos.x, targetPosition.x, t);
            transform.position = new Vector2(newX, groundY);
            yield return null;
        }
        
        transform.position = new Vector2(targetPosition.x, groundY);
    }
    
    Vector2 GetRandomPosition()
    {
        return new Vector2(
            Random.Range(minX, maxX),
            groundY
        );
    }
    
    void Flip()
    {
        isFacingRight = !isFacingRight;
        Vector3 scale = bossVisual.transform.localScale;
        scale.x *= -1;
        bossVisual.transform.localScale = scale;
    }
    
    void UpdateAnimationParameters()
    {
        if (animator == null) return;
        
        animator.SetInteger("State", (int)currentState);
        animator.SetFloat("VerticalSpeed", rb.velocity.y);
        animator.SetFloat("Speed", Mathf.Abs(rb.velocity.x));
        animator.SetBool("CanThrow", canThrow);
    }
    
    void OnDrawGizmosSelected()
    {
        Gizmos.color = Color.red;
        Gizmos.DrawLine(new Vector3(minX, groundY, 0), new Vector3(maxX, groundY, 0));
        
        Gizmos.color = Color.green;
        Gizmos.DrawLine(new Vector3(minX, groundY + jumpHeight, 0), new Vector3(maxX, groundY + jumpHeight, 0));
        
        Gizmos.color = Color.yellow;
        Gizmos.DrawWireSphere(targetPosition, 0.5f);
        
        Gizmos.color = Color.blue;
        Gizmos.DrawWireSphere(transform.position + Vector3.down * groundCheckDistance, 0.1f);
        
        // 显示投掷点
        if (throwPoint != null)
        {
            Gizmos.color = Color.magenta;
            Gizmos.DrawSphere(throwPoint.position, 0.2f);
        }
    }
}