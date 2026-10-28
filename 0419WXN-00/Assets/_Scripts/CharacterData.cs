using UnityEngine;

[CreateAssetMenu(fileName = "NewCharacterData", menuName = "Game/Character Data")]
public class CharacterData : ScriptableObject
{
    [Header("基础信息")]
    public Sprite avatar;
    public string characterName;

    [Header("数值")]
    [Range(0, 100)] public int stressValue;
    [Range(0, 100)] public int loyaltyValue;
    [Range(0, 100)] public int performance;

    [Header("等级")]
    [Range(1, 5)] public int level;

    [Header("角色材质（推荐）")]
    public Material characterMaterial;
}