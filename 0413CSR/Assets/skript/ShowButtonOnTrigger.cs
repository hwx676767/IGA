using UnityEngine;
using UnityEngine.UI;

public class ShowButtonOnTrigger : MonoBehaviour
{
    [SerializeField] private string playerTag = "Player";
    [SerializeField] private GameObject triggerButton; // 触发动画的按钮
    [SerializeField] private LightGrow lightTrigger; // Light的动画控制器

    private void Start()
    {
        // 初始隐藏按钮
        if (triggerButton != null)
        {
            triggerButton.SetActive(false);
        }
    }

    private void OnTriggerEnter(Collider other)
    {
        // 当Player进入触发器区域
        if (other.CompareTag(playerTag))
        {
            ShowButton();
        }
    }

    private void OnTriggerExit(Collider other)
    {
        // 当Player离开触发器区域
        if (other.CompareTag(playerTag))
        {
            HideButton();
        }
    }

    private void ShowButton()
    {
        if (triggerButton != null && !lightTrigger.IsAnimationTriggered)
        {
            triggerButton.SetActive(true);
        }
    }

    private void HideButton()
    {
        if (triggerButton != null)
        {
            triggerButton.SetActive(false);
        }
    }
}