using UnityEngine;
using System.Collections;

public class Operator : MonoBehaviour
{
    public OperatorCardData data;
    public Vector2Int gridPosition;
    public TileType placedTileType;
    public float currentHealth;
    public float maxHealth = 100f;
    public Animator animator; // 公开以便外部访问
    private float attackTimer = 0f;
    private GameObject currentTarget;
    private GameMap gameMap;
    private Vector2 facingDirection = Vector2.right;
    private bool isPlayingAttackAnimation = false;
    [SerializeField] private LayerMask enemyLayer; // 在Inspector中设置，过滤敌人层

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
        // 确保默认播放Idle动画
        animator.Play("Idle");
    }

    private void Update()
    {
        if (isPlayingAttackAnimation) return; // 等待攻击动画完成

        attackTimer += Time.deltaTime;
        if (attackTimer >= data.attackInterval)
        {
            FindAndActOnTarget();
        }

        if (Input.GetKey(KeyCode.A))
        {
            animator.Play("Attack");
        }
    }

    private void FindAndActOnTarget()
    {
        currentTarget = null;

        if (data.operatorType == OperatorType.Melee)
        {
            currentTarget = FindMeleeTarget();
            if (currentTarget != null)
            {
                AttackTarget(currentTarget);
            }
        }
        else if (data.operatorType == OperatorType.Ranged)
        {
            currentTarget = FindRangedTarget();
            if (currentTarget != null)
            {
                AttackTarget(currentTarget);
            }
        }
        else if (data.operatorType == OperatorType.Healer)
        {
            currentTarget = FindHealerTarget();
            if (currentTarget != null)
            {
                HealTarget(currentTarget);
            }
        }
    }

    private GameObject FindMeleeTarget()
    {
        // 使用范围检测，1格范围（约0.5单位）
        Collider2D[] hits = Physics2D.OverlapCircleAll(transform.position, 0.5f, enemyLayer);
        if (hits.Length > 0)
        {
            return hits[0].gameObject; // 返回最近的敌人（未排序）
        }
        return null;
    }

    private GameObject FindRangedTarget()
    {
        // 使用射线检测，检测前方3格
        RaycastHit2D hit = Physics2D.Raycast(transform.position, facingDirection, data.attackRange, enemyLayer);
        if (hit.collider != null)
        {
            Enemy enemy = hit.collider.GetComponent<Enemy>();
            if (enemy != null)
            {
                return enemy.gameObject;
            }
        }
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
        return lowestHealthTarget;
    }

    private void AttackTarget(GameObject target)
    {
        Enemy enemy = target.GetComponent<Enemy>();
        if (enemy != null)
        {
            enemy.TakeDamage(data.attackDamage);
            attackTimer = 0f;
            StartCoroutine(PlayAttackAnimation());
            Debug.Log($"{data.cardId} attacked {target.name} for {data.attackDamage} damage.");
        }
    }

    private void HealTarget(GameObject target)
    {
        Operator op = target.GetComponent<Operator>();
        if (op != null)
        {
            op.currentHealth = Mathf.Min(op.maxHealth, op.currentHealth + data.attackDamage);
            attackTimer = 0f;
            StartCoroutine(PlayAttackAnimation());
            Debug.Log($"{data.cardId} healed {target.name} for {data.attackDamage} health.");
        }
    }

    private IEnumerator PlayAttackAnimation()
    {
        isPlayingAttackAnimation = true;
        animator.Play("Attack");

        // 获取Attack动画长度
        AnimatorClipInfo[] clipInfo = animator.GetCurrentAnimatorClipInfo(0);
        float animationLength = clipInfo.Length > 0 ? clipInfo[0].clip.length : 1f;

        // 等待动画播放完成
        yield return new WaitForSeconds(animationLength);

        // 恢复Idle动画
        animator.Play("Idle");
        isPlayingAttackAnimation = false;
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
                Gizmos.DrawWireSphere(transform.position, 0.5f); // 显示近战范围
            }
            else if (data.operatorType == OperatorType.Ranged)
            {
                Gizmos.color = Color.red;
                Gizmos.DrawRay(transform.position, facingDirection * data.attackRange); // 显示射线范围
            }
            else if (data.operatorType == OperatorType.Healer)
            {
                Gizmos.color = Color.green;
                Gizmos.DrawWireSphere(transform.position, data.attackRange); // 显示治疗范围
            }
        }
    }
}