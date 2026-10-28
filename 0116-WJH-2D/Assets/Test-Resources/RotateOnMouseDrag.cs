using UnityEngine;

public class RotateOnMouseDrag : MonoBehaviour
{
    [Header("旋转设置")]
    public float rotationSensitivity = 2f; // 鼠标拖动敏感度（越大旋转越快）
    public bool limitRotation = false;     // 是否限制旋转角度（360度内）
    [Range(0f, 360f)]
    public float maxRotationAngle = 360f;  // 最大旋转角度限制

    private Camera cam;
    private Vector3 lastMousePos;
    private bool isDragging = false;
    private float initialRotationZ; // 初始Z旋转，用于角度限制

    void Start()
    {
        cam = Camera.main;
        if (cam == null)
        {
            Debug.LogError("需要 Main Camera！", this);
        }

        initialRotationZ = transform.eulerAngles.z;
    }

    void Update()
    {
        // 鼠标按下：射线检测是否点击到此对象
        if (Input.GetMouseButtonDown(0))
        {
            Vector2 mousePos = cam.ScreenToWorldPoint(Input.mousePosition);
            RaycastHit2D hit = Physics2D.Raycast(mousePos, Vector2.zero);

            if (hit.collider != null && hit.collider.gameObject == gameObject)
            {
                isDragging = true;
                lastMousePos = Input.mousePosition;
                initialRotationZ = transform.eulerAngles.z; // 重置初始角度（可选）
            }
        }

        // 鼠标按住拖动：根据鼠标X移动计算旋转
        if (Input.GetMouseButton(0) && isDragging)
        {
            Vector3 delta = Input.mousePosition - lastMousePos;
            float rotateZ = -delta.x * rotationSensitivity; // 鼠标右拖=逆时针，左拖=顺时针

            if (limitRotation)
            {
                float newZ = (initialRotationZ + rotateZ) % 360f;
                if (newZ < 0) newZ += 360f;
                if (newZ <= maxRotationAngle)
                {
                    transform.Rotate(0f, 0f, rotateZ);
                }
            }
            else
            {
                transform.Rotate(0f, 0f, rotateZ);
            }

            lastMousePos = Input.mousePosition;
        }

        // 鼠标松开：停止拖拽
        if (Input.GetMouseButtonUp(0))
        {
            isDragging = false;
        }
    }
}