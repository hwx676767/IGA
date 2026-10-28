using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "SpecialTraining", menuName = "Data/SpecialTrainingList")]
public class Turn02List : ScriptableObject
{
    public enum SpecialType
    {
        Special01,
        Special02,
        Special03
    }

    // 使用 SpecialType 枚举类型定义数组
    public SpecialType[] specialTraining;
}