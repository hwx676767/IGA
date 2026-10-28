using UnityEngine;
using UnityEngine.SceneManagement;

public class SceneNum : MonoBehaviour
{
    // 检查当前关卡是否解锁新关卡
    public void CheckLevelNum()
    {
        int unlockedLevelCount = PlayerPrefs.GetInt("unlockBtnInt", 1);
        int currentLevel = PlayerPrefs.GetInt("levelNum", 1);

        if (currentLevel > unlockedLevelCount)
        {
            PlayerPrefs.SetInt("unlockBtnInt", unlockedLevelCount + 1);
        }
    }
    
    // 失败再来一次：重新加载当前关卡
    public void RestartGame()
    {
        // 恢复时间缩放
        Time.timeScale = 1;
        int currentLevel = PlayerPrefs.GetInt("levelNum", 1);
        Debug.Log($"重新加载关卡 {currentLevel}");
        SceneManager.LoadScene(currentLevel);
    }

    // 失败返回：返回主菜单（Scene 0）
    public void ReturnToStart()
    {
        // 恢复时间缩放
        Time.timeScale = 1;
        Debug.Log("返回主菜单");
        SceneManager.LoadScene(0);
    }

    // 胜利返回：检查解锁并返回主菜单（Scene 0）
    public void WinReturn()
    {
        CheckLevelNum();
        // 恢复时间缩放
        Time.timeScale = 1;
        Debug.Log("胜利返回主菜单");
        SceneManager.LoadScene(0);
    }

    // 胜利下一关：加载下一关卡
    public void WinNextLevel()
    {
        CheckLevelNum();
        // 获取当前关卡编号
        int currentLevel = PlayerPrefs.GetInt("levelNum", 1);
        int nextLevel = currentLevel + 1;
        // 假设关卡数量有限，检查是否超出最大关卡
        int maxLevels = SceneManager.sceneCountInBuildSettings - 1; // 减去主菜单（Scene 0）
        if (nextLevel <= maxLevels)
        {
            // 恢复时间缩放
            Time.timeScale = 1;
            Debug.Log($"加载下一关：关卡 {nextLevel}");
            PlayerPrefs.SetInt("levelNum", nextLevel); // 更新当前关卡编号
            SceneManager.LoadScene(nextLevel);
        }
        else
        {
            // 如果没有下一关，返回主菜单
            Debug.Log("已通关所有关卡，返回主菜单");
            WinReturn();
        }
    }
    
    // 重置游戏关卡：只有第一关激活
    [ContextMenu("Reset To First Level")]
    public void ResetToFirstLevel()
    {
        PlayerPrefs.SetInt("unlockBtnInt", 1);
        PlayerPrefs.SetInt("levelNum", 1);
        Debug.Log("游戏关卡已重置：只有第一关激活，当前关卡为 1");
    }
}