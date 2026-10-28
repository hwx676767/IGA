using System.Collections.Generic;
using UnityEngine;

public class EnemySpawner : MonoBehaviour
{
    [SerializeField] private List<GameObject> enemyPrefabs; // 敌人预制体列表，按 AttackType 顺序：Melee, Sonic, Jump, Throw
    [SerializeField] private Vector3 spawnPosition;         // 生成位置
    [SerializeField] private float spawnInterval = 5f;      // 生成间隔
    [SerializeField] private int maxEnemies = 5;            // 最大敌人数量

    private float timer;
    private int spawnedCount;
    private int lastPrefabIndex = -1; // 记录上一次生成的预制体索引，-1 表示未生成

    void Start()
    {
        // 游戏开始时立即生成一个敌人
        if (spawnedCount < maxEnemies && enemyPrefabs.Count > 0)
        {
            SpawnEnemy();
            timer = 0f;
            spawnedCount++;
        }
    }

    void Update()
    {
        timer += Time.deltaTime;
        if (timer >= spawnInterval && spawnedCount < maxEnemies && enemyPrefabs.Count > 0)
        {
            SpawnEnemy();
            timer = 0f;
            spawnedCount++;
        }
    }

    private void SpawnEnemy()
    {
        if (enemyPrefabs == null || enemyPrefabs.Count == 0)
        {
            Debug.LogError("Enemy prefabs list is empty!");
            return;
        }

        int prefabIndex;
        if (enemyPrefabs.Count == 1)
        {
            prefabIndex = 0;
        }
        else
        {
            do
            {
                prefabIndex = Random.Range(0, enemyPrefabs.Count);
            } while (prefabIndex == lastPrefabIndex && enemyPrefabs.Count > 1);
        }
        lastPrefabIndex = prefabIndex;

        GameObject enemy = Instantiate(enemyPrefabs[prefabIndex], spawnPosition, Quaternion.identity);
        EnemyAI enemyAI = enemy.GetComponent<EnemyAI>();

        AttackType attackType = (AttackType)prefabIndex;
        enemyAI.SetAttackType(attackType);
        enemyAI.Initialize(FindObjectOfType<GameController>(), enemy.GetComponent<Animator>(), enemy.transform);

        Debug.Log($"Spawned enemy {spawnedCount} with AttackType: {attackType} at {Time.time} seconds");
    }

    // 当敌人销毁时减少计数
    public void OnEnemyDestroyed()
    {
        spawnedCount--;
        if (spawnedCount < 0) spawnedCount = 0; // 防止负数
        Debug.Log($"Enemy destroyed, remaining count: {spawnedCount}");
    }
}