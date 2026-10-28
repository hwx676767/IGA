using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName ="New Event Repo",menuName ="Scriptable/New Event Repo")]
public class SO_EventRepo : ScriptableObject
{
    public SO_EventData[] eventDatas;
}