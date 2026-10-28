#if UNITY_EDITOR
using UnityEditor;
using UnityEngine;

[CustomEditor(typeof(MindMapBoard))]
public class MindMapBoardEditor : Editor
{
    public override void OnInspectorGUI()
    {
        DrawDefaultInspector();

        EditorGUILayout.Space(12);
        EditorGUILayout.LabelField("Debug — Linked Mind Map", EditorStyles.boldLabel);
        EditorGUILayout.HelpBox(
            "Play Mode only.\n" +
            "Generate: spawn all rule clues, auto-chain links, unlock left cards.\n" +
            "Reset: clear nodes, lines, unlock cards, and progress.",
            MessageType.None);

        var board = (MindMapBoard)target;

        using (new EditorGUI.DisabledScope(!Application.isPlaying))
        {
            EditorGUILayout.BeginHorizontal();
            GUI.backgroundColor = new Color(0.45f, 0.85f, 0.55f);
            if (GUILayout.Button("Generate Linked", GUILayout.Height(28)))
            {
                board.DebugGenerateLinked();
                EditorUtility.SetDirty(board);
            }

            GUI.backgroundColor = new Color(0.95f, 0.55f, 0.45f);
            if (GUILayout.Button("Reset", GUILayout.Height(28)))
            {
                board.DebugReset();
                EditorUtility.SetDirty(board);
            }
            GUI.backgroundColor = Color.white;
            EditorGUILayout.EndHorizontal();
        }

        if (!Application.isPlaying)
            EditorGUILayout.HelpBox("Enter Play Mode to enable these buttons.", MessageType.Info);
    }
}
#endif
