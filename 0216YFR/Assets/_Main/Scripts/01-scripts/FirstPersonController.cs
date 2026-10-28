using UnityEngine;

public class FirstPersonController : MonoBehaviour
{
    public float moveSpeed = 5f;
    public float sprintMultiplier = 1.5f;
    public float lookSpeed = 2f;
    public float pitchLimit = 80f;

    private CharacterController characterController;
    private Camera playerCamera;

    private float yaw = 0f;
    private float pitch = 0f; 

    private void Start()
    {
        playerCamera = Camera.main;
        characterController = GetComponent<CharacterController>();
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
    }

    private void Update()
    {
        HandleLook();
        HandleMovement();
    }

    private void HandleLook()
    {
        float mouseX = Input.GetAxis("Mouse X");
        float mouseY = Input.GetAxis("Mouse Y");

        yaw += mouseX * lookSpeed;
        pitch -= mouseY * lookSpeed;
        pitch = Mathf.Clamp(pitch, -pitchLimit, pitchLimit);

        transform.rotation = Quaternion.Euler(0f, yaw, 0f); // 只旋转y轴
        playerCamera.transform.localRotation = Quaternion.Euler(pitch, 0f, 0f); // 只旋转x轴
    }

    private void HandleMovement()
    {
        float moveDirectionX = Input.GetAxis("Horizontal"); // A/D (左/右)
        float moveDirectionZ = Input.GetAxis("Vertical"); // W/S (前/后)

        bool isSprinting = Input.GetKey(KeyCode.LeftShift);

        float currentSpeed = isSprinting ? moveSpeed * sprintMultiplier : moveSpeed;

        Vector3 move = transform.right * moveDirectionX + transform.forward * moveDirectionZ;

        characterController.Move(move * currentSpeed * Time.deltaTime);
    }
}
