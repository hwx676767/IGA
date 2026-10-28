using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class PopEffectManager : MonoBehaviour
{
    [Header("物体列表")]
    [Tooltip("按顺序弹出的物体（需要带有 PopEffect 组件）")]
    public List<GameObject> objectsToPop = new List<GameObject>();
    
    [Header("时间设置")]
    [Tooltip("每个物体弹出的间隔时间（秒）")]
    public float interval = 0.2f;
    
    [Tooltip("开始前的延迟时间（秒）")]
    public float startDelay = 0f;
    
    [Header("播放设置")]
    [Tooltip("场景启动时自动播放")]
    public bool playOnStart = true;
    
    private void Start()
    {
        // 确保所有物体初始都是未激活状态
        foreach (GameObject obj in objectsToPop)
        {
            if (obj != null && obj.activeSelf)
            {
                // 如果物体是激活的，先设为未激活
                obj.SetActive(false);
            }
        }
        
        if (playOnStart)
        {
            StartPopSequence();
        }
    }
    
    [ContextMenu("开始弹出序列")]
    public void StartPopSequence()
    {
        StopAllCoroutines();
        StartCoroutine(PopSequence());
    }
    
    IEnumerator PopSequence()
    {
        // 开始延迟
        if (startDelay > 0)
            yield return new WaitForSeconds(startDelay);
        
        // 依次弹出每个物体
        for (int i = 0; i < objectsToPop.Count; i++)
        {
            GameObject obj = objectsToPop[i];
            
            if (obj != null)
            {
                Debug.Log($"激活物体: {obj.name}");
                
                // 激活物体
                obj.SetActive(true);
                
                // 等待一帧，确保物体完全激活
                yield return null;
                
                // 获取 PopEffect 组件并播放
                PopEffect pop = obj.GetComponent<PopEffect>();
                if (pop != null)
                {
                    pop.Pop();
                }
                else
                {
                    Debug.LogWarning($"物体 {obj.name} 没有 PopEffect 组件！");
                }
                
                // 等待间隔
                if (i < objectsToPop.Count - 1) // 最后一个物体不需要等待
                {
                    yield return new WaitForSeconds(interval);
                }
            }
        }
        
        Debug.Log("所有物体弹出完成");
    }
    
    [ContextMenu("重置并重新播放")]
    public void ResetAndReplay()
    {
        StopAllCoroutines();
        
        // 重置并隐藏所有物体
        foreach (GameObject obj in objectsToPop)
        {
            if (obj != null)
            {
                PopEffect pop = obj.GetComponent<PopEffect>();
                if (pop != null)
                {
                    pop.ResetAndPlay();
                }
                
                // 重新隐藏物体
                if (obj.activeSelf)
                {
                    obj.SetActive(false);
                }
            }
        }
        
        StartPopSequence();
    }
}