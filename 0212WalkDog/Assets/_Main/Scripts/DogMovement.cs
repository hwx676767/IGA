using UnityEngine;

public class DogMovement : MonoBehaviour
{
    public float moveSpeed = 5f;  // 移动速度
    public float rotateSpeed = 700f;  // 旋转速度

    private Rigidbody rb; 
    private Vector3 movementDirection;  // 当前移动方向

    private void Awake()
    {
        rb = GetComponent<Rigidbody>(); 
    }

    private void Update()
    {
        // 获取 WASD 输入
        float moveVertical = Input.GetAxis("Vertical");  // W 和 S 控制前后
        float moveHorizontal = Input.GetAxis("Horizontal");  // A 和 D 控制左右旋转

        // 计算移动方向
        movementDirection = transform.forward * moveVertical;

        // 控制玩家旋转，A 和 D 控制旋转
        if (moveHorizontal != 0)
        {
            float targetAngle = transform.eulerAngles.y + moveHorizontal * rotateSpeed * Time.deltaTime;
            Quaternion targetRotation = Quaternion.Euler(0, targetAngle, 0);
            transform.rotation = Quaternion.RotateTowards(transform.rotation, targetRotation, rotateSpeed * Time.deltaTime);
        }
    }

    private void FixedUpdate()
    {
        // 根据计算的方向移动
        rb.MovePosition(rb.position + movementDirection * moveSpeed * Time.fixedDeltaTime);
    }
}