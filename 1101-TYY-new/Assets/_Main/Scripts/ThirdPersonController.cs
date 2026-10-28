using UnityEngine;
using UnityEngine.InputSystem;

public class ThirdPersonController : MonoBehaviour
{
    [Header("移动参数")]
    public float moveSpeed = 5f;
    public float turnSpeed = 10f;
    public float sprintMultiplier = 1.5f;

    [Header("摄像机跟随参数")]
    public Transform cameraTransform;     // 第三人称摄像机
    public Vector3 cameraOffset = new Vector3(0, 3, -6); // 相机相对玩家偏移
    public float followSmoothTime = 0.2f; // 跟随平滑度

    private Vector2 moveInput;
    private bool isSprinting;

    private PlayerInput playerInput;
    private InputAction moveAction;
    private InputAction sprintAction;

    private Vector3 cameraVelocity; // 用于平滑跟随

    void Awake()
    {
        playerInput = GetComponent<PlayerInput>();
        moveAction = playerInput.actions["Move"];
        sprintAction = playerInput.actions["Sprint"];
    }

    void Start()
    {
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
    }

    void LateUpdate()
    {
        HandleCameraFollow();
    }

    void Update()
    {
        HandleMovement();
    }

    void HandleMovement()
    {
        moveInput = moveAction.ReadValue<Vector2>();
        Vector3 moveDir = new Vector3(moveInput.x, 0, moveInput.y);

        if (moveDir.magnitude > 0.1f)
        {
            // 根据相机方向计算相对世界的移动方向
            Vector3 camForward = cameraTransform.forward;
            Vector3 camRight = cameraTransform.right;
            camForward.y = 0;
            camRight.y = 0;
            camForward.Normalize();
            camRight.Normalize();

            Vector3 worldMove = camForward * moveDir.z + camRight * moveDir.x;

            // 旋转角色朝向移动方向
            Quaternion targetRotation = Quaternion.LookRotation(worldMove);
            transform.rotation = Quaternion.Slerp(transform.rotation, targetRotation, turnSpeed * Time.deltaTime);

            // 冲刺检测
            isSprinting = sprintAction.ReadValue<float>() > 0;
            float currentSpeed = isSprinting ? moveSpeed * sprintMultiplier : moveSpeed;

            // 平移角色
            transform.Translate(Vector3.forward * currentSpeed * Time.deltaTime);
        }
    }

    void HandleCameraFollow()
    {
        if (cameraTransform == null) return;

        // 计算目标相机位置
        Vector3 targetPos = transform.position + transform.TransformDirection(cameraOffset);

        // 平滑移动摄像机
        cameraTransform.position = Vector3.SmoothDamp(cameraTransform.position, targetPos, ref cameraVelocity, followSmoothTime);

        // 摄像机始终看向玩家
        cameraTransform.LookAt(transform.position + Vector3.up * 1.5f);
    }
}
