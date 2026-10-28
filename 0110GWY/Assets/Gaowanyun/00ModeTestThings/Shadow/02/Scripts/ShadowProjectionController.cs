using UnityEngine;

public class ShadowProjectionController : MonoBehaviour
{
    public Material shadowMaterial; // 你的阴影材质
    private Camera shadowCamera;    // 阴影投影用的相机
    private Matrix4x4 shadowMatrix; // 阴影投影矩阵

    void Start()
    {
        // 初始化阴影相机
        InitializeShadowCamera();

        // 更新投影矩阵
        UpdateShadowMatrix();
    }

    void Update()
    {
        // 每帧更新阴影投影矩阵
        UpdateShadowMatrix();
    }

    /// <summary>
    /// 初始化阴影相机
    /// </summary>
    void InitializeShadowCamera()
    {
        // 创建阴影相机
        shadowCamera = new GameObject("Shadow Camera").AddComponent<Camera>();
        shadowCamera.enabled = false; // 禁用渲染，仅计算投影矩阵
        shadowCamera.orthographic = true; // 使用正交投影（适合平行光）
        shadowCamera.orthographicSize = 10f; // 视野大小，按需调整
        shadowCamera.nearClipPlane = 0.3f;
        shadowCamera.farClipPlane = 50f;

        // 将阴影相机设置在适当的位置和角度
        shadowCamera.transform.position = new Vector3(0, 10, 0); // 正上方
        shadowCamera.transform.rotation = Quaternion.Euler(90, 0, 0); // 面向下方
    }

    /// <summary>
    /// 更新阴影投影矩阵并传递给 Shader
    /// </summary>
    void UpdateShadowMatrix()
    {
        // 计算阴影相机的投影矩阵
        shadowMatrix = shadowCamera.projectionMatrix * shadowCamera.worldToCameraMatrix;

        // 将矩阵的四个行向量拆分出来
        Vector4 row0 = shadowMatrix.GetRow(0);
        Vector4 row1 = shadowMatrix.GetRow(1);
        Vector4 row2 = shadowMatrix.GetRow(2);
        Vector4 row3 = shadowMatrix.GetRow(3);

        // 将投影矩阵的行向量传递到 Shader 中
        shadowMaterial.SetVector("_ShadowMatrixRow0", row0);
        shadowMaterial.SetVector("_ShadowMatrixRow1", row1);
        shadowMaterial.SetVector("_ShadowMatrixRow2", row2);
        shadowMaterial.SetVector("_ShadowMatrixRow3", row3);

        // 传递阴影相机的位置信息（可以在 Shader 中用于调整偏移）
        shadowMaterial.SetVector("_ShadowCameraPosition", shadowCamera.transform.position);
    }
}
