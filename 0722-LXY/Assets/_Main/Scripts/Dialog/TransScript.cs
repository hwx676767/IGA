using System;
using System.Collections;
using UnityEngine;
using UnityEngine.UI;

public class TransScript : MonoBehaviour
{
    public GameObject objectToHide; // 指定要隐藏的GameObject
    public Text displayText; // 要激活并显示文字的Text组件

    private string[] paragraphs = new string[]
    {
        "公元前257年，强秦围攻赵国都城邯郸，意在吞并三晋，一统天下",
        "赵国危在旦夕，向盟国魏国求救。然而，你的兄长——魏安釐王——慑于秦国的兵威，虽派出大将晋鄙率十万大军驻扎边境，却下令按兵不动",
        "你知道，赵国若亡，唇亡齿寒，下一个就是魏国",
        "屡次劝谏无果后，你，信陵君无忌，已决心集结最后的力量，亲率三千门客，奔赴邯郸，与赵共存亡",
        "这无异于飞蛾扑火，但亦是绝境中唯一的豪赌",
        "就在你准备出发的前夜，一个意想不到的人，带来了扭转命运的契机……"
    };

    private int currentParagraphIndex = 0;
    private bool isFading = false;
    private bool canShowNext = false;

    private void Start()
    {
        displayText.gameObject.SetActive(false);
    }

    // 外部调用方法：启动脚本功能
    public void StartTransition()
    {
        if (objectToHide != null)
        {
            objectToHide.SetActive(false); // 隐藏指定object
        }

        if (displayText != null)
        {
            displayText.gameObject.SetActive(true); // 激活text
            ShowNextParagraph(); // 显示第一段文字
        }
    }

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.R) && canShowNext && !isFading)
        {
            ShowNextParagraph();
        }
    }

    private void ShowNextParagraph()
    {
        if (currentParagraphIndex >= paragraphs.Length)
        {
            // 所有段落显示完毕，可以添加结束逻辑
            return;
        }

        displayText.text = paragraphs[currentParagraphIndex];

        Color currentColor = displayText.color;
        currentColor.a = 75f / 255f;
        displayText.color = currentColor;

        StopAllCoroutines();
        StartCoroutine(FadeIn());
        currentParagraphIndex++;
    }

    private IEnumerator FadeIn()
    {
        isFading = true;
        canShowNext = false;

        float timer = 0f;
        float duration = 2f;
        float startAlpha = 75f / 255f;
        float endAlpha = 1f;

        while (timer < duration)
        {
            timer += Time.deltaTime;
            float alpha = Mathf.Lerp(startAlpha, endAlpha, timer / duration);
            Color newColor = displayText.color;
            newColor.a = alpha;
            displayText.color = newColor;
            yield return null;
        }

        Color finalColor = displayText.color;
        finalColor.a = endAlpha;
        displayText.color = finalColor;

        isFading = false;
        canShowNext = true;

        // 检查是否是最后一段文字结束
        if (currentParagraphIndex >= paragraphs.Length)
        {
            displayText.gameObject.SetActive(false); // 禁用text
        }
    }
}