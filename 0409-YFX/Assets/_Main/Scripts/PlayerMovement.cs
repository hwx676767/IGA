using UnityEngine;

public class PlayerMovement : MonoBehaviour
{
    [Header("移动设置")]
    [SerializeField] private float moveSpeed = 7f;

    [Header("转向设置")]
    [SerializeField] private float rotationSpeed = 15f;

    [Header("动画设置")]
    [SerializeField] private Animator animator;
    [SerializeField] private string speedParameter = "Speed"; // 动画参数名
    
    private Rigidbody rb;

    void Start()
    {
        rb = GetComponent<Rigidbody>();
        if (rb == null)
        {
            rb = gameObject.AddComponent<Rigidbody>();
        }

        // 获取Animator组件
        if (animator == null)
        {
            animator = GetComponent<Animator>();
        }

        // 重要：锁定旋转，防止角色自己翻倒
        rb.constraints = RigidbodyConstraints.FreezeRotationX | 
                         RigidbodyConstraints.FreezeRotationZ | 
                         RigidbodyConstraints.FreezeRotationY;

        rb.interpolation = RigidbodyInterpolation.Interpolate;
    }

    void FixedUpdate()
    {
        // 获取原始输入（-1 ~ 1）
        float horizontal = Input.GetAxisRaw("Horizontal");
        float vertical   = Input.GetAxisRaw("Vertical");

        // 世界绝对方向移动
        Vector3 moveDir = new Vector3(horizontal, 0f, vertical).normalized;

        Vector3 targetVelocity = moveDir * moveSpeed;
        targetVelocity.y = rb.velocity.y;

        rb.velocity = targetVelocity;

        // 转向
        if (moveDir != Vector3.zero && rotationSpeed > 0)
        {
            Quaternion targetRotation = Quaternion.LookRotation(moveDir);
            transform.rotation = Quaternion.Slerp(transform.rotation, targetRotation, rotationSpeed * Time.fixedDeltaTime);
        }

        // 控制动画：移动速度的大小（0 = 站立，>0 = 走路）
        float speed = moveDir.magnitude;
        
        if (animator != null)
        {
            animator.SetFloat(speedParameter, speed);
        }
    }
}