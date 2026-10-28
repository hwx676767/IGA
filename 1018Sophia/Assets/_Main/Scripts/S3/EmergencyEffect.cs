using System.Collections;
using UnityEngine;
using TMPro;

public class EmergencyEffect : MonoBehaviour
{
    public TextMeshProUGUI displayText; // UI文本
    public GameObject targetObject;     // 玩家按P隐藏的对象
    public float scaleDuration = 0.5f;  // 放大缩小持续时间
    public float pauseDuration = 0.5f;  // 放大缩小之间暂停时间
    public int flashCount = 3;          // 闪烁次数

    private Color redColor = new Color32(184, 0, 0, 255); // B80000
    private Color whiteColor = Color.white;

    private void Start()
    {
        targetObject.SetActive(false);
        StartCoroutine(ShowEmergencySequence());
    }

    private IEnumerator ShowEmergencySequence()
    {
        // 1. 放大缩小闪烁显示 "EMERGENCY EMERGENCY!"
        yield return StartCoroutine(ScaleAndFlashTextEffect("EMERGENCY EMERGENCY!", redColor));

        // 2. 放大缩小闪烁显示 "VESTIBULAR WARNING!"
        yield return StartCoroutine(ScaleAndFlashTextEffect("VESTIBULAR WARNING!", redColor));

        // 3. 显示普通文字 (白色)
        displayText.text = "Otoliths have detached. You need to place them back on the pedestal.";
        displayText.color = whiteColor;
        displayText.transform.localScale = Vector3.one;

        // 4. 显示目标对象，等待玩家按P
        targetObject.SetActive(true);
        yield return StartCoroutine(WaitForPlayerHide());
    }

    private IEnumerator ScaleAndFlashTextEffect(string message, Color color)
    {
        displayText.text = message;
        displayText.color = color;
        Vector3 originalScale = displayText.transform.localScale;
        Vector3 targetScale = originalScale * 1.5f;

        for (int i = 0; i < flashCount; i++)
        {
            // 放大
            float timer = 0f;
            while (timer < scaleDuration)
            {
                displayText.transform.localScale = Vector3.Lerp(originalScale, targetScale, timer / scaleDuration);
                timer += Time.deltaTime;
                yield return null;
            }

            // 缩小
            timer = 0f;
            while (timer < scaleDuration)
            {
                displayText.transform.localScale = Vector3.Lerp(targetScale, originalScale, timer / scaleDuration);
                timer += Time.deltaTime;
                yield return null;
            }
        }

        // 保持原始大小
        displayText.transform.localScale = originalScale;
    }

    private IEnumerator WaitForPlayerHide()
    {
        while (true)
        {
            if (Input.GetKeyDown(KeyCode.P))
            {
                gameObject.SetActive(false);
                break;
            }
            yield return null;
        }
    }
}
