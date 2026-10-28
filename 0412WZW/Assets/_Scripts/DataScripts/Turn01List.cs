using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "Turn", menuName = "Data/Turn01List")]
public class Turn01List : ScriptableObject
{
    // Strength enumeration
    public enum StrengthType
    {
        Strength01,
        Strength02,
        Strength03,
        Strength04
    }

    // Running enumeration
    public enum RunningType
    {
        Run01,
        Run02,
        Run03,
        Run04
    }

    // Stretching enumeration
    public enum StretchingType
    {
        Stretch01,
        Stretch02,
        Stretch03,
        Stretch04
    }

    // Arrays using respective enumeration types
    public StrengthType[] strength;
    public RunningType[] running;
    public StretchingType[] stretching;
}