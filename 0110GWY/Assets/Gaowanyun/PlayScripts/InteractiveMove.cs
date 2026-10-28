using UnityEngine;

public class InteractiveMove : MonoBehaviour
{
    [Header("Movement Settings")]
    public float moveSpeed = 3f; // 移动速度
    public string childObjectName = "Mode"; // 子物体名称
    public string startPointName = "Start"; // 起始点子物体名称
    public string endPointName = "End"; // 目标点子物体名称

    private Transform childObject; // 子物体的 Transform
    private Transform startPoint; // 起始点 Transform
    private Transform endPoint; // 目标点 Transform

    void Start()
    {
        // 查找子物体中的 Cube
        childObject = transform.Find(childObjectName);

        if (childObject == null)
        {
            Debug.LogError($"Child object with name '{childObjectName}' not found!");
            return;
        }

        // 查找子物体中的起始点和目标点
        startPoint = transform.Find(startPointName);
        endPoint = transform.Find(endPointName);

        if (startPoint == null || endPoint == null)
        {
            Debug.LogError($"Start point '{startPointName}' or end point '{endPointName}' not found!");
        }
    }

    /// <summary>
    /// 从当前位置移动到目标位置
    /// </summary>
    public void MoveToB()
    {
        if (childObject == null || startPoint == null || endPoint == null) return;
        StopAllCoroutines(); // 停止当前正在运行的协程
        StartCoroutine(MoveObject(childObject, startPoint.position, endPoint.position));
    }

    /// <summary>
    /// 从目标位置返回到起始位置
    /// </summary>
    public void RestoreToA()
    {
        if (childObject == null || startPoint == null || endPoint == null) return;
        StopAllCoroutines(); // 停止当前正在运行的协程
        StartCoroutine(MoveObject(childObject, endPoint.position, startPoint.position));
    }

    /// <summary>
    /// 控制物体从一个位置平滑移动到另一个位置
    /// </summary>
    private System.Collections.IEnumerator MoveObject(Transform obj, Vector3 from, Vector3 to)
    {
        float elapsedTime = 0f;
        while (elapsedTime < 1f)
        {
            elapsedTime += Time.deltaTime * moveSpeed;
            obj.position = Vector3.Lerp(from, to, elapsedTime);
            yield return null;
        }
        obj.position = to; // 确保最终位置精准
    }
}
