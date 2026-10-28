/*========================================================
 * UIAutoProgressBar.cs
 * 游戏开始时自动从起点移动到终点
 * 总时长：2分钟（120秒）
 *
 * 功能：
 * 1. 开始自动设定初始位置
 * 2. 自动移动到结束位置
 * 3. 可自定义总时长
 * 4. 使用UI Image移动
 *
 * 使用方法：
 * - 挂载脚本
 * - 设置 targetImage
 * - 设置 startPoint
 * - 设置 endPoint
 ========================================================*/
using UnityEngine;

public class UIProgressBarMover : MonoBehaviour
{
    [Header("Progress UI")]
    public RectTransform targetImage;

    [Header("Position Points")]
    public RectTransform startPoint;
    public RectTransform endPoint;

    [Header("Timer Settings")]
    public float totalDuration = 120f; // 默认2分钟

    private float timer = 0f;
    private bool isRunning = true;

    private void Start()
    {
        // 游戏开始直接设定初始位置
        if (targetImage != null && startPoint != null)
        {
            targetImage.anchoredPosition = startPoint.anchoredPosition;
        }

        timer = 0f;
        isRunning = true;
    }

    private void Update()
    {
        if (!isRunning || targetImage == null || startPoint == null || endPoint == null)
            return;

        timer += Time.deltaTime;

        float progress = Mathf.Clamp01(timer / totalDuration);

        // 从起点到终点插值移动
        targetImage.anchoredPosition = Vector2.Lerp(
            startPoint.anchoredPosition,
            endPoint.anchoredPosition,
            progress
        );

        // 到达终点停止
        if (progress >= 1f)
        {
            isRunning = false;
        }
    }

    /// <summary>
    /// 重置进度条
    /// </summary>
    public void ResetProgress()
    {
        timer = 0f;
        isRunning = true;

        if (targetImage != null && startPoint != null)
        {
            targetImage.anchoredPosition = startPoint.anchoredPosition;
        }
    }

    /// <summary>
    /// 暂停
    /// </summary>
    public void PauseProgress()
    {
        isRunning = false;
    }

    /// <summary>
    /// 继续
    /// </summary>
    public void ResumeProgress()
    {
        isRunning = true;
    }
}