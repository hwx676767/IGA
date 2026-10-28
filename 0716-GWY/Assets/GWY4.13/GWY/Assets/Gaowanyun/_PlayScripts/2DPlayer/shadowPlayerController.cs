using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class shadowPlayerController : MonoBehaviour
{
    public float moveSpeed = 5f;               // 移动速度
    public float jumpForce = 5f;               // 跳跃力度
    public float pushMoveSpeed = 2f;           // 推动时的移动速度
    public LayerMask groundLayer;              // 地面图层
    public Transform groundCheck;              // 地面检测点
    public float groundCheckRadius = 0.2f;     // 地面检测半径

    private Rigidbody rb;
    [SerializeField] private Animator animator;
    private bool isGrounded;
    private bool isPushing;
    private bool isJumping;                    // 控制跳跃状态
    private bool isFalling;                    // 控制下落状态
    private float moveInput;
    private BoxCollider boxCollider;
    
    // 推动时的碰撞体参数
    private readonly Vector3 pushColliderSize = new Vector3(0.5f, 1.2f, 0.3f);
    private readonly Vector3 pushColliderCenter = new Vector3(0.2f, 0.6f, 0f);
    private Vector3 originalColliderSize;
    private Vector3 originalColliderCenter;

    void Start()
    {
        rb = GetComponent<Rigidbody>();
        animator = gameObject.GetComponentInChildren<Animator>();
        boxCollider = GetComponent<BoxCollider>();
        
        // 保存原始碰撞体参数
        if (boxCollider != null)
        {
            originalColliderSize = boxCollider.size;
            originalColliderCenter = boxCollider.center;
        }
    }

    void Update()
    {
        // 获取水平输入
        moveInput = Input.GetAxisRaw("Horizontal");

        // 检测是否在地面
        isGrounded = Physics.CheckSphere(groundCheck.position, groundCheckRadius, groundLayer);

        // 更新下落状态
        isFalling = !isGrounded && rb.velocity.y < 0;

        // 跳跃输入和在地面时才能跳
        if (Input.GetButtonDown("Jump") && isGrounded && !isPushing)
        {
            Jump();
        }

        // 按下P键进入推动状态
        if (Input.GetKeyDown(KeyCode.P) && isGrounded)
        {
            StartPushing();
        }
        // 松开P键退出推动状态
        else if (Input.GetKeyUp(KeyCode.P) && isPushing)
        {
            StopPushing();
        }

        // 地面上重置跳跃和下落状态
        if (isGrounded)
        {
            isJumping = false;
            isFalling = false;
        }

        UpdateAnimationState();
    }

    void FixedUpdate()
    {
        // 根据是否推动状态选择移动速度
        float currentMoveSpeed = isPushing ? pushMoveSpeed : moveSpeed;
        
        // 执行水平移动
        rb.velocity = new Vector3(moveInput * currentMoveSpeed, rb.velocity.y, 0);

        // 控制角色朝向
        if (Mathf.Abs(moveInput) > 0.01f && !isPushing)
        {
            transform.rotation = Quaternion.Euler(0, moveInput > 0 ? 0 : 180, 0);
        }
    }

    private void StartPushing()
    {
        isPushing = true;
        if (boxCollider != null)
        {
            boxCollider.size = pushColliderSize;
            boxCollider.center = pushColliderCenter;
        }
    }

    private void StopPushing()
    {
        isPushing = false;
        if (boxCollider != null)
        {
            boxCollider.size = originalColliderSize;
            boxCollider.center = originalColliderCenter;
        }
    }

    private void Jump()
    {
        rb.AddForce(Vector3.up * jumpForce, ForceMode.VelocityChange);
        isJumping = true; // 设置跳跃状态
        Debug.Log(isJumping);
    }

    private void UpdateAnimationState()
    {
        animator.SetBool("isGrounded", isGrounded);
        animator.SetBool("IsJumping", isJumping);
        animator.SetBool("IsFalling", isFalling);
        animator.SetBool("IsPushing", isPushing);
        animator.SetFloat("Speed", Mathf.Abs(moveInput));
    }

    private void OnDrawGizmos()
    {
        if (groundCheck != null)
        {
            Gizmos.color = Color.red;
            Gizmos.DrawWireSphere(groundCheck.position, groundCheckRadius);
        }
    }
}