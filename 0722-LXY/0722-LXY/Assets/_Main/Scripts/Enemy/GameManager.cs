using UnityEngine;

public class GameManager : MonoBehaviour
{
    public static GameManager Instance { get; private set; }
    public int playerHealth = 10; // 玩家生命值
    public int playerCost = 50; // 初始费用
    public float costRegenRate = 1f; // 每秒恢复费用
    public int maxCost = 100; // 最大费用

    private void Awake()
    {
        if (Instance == null)
        {
            Instance = this;
            DontDestroyOnLoad(gameObject);
        }
        else
        {
            Destroy(gameObject);
        }
    }

    private void Update()
    {
        // 自动恢复费用
        playerCost = Mathf.Min(playerCost + (int)(costRegenRate * Time.deltaTime), maxCost);
    }

    public bool CanAfford(int cost)
    {
        return playerCost >= cost;
    }

    public void SpendCost(int cost)
    {
        playerCost = Mathf.Max(0, playerCost - cost);
    }

    public void TakeBaseDamage(int damage)
    {
        playerHealth -= damage;
        Debug.Log($"Player takes {damage} damage. Remaining health: {playerHealth}");
        if (playerHealth <= 0)
        {
            Debug.Log("Game Over!");
            // TODO: 实现游戏结束逻辑
        }
    }
}