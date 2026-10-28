using UnityEngine;

public class EnemyController : MonoBehaviour
{
    public static EnemyController Instance; 

    public GameObject enemyPrefab;
    public Transform spawnPoint; 
    public int numberOfEnemies = 1; 

    private void Awake()
    {
        if (Instance == null)
        {
            Instance = this;
        }
        else
        {
            Destroy(gameObject); 
        }
    }

    // 生成 Enemy 的方法
    public void SpawnEnemies(Transform spawnPoint, int numberOfEnemies)
    {
        if (enemyPrefab == null)
        {
            Debug.LogError("Enemy prefab is not assigned!");
            return;
        }

        for (int i = 0; i < numberOfEnemies; i++)
        {
            Instantiate(enemyPrefab, spawnPoint.position, spawnPoint.rotation);
            Debug.Log($"Enemy spawned at {spawnPoint.position}");
        }
    }

    // 重载方法：使用默认生成点和数量
    public void SpawnEnemies()
    {
        SpawnEnemies(spawnPoint, numberOfEnemies);
    }
}