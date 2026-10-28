using UnityEngine;
using UnityEngine.InputSystem;

public class FirstPersonController : MonoBehaviour
{
    [Header("Movement Settings")]
    public float moveSpeed = 5f; 
    public float turnSpeed = 5f; 
    public float sprintMultiplier = 1.5f; 

    [Header("Mouse Look Settings")]
    public float mouseSensitivity = 1f; 
    public Transform playerCamera; 

    private float verticalRotation = 0f; 
    private Vector2 _moveInput; 
    private Vector2 lookInput; 
    private bool isSprinting;  

    private PlayerInput playerInput; 
    private InputAction moveAction; 
    private InputAction lookAction; 
    private InputAction sprintAction; 

    void Awake()
    {
        playerInput = GetComponent<PlayerInput>();

        moveAction = playerInput.actions["Move"];
        lookAction = playerInput.actions["Look"];
        sprintAction = playerInput.actions["Sprint"];
    }

    void Start()
    {
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;

        transform.rotation = Quaternion.identity;
    }

    void Update()
    {
        HandleMouseLook(); 
        HandleMovement();  
    }

    void HandleMouseLook()
    {
        lookInput = lookAction.ReadValue<Vector2>();

        float mouseX = lookInput.x * mouseSensitivity * Time.deltaTime;
        float mouseY = lookInput.y * mouseSensitivity * Time.deltaTime;

        verticalRotation -= mouseY;
        verticalRotation = Mathf.Clamp(verticalRotation, -15f, 65f);
        playerCamera.localRotation = Quaternion.Euler(verticalRotation, 0f, 0f);

        transform.Rotate(Vector3.up * mouseX);
    }

    void HandleMovement()
    {
        _moveInput = moveAction.ReadValue<Vector2>();

        // 依托相机方向计算移动方向
        Vector3 forward = playerCamera.forward;
        Vector3 right = playerCamera.right;

        // 保持 y=0 避免上下移动
        forward.y = 0f;
        right.y = 0f;
        forward.Normalize();
        right.Normalize();

        Vector3 moveDir = forward * _moveInput.y + right * _moveInput.x;
        moveDir = moveDir.normalized;

        if (moveDir.magnitude > 0)
        {
            // 平滑旋转角色朝向移动方向
            Quaternion targetRotation = Quaternion.LookRotation(moveDir);
            transform.rotation = Quaternion.Slerp(transform.rotation, targetRotation, Time.deltaTime * turnSpeed);

            // 决定当前速度
            isSprinting = sprintAction.ReadValue<float>() > 0;
            float currentSpeed = isSprinting ? moveSpeed * sprintMultiplier : moveSpeed;

            // 移动角色
            transform.Translate(moveDir * currentSpeed * Time.deltaTime, Space.World);
        }
    }

}
