using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class PlayerMoodState : MonoBehaviour
{
    public Slider moodSlider;                  // 显示心情值的Slider
    public float currentMood = 90f;            // 当前心情值，初始为90
    public float maxMood = 100f;               // 心情最大值
    public float minMood = 0f;                 // 心情最小值
    private bool isWaiting = false;            // 标记是否正在等待

    private void Start()
    {
        // 初始化Slider的范围和当前值
        moodSlider.maxValue = maxMood;
        moodSlider.minValue = minMood;
        moodSlider.value = currentMood;
    }

    private void Update()
    {
        // 更新UI显示心情值
        moodSlider.value = currentMood;
    }

    // 增加心情值
    public void IncreaseMood(float amount)
    {
        currentMood = Mathf.Min(currentMood + amount, maxMood);
        Debug.Log($"心情值增加 {amount}，当前心情值：{currentMood}");
    }

    // 减少心情值
    public void DecreaseMood(float amount)
    {
        if (!isWaiting)
        {
            currentMood = Mathf.Max(currentMood - amount, minMood);
            StartCoroutine(WaitAfterDecrease());
        }
    }

    private IEnumerator WaitAfterDecrease()
    {
        isWaiting = true;
        
        yield return new WaitForSeconds(1.5f);
        isWaiting = false;
    }
}