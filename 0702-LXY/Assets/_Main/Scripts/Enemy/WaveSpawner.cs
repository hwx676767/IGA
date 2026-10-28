using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class WaveSpawner : MonoBehaviour
{
    public GameObject enemyPrefab; // 敌人Prefab，需包含Enemy脚本和SpriteRenderer
    public Path path;

    [System.Serializable]
    public class Wave
    {
        public List<EnemyData> enemies; // 每波的敌人类型
        public float spawnInterval; // 生成间隔（秒）
        public int pathIndex; // 路径索引（0或1）
    }

    public List<Wave> waves;
    private int currentWave = 0;
    private bool isSpawning = false; // 防止重复生成

    private void Start()
    {
        path = FindObjectOfType<Path>();
        if (path == null)
        {
            Debug.LogError("Path not found in scene!");
        }
    }

    // 公共方法，外部调用以触发下一波
    public void StartNextWave()
    {
        if (isSpawning || currentWave >= waves.Count)
        {
            Debug.LogWarning(currentWave >= waves.Count ? "No more waves to spawn!" : "Wave is already spawning!");
            return;
        }

        StartCoroutine(SpawnWave());
    }

    private IEnumerator SpawnWave()
    {
        isSpawning = true;

        if (currentWave >= waves.Count)
        {
            isSpawning = false;
            yield break;
        }

        foreach (var enemyData in waves[currentWave].enemies)
        {
            if (waves[currentWave].pathIndex >= path.paths.Count)
            {
                Debug.LogError($"Invalid pathIndex {waves[currentWave].pathIndex} for wave {currentWave}");
                isSpawning = false;
                yield break;
            }

            GameObject enemy = Instantiate(enemyPrefab, path.GetWorldPosition(waves[currentWave].pathIndex, 0), Quaternion.identity);
            enemy.GetComponent<Enemy>().Initialize(enemyData, waves[currentWave].pathIndex);
            yield return new WaitForSeconds(waves[currentWave].spawnInterval);
        }

        currentWave++;
        isSpawning = false;

        // 如果还有波次，等待外部再次触发
        if (currentWave < waves.Count)
        {
            Debug.Log($"Wave {currentWave} ready to start. Press Space or click UI button to spawn.");
        }
        else
        {
            Debug.Log("All waves completed!");
        }
    }
}