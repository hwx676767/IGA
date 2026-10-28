using UnityEngine;
using TMPro; // ✅ 使用 TMP 文本组件

public class FirstPersonController : MonoBehaviour
{
    [Header("Movement Settings")]
    public float moveSpeed = 5f;
    public float mouseSensitivity = 100f;
    public float minPitch = -90f;
    public float maxPitch = 90f;

    [Header("Interaction Settings")]
    public float grabRange = 3f;
    public float grabRadius = 0.5f;
    public Transform handPosition;
    public LayerMask grabbableLayer;
    public float throwForce = 10f;

    [Header("UI Settings")]
    public TMP_Text grabHintText;   // ✅ 抓取提示文字

    private Rigidbody rb;
    private Transform playerCamera;
    private float pitch = 0f;

    private Animator anim;
    private GameObject grabbedObject = null;
    private bool canGrab = false; // ✅ 用于记录当前是否有可抓物体

    void Start()
    {
        rb = GetComponent<Rigidbody>();
        playerCamera = transform.Find("Camera");

        if (playerCamera == null)
            Debug.LogError("请确保摄像机是玩家的子对象，名称为 'Camera'");

        anim = GetComponentInChildren<Animator>();

        if (grabHintText != null)
            grabHintText.gameObject.SetActive(false); // 初始化时隐藏提示

        Cursor.lockState = CursorLockMode.Locked;
    }

    void Update()
    {
        HandleMouseLook();
        HandleGrabSystem();
        UpdateGrabHintUI(); // ✅ 每帧更新提示 UI
    }

    void FixedUpdate()
    {
        HandleMovement();
    }

    void HandleMouseLook()
    {
        float mouseX = Input.GetAxis("Mouse X") * mouseSensitivity * Time.deltaTime;
        float mouseY = Input.GetAxis("Mouse Y") * mouseSensitivity * Time.deltaTime;

        transform.Rotate(Vector3.up * mouseX);
        pitch -= mouseY;
        pitch = Mathf.Clamp(pitch, minPitch, maxPitch);
        playerCamera.localRotation = Quaternion.Euler(pitch, 0f, 0f);
    }

    void HandleMovement()
    {
        float horizontal = Input.GetAxis("Horizontal");
        float vertical = Input.GetAxis("Vertical");
        Vector3 moveDirection = transform.right * horizontal + transform.forward * vertical;

        Vector3 moveVelocity = moveDirection.normalized * moveSpeed;
        moveVelocity.y = rb.velocity.y;
        rb.velocity = moveVelocity;
    }
    
    // --- 空格恢复站立 ---
    void HandleStandUp()
    {
        if (Input.GetKeyDown(KeyCode.Space))
        {
            transform.rotation = Quaternion.Euler(0f, transform.eulerAngles.y, 0f);
            playerCamera.localRotation = Quaternion.Euler(0f, 0f, 0f);
            pitch = 0f;
            Debug.Log("已恢复站立姿势");
        }
    }

    void HandleGrabSystem()
    {
        // 检测可抓取物体（但不立即抓）
        canGrab = CheckForGrabbable();

        if (Input.GetKeyDown(KeyCode.G))
        {
            if (grabbedObject == null)
            {
                if (anim != null)
                    anim.SetTrigger("Pick");

                bool success = TryGrabObject();
                if (!success && anim != null)
                    anim.SetBool("IsHolding", false);
            }
        }

        if (Input.GetKey(KeyCode.G))
        {
            if (grabbedObject != null && anim != null)
                anim.SetBool("IsHolding", true);
        }

        if (Input.GetKeyUp(KeyCode.G))
        {
            if (grabbedObject != null)
                ThrowObject();

            if (anim != null)
            {
                anim.SetBool("IsHolding", false);
                anim.ResetTrigger("Pick");
            }
        }

        
        if (grabbedObject != null)
        {
            grabbedObject.transform.position = Vector3.Lerp(
                grabbedObject.transform.position,
                handPosition.position,
                Time.deltaTime * 15f
            );

            grabbedObject.transform.localRotation = Quaternion.Euler(0f, -90f, -25f);
        }
    }

    
    bool CheckForGrabbable()
    {
        Ray ray = new Ray(playerCamera.position, playerCamera.forward);
        if (Physics.SphereCast(ray, grabRadius, out RaycastHit hit, grabRange, grabbableLayer))
        {
            if (hit.collider.CompareTag("Grabbable"))
                return true;
        }
        return false;
    }

    
    void UpdateGrabHintUI()
    {
        if (grabHintText == null) return;

        if (canGrab && grabbedObject == null)
        {
            grabHintText.text = " [G] ";
            grabHintText.gameObject.SetActive(true);
        }
        else
        {
            grabHintText.gameObject.SetActive(false);
        }
    }

    // --- 抓取 ---
    bool TryGrabObject()
    {
        Ray ray = new Ray(playerCamera.position, playerCamera.forward);
        if (Physics.SphereCast(ray, grabRadius, out RaycastHit hit, grabRange, grabbableLayer))
        {
            if (hit.collider.CompareTag("Grabbable"))
            {
                grabbedObject = hit.collider.gameObject;
                Rigidbody objRb = grabbedObject.GetComponent<Rigidbody>();
                if (objRb != null)
                {
                    objRb.useGravity = false;
                    objRb.isKinematic = true;
                }

                Collider objCollider = grabbedObject.GetComponent<Collider>();
                if (objCollider != null)
                    objCollider.enabled = false;

                grabbedObject.transform.position = handPosition.position;
                grabbedObject.transform.rotation = handPosition.rotation;
                grabbedObject.transform.SetParent(handPosition);
                grabbedObject.transform.localPosition = Vector3.zero;
                grabbedObject.transform.localRotation = Quaternion.Euler(0f, -90f, -25f);

                Debug.Log("已抓取：" + grabbedObject.name);
                return true;
            }
        }
        return false;
    }

    // --- 投掷 ---
    void ThrowObject()
    {
        Rigidbody objRb = grabbedObject.GetComponent<Rigidbody>();
        if (objRb != null)
        {
            objRb.isKinematic = false;
            objRb.useGravity = true;
            objRb.AddForce(playerCamera.forward * throwForce, ForceMode.Impulse);
        }

        Collider objCollider = grabbedObject.GetComponent<Collider>();
        if (objCollider != null)
            objCollider.enabled = true;

        grabbedObject.transform.SetParent(null);
        grabbedObject = null;

        Debug.Log("已投掷物体");
    }

    void OnDrawGizmos()
    {
        if (playerCamera == null) return;
        Gizmos.color = Color.cyan;
        Gizmos.DrawWireSphere(playerCamera.position + playerCamera.forward * grabRange * 0.5f, grabRadius);
        Gizmos.DrawLine(playerCamera.position, playerCamera.position + playerCamera.forward * grabRange);
    }
}
