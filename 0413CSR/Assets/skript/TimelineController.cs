using UnityEngine;
using UnityEngine.Playables;

public class TimelineController : MonoBehaviour
{
    [SerializeField] private PlayableDirector timeline;
    private bool timelineStarted = false;

    private void Start()
    {
        // 确保游戏开始时时间轴不会自动播放
        if (timeline != null)
        {
            timeline.Stop();
        }
    }

    private void Update()
    {
        // 检查是否按下F键且时间轴尚未启动
        if (Input.GetKeyDown(KeyCode.F) && !timelineStarted)
        {
            StartTimeline();
        }
    }

    private void StartTimeline()
    {
        timelineStarted = true;

        if (timeline != null)
        {
            timeline.Play();
            Debug.Log("时间轴已开始播放");
        }
        else
        {
            Debug.LogError("PlayableDirector组件未指定!");
        }
    }
}