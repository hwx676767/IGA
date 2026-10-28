using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class SwitchScene : MonoBehaviour
{
    public static SwitchScene Instance { get; private set; } // 单例实例

    public Text timeText;
    
    float currentTime = Time.realtimeSinceStartup;
    float maxTime = 0f;

    void Awake()
    {
        // 实现单例模式
        if (Instance == null)
        {
            Instance = this;
            DontDestroyOnLoad(gameObject); // 确保对象在场景切换时不被销毁
        }
        else
        {
            Destroy(gameObject); // 销毁重复的实例
        }
    }

    void Start()
    {
    }

    void Update()
    {
        // 结算判断
        if (currentTime > maxTime)
        {
            maxTime = currentTime;
        }
        // 结算展示
        timeText.text = "最高纪录：" + maxTime.ToString("0.00");
    }

    public void ToGameScene()
    {
        SceneManager.LoadScene(1);
    }
}