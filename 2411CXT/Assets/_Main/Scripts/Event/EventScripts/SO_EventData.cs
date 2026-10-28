using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "New Event Data", menuName = "Scriptable/New Event Data")]
public class SO_EventData : ScriptableObject
{
    public string Name;
    [TextArea(2, 2)]
    public string Content;
    public Color color;
}
