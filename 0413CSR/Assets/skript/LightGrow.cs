using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LightGrow : MonoBehaviour
{
    [SerializeField] private string playerTag = "Player"; // 主角标签
    private Animator animator;
    private bool isTriggered = false; // 标记是否已触发

    public bool IsAnimationTriggered => isTriggered; // 外部访问触发状态

    void Start()
    {
        animator = GetComponent<Animator>(); // 获取动画控制器
    }

    void OnTriggerEnter(Collider other)
    {
        // 检测是否为主角触碰
        if (!isTriggered && other.CompareTag(playerTag))
        {
            isTriggered = true; // 标记为已触发
            PlayGrowAnimation();
        }
    }

    // 播放变大动画
    private void PlayGrowAnimation()
    {


        if (animator != null)
        {
            animator.SetTrigger("Grow"); // 触发动画
        }



    }
}

