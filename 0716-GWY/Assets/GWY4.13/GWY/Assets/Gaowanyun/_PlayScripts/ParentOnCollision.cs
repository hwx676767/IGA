using UnityEngine;

[RequireComponent(typeof(Collider))]
public class ParentOnCollision : MonoBehaviour
{
    [Header("吸附设置")]
    [Tooltip("吸附时保持玩家相对位置")]
    public bool keepRelativePosition = true;
    
    [Tooltip("解除吸附时保持玩家世界坐标")]
    public bool keepWorldPositionOnExit = true;
    
    private Transform _playerTransform;

    private void Awake()
    {
        // 确保Collider是触发器
        GetComponent<Collider>().isTrigger = true;
    }

    private void OnTriggerEnter(Collider other)
    {
        if (!other.CompareTag("Player")) return;
        
        _playerTransform = other.transform;
        
        // 记录玩家当前的世界位置（相对于父物体）
        Vector3 worldPosition = _playerTransform.position;
        Quaternion worldRotation = _playerTransform.rotation;
        
        // 设置为子物体
        _playerTransform.SetParent(transform);
        
        if (keepRelativePosition)
        {
            // 转换为局部坐标以保持相对位置
            _playerTransform.localPosition = transform.InverseTransformPoint(worldPosition);
            _playerTransform.localRotation = Quaternion.Inverse(transform.rotation) * worldRotation;
        }
        
        Debug.Log($"玩家已吸附到 {gameObject.name}");
    }

    private void OnTriggerExit(Collider other)
    {
        if (!other.CompareTag("Player") || _playerTransform == null) return;
        
        // 记录解除吸附前的世界位置
        Vector3 exitPosition = _playerTransform.position;
        Quaternion exitRotation = _playerTransform.rotation;
        
        // 解除父子关系
        _playerTransform.SetParent(null);
        
        if (keepWorldPositionOnExit)
        {
            // 保持退出时的世界坐标
            _playerTransform.position = exitPosition;
            _playerTransform.rotation = exitRotation;
        }
        
        Debug.Log($"玩家已从 {gameObject.name} 解除吸附");
        _playerTransform = null;
    }

    private void OnDisable()
    {
        ReleasePlayer();
    }

    private void OnDestroy()
    {
        ReleasePlayer();
    }

    private void ReleasePlayer()
    {
        if (_playerTransform != null)
        {
            Vector3 exitPosition = _playerTransform.position;
            Quaternion exitRotation = _playerTransform.rotation;
            
            _playerTransform.SetParent(null);
            
            if (keepWorldPositionOnExit)
            {
                _playerTransform.position = exitPosition;
                _playerTransform.rotation = exitRotation;
            }
            
            _playerTransform = null;
        }
    }
}