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
            Debug.Log($"Initialized {data.cardId} with Animator Controller: {data.animatorController.name}");
        }
        else
        {
            Debug.LogWarning($"No Animator Controller assigned for {data.cardId}");
        }
        // 确保默认播放Idle动画
        animator.Play("Idle");
        Debug.Log($"{data.cardId} started with Idle animation at {gridPosition}");
    }

    private void Update()
    {
        if (isPlayingAttackAnimation) return; // 等待攻击动画完成

        attackTimer += Time.deltaTime;
        Debug.Log($"Attack timer: {attackTimer:F2} / Interval: {data.attackInterval:F2} for {data.cardId}");
        if (attackTimer >= data.attackInterval)
        {
            FindAndActOnTarget();
        }

        if (Input.GetKey(KeyCode.A))
        {
            animator.Play("Attack");
            Debug.Log($"{data.cardId} triggered Attack animation manually with A key");
        }
    }

    private void FindAndActOnTarget()
    {
        currentTarget = null;
        Debug.Log($"{data.cardId} searching for target with type: {data.operatorType}");

        if (data.operatorType == OperatorType.Melee)
        {
            currentTarget = FindMeleeTarget();
            if (currentTarget != null)
            {
                Debug.Log($"{data.cardId} found melee target: {currentTarget.name}");
                AttackTarget(currentTarget);
            }
            else
            {
                Debug.Log($"{data.cardId} no melee target found");
            }
        }
        else if (data.operatorType == OperatorType.Ranged)
        {
            currentTarget = FindRangedTarget();
            if (currentTarget != null)
            {
                Debug.Log($"{data.cardId} found ranged target: {currentTarget.name}");
                AttackTarget(currentTarget);
            }
            else
            {
                Debug.Log($"{data.cardId} no ranged target found");
            }
        }
        else if (data.operatorType == OperatorType.Healer)
        {
            currentTarget = FindHealerTarget();
            if (currentTarget != null)
            {
                Debug.Log($"{data.cardId} found healer target: {currentTarget.name}");
                HealTarget(currentTarget);
            }
            else
            {
                Debug.Log($"{data.cardId} no healer target found");
            }
        }
    }

    private GameObject FindMeleeTarget()
    {
        // 使用范围检测，1格范围（约0.5单位）
        Collider2D[] hits = Physics2D.OverlapCircleAll(transform.position, 0.5f, enemyLayer);
        if (hits.Length > 0)
        {
            Debug.Log($"Melee range detected {hits.Length} hits at {transform.position}");
            return hits[0].gameObject; // 返回最近的敌人（未排序）
        }
        Debug.Log($"No melee targets in range {0.5f} at {transform.position}");
        return null;
    }

    private GameObject FindRangedTarget()
    {
        // 使用射线检测，检测前方3格
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

    private void AttackTarget(GameObject target)
    {
        Enemy enemy = target.GetComponent<Enemy>();
        if (enemy != null)
        {
            enemy.TakeDamage(data.attackDamage);
            attackTimer = 0f;
            Debug.Log($"Starting attack animation for {data.cardId} on {target.name}");
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
            Debug.Log($"Starting heal animation for {data.cardId} on {target.name}");
            StartCoroutine(PlayAttackAnimation());
            Debug.Log($"{data.cardId} healed {target.name} for {data.attackDamage} health.");
        }
    }

    private IEnumerator PlayAttackAnimation()
    {
        isPlayingAttackAnimation = true;
        animator.Play("Attack");
        Debug.Log($"Playing Attack animation for {data.cardId}. State: {animator.GetCurrentAnimatorStateInfo(0).IsName("Attack")}");
        AnimatorClipInfo[] clipInfo = animator.GetCurrentAnimatorClipInfo(0);
        float animationLength = clipInfo.Length > 0 ? clipInfo[0].clip.length : 1f;
        Debug.Log($"Animation length for {data.cardId}: {animationLength}");

        yield return new WaitForSeconds(animationLength);

        animator.Play("Idle");
        Debug.Log($"{data.cardId} returned to Idle animation");
        isPlayingAttackAnimation = false;
    }

    public void TakeDamage(float damage)
    {
        currentHealth = Mathf.Max(0, currentHealth - damage);
        Debug.Log($"{data.cardId} took {damage} damage, current health: {currentHealth}");
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