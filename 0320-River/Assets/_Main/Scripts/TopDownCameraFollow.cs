using UnityEngine;

/// <summary>
/// 俯视角相机跟随（X轴实时 + Z轴死区触发移动）
/// 适用于：俯视动作游戏 / 节奏游戏 / 探索类
/// </summary>
public class TopDownCameraFollow : MonoBehaviour
{
    [Header("跟随目标")]
    [SerializeField]
    private Transform _target;

    [Header("相机偏移")]
    [SerializeField]
    private Vector3 _offset = new Vector3(0, 10, -5);

    [Header("相机角度")]
    [SerializeField]
    private bool _fixedAngle = true;

    [SerializeField]
    private Vector3 _rotationAngle = new Vector3(45, 0, 0);

    [Header("平滑设置")]
    [SerializeField]
    private bool _smoothFollow = true;

    [SerializeField]
    [Range(0.1f, 10f)]
    private float _smoothSpeed = 5f;

    [Header("Z轴死区控制 ⭐")]
    [SerializeField]
    private float _zDeadZone = 3f;     // 触发范围（视线范围）

    [SerializeField]
    private float _zMoveStep = 2f;     // 每次移动距离

    [Header("边界限制")]
    [SerializeField]
    private bool _useBoundaries = false;

    [SerializeField]
    private Vector2 _xBounds = new Vector2(-20, 20);

    [SerializeField]
    private Vector2 _zBounds = new Vector2(-20, 20);

    private Vector3 _velocity = Vector3.zero;

    void Start()
    {
        // 自动找玩家
        if (_target == null)
        {
            GameObject player = GameObject.FindGameObjectWithTag("Player");
            if (player != null)
                _target = player.transform;
        }

        if (_target != null)
        {
            // 初始化位置
            Vector3 startPos = _target.position + _offset;
            transform.position = startPos;

            if (_fixedAngle)
                transform.rotation = Quaternion.Euler(_rotationAngle);
        }
    }

    void LateUpdate()
    {
        if (_target == null) return;

        Vector3 currentPos = transform.position;
        Vector3 targetPos = _target.position + _offset;

        // ✅ X轴：始终跟随
        float newX = targetPos.x;

        // ✅ Y轴：固定高度（直接用offset）
        float newY = targetPos.y;

        // ✅ Z轴：死区触发移动
        float newZ = currentPos.z;

        float zDiff = targetPos.z - currentPos.z;

        if (Mathf.Abs(zDiff) > _zDeadZone)
        {
            // 分段推进（不会贴着玩家）
            newZ += Mathf.Sign(zDiff) * _zMoveStep;
        }

        Vector3 finalPos = new Vector3(newX, newY, newZ);

        // 边界限制
        if (_useBoundaries)
        {
            finalPos.x = Mathf.Clamp(finalPos.x, _xBounds.x, _xBounds.y);
            finalPos.z = Mathf.Clamp(finalPos.z, _zBounds.x, _zBounds.y);
        }

        // 平滑移动
        if (_smoothFollow)
        {
            transform.position = Vector3.SmoothDamp(
                transform.position,
                finalPos,
                ref _velocity,
                1f / _smoothSpeed
            );
        }
        else
        {
            transform.position = finalPos;
        }

        // 固定角度
        if (_fixedAngle)
        {
            transform.rotation = Quaternion.Euler(_rotationAngle);
        }
    }

    /// <summary>
    /// 设置目标
    /// </summary>
    public void SetTarget(Transform newTarget)
    {
        _target = newTarget;
    }

    /// <summary>
    /// 设置偏移
    /// </summary>
    public void SetOffset(Vector3 newOffset)
    {
        _offset = newOffset;
    }

    /// <summary>
    /// Scene 可视化
    /// </summary>
    private void OnDrawGizmosSelected()
    {
        if (_target == null) return;

        // 玩家位置
        Gizmos.color = Color.yellow;
        Gizmos.DrawWireSphere(_target.position, 0.5f);

        // 相机位置
        Vector3 camPos = Application.isPlaying ? transform.position : _target.position + _offset;
        Gizmos.color = Color.blue;
        Gizmos.DrawWireSphere(camPos, 0.3f);
        Gizmos.DrawLine(_target.position, camPos);

        // Z轴死区范围（前后）
        Gizmos.color = Color.red;
        Vector3 forward = new Vector3(0, 0, _zDeadZone);
        Gizmos.DrawLine(camPos - forward, camPos + forward);

        // 边界
        if (_useBoundaries)
        {
            Gizmos.color = Color.green;
            Vector3 center = new Vector3(
                (_xBounds.x + _xBounds.y) / 2f,
                0,
                (_zBounds.x + _zBounds.y) / 2f
            );

            Vector3 size = new Vector3(
                _xBounds.y - _xBounds.x,
                1,
                _zBounds.y - _zBounds.x
            );

            Gizmos.DrawWireCube(center, size);
        }
    }
}