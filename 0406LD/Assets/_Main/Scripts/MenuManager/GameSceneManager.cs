using System;
using UnityEngine;
using UnityEngine.SceneManagement;

public class GameSceneManager : MonoBehaviour
{
    [Header("暂停菜单")]
    public GameObject pauseMenu;
    private bool isPaused = false;

    private void Start()
    {
        pauseMenu.SetActive(false);
    }

    void Update()
    {
        // R键暂停/继续
        if (Input.GetKeyDown(KeyCode.R))
        {
            TogglePause();
        }

        // ESC键返回主菜单
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            ReturnToMainMenu();
        }
    }

    /// <summary> 切换暂停状态 </summary>
    public void TogglePause()
    {
        isPaused = !isPaused;
        
        pauseMenu.SetActive(isPaused);
        Time.timeScale = isPaused ? 0f : 1f;
        
        // 可选：锁定/解锁鼠标
        Cursor.lockState = isPaused ? CursorLockMode.None : CursorLockMode.Locked;
    }

    /// <summary> 返回主菜单 </summary>
    public void ReturnToMainMenu()
    {
        Time.timeScale = 1f; // 确保恢复时间流速
        SceneManager.LoadScene(0);
    }

    /// <summary> 重新开始游戏 </summary>
    public void RestartGame()
    {
        Time.timeScale = 1f;
        SceneManager.LoadScene(SceneManager.GetActiveScene().name);
    }
}