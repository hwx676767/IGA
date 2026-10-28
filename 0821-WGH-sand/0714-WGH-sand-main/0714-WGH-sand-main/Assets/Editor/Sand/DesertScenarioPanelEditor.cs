using SandSystem;
using UnityEditor;
using UnityEngine;

namespace SandSystem.Editor
{
    [CustomEditor(typeof(DesertScenarioPanel))]
    public class DesertScenarioPanelEditor : UnityEditor.Editor
    {
        public override void OnInspectorGUI()
        {
            serializedObject.Update();
            DrawDefaultInspector();

            var panel = (DesertScenarioPanel)target;
            var presets = panel.Presets;

            EditorGUILayout.Space(10);
            EditorGUILayout.LabelField("Apply Scenario", EditorStyles.boldLabel);

            if (!Application.isPlaying)
            {
                EditorGUILayout.HelpBox(
                    "Enter Play Mode, then click a scenario button below.\n" +
                    "Factory/mining placement prefers the camera forward direction.",
                    MessageType.Info);
            }
            else
            {
                EditorGUILayout.HelpBox(
                    "Playing — click a button to rebuild the world for screenshots.",
                    MessageType.None);
            }

            if (presets != null)
            {
                EditorGUI.BeginDisabledGroup(panel.IsBusy);
                for (int i = 0; i < presets.Length; i++)
                {
                    var p = presets[i];
                    if (p == null) continue;

                    string caption = string.IsNullOrEmpty(p.label) ? $"Scenario {i + 1}" : p.label;
                    string detail = $"{p.note}\nTrees {p.trees} · Factories {p.factories} · Mining {p.mining}";

                    if (GUILayout.Button($"{caption}\n{detail}", GUILayout.Height(56f)))
                    {
                        panel.ApplyScenarioAtIndex(i);
                        EditorUtility.SetDirty(panel);
                    }

                    EditorGUILayout.Space(2);
                }
                EditorGUI.EndDisabledGroup();
            }

            if (!string.IsNullOrEmpty(panel.LastStatus))
            {
                EditorGUILayout.Space(4);
                EditorGUILayout.LabelField("Last result", EditorStyles.miniBoldLabel);
                EditorGUILayout.HelpBox(panel.LastStatus, MessageType.None);
            }

            serializedObject.ApplyModifiedProperties();
        }
    }
}
