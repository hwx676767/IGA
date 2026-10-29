using UnityEngine;
using System.Collections.Generic;

public class CameraOcclusionHider : MonoBehaviour
{
    [Header("基本设置")]
    public Transform player;                // 拖拽玩家对象到这里
    public LayerMask occlusionMask = -1;    // 选择要检测的遮挡层级
    public float checkInterval = 0.1f;      // 检测间隔（秒")
    public float detectionRange = 10f;      // 玩家前方检测范围

    [Header("透明度设置")]
    [Range(0f, 1f)] public float targetAlpha = 0.5f; // 目标不透明度（一半）
    public float fadeSpeed = 5f;            // 透明度变化速度

    [Header("控制接口")]
    public bool isActive = true;            // 是否激活遮挡隐藏功能
    public bool startActive = true;         // 开始时是否激活

    [Header("调试设置")]
    public bool showDebugRay = true;        // 显示调试射线
    public Color debugRayColor = Color.red; // 调试射线颜色

    private float nextCheckTime = 0;

    private Dictionary<Renderer, float> originalAlphas = new Dictionary<Renderer, float>(); // 原始透明度
    private List<Renderer> currentOccluders = new List<Renderer>(); // 当前需要半透明的渲染器

    // 公共属性，用于外部访问和控制
    public bool IsActive
    {
        get { return isActive; }
        set
        {
            if (isActive != value)
            {
                isActive = value;
                if (!isActive)
                {
                    // 如果禁用功能，立即恢复所有材质的透明度
                    RestoreAllTransparency();
                }
            }
        }
    }

    void Start()
    {
        // 初始化激活状态
        isActive = startActive;

        if (player == null)
        {
            Debug.LogError("请指定玩家对象！");
            enabled = false;
        }
    }

    void Update()
    {
        // 如果功能未激活，跳过检测
        if (!isActive) return;

        // 按间隔时间进行检测
        if (Time.time >= nextCheckTime)
        {
            CheckOcclusion();
            nextCheckTime = Time.time + checkInterval;
        }

        // 更新透明度
        UpdateTransparency();
    }

    void CheckOcclusion()
    {
        // 清空当前遮挡物列表
        currentOccluders.Clear();

        if (player == null) return;

        // 使用玩家位置和前方方向进行检测
        Vector3 playerPos = player.position;
        Vector3 playerForward = player.forward; // 玩家前方方向

        // 从玩家位置向前方发射射线
        RaycastHit[] hits = Physics.RaycastAll(playerPos, playerForward, detectionRange, occlusionMask);

        foreach (RaycastHit hit in hits)
        {
            Renderer renderer = hit.collider.GetComponent<Renderer>();
            if (renderer != null)
            {
                currentOccluders.Add(renderer);

                // 记录原始透明度（如果是新发现的渲染器）
                if (!originalAlphas.ContainsKey(renderer))
                {
                    originalAlphas[renderer] = GetMaterialAlpha(renderer);
                }
            }
        }

        // 调试：绘制检测射线
        if (showDebugRay)
        {
            Debug.DrawRay(playerPos, playerForward * detectionRange, debugRayColor);
        }
    }

    void UpdateTransparency()
    {
        // 处理所有已知的渲染器
        List<Renderer> allKnownRenderers = new List<Renderer>(originalAlphas.Keys);

        foreach (Renderer renderer in allKnownRenderers)
        {
            bool shouldBeTransparent = currentOccluders.Contains(renderer);
            float targetAlphaValue = shouldBeTransparent ? targetAlpha : originalAlphas[renderer];

            // 获取当前透明度
            float currentAlpha = GetMaterialAlpha(renderer);

            // 平滑过渡到目标透明度
            float newAlpha = Mathf.Lerp(currentAlpha, targetAlphaValue, Time.deltaTime * fadeSpeed);

            // 设置材质透明度
            SetMaterialAlpha(renderer, newAlpha);

            // 如果透明度接近原始值且不是当前遮挡物，从字典中移除
            if (Mathf.Abs(newAlpha - originalAlphas[renderer]) < 0.01f && !shouldBeTransparent)
            {
                originalAlphas.Remove(renderer);
            }
        }
    }

    float GetMaterialAlpha(Renderer renderer)
    {
        if (renderer != null && renderer.material != null && renderer.material.HasProperty("_Color"))
        {
            return renderer.material.color.a;
        }
        return 1f;
    }

