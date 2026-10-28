using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class WaveSpawner : MonoBehaviour
{
    public GameObject enemyPrefab; // 敌人Prefab，需包含Enemy脚本和SpriteRenderer
    public Pathfinding pathfinding;

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
        pathfinding = FindObjectOfType<Pathfinding>();
        if (pathfinding == null || pathfinding.paths == null || pathfinding.paths.Count < 2)
        {
            Debug.LogError("Pathfinding not found or paths not initialized!");
            return;
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

        if (waves[currentWave].pathIndex >= pathfinding.paths.Count || pathfinding.paths[waves[currentWave].pathIndex].Count == 0)
        {
            Debug.LogError($"Invalid pathIndex {waves[currentWave].pathIndex} for wave {currentWave}");
            isSpawning = false;
            yield break;
        }

        foreach (var enemyData in waves[currentWave].enemies)
        {
            Vector2 startPos = pathfinding.mapGenerator.GetNodePosition(
                pathfinding.paths[waves[currentWave].pathIndex][0].x,
                pathfinding.paths[waves[currentWave].pathIndex][0].y);
            GameObject enemy = Instantiate(enemyPrefab, startPos, Quaternion.identity);
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

    public Vector2 GetWorldPosition(int pathIndex, int pointIndex)
    {
        if (pathIndex < 0 || pathIndex >= pathfinding.paths.Count || pointIndex < 0 || pointIndex >= pathfinding.paths[pathIndex].Count)
        {
            Debug.LogError($"Invalid pathIndex {pathIndex} or pointIndex {pointIndex}");
            return Vector2.zero;
        }
        Vector2Int gridPos = pathfinding.paths[pathIndex][pointIndex];
        return pathfinding.mapGenerator.GetNodePosition(gridPos.x, gridPos.y);
    }
}