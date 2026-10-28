using UnityEngine;

public class TopDownCameraFollow : MonoBehaviour
{
    [Header("相机设置")]
    [SerializeField] private Transform target;     // 拖入你的 Player
    [SerializeField] private float height = 14f;   // 相机高度
    [SerializeField] private float distance = 9f;  // 水平距离
    [SerializeField] private float angle = 55f;    // 俯视角度

    private Vector3 offset;

    void Start()
    {
        if (target == null)
        {
            target = GameObject.FindWithTag("Player")?.transform;
            if (target == null)
                Debug.LogError("请把 Player 拖到 Target 字段！");
        }

        CalculateOffset();
    }

    // 根据高度、距离、角度计算偏移
    private void CalculateOffset()
    {
        float rad = angle * Mathf.Deg2Rad;
        offset = new Vector3(0, height, -distance);
    }

    void LateUpdate()
    {
        if (target == null) return;

        // 硬跟随：直接设置位置（无任何插值）
        transform.position = target.position + offset;

        // 始终看向玩家（稍微抬高一点，更自然）
        transform.LookAt(target.position + Vector3.up * 1.2f);
    }

    // 在Inspector修改参数时实时更新
    private void OnValidate()
    {
        CalculateOffset();
    }
}