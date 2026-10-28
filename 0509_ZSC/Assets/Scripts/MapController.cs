using UnityEngine;

public class MapController : MonoBehaviour
{
    public float moveSpeed = 2f; // 地图移动速度（单位/秒）

    void Update()
    {
        transform.Translate(Vector3.left * moveSpeed * Time.deltaTime);
    }
}