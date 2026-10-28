using UnityEngine;

public class CableCarSpin : MonoBehaviour
{
    private bool isCompleted = false;
    private Animator animator;

    private void Start()
    {
        animator = GetComponent<Animator>();
        
        // 确保一开始不播放任何动画
        if (animator != null)
        {
            animator.enabled = false;  // 先禁用动画组件
        }
    }

    private void OnMouseDown()
    {
        if (isCompleted) return;

        if (GameManager.Instance.GetCurrentStep() == 0)
        {
            // 播放动画
            if (animator != null)
            {
                animator.enabled = true;  // 启用
                animator.Play("CableCarSpin", 0, 0f);
            }
            isCompleted = true;
            GameManager.Instance.CompleteStep(0);
        }
    }
}