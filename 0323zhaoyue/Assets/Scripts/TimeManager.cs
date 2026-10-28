using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class TimeManager : MonoBehaviour
{
    [Header("UI References")]
    [SerializeField] private Text clockText;
    [SerializeField] private Text timerText;
    
    [Header("Timer Settings")]
    [SerializeField] private float initialCountdownMinutes = 3f; // 默认3分钟倒计时
    
    private bool isCountingDown = false;
    private float timerRemaining;
    private bool timerExpired = false;
    
    private float baseGameTimeMinutes; // 转换为分钟
    private float elapsedTime = 0f; // 已过去的时间（秒）

    void Start()
    {
        baseGameTimeMinutes = 8f* 60 - initialCountdownMinutes; 
        // 自动开始倒计时
        StartCountdown(initialCountdownMinutes);
    }

    void Update()
    {
        // 更新已过去的时间（无论是否在倒计时）
        elapsedTime += Time.deltaTime;
        
        // 更新时钟显示
        UpdateClock();
        
        if (isCountingDown)
        {
            UpdateTimer();
        }
    }

    private void UpdateClock()
    {
        // 计算当前游戏时间（基础时间 + 已过去时间）
        float totalMinutes = baseGameTimeMinutes + (elapsedTime / 60f);
        
        // 转换为小时和分钟
        int hours = Mathf.FloorToInt(totalMinutes / 60f);
        int minutes = Mathf.FloorToInt(totalMinutes % 60f);
        
        clockText.text = $"{hours}:{minutes:D2}";
    }

    public void StartCountdown(float minutes)
    {
        if (timerText == null)
        {
            Debug.LogError("Timer Text is not assigned!");
            return;
        }

        timerRemaining = minutes * 60f;
        isCountingDown = true;
        timerExpired = false;
        elapsedTime = 0f; // 重置已过去时间
        
        Color newColor;
        if (ColorUtility.TryParseHtmlString("#E18DB9", out newColor))
        {
            timerText.color = newColor;
        }
        timerText.gameObject.SetActive(true);
        
        Debug.Log($"Countdown started for {minutes} minutes");
    }

    private void UpdateTimer()
    {
        if (timerRemaining > 0)
        {
            timerRemaining -= Time.deltaTime;
            UpdateTimerDisplay(timerRemaining);
        }
        else if (!timerExpired)
        {
            timerExpired = true;
            isCountingDown = false; // 停止倒计时
            
            Color newColor;
            if (ColorUtility.TryParseHtmlString("#FF0029", out newColor))
            {
                timerText.color = newColor;
            }
            StartCoroutine(StartCountUp());
        }
    }

    private void UpdateTimerDisplay(float timeInSeconds)
    {
        int minutes = Mathf.FloorToInt(timeInSeconds / 60f);
        int seconds = Mathf.FloorToInt(timeInSeconds % 60f);
        timerText.text = $"{minutes}:{seconds:D2}";
    }

    private IEnumerator StartCountUp()
    {
        float elapsed = 0;
        while (true)
        {
            elapsed += Time.deltaTime;
            UpdateTimerDisplay(elapsed);
            yield return null;
        }
    }
}