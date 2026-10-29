using UnityEngine;

public class CharacterSwitchCamera : MonoBehaviour
{
    [Header("角色设置")]
    public Transform characterA;          // 角色A
    public Transform characterB;          // 角色B
    public KeyCode switchKey = KeyCode.Space; // 切换按键

    [Header("摄像机设置")]
    public float smoothSpeed = 5f;        // 摄像机移动平滑度
    public Vector3 cameraOffset = new Vector3(0, 0, -10f); // 摄像机偏移

    [Header("遮挡隐藏设置")]
    public CameraOcclusionHider occlusionHider; // 遮挡隐藏组件

    private Transform currentTarget;      // 当前跟随目标
    private bool hasSwitched = false;     // 是否已经切换过

    void Start()
    {
        // 初始化设置
        if (characterA == null || characterB == null)
        {
            Debug.LogError("请指定角色A和角色B！");
            enabled = false;
            return;
        }

        // 自动获取遮挡隐藏组件（如果未指定）
        if (occlusionHider == null)
        {
            occlusionHider = GetComponent<CameraOcclusionHider>();
            if (occlusionHider == null)
            {
                Debug.LogError("找不到CameraOcclusionHider组件！");
            }
        }

        // 初始状态：跟随角色A，禁用遮挡隐藏
        currentTarget = characterA;
        if (occlusionHider != null)
        {
            occlusionHider.IsActive = false;
        }

        // 立即移动到角色A位置
        transform.position = currentTarget.position + cameraOffset;
    }

    void Update()
    {
        // 检测切换按键（只能切换一次）
        if (!hasSwitched && Input.GetKeyDown(switchKey))
        {
            SwitchToCharacterB();
        }

        // 摄像机跟随
        if (currentTarget != null)
        {
            Vector3 targetPosition = currentTarget.position + cameraOffset;
            transform.position = Vector3.Lerp(transform.position, targetPosition, smoothSpeed * Time.deltaTime);
        }
    }

    /// <summary>
    /// 切换到角色B
    /// </summary>
    public void SwitchToCharacterB()
    {
        if (hasSwitched) return; // 防止重复切换

        currentTarget = characterB;
        hasSwitched = true;

        // 启用遮挡隐藏功能
        if (occlusionHider != null)
        {
            occlusionHider.IsActive = true;
            Debug.Log("切换到角色B，启用遮挡隐藏功能");
        }

        // 可以在这里添加切换特效、音效等
        OnCharacterSwitched?.Invoke();
    }

    /// <summary>
    /// 强制切换到指定角色（用于特殊情况）
    /// </summary>
    public void ForceSwitchTo(Transform targetCharacter, bool enableOcclusion = false)
    {
        currentTarget = targetCharacter;

        if (occlusionHider != null)
        {
            occlusionHider.IsActive = enableOcclusion;
        }

        Debug.Log($"强制切换到: {targetCharacter.name}, 遮挡隐藏: {enableOcclusion}");
    }

    /// <summary>
    /// 获取当前目标角色
    /// </summary>
    public Transform GetCurrentTarget()
    {
        return currentTarget;
    }

    /// <summary>
    /// 检查是否已经切换到角色B
    /// </summary>
    public bool HasSwitchedToB()
    {
        return hasSwitched;
    }

    // 事件：当角色切换时触发
    public System.Action OnCharacterSwitched;

    // 可视化调试
    void OnDrawGizmos()
    {
        if (characterA != null)
        {
            Gizmos.color = Color.blue;
            Gizmos.DrawWireSphere(characterA.position, 0.5f);
            Gizmos.DrawIcon(characterA.position + Vector3.up * 1f, "CharacterA", true);
        }

        if (characterB != null)
        {
            Gizmos.color = Color.red;
            Gizmos.DrawWireSphere(characterB.position, 0.5f);
            Gizmos.DrawIcon(characterB.position + Vector3.up * 1f, "CharacterB", true);
        }

        if (currentTarget != null)
        {
            Gizmos.color = Color.green;
            Gizmos.DrawLine(transform.position, currentTarget.position);
        }
    }

    // 编辑器调试按钮
    [ContextMenu("切换到角色B")]
    void SwitchToBEditor()
    {
        if (Application.isPlaying)
        {
            SwitchToCharacterB();
        }
        else
        {
            Debug.Log("请在运行模式下使用此功能");
        }
    }

}