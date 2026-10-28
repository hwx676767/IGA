#if UNITY_EDITOR
using UnityEditor;
using UnityEngine;

/// <summary>
/// 菜单：YFX Content → 在 Console 打印内容资源与 clueId 对照表，方便往场景里拖引用。
/// </summary>
public static class YfxContentMenu
{
    [MenuItem("YFX Content/Log Clue ID Cheat Sheet")]
    public static void LogCheatSheet()
    {
        Debug.Log("=== Items ===");
        foreach (var guid in AssetDatabase.FindAssets("t:ItemData", new[] { "Assets/_Main/Content/Items" }))
        {
            var path = AssetDatabase.GUIDToAssetPath(guid);
            var item = AssetDatabase.LoadAssetAtPath<ItemData>(path);
            if (item != null)
                Debug.Log($"[Item] {item.itemName} | clueId={item.clueId} | {path}");
        }

        Debug.Log("=== Testimony ===");
        foreach (var guid in AssetDatabase.FindAssets("t:TestimonyData", new[] { "Assets/_Main/Content/Testimony" }))
        {
            var path = AssetDatabase.GUIDToAssetPath(guid);
            var t = AssetDatabase.LoadAssetAtPath<TestimonyData>(path);
            if (t != null)
                Debug.Log($"[Testimony] {t.title} | clueId={t.clueId} | {path}");
        }

        Debug.Log("=== Inferences ===");
        foreach (var guid in AssetDatabase.FindAssets("t:InferenceRule", new[] { "Assets/_Main/Content/Inferences" }))
        {
            var path = AssetDatabase.GUIDToAssetPath(guid);
            var r = AssetDatabase.LoadAssetAtPath<InferenceRule>(path);
            if (r != null)
                Debug.Log($"[Inference] {r.title} | needs=[{string.Join(", ", r.requiredClueIds)}] | {path}");
        }
    }

    [MenuItem("YFX Content/Select Content Folder")]
    public static void SelectContentFolder()
    {
        var obj = AssetDatabase.LoadAssetAtPath<Object>("Assets/_Main/Content");
        if (obj != null)
        {
            Selection.activeObject = obj;
            EditorGUIUtility.PingObject(obj);
        }
        else
        {
            Debug.LogWarning("Assets/_Main/Content not found.");
        }
    }

    [MenuItem("YFX Content/Select MindMapBoard Object")]
    public static void SelectMindMapBoard()
    {
        // Include inactive — analyzePanel starts disabled
        var boards = Object.FindObjectsOfType<MindMapBoard>(true);
        if (boards == null || boards.Length == 0)
        {
            Debug.LogWarning("[YFX] No MindMapBoard in the open scene. Open GameDemo and look under analyzePanel.");
            return;
        }

        var board = boards[0];
        Selection.activeGameObject = board.gameObject;
        EditorGUIUtility.PingObject(board.gameObject);
        Debug.Log($"[YFX] Selected '{GetHierarchyPath(board.transform)}' (activeSelf={board.gameObject.activeSelf}, activeInHierarchy={board.gameObject.activeInHierarchy})", board);
    }

    private static string GetHierarchyPath(Transform t)
    {
        var path = t.name;
        while (t.parent != null)
        {
            t = t.parent;
            path = t.name + "/" + path;
        }
        return path;
    }
}
#endif
