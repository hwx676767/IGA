using System;
using UnityEngine;

/// <summary>
/// One brainstorm thought: danmaku text + the scene object it reveals when clicked.
/// </summary>
[Serializable]
public class BrainstormThought
{
    [Tooltip("Text shown on the floating button.")]
    public string text = "Thought";

    [Tooltip("Scene object to activate when this thought is clicked. Leave empty for now.")]
    public GameObject objectToActivate;

    [Tooltip("If false, click will not activate any object (wrong / noise thought).")]
    public bool isRelevant = true;
}
