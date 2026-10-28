#if UNITY_EDITOR
using UnityEditor;
using UnityEngine;

[CustomEditor(typeof(CluePanelBootstrap))]
public class CluePanelBootstrapEditor : Editor
{
    public override void OnInspectorGUI()
    {
        DrawDefaultInspector();

        EditorGUILayout.Space(10);
        EditorGUILayout.LabelField("Debug", EditorStyles.boldLabel);
        EditorGUILayout.HelpBox(
            "Play Mode: reveal every Object + Photo into CluePanel without exploring.",
            MessageType.None);

        var boot = (CluePanelBootstrap)target;
        using (new EditorGUI.DisabledScope(!Application.isPlaying))
        {
            GUI.backgroundColor = new Color(0.45f, 0.85f, 0.55f);
            if (GUILayout.Button("Reveal All Clues", GUILayout.Height(28)))
                boot.DebugRevealAll();
            GUI.backgroundColor = Color.white;
        }

        if (!Application.isPlaying)
            EditorGUILayout.HelpBox("Enter Play Mode to enable Reveal All.", MessageType.Info);
    }
}
#endif
