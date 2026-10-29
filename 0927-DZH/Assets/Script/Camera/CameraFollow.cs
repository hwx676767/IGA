using UnityEngine;

public class CameraFollow : MonoBehaviour
{
    [Header("跟随目标")]
    public Transform target;          // 要跟随的目标

    [Header("摄像机设置")]
    public float smoothSpeed = 5f;        // 摄像机移动平滑度
    public Vector3 cameraOffset = new Vector3(0, 0, -10f); // 摄像机偏移
    public float minSmoothDistance = 0.01f; // 最小平滑距离

    [Header("调试设置")]
    public bool enableDebugLogs = true;   // 启用调试日志

    void Start()
    {
        // 初始化设置
        if (target == null)
        {
            Debug.LogError("请指定要跟随的目标！");
            enabled = false;
            return;
        }

        // 立即移动到目标位置
        transform.position = target.position + cameraOffset;

        DebugLog("摄像机初始化完成，开始跟随目标");
    }

    void Update()
    {
        // 摄像机平滑跟随
        SmoothFollowTarget();
    }

    /// <summary>
    /// 平滑跟随目标
    /// </summary>
    void SmoothFollowTarget()
    {
        if (target == null)
        {
            DebugLogError("跟随目标为null！");
            return;
        }

        Vector3 targetPosition = target.position + cameraOffset;
        float distance = Vector3.Distance(transform.position, targetPosition);

        // 动态调整平滑速度（距离越远，移动越快）
        float dynamicSmoothSpeed = smoothSpeed;
        if (distance > 5f) // 如果距离较远，加快移动速度
        {
            dynamicSmoothSpeed = smoothSpeed * 2f;
        }

        // 使用Lerp进行平滑移动
        transform.position = Vector3.Lerp(transform.position, targetPosition, dynamicSmoothSpeed * Time.deltaTime);

        // 只有在距离很近时才考虑直接设置位置（避免微小抖动）
        if (distance < minSmoothDistance)
        {
            transform.position = targetPosition;
        }

        // 调试信息（每30帧输出一次，避免日志过多）
        if (Time.frameCount % 30 == 0 && enableDebugLogs)
        {
            DebugLog($"跟随: {target.name}, 距离: {distance:F2}, 速度: {dynamicSmoothSpeed:F1}");
        }
    }

    /// <summary>
    /// 设置新的跟随目标
    /// </summary>
    public void SetTarget(Transform newTarget)
    {
        if (newTarget == null)
        {
            DebugLogError("新目标为null！");
            return;
        }

        target = newTarget;
        DebugLog($"切换到新目标: {newTarget.name}");
    }

    /// <summary>
    /// 获取当前目标
    /// </summary>
    public Transform GetTarget()
    {
        return target;
    }

    /// <summary>
    /// 调试日志输出
    /// </summary>
    private void DebugLog(string message)
    {
        if (enableDebugLogs)
        {
            Debug.Log($"[Camera] {message}");
        }
    }

    /// <summary>
    /// 调试错误输出
    /// </summary>
    private void DebugLogError(string message)
    {
        Debug.LogError($"[Camera] {message}");
    }

    // 可视化调试
    void OnDrawGizmosSelected()
    {
        if (target != null)
        {
            Gizmos.color = Color.green;
            Gizmos.DrawWireSphere(target.position, 0.7f);
            Gizmos.DrawLine(transform.position, target.position);
        }

        // 绘制摄像机视野
        Gizmos.color = Color.yellow;
        Gizmos.DrawWireCube(transform.position - cameraOffset, new Vector3(18f, 10f, 0.1f));
    }
}