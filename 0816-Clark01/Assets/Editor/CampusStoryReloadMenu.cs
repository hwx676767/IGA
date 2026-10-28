using UnityEditor;
using UnityEngine;

/// <summary>
/// Reloads StreamingAssets dialogue JSON without restarting the Editor play session setup.
/// </summary>
public static class CampusStoryReloadMenu
{
    [MenuItem("Tools/Campus Shop/Reload Dialogue JSON")]
    public static void Reload()
    {
        CampusStoryScript.Reload();
        Debug.Log("Dialogue JSON reloaded from StreamingAssets/Dialogue/campus_story.json");
    }
}
