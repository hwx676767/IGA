using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class shadowPlayerController : MonoBehaviour
{
    public float moveSpeed = 5f;       // 移动速度
    public float jumpForce = 5f;      // 跳跃力度
    public LayerMask groundLayer;     // 地面层，用于地面检测
    public Transform groundCheck;     // 地面检测点
    public float groundCheckRadius = 0.2f; // 地面检测范围

    private Rigidbody rb;
    [SerializeField] private Animator animator;
    private bool isGrounded;
    private float moveInput;

    void Start()
    {
        rb = GetComponent<Rigidbody>();
        animator = gameObject.GetComponentInChildren<Animator>(); // 获取Animator组件
    }

    void Update()
    {
        // 获取水平输入
        moveInput = Input.GetAxis("Horizontal");

        // 地面检测
        isGrounded = Physics.CheckSphere(groundCheck.position, groundCheckRadius, groundLayer);

        // 跳跃输入和地面检测
        if (Input.GetButtonDown("Jump") && isGrounded)
        {
            Jump();  // 调用跳跃方法
        }

        // 更新动画状态（只需要根据状态来控制动画）
        UpdateAnimationState();
    }

    void FixedUpdate()
    {
        // 处理水平移动：只改变 X 轴速度，Y 轴由物理引擎控制
        rb.velocity = new Vector3(0, rb.velocity.y, - moveInput * moveSpeed);

        // 更新是否在地面上的状态
        animator.SetBool("isGrounded", isGrounded);

        // 角色旋转：通过水平输入决定角色朝向
        if (Mathf.Abs(moveInput) > 0.01f)
        {
            transform.rotation = Quaternion.Euler(0, moveInput > 0 ? -90 : 90, 0);
        }
    }

    // 跳跃方法：施加跳跃力度
    private void Jump()
    {
        rb.AddForce(Vector3.up * jumpForce, ForceMode.VelocityChange); // 向上施加跳跃力
        animator.SetTrigger("Jump"); // 播放跳跃动画
    }

    // 更新动画状态：通过状态来切换动画
    private void UpdateAnimationState()
    {
        if (isGrounded)
        {
            animator.SetBool("IsFalling", false); // 如果在地面上，停止下落状态

            // 判断角色是否有水平移动
            if (Mathf.Abs(moveInput) > 0.01f)
            {
                animator.SetFloat("Speed", Mathf.Abs(moveInput)); // 跑步动画
            }
            else
            {
                animator.SetFloat("Speed", 0); // 待机动画
            }
        }
        else
        {
            animator.SetBool("IsFalling", true); // 如果不在地面上，进入下落状态
        }
    }

    private void OnDrawGizmos()
    {
        // 绘制地面检测范围，用于调试
        if (groundCheck != null)
        {
            Gizmos.color = Color.red;
            Gizmos.DrawWireSphere(groundCheck.position, groundCheckRadius);
        }
    }
}