    void SetMaterialAlpha(Renderer renderer, float alpha)
    {
        if (renderer != null && renderer.material != null && renderer.material.HasProperty("_Color"))
        {
            Color color = renderer.material.color;
            color.a = alpha;
            renderer.material.color = color;

            // 启用透明渲染
            if (alpha < 0.99f)
            {
                renderer.material.SetInt("_SrcBlend", (int)UnityEngine.Rendering.BlendMode.SrcAlpha);
                renderer.material.SetInt("_DstBlend", (int)UnityEngine.Rendering.BlendMode.OneMinusSrcAlpha);
                renderer.material.EnableKeyword("_ALPHABLEND_ON");
                renderer.material.renderQueue = 3000;
            }
            else
            {
                // 恢复不透明渲染
                renderer.material.SetInt("_SrcBlend", (int)UnityEngine.Rendering.BlendMode.One);
                renderer.material.SetInt("_DstBlend", (int)UnityEngine.Rendering.BlendMode.Zero);
                renderer.material.DisableKeyword("_ALPHABLEND_ON");
                renderer.material.renderQueue = -1;
            }
        }
    }

    void RestoreAllTransparency()
    {
        // 恢复所有材质的原始透明度
        foreach (var kvp in originalAlphas)
        {
            if (kvp.Key != null)
            {
                SetMaterialAlpha(kvp.Key, kvp.Value);
            }
        }

        originalAlphas.Clear();
        currentOccluders.Clear();
    }

    // ========== 公共接口方法 ==========

    /// <summary>
    /// 激活遮挡半透明功能
    /// </summary>
    public void Activate()
    {
        IsActive = true;
        Debug.Log("遮挡半透明功能已激活");
    }

    /// <summary>
    /// 禁用遮挡半透明功能（并恢复所有材质的透明度）
    /// </summary>
    public void Deactivate()
    {
        IsActive = false;
        Debug.Log("遮挡半透明功能已禁用");
    }

    /// <summary>
    /// 切换遮挡半透明功能的激活状态
    /// </summary>
    public void Toggle()
    {
        IsActive = !IsActive;
        Debug.Log($"遮挡半透明功能: {(IsActive ? "激活" : "禁用")}");
    }

    /// <summary>
    /// 强制立即更新一次遮挡检测
    /// </summary>
    public void ForceUpdate()
    {
        if (isActive)
        {
            CheckOcclusion();
            nextCheckTime = Time.time + checkInterval;
        }
    }

    /// <summary>
    /// 立即恢复所有材质的原始透明度（但不改变激活状态）
    /// </summary>
    public void RestoreAllImmediately()
    {
        RestoreAllTransparency();
        Debug.Log("已立即恢复所有材质的透明度");
    }

    /// <summary>
    /// 获取当前半透明的物体数量
    /// </summary>
    public int GetTransparentObjectCount()
    {
        return currentOccluders.Count;
    }

    /// <summary>
    /// 检查特定物体是否当前为半透明
    /// </summary>
    public bool IsObjectTransparent(GameObject obj)
    {
        Renderer renderer = obj.GetComponent<Renderer>();
        return renderer != null && currentOccluders.Contains(renderer);
    }

    /// <summary>
    /// 设置目标透明度（0-1之间）
    /// </summary>
    public void SetTargetAlpha(float alpha)
    {
        targetAlpha = Mathf.Clamp01(alpha);
    }

    /// <summary>
    /// 设置检测范围
    /// </summary>
    public void SetDetectionRange(float range)
    {
        detectionRange = Mathf.Max(0f, range);
    }

    // ========== 可视化调试 ==========

    void OnDrawGizmos()
    {
        if (showDebugRay && player != null && isActive)
        {
            // 绘制玩家前方的检测射线
            Gizmos.color = debugRayColor;
            Gizmos.DrawRay(player.position, player.forward * detectionRange);

            // 在摄像机位置显示状态图标
            Gizmos.color = isActive ? Color.green : Color.red;
            Gizmos.DrawWireSphere(transform.position + Vector3.up * 0.5f, 0.2f);
        }
    }

    // ========== 生命周期管理 ==========

    void OnDisable()
    {
        // 组件禁用时恢复所有透明度
        RestoreAllTransparency();
    }

    void OnDestroy()
    {
        RestoreAllTransparency();
    }

    // 在Inspector中显示调试按钮
    [ContextMenu("激活功能")]
    void ActivateEditor() => Activate();

    [ContextMenu("禁用功能")]
    void DeactivateEditor() => Deactivate();

    [ContextMenu("切换功能")]
    void ToggleEditor() => Toggle();

    [ContextMenu("强制更新")]
    void ForceUpdateEditor() => ForceUpdate();

    [ContextMenu("立即恢复透明度")]
    void RestoreTransparencyEditor() => RestoreAllImmediately();
}