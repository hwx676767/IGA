using UnityEngine;
using UnityEngine.Rendering;

[RequireComponent(typeof(Camera))]
public class MapCamera : MonoBehaviour
{
    [Header("地图参数")]
    public float mapSize = 50f;  // 地图尺寸（半径）
    public float padding = 5f;   // 边缘留白
    public float layerHeight = 10f; // 每次下移的距离

    [Header("调试")]
    public bool showGizmos = true;
    public Color gizmoColor = Color.cyan;

    private Camera _camera;

    void Start()
    {
        InitializeCamera();
    }
    

    void InitializeCamera()
    {
        _camera = GetComponent<Camera>();
        _camera.orthographic = true;
        _camera.orthographicSize = mapSize + padding;
        _camera.nearClipPlane = 0.1f;
        _camera.farClipPlane = mapSize * 2f;
        _camera.clearFlags = CameraClearFlags.SolidColor;
        _camera.backgroundColor = Color.clear;
        
        ResetCameraPosition();
    }

    // 公开方法：手动触发下移
    public void MoveDown()
    {
        Vector3 newPos = transform.position;
        newPos.y -= layerHeight; // Y轴下移固定距离
        transform.position = newPos;
    }

    // 重置相机到初始位置（可选）
    public void ResetCameraPosition()
    {
        transform.position = new Vector3(0, mapSize * 1.5f, 0);
        transform.rotation = Quaternion.Euler(90, 0, 0);
    }

    // 渲染清理（保持原有功能）
    void OnBeginCameraRendering(ScriptableRenderContext context, Camera cam)
    {
        if (cam == _camera) GL.Clear(true, true, Color.clear);
    }

    void OnEnable()
    {
        RenderPipelineManager.beginCameraRendering += OnBeginCameraRendering;
    }

    void OnDisable()
    {
        RenderPipelineManager.beginCameraRendering -= OnBeginCameraRendering;
    }

    void OnDrawGizmos()
    {
        if (!showGizmos || !Application.isPlaying) return;
        
        Gizmos.color = gizmoColor;
        Gizmos.DrawWireCube(Vector3.zero, new Vector3(mapSize * 2, 0.1f, mapSize * 2));
    }
}