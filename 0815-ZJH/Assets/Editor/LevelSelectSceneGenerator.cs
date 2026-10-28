#if UNITY_EDITOR
using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine;

/// <summary>
/// Safe entry point for the already-created level-select template.
/// It deliberately does not regenerate existing scenes, so a click in the Tools
/// menu can no longer overwrite scene-specific work such as Level 1's diary.
/// </summary>
public static class LevelSelectSceneGenerator
{
    private const string LevelSelectPath = "Assets/Scenes/LevelSelect.unity";

    [MenuItem("Tools/Level Select/Open Existing Template")]
    public static void OpenExistingTemplate()
    {
        if (AssetDatabase.LoadAssetAtPath<SceneAsset>(LevelSelectPath) == null)
        {
            Debug.LogError("The Level Select scene is missing: " + LevelSelectPath);
            return;
        }

        EditorSceneManager.OpenScene(LevelSelectPath, OpenSceneMode.Single);
    }
}
#endif
