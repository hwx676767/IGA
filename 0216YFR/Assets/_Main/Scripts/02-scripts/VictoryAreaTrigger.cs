using System;
using UnityEngine;

public class VictoryAreaTrigger : MonoBehaviour
{
    public GameObject victoryUI;

    private void Start()
    {
        victoryUI.SetActive(false);
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            // 触发过场动画
            
            // 调用游戏结束的处理方法
            EndGame();
        }
    }

    private void EndGame()
    {
        // 游戏结束的逻辑，显示胜利界面、播放音乐或其他效果
        victoryUI.SetActive(true);
        Time.timeScale = 0;
        Debug.Log("游戏结束！玩家胜利！");
        
    }
}