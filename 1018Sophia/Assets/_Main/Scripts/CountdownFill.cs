using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Events;
#if TMP_PRESENT
using TMPro;
#endif

public class CountdownFill : MonoBehaviour
{
    [Header("倒计时设置")]
    public Image fillImage;          // 要控制的图片（Image类型要设置为 Filled）
    public float countdownTime = 5f; // 倒计时总时间（秒）

    private float timer;
    private bool isCounting = false;

    void Start()
    {
        StartCountdown();
    }

    void Update()
    {
        if (!isCounting || fillImage == null) return;

        timer -= Time.deltaTime;
        float fill = Mathf.Clamp01(timer / countdownTime);
        fillImage.fillAmount = fill;

        if (timer <= 0f)
        {
            isCounting = false;
            fillImage.fillAmount = 0f;
        }
    }

    public void StartCountdown()
    {
        timer = countdownTime;
        isCounting = true;
    }
}
