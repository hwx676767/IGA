using UnityEngine;
using System.Collections;

public class Operator : MonoBehaviour
{
    public OperatorCardData data;
    public Vector2Int gridPosition;
    public TileType placedTileType;
    public float currentHealth;
    public float maxHealth = 100f;
    public Animator animator;
    private float attackTimer = 0f;
    [SerializeField] private GameObject currentTarget;
    private GameMap gameMap;
    private Vector2 facingDirection = Vector2.right;
    private bool isPlayingAttackAnimation = false;
    [SerializeField] private LayerMask enemyLayer;

    public void Initialize(OperatorCardData cardData, Vector2Int gridPos, TileType tileType)
    {
        data = cardData;
        gridPosition = gridPos;
        placedTileType = tileType;
        currentHealth = maxHealth;
        gameMap = FindObjectOfType<GameMap>();
        animator = GetComponent<Animator>();
        if (data.animatorController != null)
        {
            animator.runtimeAnimatorController = data.animatorController;
        }
        animator.Play("Idle");
    }

    private void Update()
    {
        if (isPlayingAttackAnimation) return;

        attackTimer += Time.deltaTime;
        if (attackTimer >= data.attackInterval)
        {
            FindAndActOnTarget();
        }

        // 用于调试的按键触发（可选）
        if (Input.GetKeyDown(KeyCode.A))
        {
            FindAndActOnTarget();
        }
    }

    private void FindAndActOnTarget()
    {
        currentTarget = null;
        Debug.Log($"{data.cardId} searching for target with type: {data.operatorType}");

        if (data.operatorType == OperatorType.Melee)
        {
            currentTarget = FindMeleeTarget();
        }
        else if (data.operatorType == OperatorType.Ranged)
        {
            currentTarget = FindRangedTarget();
        }
        else if (data.operatorType == OperatorType.Healer)
        {
            currentTarget = FindHealerTarget();
        }

        if (currentTarget != null)
        {
            Debug.Log($"{data.cardId} found target: {currentTarget.name}");
            StartCoroutine(PlayAttackAnimation(currentTarget, data.operatorType != OperatorType.Healer));
        }
        else
        {
            Debug.Log($"{data.cardId} no target found");
            animator.Play("Idle"); // 确保无目标时播放Idle
            attackTimer = 0f; // 重置计时器
        }
    }

    private GameObject FindMeleeTarget()
    {
        Collider2D[] hits = Physics2D.OverlapCircleAll(transform.position, data.attackRange, enemyLayer);
        if (hits.Length > 0)
        {
            Debug.Log($"Melee range detected {hits.Length} hits at {transform.position}");
            return hits[0].gameObject; // 返回第一个敌人
        }
        Debug.Log($"No melee targets in range {data.attackRange} at {transform.position}");
        return null;
    }

    private GameObject FindRangedTarget()
    {
        if (currentTarget != null)
        {
            facingDirection = (currentTarget.transform.position - transform.position).normalized;
        }
        RaycastHit2D hit = Physics2D.Raycast(transform.position, facingDirection, data.attackRange, enemyLayer);
        if (hit.collider != null)
        {
            Enemy enemy = hit.collider.GetComponent<Enemy>();
            if (enemy != null)
            {
                Debug.Log($"Ranged hit target: {enemy.gameObject.name} at distance {Vector2.Distance(transform.position, hit.point)}");
                return enemy.gameObject;
            }
        }
        Debug.Log($"No ranged target found in direction {facingDirection} with range {data.attackRange}");
        return null;
    }

    private GameObject FindHealerTarget()
    {
        GameObject lowestHealthTarget = null;
        float lowestHealth = float.MaxValue;
        Collider2D[] hits = Physics2D.OverlapCircleAll(transform.position, data.attackRange);
        foreach (var hit in hits)
        {
            Operator op = hit.GetComponent<Operator>();
            if (op != null && op.currentHealth < op.maxHealth && op.currentHealth < lowestHealth)
            {
                lowestHealth = op.currentHealth;
                lowestHealthTarget = op.gameObject;
            }
        }
        if (lowestHealthTarget != null)
        {
            Debug.Log($"Healer found target: {lowestHealthTarget.name} with health {lowestHealth}");
        }
        else
        {
            Debug.Log($"No healable targets in range {data.attackRange}");
        }
        return lowestHealthTarget;
    }

    private IEnumerator PlayAttackAnimation(GameObject target, bool isAttack)
    {
        if (target == null || animator == null)
        {
            Debug.LogWarning($"{data.cardId} cannot play attack animation: target or animator is null.");
            isPlayingAttackAnimation = false;
            attackTimer = 0f;
            animator.Play("Idle");
            yield break;
        }

        isPlayingAttackAnimation = true;
        animator.Play("Attack");
        Debug.Log($"Playing Attack animation for {data.cardId}");

        AnimatorClipInfo[] clipInfo = animator.GetCurrentAnimatorClipInfo(0);
        float animationLength = clipInfo.Length > 0 ? clipInfo[0].clip.length : 1f;
        Debug.Log($"Animation length for {data.cardId}: {animationLength}");

        float triggerTime = animationLength * 0.8f;
        yield return new WaitForSeconds(triggerTime);

        // 再次检查目标是否有效
        if (target != null)
        {
            if (isAttack)
            {
                Enemy enemy = target.GetComponent<Enemy>();
                if (enemy != null)
                {
                    enemy.TakeDamage(data.attackDamage);
                    Debug.Log($"{data.cardId} attacked {target.name} for {data.attackDamage} damage at 80% animation.");
                }
            }
            else
            {
                Operator op = target.GetComponent<Operator>();
                if (op != null)
                {
                    op.currentHealth = Mathf.Min(op.maxHealth, op.currentHealth + data.attackDamage);
                    Debug.Log($"{data.cardId} healed {target.name} for {data.attackDamage} health at 80% animation.");
                }
            }
        }
        else
        {
            Debug.LogWarning($"{data.cardId} target lost during animation.");
        }

        yield return new WaitForSeconds(animationLength - triggerTime);

        isPlayingAttackAnimation = false;
        attackTimer = 0f;

        // 动画完成后立即检查下一个目标
        FindAndActOnTarget();
    }

    public void TakeDamage(float damage)
    {
        currentHealth = Mathf.Max(0, currentHealth - damage);
        if (currentHealth <= 0)
        {
            gameMap.ReleaseTile(gridPosition);
            Destroy(gameObject);
        }
    }

    private void OnDrawGizmosSelected()
    {
        if (data != null)
        {
            if (data.operatorType == OperatorType.Melee)
            {
                Gizmos.color = Color.red;
                Gizmos.DrawWireSphere(transform.position, data.attackRange);
            }
            else if (data.operatorType == OperatorType.Ranged)
            {
                Gizmos.color = Color.red;
                Gizmos.DrawRay(transform.position, facingDirection * data.attackRange);
            }
            else if (data.operatorType == OperatorType.Healer)
            {
                Gizmos.color = Color.green;
                Gizmos.DrawWireSphere(transform.position, data.attackRange);
            }
        }
    }
}