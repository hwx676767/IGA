using UnityEngine;
public static class GameState
{
    // 当前游戏数据（每次游戏重新开始时重置）
    public static int CurrentDepth { get; set; }
    public static int CurrentBatteries { get; set; }
    
    // 永久性记录数据（跨游戏会话保存）
    public static int MaxDepthRecorded 
    {
        get => PlayerPrefs.GetInt("MaxDepth", 0);
        set => PlayerPrefs.SetInt("MaxDepth", value);
    }

    // 重置临时游戏数据
    public static void ResetGame()
    {
        CurrentDepth = 0;
        CurrentBatteries = 3; // 默认电池数量
    }
}