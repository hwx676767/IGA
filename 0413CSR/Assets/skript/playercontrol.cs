using UnityEngine;

[RequireComponent(typeof(CharacterController))]
public class playercontrol : MonoBehaviour
{
    [Header("Movement Settings")]
    [SerializeField] private float moveSpeed = 5f;
    [SerializeField] private float runSpeed = 8f;
    [SerializeField] private float jumpForce = 15f;
    [SerializeField] private float gravity = -20f;
    [SerializeField] private float smoothTime = 2f;

    [Header("Rotation Settings")]
    [SerializeField] private float rotationSpeed = 15f;

    private CharacterController characterController;
    private Vector3 moveDirection;
    private Vector3 velocity;

    void Start()
    {
        characterController = GetComponent<CharacterController>();
    }

    void Update()
    {
        HandleMovement();
        HandleRotation();
    }

    private void HandleMovement()
    {
        float horizontal = Input.GetAxis("Horizontal");
        float vertical = Input.GetAxis("Vertical");
        bool hasInput = Mathf.Abs(horizontal) > 0.1f || Mathf.Abs(vertical) > 0.1f;
        bool isRunning = Input.GetKey(KeyCode.LeftShift) && hasInput;

        Vector3 inputDirection = new Vector3(horizontal, 0f, vertical).normalized;
        if (Camera.main != null && hasInput)
        {
            Vector3 cameraForward = Vector3.Scale(Camera.main.transform.forward, new Vector3(1, 0, 1)).normalized;
            Vector3 cameraRight = Vector3.Scale(Camera.main.transform.right, new Vector3(1, 0, 1)).normalized;
            moveDirection = cameraForward * vertical + cameraRight * horizontal;
            moveDirection.Normalize();
        }
        else
        {
            moveDirection = inputDirection;
        }

        float currentSpeed = isRunning ? runSpeed : moveSpeed;

        Vector3 targetHorizontalVelocity = moveDirection * currentSpeed;
        velocity.x = Mathf.Lerp(velocity.x, targetHorizontalVelocity.x, smoothTime * Time.deltaTime);
        velocity.z = Mathf.Lerp(velocity.z, targetHorizontalVelocity.z, smoothTime * Time.deltaTime);

        if (characterController.isGrounded)
        {
            if (Input.GetKeyDown(KeyCode.Space))
            {
                velocity.y = jumpForce;
                Debug.Log("Jump triggered");
            }
            else
            {
                velocity.y = -0.5f; 
            }
        }
        else
        {
            // 应用重力
            velocity.y += gravity * Time.deltaTime;
        }

        // 执行移动
        characterController.Move(velocity * Time.deltaTime);
    }

    private void HandleRotation()
    {
        if (moveDirection.magnitude > 0.1f)
        {
            Quaternion targetRotation = Quaternion.LookRotation(moveDirection);
            transform.rotation = Quaternion.Slerp(transform.rotation, targetRotation, rotationSpeed * Time.deltaTime);
        }
    }
}