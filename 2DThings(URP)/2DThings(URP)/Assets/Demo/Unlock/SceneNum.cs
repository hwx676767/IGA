using UnityEngine;
using UnityEngine.SceneManagement;

public class SceneNum : MonoBehaviour
{
    // Check if the current level unlocks a new level
    public void CheckLevelNum()
    {
        int unlockedLevelCount = PlayerPrefs.GetInt("unlockBtnInt", 1); // Default to 1
        int currentLevel = PlayerPrefs.GetInt("levelNum", 1); // Default to 1

        // Unlock the next level if the current level is higher than the unlocked count
        if (currentLevel > unlockedLevelCount)
        {
            PlayerPrefs.SetInt("unlockBtnInt", unlockedLevelCount + 1);
        }
    }

    // Return to the start scene (Scene 0)
    public void ReturnToStart()
    {
        SceneManager.LoadScene(0);
    }
}