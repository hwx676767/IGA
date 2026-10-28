using UnityEngine;
using System.Collections.Generic;

[CreateAssetMenu(fileName = "AttackData", menuName = "Combat/AttackData")]
public class AttackData : ScriptableObject
{
    [Header("Input & Anim")]
    public string inputSequence = "X";  // "X" or "UpX"
    public int animTrigger = 1;         // 1=X, 4=UpX

    [Header("Combat")]
    public float damage = 10f;
    public float hitStun = 0.5f;
    public float knockbackForce = 5f;
    public float cancelWindow = 0.3f;

    [Header("Cancel Chain")]
    public List<AttackData> cancelableTo = new();
}


