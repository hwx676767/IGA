using UnityEngine;

[CreateAssetMenu(fileName = "New Testimony", menuName = "ScriptableObjects/TestimonyData")]
public class TestimonyData : ScriptableObject
{
    public string title;
    [TextArea(3, 12)] public string body;
    [Tooltip("Stable id used by ConnectableUI / InferenceRule")]
    public string clueId;
}
