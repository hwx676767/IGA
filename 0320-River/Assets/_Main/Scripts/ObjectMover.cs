using UnityEngine;
using System.Collections;

public class ObjectMover : MonoBehaviour
{
    [Header("move setting")]
    [SerializeField] private float raiseOffset = 1f;  // Y轴移动偏移量
    [SerializeField] private float moveOffset = 1f;   // X轴移动偏移量
    [SerializeField] private float moveDuration = 0.5f; // 移动持续时间
    
    [Header("移动方向预设（可选）")]
    public bool isPositiveRaise = true;  // true=向上，false=向下
    public bool isPositiveMove = true;   // true=向右，false=向左
    
    /// <summary>
    /// 供外部事件调用的无参方法
    /// 使用Inspector中配置的偏移量进行移动
    /// </summary>
    public void RaiseMove()
    {
        float finalRaise = isPositiveRaise ? raiseOffset : -raiseOffset;
        float finalMove = isPositiveMove ? moveOffset : -moveOffset;
        
        Vector3 targetPosition = transform.position + new Vector3(finalMove, finalRaise, 0f);
        
        StopAllCoroutines();
        
        StartCoroutine(SmoothMove(targetPosition));
    }
    
    /// <summary>
    /// 可选的带参数方法（供代码调用）
    /// </summary>
    public void RaiseMove(float customRaise, float customMove)
    {
        Vector3 targetPosition = transform.position + new Vector3(customMove, customRaise, 0f);
        StopAllCoroutines();
        StartCoroutine(SmoothMove(targetPosition));
    }
    
    private IEnumerator SmoothMove(Vector3 targetPosition)
    {
        Vector3 startPosition = transform.position;
        float elapsedTime = 0f;
        
        while (elapsedTime < moveDuration)
        {
            float t = elapsedTime / moveDuration;
            transform.position = Vector3.Lerp(startPosition, targetPosition, t);
            elapsedTime += Time.deltaTime;
            yield return null;
        }
        
        transform.position = targetPosition;
    }
}