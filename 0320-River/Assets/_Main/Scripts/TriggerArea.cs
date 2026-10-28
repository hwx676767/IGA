using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class TriggerArea : MonoBehaviour
{
    /// <summary>
    /// 单个定时触发事件
    /// </summary>
    [System.Serializable]
    public class TimedEvent
    {
        [Tooltip("延迟多少秒后触发（0表示立即触发）")]
        public float delay = 0f;

        [Tooltip("要调用的方法，支持拖拽多个方法")]
        public UnityEvent onTrigger = new UnityEvent();
    }

    [Header("触发事件列表")]
    [Tooltip("添加多个事件，每个可设置不同延迟时间")]
    [SerializeField]
    private List<TimedEvent> timedEvents = new List<TimedEvent>();

    [Header("触发设置")]
    [Tooltip("是否只触发一次（默认勾选，玩家重复进入也不会再次触发）")]
    public bool triggerOnlyOnce = true;

    // 内部标记：是否已经触发过
    private bool hasTriggered = false;

    /// <summary>
    /// 编辑器中自动设置Collider为Trigger
    /// </summary>
    private void Reset()
    {
        Collider col = GetComponent<Collider>();
        if (col == null)
        {
            col = gameObject.AddComponent<BoxCollider>();
        }
        col.isTrigger = true;
    }

    private void OnTriggerEnter(Collider other)
    {
        // 只检测玩家
        if (!other.CompareTag("Player"))
            return;

        // 如果设置了只触发一次，并且已经触发过，则不再执行
        if (triggerOnlyOnce && hasTriggered)
            return;

        TriggerAllEvents();

        // 标记为已触发
        hasTriggered = true;
    }

    /// <summary>
    /// 执行所有配置的事件（带延迟）
    /// </summary>
    private void TriggerAllEvents()
    {
        Debug.Log("调用！！！！！");
        foreach (TimedEvent te in timedEvents)
        {
            if (te.onTrigger == null) continue;

            if (te.delay <= 0.001f)  // 避免浮点误差
            {
                te.onTrigger.Invoke();
            }
            else
            {
                StartCoroutine(DelayedInvoke(te.delay, te.onTrigger));
            }
        }
    }

    /// <summary>
    /// 延迟调用
    /// </summary>
    private IEnumerator DelayedInvoke(float delay, UnityEvent unityEvent)
    {
        yield return new WaitForSeconds(delay);
        unityEvent.Invoke();
    }

    /// <summary>
    /// 可选：提供一个公开方法，允许外部脚本手动重置触发状态
    /// （比如某些剧情需要让区域可以再次触发）
    /// </summary>
    public void ResetTriggerState()
    {
        hasTriggered = false;
    }
}