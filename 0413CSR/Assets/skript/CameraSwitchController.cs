using UnityEngine;
using Cinemachine;

public class CameraSwitchControl : MonoBehaviour
{
  
    [Header("Camera References")]
    public CinemachineVirtualCamera followCamera; // 常规跟随相机
    public CinemachineVirtualCamera dollyCamera;  // 轨道运动相机
    public CinemachineSmoothPath dollyPath;       // Dolly路径

    [Header("Movement Settings")]
    public float moveSpeed = 0.5f;
    public KeyCode triggerKey = KeyCode.F;

    private CinemachineTrackedDolly dollyComponent;
    private bool isDollyActive = false;
    private Vector3[] originalWaypoints; // 原始路径点缓存

    void Start()
    {
        dollyComponent = dollyCamera.GetCinemachineComponent<CinemachineTrackedDolly>();
        dollyCamera.gameObject.SetActive(false);

        // 缓存原始路径点坐标（世界坐标）
        CachePathWorldPositions();
    }

    void Update()
    {
        HandleCameraSwitch();
        UpdateDollyMovement();
    }

    void HandleCameraSwitch()
    {
        if (Input.GetKeyDown(triggerKey))
        {
            if (!isDollyActive)
            {
                // 切换到轨道模式时同步状态
                AlignDollyCamera();
                AlignDollyPath();
            }

            ToggleCameraActiveState();
        }
    }

    void ToggleCameraActiveState()
    {
        isDollyActive = !isDollyActive;
        followCamera.gameObject.SetActive(!isDollyActive);
        dollyCamera.gameObject.SetActive(isDollyActive);
    }

    void AlignDollyCamera()
    {
        // 同步物理位置和旋转
        dollyCamera.transform.SetPositionAndRotation(
            followCamera.transform.position,
            followCamera.transform.rotation
        );

        // 同步镜头参数
        dollyCamera.m_Lens.FieldOfView = followCamera.m_Lens.FieldOfView;
    }

    void AlignDollyPath()
    {
        // 计算主相机在路径局部坐标系中的位置
        Vector3 localPos = dollyPath.transform.InverseTransformPoint(followCamera.transform.position);

        // 动态调整路径起点到当前相机位置
        if (dollyPath.m_Waypoints.Length > 0)
        {
            // 保持路径原有形状，仅移动整个路径
            Vector3 offset = localPos - dollyPath.m_Waypoints[0].position;
            for (int i = 0; i < dollyPath.m_Waypoints.Length; i++)
            {
                dollyPath.m_Waypoints[i].position += offset;
            }
        }

        dollyComponent.m_PathPosition = 0; // 重置路径位置
    }

    void UpdateDollyMovement()
    {
        if (isDollyActive)
        {
            // 根据路径长度比例计算移动量
            float pathLength = dollyPath.PathLength;
            dollyComponent.m_PathPosition += (moveSpeed / pathLength) * Time.deltaTime;
        }
    }

    void CachePathWorldPositions()
    {
        // 缓存原始路径世界坐标（用于重置）
        originalWaypoints = new Vector3[dollyPath.m_Waypoints.Length];
        for (int i = 0; i < dollyPath.m_Waypoints.Length; i++)
        {
            originalWaypoints[i] = dollyPath.transform.TransformPoint(dollyPath.m_Waypoints[i].position);
        }
    }

    // 可选：退出时恢复原始路径
    void OnDestroy()
    {
        for (int i = 0; i < dollyPath.m_Waypoints.Length; i++)
        {
            dollyPath.m_Waypoints[i].position = dollyPath.transform.InverseTransformPoint(originalWaypoints[i]);
        }
    }
}