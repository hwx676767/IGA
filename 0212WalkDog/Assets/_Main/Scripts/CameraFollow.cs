using UnityEngine;

public class CameraFollow : MonoBehaviour
{
    public Transform dog;  // 玩家对象
    public Vector3 offset;  // 初始偏移量，设置在玩家后方
    public float smoothSpeed = 0.125f;  // 平滑跟随速度

    public float rotationSpeed = 5f;  // 旋转速度
    private float currentYaw = 0f;  // 当前偏航角度
    private float currentPitch = 10f;  // 当前俯仰角度（控制上下视角）
    
    private void Update()
    {
        // 获取鼠标的水平和垂直输入
        float mouseX = Input.GetAxis("Mouse X") * rotationSpeed;
        float mouseY = Input.GetAxis("Mouse Y") * rotationSpeed;

        // 更新当前偏航角度和俯仰角度
        currentYaw += mouseX;
        currentPitch -= mouseY;
        currentPitch = Mathf.Clamp(currentPitch, -30f, 50f);  // 限制上下旋转的范围

        // 旋转摄像机
        Quaternion rotation = Quaternion.Euler(currentPitch, currentYaw, 0);
        Vector3 desiredPosition = dog.position + rotation * offset;

        // 平滑跟随
        Vector3 smoothedPosition = Vector3.Lerp(transform.position, desiredPosition, smoothSpeed);
        transform.position = smoothedPosition;

        // 始终保持相机朝向玩家
        transform.LookAt(dog);
    }
}