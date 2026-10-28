using UnityEngine;
using System.Collections;

public class Click : MonoBehaviour
{
    public GameObject animatedObject;   // 拖入动画物体（Water 或 Penguin）
    public Animator animator;           // 拖入动画物体的 Animator
    public AnimationClip clip;          // 拖入动画文件
    
    [Header("播放后行为")]
    public bool hideAfterPlay = false;   // 播放后是否隐藏
    public bool stopAtLastFrame = true;  // 是否停在最后一帧
    
    void OnMouseDown()
    {
        // 显示物体
        animatedObject.SetActive(true);
        
        // 重置动画到开头
        animator.Rebind();
        
        // 播放动画
        animator.Play(0, 0, 0f);
        
        // 根据设置执行不同行为
        StartCoroutine(HandleAfterPlay());
    }
    
    IEnumerator HandleAfterPlay()
    {
        // 等待动画播完
        yield return new WaitForSeconds(clip.length);
        
        if (hideAfterPlay)
        {
            // 播放后隐藏
            animatedObject.SetActive(false);
        }
        else if (stopAtLastFrame)
        {
            // 停在最后一帧
            animator.speed = 0;
        }
    }
}