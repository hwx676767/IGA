using UnityEngine;

public class CharacterBMovement : MonoBehaviour
{
    [Header("移动设置")]
    public KeyCode moveKey = KeyCode.D;       // 移动按键
    public float moveSpeed = 5f;              // 移动速度
    public float acceleration = 10f;          // 加速平滑度
    public float deceleration = 20f;          // 减速平滑度

    [Header("依赖设置")]
    public CharacterSwitchCamera switchCamera; // 角色切换摄像机
    public Animator animator;                 // 动画控制器

    private float currentSpeed = 0f;          // 当前速度
    private bool isMoving = false;            // 是否正在移动
    private bool canMove = false;             // 是否允许移动

    void Start()
    {
        // 如果未指定Animator，自动获取
        if (animator == null)
        {
            animator = GetComponent<Animator>();
            if (animator == null)
            {
                Debug.LogWarning("未找到Animator组件，请手动指定或添加Animator组件");
            }
        }
    }

    void Update()
    {
        // 检查是否允许移动（只有在摄像机跟随角色B时才能移动）
        CheckMovementPermission();

        if (canMove)
        {
            HandleMovementInput();
            ApplyMovement();
        }
        else
        {
            // 如果不允许移动，立即停止
            currentSpeed = 0f;
            isMoving = false;
        }

        // 更新动画状态
        UpdateAnimation();
    }

    /// <summary>
    /// 检查是否允许移动
    /// </summary>
    void CheckMovementPermission()
    {
        if (switchCamera == null)
        {
            // 尝试自动获取摄像机组件
            switchCamera = Camera.main?.GetComponent<CharacterSwitchCamera>();
            if (switchCamera == null)
            {
                Debug.LogWarning("找不到CharacterSwitchCamera组件");
                canMove = false;
                return;
            }
        }

        // 只有在摄像机跟随角色B时才能移动
        canMove = switchCamera.HasSwitchedToB() && switchCamera.GetCurrentTarget() == transform;
    }

    /// <summary>
    /// 处理移动输入
    /// </summary>
    void HandleMovementInput()
    {
        // 检测按键按下
        if (Input.GetKeyDown(moveKey))
        {
            isMoving = true;
        }

        // 检测按键松开
        if (Input.GetKeyUp(moveKey))
        {
            isMoving = false;
        }

        // 持续检测按键状态（防止按键丢失）
        if (Input.GetKey(moveKey))
        {
            isMoving = true;
        }
        else
        {
            isMoving = false;
        }
    }

    /// <summary>
    /// 应用移动
    /// </summary>
    void ApplyMovement()
    {
        if (isMoving)
        {
            // 加速过程
            currentSpeed = Mathf.Lerp(currentSpeed, moveSpeed, acceleration * Time.deltaTime);
        }
        else
        {
            // 减速过程
            currentSpeed = Mathf.Lerp(currentSpeed, 0f, deceleration * Time.deltaTime);

            // 当速度很小时直接设为0
            if (Mathf.Abs(currentSpeed) < 0.1f)
            {
                currentSpeed = 0f;
            }
        }

        // 应用移动（只向右移动）
        Vector3 movement = Vector3.right * currentSpeed * Time.deltaTime;
        transform.Translate(movement, Space.World);
    }

    /// <summary>
    /// 更新动画状态
    /// </summary>
    void UpdateAnimation()
    {
        if (animator != null)
        {
            // 根据移动状态设置动画参数
            bool shouldPlayMoveAnimation = isMoving && currentSpeed > 0.1f && canMove;
            animator.SetBool("Move", shouldPlayMoveAnimation);
        }
    }

    /// <summary>
    /// 强制停止移动
    /// </summary>
    public void StopMovement()
    {
        isMoving = false;
        currentSpeed = 0f;

        // 立即更新动画状态
        if (animator != null)
        {
            animator.SetBool("Move", false);
        }
    }

    /// <summary>
    /// 设置移动速度（用于外部控制）
    /// </summary>
    public void SetMoveSpeed(float speed)
    {
        moveSpeed = Mathf.Max(0f, speed);
    }

    /// <summary>
    /// 获取当前移动状态
    /// </summary>
    public bool IsMoving()
    {
        return isMoving && currentSpeed > 0.1f;
    }

    /// <summary>
    /// 获取当前速度
    /// </summary>
    public float GetCurrentSpeed()
    {
        return currentSpeed;
    }

    /// <summary>
    /// 检查是否允许移动
    /// </summary>
    public bool CanMove()
    {
        return canMove;
    }

    // 可视化调试
    void OnDrawGizmos()
    {
        if (isMoving && canMove)
        {
            // 显示移动方向
            Gizmos.color = Color.green;
            Gizmos.DrawLine(transform.position, transform.position + Vector3.right * 2f);
            Gizmos.DrawWireSphere(transform.position + Vector3.right * 2f, 0.2f);
        }

        // 显示移动状态
        GUIStyle style = new GUIStyle();
        style.normal.textColor = canMove ? Color.green : Color.red;
        string status = canMove ? (isMoving ? "移动中" : "待机") : "不可移动";
        UnityEditor.Handles.Label(transform.position + Vector3.up * 1.5f, $"角色B: {status}\n速度: {currentSpeed:F1}", style);
    }
}