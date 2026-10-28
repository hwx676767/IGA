using TMPro;
using UnityEngine;

public class TimeSystem : MonoBehaviour
{
    [Header("时间设置")]
    [Range(0, 23)]
    public int startHour = 12;      // 起始小时 (0-23)
    [Range(0, 59)]
    public int startMinute = 0;     // 起始分钟 (0-59)
    
    [Header("流速设置")]
    [Tooltip("现实1秒 = 游戏内X分钟")]
    public float realSecondToGameMinutes = 24f;  // 1秒 = 24分钟
    
    [Header("UI组件(可选)")]
    public TMP_Text timeText;
    
    // 存储当前时间（整数分钟，0-1439）
    private int currentTotalMinutes;
    
    // 累加器（用于计算何时增加1分钟）
    private float accumulator = 0f;
    
    void Start()
    {
        // 初始化时间
        currentTotalMinutes = startHour * 60 + startMinute;
        UpdateTimeDisplay();
    }
    
    void Update()
    {
        // 计算每帧需要增加的分钟数（可能是小数）
        float minutesDelta = Time.deltaTime * realSecondToGameMinutes;
        
        // 累加分钟增量
        accumulator += minutesDelta;
        
        // 当累加器达到1分钟时，实际增加1分钟
        if (accumulator >= 1f)
        {
            int addMinutes = Mathf.FloorToInt(accumulator); // 获取整数分钟数
            currentTotalMinutes += addMinutes;
            accumulator -= addMinutes; // 保留剩余的小数部分
            
            // 处理一天循环
            if (currentTotalMinutes >= 1440)
            {
                currentTotalMinutes -= 1440;
            }
            
            // 更新UI显示
            UpdateTimeDisplay();
        }
    }
    
    void UpdateTimeDisplay()
    {
        // 计算小时和分钟
        int hour = currentTotalMinutes / 60;
        int minute = currentTotalMinutes % 60;
        
        // 格式化显示
        string timeString = string.Format("{0:00}:{1:00}", hour, minute);
        
        if (timeText != null)
            timeText.text = timeString;
        
        // 可选：调试输出
        // Debug.Log(timeString);
    }
    
    // 获取当前时间字符串
    public string GetCurrentTimeString()
    {
        int hour = currentTotalMinutes / 60;
        int minute = currentTotalMinutes % 60;
        return string.Format("{0:00}:{1:00}", hour, minute);
    }
    
    // 获取当前时间（输出参数）
    public void GetCurrentTime(out int hour, out int minute)
    {
        hour = currentTotalMinutes / 60;
        minute = currentTotalMinutes % 60;
    }
    
    // 设置时间流速
    public void SetTimeScale(float newGameMinutesPerRealSecond)
    {
        realSecondToGameMinutes = newGameMinutesPerRealSecond;
    }
    
    // 手动设置时间
    public void SetTime(int hour, int minute)
    {
        currentTotalMinutes = Mathf.Clamp(hour, 0, 23) * 60 + Mathf.Clamp(minute, 0, 59);
        UpdateTimeDisplay();
    }
}