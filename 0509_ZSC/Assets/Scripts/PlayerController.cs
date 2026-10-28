using UnityEngine;
using DG.Tweening;

[RequireComponent(typeof(Animator))]
public class PlayerController : MonoBehaviour
{
    [Header("Animation Parameters")]
    public string floatParam = "IsFloating";
    public string jumpParam = "Jump";
    public string crouchParam = "Crouch";
    public string attackParam = "Attack";
    public string hoverParam = "IsHovering"; // 复用悬浮动画参数

    [Header("Jump Settings")]
    public float jumpForce = 12f; // 从 10f 增加到 12f，加快上升
    public float fallGravityMultiplier = 3.5f; // 从 2f 增加到 3.5f，加速下落
    public float jumpBufferTime = 0.05f; // 从 0.1f 减少到 0.05f，输入更即时
    public float defaultGravityScale = 2f; // 新增，增加默认重力

    [Header("Attack Settings")]
    public Vector2 attackAreaSize = new Vector2(2f, 1f);
    public Vector2 attackAreaOffset = new Vector2(1f, 0f);
    public string attackableTag = "Attackable";
    public float attackScaleDuration = 0.3f;
    public float attackScaleFactor = 1.2f;

    [Header("Pull Ring Settings")]
    private PullRingZone currentZone; // 当前区域
    private bool isInZone = false; // 是否在区域内

    [Header("Ground Check")]
    public LayerMask groundLayer;
    public Transform groundCheck;
    public float groundCheckRadius = 0.2f;

    [Header("Collider Settings")]
    private readonly Vector2 standingOffset = new Vector2(0, -0.65f);
    private readonly Vector2 standingSize = new Vector2(0.6f, 2);
    private readonly Vector2 crouchingOffset = new Vector2(0, -1.2f);
    private readonly Vector2 crouchingSize = new Vector2(0.6f, 1);

    [Header("悬浮控制")]
    private bool canHover;
    private bool isHovering;
    private float targetHeight;

    private Rigidbody2D rb;
    private CapsuleCollider2D collider2D;
    private Animator animator;
    private bool isGrounded = true;
    private float jumpBufferTimer = 0f;
    private bool canPull;
    private bool isPulling;
    private Transform pullParent;
    private Tween pullTween;

    void Start()
    {
        rb = GetComponent<Rigidbody2D>();
        collider2D = GetComponent<CapsuleCollider2D>();
        animator = GetComponent<Animator>();
        collider2D.offset = standingOffset;
        collider2D.size = standingSize;

        defaultGravityScale = 2f; // 设置更高的默认重力
        rb.gravityScale = defaultGravityScale;
        rb.constraints = RigidbodyConstraints2D.FreezeRotation;
        rb.collisionDetectionMode = CollisionDetectionMode2D.Continuous;
        rb.drag = 0f;

        SetFloatingState(true);
    }

    void Update()
    {
        HandleHoverInput();
        if (isInZone)
        {
            HandlePullInput();
        }
        
        isGrounded = GroundCheck();

        if (Input.GetKeyDown(KeyCode.Space) && !isPulling)
        {
            jumpBufferTimer = jumpBufferTime; // 更短的缓冲时间
        }
        if (jumpBufferTimer > 0 && !isPulling)
        {
            jumpBufferTimer -= Time.deltaTime;
            if (isGrounded && jumpBufferTimer > 0)
            {
                Jump();
                jumpBufferTimer = 0f;
            }
        }

        if (!isHovering && !isPulling)
        {
            if (Input.GetKeyDown(KeyCode.LeftControl))
            {
                Crouch(true);
            }
            if (Input.GetKeyUp(KeyCode.LeftControl))
            {
                Crouch(false);
            }
        }

        if (Input.GetKeyDown(KeyCode.Z) && !isPulling)
        {
            Attack();
        }

        if (!isPulling)
        {
            rb.velocity = new Vector2(0, rb.velocity.y);
        }
    }

    void FixedUpdate()
    {
        if (isHovering)
        {
            rb.velocity = new Vector2(0, 0);
            transform.position = new Vector2(
                transform.position.x,
                Mathf.Lerp(transform.position.y, targetHeight, 0.2f)
            );
        }
        else if (!isPulling)
        {
            if (rb.velocity.y < 0)
            {
                rb.gravityScale = defaultGravityScale * fallGravityMultiplier; // 更强的下落重力
            }
            else if (rb.velocity.y > 0)
            {
                rb.gravityScale = defaultGravityScale * 1.5f; // 上升时略增重力，减少顶点悬浮
            }
            else
            {
                rb.gravityScale = defaultGravityScale;
            }
        }
    }

