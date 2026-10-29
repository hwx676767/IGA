using UnityEngine;

public class LightTrigger : MonoBehaviour
{
    private Animator animator;
    private bool isTriggered = false;

    public bool IsAnimationTriggered => isTriggered; // 外部访问触发状态

    void Start()
    {
        animator = GetComponent<Animator>();
    }

    // 外部调用：播放动画
    public void PlayGrowAnimation()
    {
        if (!isTriggered && animator != null)
        {
            isTriggered = true;
            animator.SetTrigger("Grow");
        }
    }
}