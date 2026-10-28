using UnityEngine;

[CreateAssetMenu(fileName = "New Inference", menuName = "ScriptableObjects/InferenceRule")]
public class InferenceRule : ScriptableObject
{
    public string inferenceId;
    public string title;
    [TextArea(3, 10)] public string resultBody;

    [Tooltip("All of these clueIds must end up in the same connected group")]
    public string[] requiredClueIds;
}
