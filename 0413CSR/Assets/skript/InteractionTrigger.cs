using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class InteractionTrigger : MonoBehaviour
{
    [SerializeField] private string playerTag = "Player";
    [SerializeField] private TextMeshProUGUI interactionText; // 交互提示文本
    [SerializeField] private LightTrigger lightTrigger; // 台灯动画控制器
    [SerializeField] private KeyCode interactionKey = KeyCode.F; // 交互按键

    private bool isPlayerInRange = false; // 玩家是否在触发范围内

    void Start()
    {
        // 确保初始隐藏文本
        if (interactionText != null)
        {
            interactionText.enabled = false;
        }
    }

    void Update()
    {
        // 当玩家在范围内且未触发动画时，检测按键
        if (isPlayerInRange && !lightTrigger.IsAnimationTriggered)
        {
            if (Input.GetKeyDown(interactionKey))
            {
                lightTrigger.PlayGrowAnimation();
                HideText(); // 触发后隐藏文本
            }
        }
    }

    void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag(playerTag) && !lightTrigger.IsAnimationTriggered)
        {
            isPlayerInRange = true;
            ShowText();
        }
    }

    void OnTriggerExit(Collider other)
    {
        if (other.CompareTag(playerTag))
        {
            isPlayerInRange = false;
            HideText();
        }
    }

    void ShowText()
    {
        if (interactionText != null)
        {
            interactionText.enabled = true;
        }
    }

    void HideText()
    {
        if (interactionText != null)
        {
            interactionText.enabled = false;
        }
    }
}