// 文件名：ItemData.cs
using UnityEngine;

[CreateAssetMenu(fileName = "New Item Data", menuName = "ScriptableObjects/ItemData")]
public class ItemData : ScriptableObject
{
    [Header("Basic")]
    public string itemName;
    [TextArea(2, 6)] public string description;
    public Sprite itemImage;

    [Header("Analyze / Read (optional)")]
    [Tooltip("Shown after examining the item more closely")]
    [TextArea(2, 8)] public string analyzedText;

    [Tooltip("Full document body for diary / newsreport style items")]
    [TextArea(4, 20)] public string fullReadContent;

    [Tooltip("Optional: overrides fullReadContent when assigned")]
    public TextAsset fullReadFile;

    [Header("Mind Map")]
    [Tooltip("Stable id used by ConnectableUI / InferenceRule")]
    public string clueId;

    public string GetFullReadText()
    {
        if (fullReadFile != null && !string.IsNullOrEmpty(fullReadFile.text))
            return fullReadFile.text;
        return fullReadContent;
    }
}
