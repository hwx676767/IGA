using UnityEngine;

[RequireComponent(typeof(Rigidbody2D))]
public class TopDownMovement : MonoBehaviour
{
    [Header("Movement Settings")]
    [SerializeField] private float moveSpeed = 5f; // 移动速度
    
    private Rigidbody2D rb;
    private Vector2 movementInput;
    
    private void Awake()
    {
        rb = GetComponent<Rigidbody2D>();
        rb.gravityScale = 0; // 禁用重力
        rb.freezeRotation = true; // 冻结旋转
    }
    
    private void Update()
    {
        // 获取输入
        movementInput.x = Input.GetAxisRaw("Horizontal");
        movementInput.y = Input.GetAxisRaw("Vertical");
        
        // 标准化输入向量，防止斜向移动速度更快
        movementInput = movementInput.normalized;
    }
    
    private void FixedUpdate()
    {
        // 应用移动
        rb.velocity = movementInput * moveSpeed;
    }
}