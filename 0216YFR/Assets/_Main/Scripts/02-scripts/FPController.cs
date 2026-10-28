using UnityEngine;

public class FPController : MonoBehaviour
{
    public float moveSpeed = 5f; 
    public float sprintMultiplier = 1.5f; 
    public float lookSpeed = 2f; 
    public float pitchLimit = 80f; 

    public float crouchHeight = 0.5f; 
    public float standHeight = 1.8f; 
    private bool isCrouching = false;
    private float originalStepOffset;

    private CharacterController characterController;
    private Camera playerCamera;

    private float yaw = 0f;
    private float pitch = 0f;

    // 暴露蹲下状态
    public bool IsCrouching => isCrouching;

    private void Start()
    {
        playerCamera = Camera.main;
        characterController = GetComponent<CharacterController>();
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;

        playerCamera.transform.localPosition = new Vector3(0f, standHeight, 0f);
        originalStepOffset = characterController.stepOffset;
    }

    private void Update()
    {
        HandleLook();
        HandleCrouch();
        HandleMovement();
    }

    private void HandleLook()
    {
        float mouseX = Input.GetAxis("Mouse X");
        float mouseY = Input.GetAxis("Mouse Y");

        yaw += mouseX * lookSpeed;
        pitch -= mouseY * lookSpeed;
        pitch = Mathf.Clamp(pitch, -pitchLimit, pitchLimit);

        transform.rotation = Quaternion.Euler(0f, yaw, 0f);
        playerCamera.transform.localRotation = Quaternion.Euler(pitch, 0f, 0f);
    }
    private void HandleCrouch()
    {
        if (Input.GetKeyDown(KeyCode.C))
        {
            isCrouching = !isCrouching;

            if (isCrouching)
            {
                playerCamera.transform.localPosition = new Vector3(0f, crouchHeight, 0f);
                characterController.height = crouchHeight;
                //characterController.stepOffset = 0f;
            }
            else
            {
                playerCamera.transform.localPosition = new Vector3(0f, standHeight, 0f);
                characterController.height = standHeight;
                //characterController.stepOffset = originalStepOffset;
            }
        }
    }
    private void HandleMovement()
    {
        float moveDirectionX = Input.GetAxis("Horizontal"); 
        float moveDirectionZ = Input.GetAxis("Vertical");
        bool isSprinting = Input.GetKey(KeyCode.LeftShift);

        float currentSpeed = isSprinting ? moveSpeed * sprintMultiplier : moveSpeed;
        Vector3 move = transform.right * moveDirectionX + transform.forward * moveDirectionZ;
        characterController.Move(move * currentSpeed * Time.deltaTime);
    }
}
