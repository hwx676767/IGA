using UnityEngine;

public class ThirdPersonPlayerController : MonoBehaviour
{
    [Header("Movement Settings")]
    public float walkSpeed = 2f;
    public float runSpeed = 5f;
    public float rotationSpeed = 10f;

    [Header("Animation")]
    public Animator animator;

    private Rigidbody rb;
    private Transform model; // 用于旋转玩家模型
    private Vector3 movement;
    private float currentSpeed;



    void Start()
    {
        //receive shadow
        SkinnedMeshRenderer skinnedRenderer = GetComponentInChildren<SkinnedMeshRenderer>();
        if (skinnedRenderer != null)
        {
            
            skinnedRenderer.receiveShadows = false;
            Debug.Log(skinnedRenderer.receiveShadows);
        }


        rb = GetComponent<Rigidbody>();

        // 获取模型（假设模型是第一个子物体）
        model = transform.GetChild(0);
        if (!animator && model) animator = model.GetComponent<Animator>();
    }

    void Update()
    {
        HandleMovementInput();
        HandleAnimation();
    }

    void FixedUpdate()
    {
        MovePlayer();
    }

    private void HandleMovementInput()
    {
        // 获取输入
        float horizontal = Input.GetAxis("Horizontal");
        float vertical = Input.GetAxis("Vertical");

        // 基于摄像机方向调整输入方向
        Camera mainCamera = Camera.main;
        if (mainCamera)
        {
            // 获取摄像机前方和右方方向（忽略Y轴）
            Vector3 forward = mainCamera.transform.forward;
            forward.y = 0;
            forward.Normalize();
            Vector3 right = mainCamera.transform.right;
            right.y = 0;
            right.Normalize();

            // 计算移动方向
            movement = (forward * vertical + right * horizontal).normalized;
        }

        // 切换行走和奔跑速度
        currentSpeed = Input.GetKey(KeyCode.Space) ? runSpeed : walkSpeed;
    }

    private void HandleAnimation()
    {
        if (animator)
        {
            if (movement.magnitude > 0.1f)
            {
                bool isRunning = currentSpeed == runSpeed;
                animator.SetBool("isRunning", isRunning);
                animator.SetBool("isWalking", !isRunning);
            }
            else
            {
                animator.SetBool("isRunning", false);
                animator.SetBool("isWalking", false);
            }
        }
    }

    private void MovePlayer()
    {
        // 位移
        if (movement.magnitude > 0.1f)
        {
            Vector3 moveDirection = movement * currentSpeed;
            rb.MovePosition(rb.position + moveDirection * Time.fixedDeltaTime);

            // 模型旋转（朝向移动方向）
            Quaternion targetRotation = Quaternion.LookRotation(movement, Vector3.up);
            model.rotation = Quaternion.Lerp(model.rotation, targetRotation, rotationSpeed * Time.fixedDeltaTime);
        }
    }
}
