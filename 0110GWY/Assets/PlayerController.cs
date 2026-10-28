using UnityEngine;

public class PlayerController : MonoBehaviour
{
    public float moveSpeed = 5f;    // 移动速度
    public float sprintMultiplier = 2f; // 冲刺加速倍数
    public float rotationSpeed = 10f;   // 旋转的平滑度

    private Animator animator;      // 动画控制器
    private Rigidbody rb;           // 刚体
    private Vector3 movement;       // 移动方向
    private Quaternion targetRotation; // 目标旋转

    //private MotorbikeController motorbikeController; // 摩托车控制器
    private bool isOnMotorbike = false;  // 是否骑摩托车

    private bool isCharacterHidden = false; // 角色是否被隐藏
    private SkinnedMeshRenderer childSkinnedMeshRenderer; // 子物体的渲染组件

    void Start()
    {
        animator = GetComponent<Animator>();
        rb = GetComponent<Rigidbody>();

        // 初始化角色Y轴旋转为0
        transform.rotation = Quaternion.Euler(0, 0, 0); // 设置初始Y轴旋转为0
        targetRotation = transform.rotation; // 初始目标旋转与当前旋转相同
    }

    void Update()
    {
        if (!isOnMotorbike) // 仅在未骑摩托车时处理角色控制
        {
            // 获取左右输入 (A, D) 和前后输入 (W, S)
            float moveX = Input.GetAxis("Horizontal");
            float moveZ = Input.GetAxis("Vertical");

            // 获取移动方向并规范化
            movement = new Vector3(moveX, 0, moveZ).normalized * moveSpeed;

            // 根据输入更新目标旋转（角色朝向）
            if (moveX < 0) // 向左移动 (A键)
            {
                targetRotation = Quaternion.Euler(0, 0, 0); // Y轴旋转设为0（朝左）
            }
            else if (moveX > 0) // 向右移动 (D键)
            {
                targetRotation = Quaternion.Euler(0, 180, 0); // Y轴旋转设为180（朝右）
            }
            else if (moveZ > 0) // 向前移动 (W键)
            {
                targetRotation = Quaternion.Euler(0, 90, 0); // Y轴旋转设为90（朝前）
            }
            else if (moveZ < 0) // 向后移动 (S键)
            {
                targetRotation = Quaternion.Euler(0, -90, 0); // Y轴旋转设为-90（朝后）
            }

            // 平滑旋转到目标朝向
            transform.rotation = Quaternion.Slerp(transform.rotation, targetRotation, Time.deltaTime * rotationSpeed);

            // 处理动画
            bool isMoving = movement.magnitude > 0;
            animator.SetFloat("Speed", movement.magnitude); // 更新Animator中的Speed参数

            if (isMoving)
            {
                // 冲刺
                if (Input.GetKey(KeyCode.LeftShift) || Input.GetKey(KeyCode.RightShift))
                {
                    movement *= sprintMultiplier;
                    animator.SetBool("IsRunning", true); // 播放奔跑动画
                }
                else
                {
                    animator.SetBool("IsRunning", false); // 播放走路动画
                }
            }
            else
            {
                animator.SetBool("IsRunning", false); // 停止动画
                animator.SetFloat("Speed", 0);        // 停止动画时速度设为0
            }
        }

        // 特殊动作：按下F键时触发动画
        if (Input.GetKeyDown(KeyCode.F))
        {
            animator.SetTrigger("PlaySpecialAction");
        }

        /*
        // 切换到摩托车控制
        if (Input.GetKeyDown(KeyCode.E) && !isOnMotorbike && motorbikeController != null)
        {
            HideCharacterModel();  // 隐藏角色
            isOnMotorbike = true;
            this.enabled = false;  // 禁用角色控制器
            motorbikeController.enabled = true; // 启用摩托车控制器
        }*/

        // 显示或隐藏角色模型
        if (Input.GetKeyDown(KeyCode.Q))
        {
            if (isCharacterHidden)
            {
                ShowCharacterModel(); // 显示角色模型
            }
            else
            {
                HideCharacterModel(); // 隐藏角色模型
            }
        }
    }

    void FixedUpdate()
    {
        if (!isOnMotorbike) // 仅在未骑摩托车时处理角色移动
        {
            // 平滑移动
            Vector3 targetPosition = transform.position + movement * Time.fixedDeltaTime;
            rb.MovePosition(targetPosition);
        }
    }

    // 隐藏角色模型
    void HideCharacterModel()
    {
        if (childSkinnedMeshRenderer != null)
        {
            childSkinnedMeshRenderer.enabled = false;
        }
        isCharacterHidden = true;
    }

    // 显示角色模型
    void ShowCharacterModel()
    {
        if (childSkinnedMeshRenderer != null)
        {
            childSkinnedMeshRenderer.enabled = true;
        }
        isCharacterHidden = false;
    }
}
