using System;
using UnityEngine;
using UnityEngine.SceneManagement;

public class MainMenuManager : MonoBehaviour
{
    [Header("界面配置")]
    public GameObject mainPanel;
    public GameObject loadingPanel;
    public float minLoadingTime = 1f; // 最小加载显示时间
    
    [Header("游戏设置")]
    public int defaultBatteries = 3; // 初始电池数量

    private void Start()
    {
        loadingPanel.SetActive(false);
        ResetGameState(); // 进入主菜单时重置临时状态
    }

    void Update()
    {
        // ESC键退出游戏
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            QuitGame();
        }
    }
    
    private void ResetGameState()
    {
        GameState.CurrentDepth = 0;
        GameState.CurrentBatteries = defaultBatteries;
        // 可以添加其他需要重置的临时变量
    }

    /// <summary> 切换到游戏场景 </summary>
    public void StartGame()
    {
        mainPanel.SetActive(false);
        loadingPanel.SetActive(true);
        
        // 异步加载场景
        StartCoroutine(LoadGameSceneAsync());
    }

    System.Collections.IEnumerator LoadGameSceneAsync()
    {
        // 确保重置游戏状态
        ResetGameState();

        AsyncOperation asyncLoad = SceneManager.LoadSceneAsync(1);
        asyncLoad.allowSceneActivation = false;
        
        float timer = 0f;
        while (!asyncLoad.isDone || timer < minLoadingTime)
        {
            timer += Time.deltaTime;
            
            if (asyncLoad.progress >= 0.9f && timer >= minLoadingTime)
            {
                asyncLoad.allowSceneActivation = true;
            }
            yield return null;
        }
    }


    /// <summary> 退出游戏 </summary>
    public void QuitGame()
    {
#if UNITY_EDITOR
        UnityEditor.EditorApplication.isPlaying = false;
#else
        Application.Quit();
#endif
    }
}