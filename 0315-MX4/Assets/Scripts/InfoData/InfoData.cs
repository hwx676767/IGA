using UnityEngine;
using System.Collections.Generic;

// 可创建的数据文件
[CreateAssetMenu(fileName = "NewInfoData", menuName = "Search System/Info Data", order = 1)]
public class InfoData : ScriptableObject
{
    [Header("基本信息")]
    public string infoTitle;        // 标题
    [TextArea(3, 5)]
    public string infoContent;      // 内容
    public Sprite infoImage;        // 图片
    
    [Header("搜索关键词")]
    public List<string> keywords;    // 关联的关键词
}