using UnityEngine;

public class SimpleMovement : MonoBehaviour
{
    public float moveSpeed = 5f; // 控制移动速度

    void Update()
    {
        // 获取水平和垂直轴的输入
        float horizontal = Input.GetAxis("Horizontal"); // A和D键
        float vertical = Input.GetAxis("Vertical"); // W和S键

        // 计算移动方向
        Vector3 direction = new Vector3(horizontal, 0, vertical).normalized;

        // 使物体沿方向移动
        transform.Translate(direction * moveSpeed * Time.deltaTime, Space.World);
    }
}
