using UnityEngine;

// 添加CreateAssetMenu属性
[CreateAssetMenu(fileName = "New Dialogue", menuName = "Dialogue System/Dialogue", order = 1)]
public class Dialogue : ScriptableObject
{
    public DialogueLine[] lines;
}

[System.Serializable]
public class DialogueLine
{
    public string speakerName;
    [TextArea(3, 8)]
    public string text;
    public Sprite speakerImage;
    public AudioClip voiceClip; // 可选：添加语音
}