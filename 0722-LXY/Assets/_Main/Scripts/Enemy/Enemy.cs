using UnityEngine;
using System.Collections;

public class Enemy : MonoBehaviour
{
    public EnemyData data;
    private Pathfinding pathfinding;
    private int pathIndex;
    private int currentWaypointIndex = 0;
    [SerializeField] float health;
    private Vector3 targetPosition;
    private Animator animator;
    private GameObject currentTarget; // 当前攻击目标
    private float attackTimer = 0f;
    private MapGenerator mapGenerator;
    private bool isPlayingAttackAnimation = false; // 跟踪攻击动画状态
    [SerializeField] private GameObject arrowPrefab; // 在Inspector中赋值弓箭Prefab，仅远程使用
    private const float Y_OFFSET = 0.5f; // y轴偏移量

    public void Initialize(EnemyData enemyData, int assignedPathIndex)
    {
        data = enemyData;
        pathIndex = assignedPathIndex;
        GetComponent<SpriteRenderer>().sprite = data.sprite;
    }

    private void Start()
    {
        health = data.maxHealth;
        pathfinding = FindObjectOfType<Pathfinding>();
        mapGenerator = FindObjectOfType<MapGenerator>();
        animator = GetComponent<Animator>();
        if (data.animatorController != null)
        {
            animator.runtimeAnimatorController = data.animatorController;
        }
        if (pathfinding == null || mapGenerator == null)
        {
            Debug.LogError("Pathfinding or MapGenerator not found!");
            Destroy(gameObject);
            return;
        }
        if (pathIndex >= pathfinding.paths.Count)
        {
            Debug.LogError($"Invalid pathIndex {pathIndex}!");
            Destroy(gameObject);
            return;
        }
        Vector3 startPos = pathfinding.GetWorldPosition(pathIndex, 0);
        startPos.y += Y_OFFSET; // 应用y轴偏移
        transform.position = startPos;
        UpdateSortingLayer();
        UpdateTargetPosition();
        // 确保默认播放Move动画
        animator.Play("Move");
    }

    private void Update()
    {
        if (isPlayingAttackAnimation) return; // 等待攻击动画完成

        attackTimer += Time.deltaTime;

        // 检测是否在干员攻击范围内
        currentTarget = FindOperatorInRange();

        if (currentTarget != null)
        {
            // 锁定目标，持续攻击直到目标死亡
            if (attackTimer >= data.attackInterval)
            {
                AttackTarget(currentTarget);
            }
        }
        else
        {
            // 目标消失，恢复移动
            transform.position = Vector3.MoveTowards(transform.position, targetPosition, data.moveSpeed * Time.deltaTime);
            if (Vector3.Distance(transform.position, targetPosition) < 0.01f)
            {
                currentWaypointIndex++;
                if (currentWaypointIndex < pathfinding.paths[pathIndex].Count)
                {
                    UpdateTargetPosition();
                    UpdateSortingLayer();
                }
                else
                {
                    GameManager.Instance.TakeBaseDamage(data.damageToBase);
                    Destroy(gameObject);
                }
            }
        }
    }

    private void UpdateTargetPosition()
    {
        if (currentWaypointIndex < pathfinding.paths[pathIndex].Count)
        {
            Vector2Int gridPos = pathfinding.paths[pathIndex][currentWaypointIndex];
            targetPosition = pathfinding.mapGenerator.GetNodePosition(gridPos.x, gridPos.y);
            targetPosition.y += Y_OFFSET; // 应用y轴偏移
        }
    }

    private void UpdateSortingLayer()
    {
        Vector2Int gridPos = mapGenerator.WorldToGrid(transform.position);
        int row = gridPos.y;
        int sortingOrder = 5 - row; // 从第0行开始，sorting layer从5递减
        GetComponent<SpriteRenderer>().sortingOrder = sortingOrder;
    }

    private GameObject FindOperatorInRange()
    {
        // 检测干员的攻击范围（近战1格，远程/治疗3格）
        Operator nearestOperator = null;
        float nearestDistance = float.MaxValue;
        Collider2D[] hits = Physics2D.OverlapCircleAll(transform.position, data.attackRange);
        foreach (var hit in hits)
        {
            Operator op = hit.GetComponent<Operator>();
            if (op != null && !op.animator.GetBool("IsAttacking")) // 忽略战斗状态的干员
            {
                float distance = Vector2.Distance(transform.position, op.transform.position);
                if (distance < nearestDistance)
                {
                    nearestDistance = distance;
                    nearestOperator = op;
                }
            }
        }
        return nearestOperator != null ? nearestOperator.gameObject : null;
    }

    private void AttackTarget(GameObject target)
    {
        Operator op = target.GetComponent<Operator>();
        if (op != null)
        {
            attackTimer = 0f;
            if (data.enemyType == EnemyData.EnemyType.Ranged && arrowPrefab != null)
            {
                StartCoroutine(PlayAttackAnimation());
            }
            else if (data.enemyType == EnemyData.EnemyType.Melee)
            {
                op.TakeDamage(data.attackDamage);
                StartCoroutine(PlayAttackAnimation());
                Debug.Log($"{data.enemyName} attacked {op.data.cardId} for {data.attackDamage} damage at time {Time.time}");
            }
        }
    }

    private IEnumerator PlayAttackAnimation()
    {
        isPlayingAttackAnimation = true;
        animator.Play("Attack");

        // 获取Attack动画长度
        AnimatorClipInfo[] clipInfo = animator.GetCurrentAnimatorClipInfo(0);
        float animationLength = clipInfo.Length > 0 ? clipInfo[0].clip.length : 1f;

        // 远程攻击生成箭矢
        if (data.enemyType == EnemyData.EnemyType.Ranged && currentTarget != null && arrowPrefab != null)
        {
            yield return new WaitForSeconds(0.5f); // 模拟拉弓射击
            Vector3 spawnPosition = transform.position + new Vector3(0, 0.5f, 0); // 箭矢从上方生成
            GameObject arrow = Instantiate(arrowPrefab, spawnPosition, Quaternion.identity);
            Arrow arrowScript = arrow.GetComponent<Arrow>();
            if (arrowScript != null)
            {
                arrowScript.Initialize(currentTarget, data.attackDamage);
            }
        }

        // 等待动画播放完成
        yield return new WaitForSeconds(animationLength - (data.enemyType == EnemyData.EnemyType.Ranged ? 0.5f : 0f));

        // 恢复Move动画
        animator.Play("Move");
        isPlayingAttackAnimation = false;
    }

    public void TakeDamage(float damage)
    {
        health -= damage;
        if (health <= 0)
        {
            GameManager.Instance.AddCostOnEnemyDefeated();
            Destroy(gameObject);
        }
        else
        {
            Debug.Log($"{data.enemyName} health: {health}");
        }
    }

    private void OnDrawGizmosSelected()
    {
        // 显示攻击范围
        if (data != null)
        {
            Gizmos.color = Color.red;
            Gizmos.DrawWireSphere(transform.position, data.attackRange);
        }
    }
}