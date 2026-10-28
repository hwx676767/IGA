using UnityEngine;

public class ObjectRotator : MonoBehaviour
{
    [Header("旋转设置")]
    [Tooltip("旋转速度系数")]
    public float rotationSpeed = 5f;
    [Tooltip("是否启用惯性效果")]
    public bool enableInertia = true;
    [Tooltip("惯性减速系数")]
    public float inertiaDamping = 0.95f;
    
    [Header("自动旋转")]
    [Tooltip("启用自动旋转")]
    public bool autoRotate = true;
    [Tooltip("自动旋转速度")]
    public float autoRotateSpeed = 10f;
    
    private Vector3 lastMousePosition;
    private Vector3 rotationVelocity;
    private bool isDragging;
    private float idleTime;

    private void Update()
    {
        HandleMouseInput();
        ApplyRotation();
        HandleAutoRotation();
    }

    private void HandleMouseInput()
    {
        // 鼠标按下时开始拖拽
        if (Input.GetMouseButtonDown(0))
        {
            isDragging = true;
            lastMousePosition = Input.mousePosition;
            idleTime = 0f;
        }
        
        // 鼠标按住时旋转物体
        if (Input.GetMouseButton(0) && isDragging)
        {
            Vector3 delta = Input.mousePosition - lastMousePosition;
            rotationVelocity = new Vector3(0, -delta.x, 0) * rotationSpeed;
            lastMousePosition = Input.mousePosition;
        }
        
        // 鼠标释放时停止拖拽
        if (Input.GetMouseButtonUp(0))
        {
            isDragging = false;
        }
    }

    private void ApplyRotation()
    {
        if (!enableInertia && !isDragging) return;
        
        // 应用旋转
        transform.Rotate(rotationVelocity * Time.deltaTime, Space.World);
        
        // 惯性效果
        if (!isDragging)
        {
            rotationVelocity *= inertiaDamping;
            
            // 当速度很小时直接停止
            if (rotationVelocity.magnitude < 0.1f)
            {
                rotationVelocity = Vector3.zero;
            }
        }
    }

    private void HandleAutoRotation()
    {
        if (!autoRotate) return;
        
        // 如果没有交互操作，开始计时
        if (!isDragging && rotationVelocity.magnitude < 0.1f)
        {
            idleTime += Time.deltaTime;
            
            // 闲置2秒后开始自动旋转
            if (idleTime > 2f)
            {
                transform.Rotate(Vector3.up * autoRotateSpeed * Time.deltaTime, Space.World);
            }
        }
        else
        {
            idleTime = 0f;
        }
    }
}