#if UNITY_EDITOR
using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

/// <summary>
/// Editor-only, persistent font migration. It writes Unity's built-in
/// LegacyRuntime font directly into every Legacy UGUI Text in Assets/Scenes.
/// It is never included in a player build and does no work at runtime.
/// </summary>
[InitializeOnLoad]
public static class LegacyRuntimeSceneFontConverter
{
    private const string MigrationKey = "MemoryStory.LegacyRuntimeFontMigrationV1";

    static LegacyRuntimeSceneFontConverter()
    {
        EditorApplication.delayCall += ConvertOnceAfterEditorLoads;
    }

    [MenuItem("Tools/Memory Story/Apply LegacyRuntime Font To All Scenes")]
    public static void ApplyToAllScenes()
    {
        var legacyRuntime = Resources.GetBuiltinResource<Font>("LegacyRuntime.ttf");
        var sceneGuids = AssetDatabase.FindAssets("t:Scene", new[] { "Assets/Scenes" });

        foreach (var sceneGuid in sceneGuids)
        {
            var scenePath = AssetDatabase.GUIDToAssetPath(sceneGuid);
            var scene = SceneManager.GetSceneByPath(scenePath);
            var closeWhenFinished = !scene.isLoaded;
            if (closeWhenFinished)
            {
                scene = EditorSceneManager.OpenScene(scenePath, OpenSceneMode.Additive);
            }
            var changed = false;

            foreach (var root in scene.GetRootGameObjects())
            {
                foreach (var text in root.GetComponentsInChildren<Text>(true))
                {
                    if (text.font == legacyRuntime) continue;
                    text.font = legacyRuntime;
                    EditorUtility.SetDirty(text);
                    changed = true;
                }
            }

            if (changed)
            {
                EditorSceneManager.MarkSceneDirty(scene);
                EditorSceneManager.SaveScene(scene);
            }

            if (closeWhenFinished)
            {
                EditorSceneManager.CloseScene(scene, true);
            }
        }

        AssetDatabase.SaveAssets();
        AssetDatabase.Refresh();
        Debug.Log("All scene Legacy Text components now reference LegacyRuntime.ttf.");
    }

    private static void ConvertOnceAfterEditorLoads()
    {
        if (SessionState.GetBool(MigrationKey, false)) return;

        ApplyToAllScenes();
        SessionState.SetBool(MigrationKey, true);
    }
}
#endif
