using UnityEngine;

public class Enemy : Entity
{
    public EnemyIdleState idleState;
    public EnemyMoveState moveState;
    public EnemyAttackState attackState;
    public EnemyBattleState battleState;
    public EnemyDeadState  deadState;
    public EnemyStunnedState stunnedState;

    [Header("Drop details")]
    public ItemDataSO dropItem;  // 要掉落的物品
    public bool shouldDrop = true;  // 是否掉落
    [SerializeField] private GameObject itemDropPrefab;  // 掉落物品的预制体

    [Header("Battle details")] public float battleMoveSpeed = 3;
    public float attackDistance = 2;
    public float battleTimeDuration = 5;
    public float minRetreatDistance = 1;
    public Vector2 retreatVelocity;
    public float moveTimer = 0f;
    public float moveTimeDuration = 7f;
    
    [Header("Stunned state details")]
    public float stunnedDuration = 1;
    public Vector2 stunnedVelocity = new Vector2(7, 7);
    [SerializeField] protected bool canBeStunned;

    [Header("Movement details")] public float idleTime = 2;
    public float moveSpeed = 1.4f;
    [Range(0, 2)] public float moveAnimSpeedMultiplier = 1;

    [Header("Player detection")] [SerializeField]
    private LayerMask whatIsPlayer;

    [SerializeField] private Transform playerCheck;
    [SerializeField] private float playerCheckDistance = 10;
    [SerializeField] public bool PlayerChecked;
    [SerializeField] public bool PlayerIsAttacked;
    
    public Transform player { get; private set; }
    
    public void EnableCounterWindow(bool enable) => canBeStunned = enable;

    public override void EntityDeath()
    {
        base.EntityDeath();

        // 掉落物品
        DropItem();

        StateMachine.ChangeState(deadState);
        Debug.Log("EnemyDeath");
    }

    private void DropItem()
    {
        if (shouldDrop && dropItem != null && itemDropPrefab != null)
        {
            GameObject newItem = Instantiate(itemDropPrefab, transform.position, Quaternion.identity);
            newItem.GetComponent<Object_ItemPickup>().SetupItem(dropItem);
            Debug.Log($"掉落了: {dropItem.itemName}");
        }
    }

    private void HandlePlayerDeath()
    {
        StateMachine.ChangeState(idleState);
    }

    protected override void Update()
    {
        base.Update();

        PlayerChecked = PlayerDetected();
        PlayerIsAttacked = PlayerAttacked();
    }
    
    public void TryEnterBattleState(Transform player)
    {
        if (StateMachine.CurrentState == battleState)
            return;

        if (StateMachine.CurrentState == attackState)
            return;

        this.player = player;
        StateMachine.ChangeState(battleState);
    }

    public Transform GetPlayerReference()
    {
        if (player == null)
            player = PlayerDetected().transform;

        return player;
    }

    public RaycastHit2D PlayerAttacked()
    {
        RaycastHit2D hit =
            Physics2D.Raycast(playerCheck.position, Vector2.right * FacingDir, attackDistance, whatIsPlayer);
        
        return hit;
    }
    
    public RaycastHit2D PlayerDetected()
    {
        RaycastHit2D hit =
            Physics2D.Raycast(playerCheck.position, Vector2.right * FacingDir, playerCheckDistance, whatIsPlayer | groundCheckLayer);

        if (hit.collider == null || hit.collider.gameObject.layer != LayerMask.NameToLayer("Player"))
            return default;

        return hit;
    }

    protected override void OnDrawGizmos()
    {
        base.OnDrawGizmos();

        Gizmos.color = Color.yellow;
        Gizmos.DrawLine(playerCheck.position, new Vector3(playerCheck.position.x + (FacingDir * playerCheckDistance), playerCheck.position.y));
        Gizmos.color = Color.blue;
        Gizmos.DrawLine(playerCheck.position, new Vector3(playerCheck.position.x + (FacingDir * attackDistance), playerCheck.position.y));
        Gizmos.color = Color.green;
        Gizmos.DrawLine(playerCheck.position, new Vector3(playerCheck.position.x + (FacingDir * minRetreatDistance), playerCheck.position.y));
    }
}