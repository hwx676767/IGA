using UnityEngine;

public class CameraFollow : MonoBehaviour
{
    public Transform player; // 玩家的Transform
    public Vector3 offset; // 相机与玩家的偏移量
    public float followThreshold = 2.0f; // 跟随的阈值，超过这个范围相机才会移动

    private Vector3 initialPosition; // 相机的初始位置

    void Start()
    {
        // 记录相机的初始位置
        initialPosition = transform.position;
    }

    void LateUpdate()
    {
        // 计算玩家在XZ平面上的位置
        Vector3 playerPositionXZ = new Vector3(player.position.x, 0, player.position.z);
        Vector3 cameraPositionXZ = new Vector3(transform.position.x, 0, transform.position.z);

        // 计算玩家与相机在XZ平面上的距离
        float distance = Vector3.Distance(playerPositionXZ, cameraPositionXZ);

        // 如果距离超过阈值，则移动相机
        if (distance > followThreshold)
        {
            // 计算新的相机位置，只改变X和Z轴
            Vector3 newPosition = new Vector3(player.position.x + offset.x, initialPosition.y, player.position.z + offset.z);
            transform.position = newPosition;
        }
    }
}