    void Jump()
    {
        rb.velocity = new Vector2(rb.velocity.x, jumpForce); // 更高的跳跃力
        isGrounded = false;
        animator.SetTrigger(jumpParam);
        SetFloatingState(false);
    }

    void Attack()
    {
        Sequence scaleSequence = DOTween.Sequence();
        scaleSequence.Append(transform.DOScale(attackScaleFactor, attackScaleDuration * 0.6f).SetEase(Ease.OutBack))
            .Append(transform.DOScale(1f, attackScaleDuration * 0.4f).SetEase(Ease.InOutQuad));

        Vector2 attackPosition = (Vector2)transform.position + attackAreaOffset;
        Collider2D[] hits = Physics2D.OverlapBoxAll(attackPosition, attackAreaSize, 0f);

        foreach (Collider2D hit in hits)
        {
            if (hit.CompareTag(attackableTag))
            {
                // Create a scaling sequence before destroying
                Sequence destroySequence = DOTween.Sequence();
                destroySequence.Append(hit.transform.DOScale(hit.transform.localScale * 4f, 0.2f).SetEase(Ease.OutBack))
                    .AppendCallback(() => Destroy(hit.gameObject));
            
                Debug.Log($"Destroyed {hit.gameObject.name} with tag {attackableTag}");
            }
        }

        animator.SetTrigger(attackParam);
        SetFloatingState(false);
    }

    void Crouch(bool crouch)
    {
        if (crouch)
        {
            collider2D.offset = crouchingOffset;
            collider2D.size = crouchingSize;
            animator.SetBool(crouchParam, true);
            SetFloatingState(false);
        }
        else
        {
            collider2D.offset = standingOffset;
            collider2D.size = standingSize;
            animator.SetBool(crouchParam, false);
            SetFloatingState(true);
        }
    }

    bool GroundCheck()
    {
        return Physics2D.OverlapCircle(groundCheck.position, groundCheckRadius, groundLayer);
    }

    void SetFloatingState(bool floating)
    {
        if (!isHovering && !isPulling)
        {
            animator.SetBool(floatParam, floating);
        }
    }

    public void EnterHoverZone(float height)
    {
        canHover = true;
        targetHeight = height;
    }

    public void ExitHoverZone()
    {
        canHover = false;
        if (isHovering) EndHover();
    }

    private void HandleHoverInput()
    {
        bool wantHover = canHover && 
                         Input.GetKey(KeyCode.LeftControl) && 
                         Input.GetKey(KeyCode.Space);

        if (wantHover && !isHovering && !isPulling)
        {
            StartHover();
        }
        else if (!wantHover && isHovering)
        {
            EndHover();
        }
    }

    private void StartHover()
    {
        isHovering = true;
        rb.gravityScale = 0;
        animator.SetBool(hoverParam, true);
        animator.SetBool(floatParam, false);
    }

    private void EndHover()
    {
        isHovering = false;
        rb.gravityScale = defaultGravityScale;
        animator.SetBool(hoverParam, false);
        SetFloatingState(true);
    }

    // 由 PullRingZone 调用，设置区域状态
    public void SetInZone(bool inZone, PullRingZone zone)
    {
        isInZone = inZone;
        currentZone = zone;
    }


    public void HandlePullInput()
    {
        // 按下 E 键，开始拉拽
        if (Input.GetKeyDown(KeyCode.E) && !isPulling && currentZone.playerInZone)
        {
            isPulling = true;
            animator.SetBool("isPulling", true); // 播放拉拽动画
            rb.gravityScale = 0f; // 关闭重力
            currentZone.SetPlayerAsChild(); // 成为子物体并触发区域移动
        }
        // 持续按住 E 键，维持拉拽状态
        else if (Input.GetKey(KeyCode.E))
        {
            // 保持拉拽动画和无重力状态
            animator.SetBool("isPulling", true);
            rb.gravityScale = 0f;
        }
        // 松开 E 键，恢复重力并脱离
        else if (Input.GetKeyUp(KeyCode.E) && isPulling)
        {
            isPulling = false;
            animator.SetBool("isPulling", false); // 停止拉拽动画
            rb.gravityScale = 1f; // 恢复重力（根据你的游戏调整值）
            currentZone.ReleasePlayer(); // 解除父子关系
        }
    }
    
    void OnDrawGizmos()
    {
        if (groundCheck != null)
        {
            Gizmos.color = Color.red;
            Gizmos.DrawWireSphere(groundCheck.position, groundCheckRadius);
        }

        Gizmos.color = Color.green;
        Vector2 attackPosition = (Vector2)transform.position + attackAreaOffset;
        Gizmos.DrawWireCube(attackPosition, attackAreaSize);
    }
}