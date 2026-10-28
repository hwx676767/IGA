using UnityEngine;
using UnityEngine.AI;

public class EnemyNavMeshController : MonoBehaviour
{
    public float updateTargetInterval = 0.5f; 
    private Transform player;
    private NavMeshAgent enemyAgent; 
    private float timeSinceLastUpdate = 0f;

    void Start()
    {
        enemyAgent = GetComponent<NavMeshAgent>();

        if (enemyAgent == null)
        {
            Debug.LogError("NavMeshAgent component is missing on the enemy!");
        }

        player = GameObject.FindWithTag("Player")?.transform;
        // 初始化目标为玩家
        if (player == null)
        {
            Debug.LogError("Player reference is not set!");
        }
    }

    void Update()
    {
        timeSinceLastUpdate += Time.deltaTime;
        if (timeSinceLastUpdate >= updateTargetInterval)
        {
            UpdateTargetPosition();
            timeSinceLastUpdate = 0f;
        }
    }

    void UpdateTargetPosition()
    {
        if (player != null && enemyAgent != null)
        {
            enemyAgent.SetDestination(player.position);
        }
    }
}