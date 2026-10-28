using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using System.Collections; 

public class TimerManager : MonoBehaviour
{
    [Header("UI References")]
    [SerializeField] private Text timerText;          // 显示倒计时的Text组件
    [SerializeField] private GameObject timeUpPanel;  // 时间结束提示面板

    [Header("Timer Settings")]
    [SerializeField] private float initialTime = 300f; // 初始时间(秒) 300秒=5分钟
    private float currentTime;
    private bool isTimerRunning = false;

    private void Start()
    {
        InitializeTimer();
        StartTimer();
    }

    private void Update()
    {
        if (isTimerRunning)
        {
            UpdateTimer();
        }
    }

    // 初始化计时器
    public void InitializeTimer()
    {
        currentTime = initialTime;
        UpdateTimerDisplay();
        if (timeUpPanel != null) timeUpPanel.SetActive(false);
    }

    // 开始计时
    public void StartTimer()
    {
        isTimerRunning = true;
    }

    // 暂停计时
    public void PauseTimer()
    {
        isTimerRunning = false;
    }

    // 更新计时器
    private void UpdateTimer()
    {
        currentTime -= Time.deltaTime;
        
        // 时间结束
        if (currentTime <= 0f)
        {
            currentTime = 0f;
            TimerEnded();
        }
        
        UpdateTimerDisplay();
    }

    // 更新UI显示
    private void UpdateTimerDisplay()
    {
        // 计算分钟和秒数
        int minutes = Mathf.FloorToInt(currentTime / 60f);
        int seconds = Mathf.FloorToInt(currentTime % 60f);
        
        // 更新文本
        timerText.text = string.Format("{0:00}:{1:00}", minutes, seconds);
        
        // 最后10秒变红色
        if (currentTime <= 10f)
        {
            timerText.color = Color.red;
        }
    }

    // 时间结束处理
    private void TimerEnded()
    {
        isTimerRunning = false;
        
        // 显示结束面板
        if (timeUpPanel != null)
        {
            timeUpPanel.SetActive(true);
        }
        
        // 结束游戏
        EndGame();
    }

    // 结束游戏
    private void EndGame()
    {
        // 这里可以根据需求实现不同的结束方式
        // 示例1: 暂停游戏
        Time.timeScale = 0f;
        
        // 示例2: 重新加载场景
        // StartCoroutine(ReloadSceneAfterDelay(2f));
        
        // 示例3: 返回主菜单
        // SceneManager.LoadScene("MainMenu");
        
        Debug.Log("游戏时间结束!");
    }

    // 可选: 延迟后重新加载场景
    private IEnumerator ReloadSceneAfterDelay(float delay)
    {
        yield return new WaitForSecondsRealtime(delay);
        SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex);
    }

    // 增加时间(可选功能)
    public void AddTime(float secondsToAdd)
    {
        currentTime += secondsToAdd;
        // 确保不超过最大时间(可选)
        // currentTime = Mathf.Min(currentTime, initialTime);
    }
}