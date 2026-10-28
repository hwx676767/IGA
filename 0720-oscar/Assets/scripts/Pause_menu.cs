using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Pause_menu : MonoBehaviour
{
    bool gamePaused = false;
    [SerializeField] GameObject pauseMenu;
    // Start is called before the first frame update
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {
        //检测按到esc键
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            if (pauseMenu != null)
            {
                if (gamePaused) Resume();
                else
                {
                    Pause();
                }
            }
        }
    }
    //暂停
    public void Pause()
    {
        if(pauseMenu != null)
        {
            gamePaused = true;
            pauseMenu.SetActive(true);
            Time.timeScale = 0;
        }
    }
    //继续
    public void Resume()
    {
        gamePaused = false;
        pauseMenu.SetActive(false);
        Time.timeScale = 1;
    }
    //重新开始
    public void Restart()
    {
        gamePaused = false;
        SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex);
        Time.timeScale = 1;
    }
    //退出
    public void Exit()
    {
        gamePaused = false;
        SceneManager.LoadScene("Main Menu");
        Time.timeScale = 1;
    }
}
