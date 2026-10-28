using UnityEngine;
using System.Collections;

public class InteractiveMove : MonoBehaviour
{
    [Header("Movement Settings")]
    public float moveSpeed = 3f; // 移动速度
    public string childObjectName = "Mode"; // 要移动的子对象名
    public string startPointName = "Start"; // 起点对象名
    public string endPointName = "End"; // 终点对象名

    [Header("Rotation Settings")]
    public float rotationSpeed = 90f; // 旋转速度（度/秒）
    public Vector3 targetRotationAngle = new Vector3(0, 45, 0); // 顺时针旋转的目标角度
    public Vector3 initialRotationAngle = new Vector3(0, -45, 0); // 初始旋转角度

    private Transform childObject; // 要移动的子对象
    private Transform startPoint;  // 起点位置
    private Transform endPoint;    // 终点位置
    private Quaternion initialRotation; // 初始旋转角度

    void Start()
    {
        // 查找子对象
        childObject = transform.Find(childObjectName);
        if (childObject == null)
        {
            Debug.LogError($"Child object with name '{childObjectName}' not found!");
            return;
        }

        // 查找起点和终点
        startPoint = transform.Find(startPointName);
        endPoint = transform.Find(endPointName);

        if (startPoint == null || endPoint == null)
        {
            Debug.LogError($"Start point '{startPointName}' or end point '{endPointName}' not found!");
            return;
        }

        // 初始化位置为起点位置
        childObject.position = startPoint.position;
        // 初始化旋转为指定初始角度
        childObject.rotation = Quaternion.Euler(initialRotationAngle);
        initialRotation = childObject.rotation;
    }

    /// <summary>
    /// 从当前位置移动到终点位置
    /// </summary>
    public void MoveToB()
    {
        if (childObject == null || startPoint == null || endPoint == null) return;
        StopAllCoroutines(); // 停止当前正在进行的协程
        StartCoroutine(MoveObject(childObject, childObject.position, endPoint.position));
    }

    /// <summary>
    /// 从当前位置移动回起点位置
    /// </summary>
    public void RestoreToA()
    {
        if (childObject == null || startPoint == null || endPoint == null) return;
        StopAllCoroutines(); // 停止当前正在进行的协程
        StartCoroutine(MoveObject(childObject, childObject.position, startPoint.position));
    }

    /// <summary>
    /// 旋转到目标角度 (0, 45, 0)
    /// </summary>
    public void RotateToB()
    {
        if (childObject == null) return;
        StopAllCoroutines(); // 停止当前正在进行的协程
        Quaternion targetRotation = Quaternion.Euler(targetRotationAngle);
        StartCoroutine(RotateObject(childObject, childObject.rotation, targetRotation));
    }

    /// <summary>
    /// 恢复到初始角度 (0, -45, 0)
    /// </summary>
    public void RestoreRotationToA()
    {
        if (childObject == null) return;
        StopAllCoroutines(); // 停止当前正在进行的协程
        StartCoroutine(RotateObject(childObject, childObject.rotation, initialRotation));
    }

    /// <summary>
    /// 将目标对象从一个位置平滑移动到另一个位置
    /// </summary>
    private IEnumerator MoveObject(Transform obj, Vector3 from, Vector3 to)
    {
        float elapsedTime = 0f;
        while (elapsedTime < 1f)
        {
            elapsedTime += Time.deltaTime * moveSpeed;
            obj.position = Vector3.Lerp(from, to, elapsedTime);
            yield return null;
        }
        obj.position = to; // 确保最终位置准确
    }

    /// <summary>
    /// 将目标对象从一个旋转角度平滑旋转到另一个角度
    /// </summary>
    private IEnumerator RotateObject(Transform obj, Quaternion from, Quaternion to)
    {
        float elapsedTime = 0f;
        float rotationDuration = Vector3.Angle(from.eulerAngles, to.eulerAngles) / rotationSpeed;
        while (elapsedTime < 1f)
        {
            elapsedTime += Time.deltaTime / rotationDuration;
            obj.rotation = Quaternion.Slerp(from, to, elapsedTime);
            yield return null;
        }
        obj.rotation = to; // 确保最终旋转角度准确
    }
}