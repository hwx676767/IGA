using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "PlayerData", menuName = "Data/PlayerData")]
public class PlayerData : ScriptableObject
{
    // Player issue enumeration
    public enum NeedType
    {
        Issue01,
        Issue02,
        Issue03,
        Issue04
    }
    //动态加载--问题部位
    //脚本-左右摇晃-->平板支撑+俯卧撑+硬拉   慢跑   ====  查找文件列表
    /// <summary>
    /// 1.直接设定
    /// 2.动态加载-根据设定规则动态新建一个训练脚本 === switch  + 文件读取加载
    /// </summary>

    public int playerId;
    
    // Array using NeedType enumeration
    public NeedType[] playerNeed;
    
}