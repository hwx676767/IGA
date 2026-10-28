using UnityEngine;

public class DynamicFollower : MonoBehaviour
{
    [Header("跟随设置")]
    [SerializeField] private Transform target;              // 玩家目标
    [SerializeField] private float horizontalSpeed = 3f;    // 水平跟随速度
    [SerializeField] private float verticalSpeed = 2f;      // 垂直跟随速度
    [SerializeField] private float rotationSpeed = 5f;      // 旋转速度
    
    [Header("距离设置")]
    [SerializeField] private float minDistance = 2f;        // 最小距离
    [SerializeField] private float maxDistance = 5f;        // 最大距离
    [SerializeField] private float baseHeightOffset = 1.2f; // 基础高度偏移（提高到1.2米）
    private float currentDistance;                          // 当前跟随距离
    
    [Header("浮动效果")]
    [SerializeField] private float floatHeight = 0.4f;      // 浮动幅度
    [SerializeField] private float floatSpeed = 1.2f;      // 浮动速度
    private float floatOffset;                              // 当前浮动值
    
    [Header("防嵌入设置")]
    [SerializeField] private float groundClearance = 0.5f;  // 离地间隙
    [SerializeField] private LayerMask groundLayer;         // 地面层
    [SerializeField] private float raycastLength = 2f;      // 射线检测长度

    private Vector3 horizontalVelocity = Vector3.zero;
    private float verticalVelocity;
    private float currentHeightOffset;

    private void Start()
    {
        if (target == null)
        {
            Debug.LogError("未设置跟随目标!");
            enabled = false;
            return;
        }
        
        // 初始化距离
        Vector3 flatTargetPos = new Vector3(target.position.x, 0, target.position.z);
        Vector3 flatSelfPos = new Vector3(transform.position.x, 0, transform.position.z);
        currentDistance = Mathf.Clamp(Vector3.Distance(flatTargetPos, flatSelfPos), minDistance, maxDistance);
        
        // 初始化高度
        currentHeightOffset = baseHeightOffset;
    }

    private void Update()
    {
        if (target == null) return;
        
        UpdateFloating();
        FollowTarget();
        CheckGroundClearance();
    }

    // 浮动效果更新
    private void UpdateFloating()
    {
        floatOffset = Mathf.Sin(Time.time * floatSpeed) * floatHeight;
    }

    // 地面检测
    private void CheckGroundClearance()
    {
        RaycastHit hit;
        Vector3 rayOrigin = transform.position + Vector3.up * 0.5f; // 从腰部高度发射射线
        
        if (Physics.Raycast(rayOrigin, Vector3.down, out hit, raycastLength, groundLayer))
        {
            float requiredHeight = hit.point.y + groundClearance;
            if (transform.position.y < requiredHeight)
            {
                // 紧急提升高度
                transform.position = new Vector3(
                    transform.position.x, 
                    Mathf.Lerp(transform.position.y, requiredHeight, 0.5f),
                    transform.position.z
                );
            }
        }
    }

    // 跟随逻辑
    private void FollowTarget()
    {
        // 计算水平方向(忽略Y轴)
        Vector3 horizontalDir = new Vector3(
            target.position.x - transform.position.x,
            0,
            target.position.z - transform.position.z
        ).normalized;
        
        // 计算目标水平位置
        Vector3 targetHorizontalPos = target.position - horizontalDir * currentDistance;
        targetHorizontalPos.y = transform.position.y; // 保持当前Y值
        
        // 平滑水平移动
        Vector3 newPos = Vector3.SmoothDamp(
            transform.position,
            targetHorizontalPos,
            ref horizontalVelocity,
            0.3f,
            horizontalSpeed
        );
        
        // 计算目标高度（玩家高度 + 基础偏移 + 浮动）
        float targetHeight = target.position.y + baseHeightOffset + floatOffset;
        
        // 应用高度差（楼梯/斜坡适应）
        if (Mathf.Abs(target.position.y - transform.position.y) > 1f)
        {
            // 当高度差较大时，增加高度偏移
            targetHeight += (target.position.y - transform.position.y) * 0.3f;
        }
        
        // 平滑垂直移动
        newPos.y = Mathf.SmoothDamp(
            transform.position.y,
            targetHeight,
            ref verticalVelocity,
            0.5f,
            verticalSpeed
        );
        
        // 应用新位置
        transform.position = newPos;
        
        // 面向玩家（仅水平旋转）
        if (horizontalDir != Vector3.zero)
        {
            Quaternion targetRotation = Quaternion.LookRotation(horizontalDir);
            transform.rotation = Quaternion.Slerp(
                transform.rotation,
                targetRotation,
                rotationSpeed * Time.deltaTime
            );
        }
    }

    // 调试可视化
    private void OnDrawGizmosSelected()
    {
        if (target != null)
        {
            // 绘制跟随距离
            Gizmos.color = Color.cyan;
            Vector3 center = new Vector3(target.position.x, transform.position.y, target.position.z);
            UnityEditor.Handles.DrawWireDisc(center, Vector3.up, currentDistance);
            
            // 绘制高度关系
            Gizmos.color = Color.green;
            Gizmos.DrawLine(
                target.position,
                target.position + Vector3.up * baseHeightOffset
            );
            
            // 绘制地面检测射线
            Gizmos.color = Color.yellow;
            Vector3 rayStart = transform.position + Vector3.up * 0.5f;
            Gizmos.DrawLine(rayStart, rayStart + Vector3.down * raycastLength);
        }
    }
}