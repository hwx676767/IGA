using UnityEngine;
using UnityEngine.SceneManagement;

/// <summary>
/// Handles navigation between the level-select UI and playable level scenes.
/// Attach this component to the Canvas in scenes that use its buttons.
/// </summary>
public class LevelSelectController : MonoBehaviour
{
    public void LoadScene(string sceneName)
    {
        if (string.IsNullOrWhiteSpace(sceneName))
        {
            Debug.LogWarning("No scene name was supplied to the level-select button.");
            return;
        }

        if (!Application.CanStreamedLevelBeLoaded(sceneName))
        {
            Debug.LogError($"Scene '{sceneName}' is not included in Build Settings.");
            return;
        }

        // Explicitly use Single so the previous screen is unloaded rather than left
        // alongside the scene the player just selected.
        SceneManager.LoadScene(sceneName, LoadSceneMode.Single);
    }
}
