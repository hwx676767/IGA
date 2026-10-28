using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.Linq;

public class PlayerController : MonoBehaviour
{
    [Header("Components")]
    public Animator anim;
    public Rigidbody2D rb;
    public Collider2D hitbox;

    [Header("Attacks")]
    public List<AttackData> attacks = new();

    [Header("Movement")]
    public float moveSpeed = 5f;
    public float jumpForce = 12f;
    public Transform groundCheck;
    public LayerMask groundLayer;

    [Header("Input Buffer")]
    public float bufferTime = 0.2f;

    private bool isGrounded;
    private Vector2 moveInput;
    private float faceDir = 1f;
    
    // 只用两个状态变量
    private bool isJumping = false;  // true表示上升中
    private bool isFalling = false;  // true表示下落中

    private AttackInstance currentAttack;
    private InputBuffer inputBuffer = new InputBuffer();

    void Start()
    {
        StartCoroutine(inputBuffer.ClearOldInputs(bufferTime));
    }

    void Update()
    {
        HandleInput();
        CheckGrounded();
        UpdateJumpState();
        UpdateAnimation();
    }

    void FixedUpdate()
    {
        HandleMovement();
    }

    void CheckGrounded()
    {
        bool wasGrounded = isGrounded;
        isGrounded = Physics2D.OverlapCircle(groundCheck.position, 0.2f, groundLayer);
        
        // 落地检测 - 这里可以直接更新状态，不需要trigger
        if (!wasGrounded && isGrounded)
        {
            isJumping = false;
            isFalling = false;
        }
    }

    // 更新跳跃状态
    void UpdateJumpState()
    {
        if (!isGrounded)
        {
            if (rb.velocity.y > 0.1f)
            {
                // 上升中
                isJumping = true;
                isFalling = false;
            }
            else if (rb.velocity.y < -0.1f)
            {
                // 下落中
                isJumping = false;
                isFalling = true;
            }
        }
    }

    void HandleInput()
    {
        moveInput.x = Input.GetAxisRaw("Horizontal");
        moveInput.y = Input.GetAxisRaw("Vertical");

        if (moveInput.x != 0) faceDir = Mathf.Sign(moveInput.x);

        // ===== jump =====
        if (Input.GetKeyDown(KeyCode.Space) && isGrounded)
        {
            rb.velocity = new Vector2(rb.velocity.x, jumpForce);
            isJumping = true;
            isFalling = false;
        }

        // ===== attack =====
        if (Input.GetKeyDown(KeyCode.X))
        {
            inputBuffer.Add("X");

            if (currentAttack != null && currentAttack.CanCancel())
            {
                AttackData combo = FindCancelableAttack();
                if (combo != null)
                {
                    StartAttack(combo);
                    return;
                }
            }
            AttackData matched = GetMatchedAttack();
            if (matched != null && (currentAttack == null || currentAttack.CanCancel()))
            {
                StartAttack(matched);
                inputBuffer.Clear();
            }
        }
    }

    // ===== 根据输入方向匹配攻击 =====
    AttackData GetMatchedAttack()
    {
        if (!inputBuffer.Matches("X")) return null;

        if (moveInput.y > 0.5f)
            return attacks.Find(a => a.inputSequence == "UpX");

        return attacks.Find(a => a.inputSequence == "X");
    }

    // ===== 查找可取消的连招 =====
    AttackData FindCancelableAttack()
    {
        if (currentAttack == null) return null;

        foreach (var next in currentAttack.data.cancelableTo)
        {
            if (next.inputSequence == "X") return next;

            if (next.inputSequence == "UpX" && moveInput.y > 0.5f)
                return next;
        }

        return null;
    }

    // ===== 开始攻击 =====
    void StartAttack(AttackData data)
    {
        if (currentAttack != null)
        {
            currentAttack = null;
        }
        
        currentAttack = new AttackInstance(data);

        anim.SetInteger("AttackID", data.animTrigger);
        anim.SetTrigger("Attack");

        anim.SetFloat("FaceDir", faceDir);
    }

    void HandleMovement()
    {
        if (currentAttack != null && !currentAttack.allowMove) return;
        
        rb.velocity = new Vector2(moveInput.x * moveSpeed, rb.velocity.y);
        transform.localScale = new Vector3(faceDir, 1f, 1f);
    }

    void UpdateAnimation()
    {
        anim.SetFloat("Speed", Mathf.Abs(moveInput.x));
        anim.SetBool("isGrounded", isGrounded);
        anim.SetBool("isJumping", isJumping);
        anim.SetBool("isFalling", isFalling);
    }

    // ===== 动画事件 =====

    public void OnHitboxStart() => hitbox.enabled = true;
    public void OnHitboxEnd() => hitbox.enabled = false;

    public void OnAttackEnd()
    {
        currentAttack?.End();
        currentAttack = null;
    }

    public void OnCancelWindowEnd()
    {
        currentAttack?.EndCancelWindow();
    }
}