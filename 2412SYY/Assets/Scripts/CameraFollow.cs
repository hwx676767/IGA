using UnityEngine;

public class CameraFollow : MonoBehaviour
{
    public Transform player; // 玩家对象的 Transform
    public float followSpeed = 5f; // 相机跟随速度

    // X 和 Z 轴的最小和最大位置
    public float minX = -10f;
    public float maxX = 10f;
    public float minZ = -10f;
    public float maxZ = 10f;

    public float offsetY = 5f; // 相机在 Y 轴上的偏移，保持相机固定高度

    void LateUpdate()
    {
        // 获取相机应该的位置（跟随玩家的 X 和 Z 轴）
        float targetX = Mathf.Clamp(player.position.x, minX, maxX);
        float targetZ = Mathf.Clamp(player.position.z, minZ, maxZ);

        // 计算新的相机位置
        Vector3 targetPosition = new Vector3(targetX, offsetY, targetZ);

        // 平滑过渡到目标位置
        transform.position = Vector3.Lerp(transform.position, targetPosition, followSpeed * Time.deltaTime);
    }
}
