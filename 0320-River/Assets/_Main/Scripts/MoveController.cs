using UnityEngine;

/// <summary>
/// 3D场景WASD四向移动脚本（不自动转向）
/// </summary>
public class MoveController : MonoBehaviour
{
    [Header("move setting")]
    [SerializeField]
    [Range(1, 20)]
    private float _maxSpeed = 5f;           // 最大移动速度
    
    [SerializeField]
    [Range(0.1f, 5f)]
    private float _acceleration = 2f;        // 加速度
    
    [SerializeField]
    [Range(0.1f, 5f)]
    private float _deceleration = 3f;        // 减速度
    
    [SerializeField]
    [Range(0, 1)]
    private float _smoothness = 0.5f;        // 移动平滑度
    
    [SerializeField]
    private bool _useCameraDirection = true;  // 是否基于摄像机方向移动
    
    [SerializeField]
    private bool _moveOnXZ = true;            // 是否在XZ平面移动（忽略Y轴）
    
    [Header("camera")]
    [SerializeField]
    private Transform _camera;                 // 摄像机（用于基于摄像机方向的移动）
    
    // 私有变量
    private Vector3 _currentVelocity;
    private Vector3 _targetVelocity;
    private Vector3 _smoothVelocity;
    private Rigidbody _rigidbody;
    
    void Start()
    {
        _rigidbody = GetComponent<Rigidbody>();
        
        // 如果没有指定摄像机，尝试找主摄像机
        if (_camera == null && Camera.main != null)
            _camera = Camera.main.transform;
    }
    
    void Update()
    {
        // 如果不使用物理系统，在Update中处理移动
        if (_rigidbody == null || !_rigidbody.isKinematic)
        {
            HandleInput();
            ApplyMovement();
        }
    }
    
    void FixedUpdate()
    {
        // 如果使用物理系统，在FixedUpdate中处理移动
        if (_rigidbody != null && !_rigidbody.isKinematic)
        {
            HandleInput();
            ApplyPhysicsMovement();
        }
    }
    
    /// <summary>
    /// 处理键盘输入
    /// </summary>
    private void HandleInput()
    {
        // 获取输入（范围 -1 到 1）
        float horizontal = - Input.GetAxisRaw("Horizontal"); // A/D
        float vertical = - Input.GetAxisRaw("Vertical");     // W/S
        
        // 计算移动方向
        Vector3 moveDirection = GetMoveDirection(horizontal, vertical);
        
        // 如果有输入
        if (moveDirection.magnitude > 0.1f)
        {
            // 计算目标速度
            _targetVelocity = moveDirection.normalized * _maxSpeed;
        }
        else
        {
            _targetVelocity = Vector3.zero;
        }
    }
    
    /// <summary>
    /// 获取移动方向
    /// </summary>
    private Vector3 GetMoveDirection(float horizontal, float vertical)
    {
        Vector3 direction = Vector3.zero;
        
        if (_useCameraDirection && _camera != null)
        {
            Vector3 cameraForward = _camera.forward;
            Vector3 cameraRight = _camera.right;
            
            cameraForward.y = 0;
            cameraRight.y = 0;
            
            cameraForward.Normalize();
            cameraRight.Normalize();
            
            direction = cameraForward * vertical + cameraRight * horizontal;
        }
        else
        {
            direction = new Vector3(horizontal, 0, vertical);
        }
        
        if (_moveOnXZ)
        {
            direction.y = 0;
        }
        
        return direction;
    }
    
    /// <summary>
    /// 应用平滑移动（Transform方式）
    /// </summary>
    private void ApplyMovement()
    {
        // 计算平滑时间
        float smoothTime = _targetVelocity.magnitude > 0 ? 
            1f / (_acceleration * 5f) * (1 - _smoothness * 0.8f) :  
            1f / (_deceleration * 5f) * (1 - _smoothness * 0.8f);
        
        smoothTime = Mathf.Clamp(smoothTime, 0.01f, 0.5f);
        
        // 平滑速度变化
        _currentVelocity = Vector3.SmoothDamp(
            _currentVelocity, 
            _targetVelocity, 
            ref _smoothVelocity, 
            smoothTime
        );
        
        // 应用移动
        transform.position += _currentVelocity * Time.deltaTime;
    }
    
    /// <summary>
    /// 应用平滑移动（物理方式）
    /// </summary>
    private void ApplyPhysicsMovement()
    {
        if (_rigidbody == null) return;
        
        // 计算平滑时间
        float smoothTime = _targetVelocity.magnitude > 0 ? 
            1f / (_acceleration * 5f) * (1 - _smoothness * 0.8f) :  
            1f / (_deceleration * 5f) * (1 - _smoothness * 0.8f);
        
        smoothTime = Mathf.Clamp(smoothTime, 0.01f, 0.5f);
        
        // 平滑速度变化
        _currentVelocity = Vector3.SmoothDamp(
            _currentVelocity, 
            _targetVelocity, 
            ref _smoothVelocity, 
            smoothTime
        );
        
        // 应用物理移动
        Vector3 newPosition = _rigidbody.position + _currentVelocity * Time.fixedDeltaTime;
        _rigidbody.MovePosition(newPosition);
    }
    
    // 获取当前速度（供其他脚本使用）
    public Vector3 GetCurrentVelocity()
    {
        return _currentVelocity;
    }
    
    // 获取移动方向（归一化）
    public Vector3 GetMoveDirection()
    {
        return _currentVelocity.normalized;
    }
    
    // 是否正在移动
    public bool IsMoving()
    {
        return _currentVelocity.magnitude > 0.1f;
    }
}