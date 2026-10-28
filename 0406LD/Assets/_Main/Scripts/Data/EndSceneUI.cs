using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class EndSceneUI : MonoBehaviour
{
    public Text currentDepthText;
    public Text recordDepthText;

    void Start()
    {
        currentDepthText.text = $"Current Dive: {GameState.CurrentDepth}Level";
        recordDepthText.text = $"History Record:{GameState.MaxDepthRecorded}Level";
        
    }
    
    void Update()
    {
        // ESC键退出游戏
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            RestartGame();
        }
    }
    
    public void RestartGame()
    {
        SceneManager.LoadScene(0); 
    }
}