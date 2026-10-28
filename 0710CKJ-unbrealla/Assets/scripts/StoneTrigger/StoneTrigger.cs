using UnityEngine;

public class StoneTrigger : Entity
{
    [Header("Movement Settings")]
    public float moveSpeed = 0.5f;
    public float idleTime = 2f;
    public float moveTimeDuration = 5f;
    public float moveTimer = 0f;
    
    [Header("Player Detection")]
    [SerializeField] private LayerMask whatIsPlayer;
    [SerializeField] private Transform playerCheck;
    [SerializeField] private float playerCheckDistance = 3f;
    
    #region States
    public StoneTriggerIdleState idleState { get; private set; }
    public StoneTriggerMoveState moveState { get; private set; }
    #endregion
    
    
    protected override void Awake()
    {
        base.Awake();
        
        idleState = new StoneTriggerIdleState(this, StateMachine, "idle");
        moveState = new StoneTriggerMoveState(this, StateMachine, "move");
    }
    
    protected override void Start()
    {
        base.Start();
        
        StateMachine.Initialize(idleState);
        RigidBody.mass = mass;
        speedFactor = moveSpeed;
    }
    
    protected override void Update()
    {
        base.Update();
    }
    
    public bool PlayerDetected()
    {
        RaycastHit2D hit = Physics2D.Raycast(playerCheck.position, Vector2.right * FacingDir, playerCheckDistance, whatIsPlayer);
        return hit.collider != null;
    }
    
    protected override void OnDrawGizmos()
    {
        base.OnDrawGizmos();
        
        if (playerCheck != null)
        {
            Gizmos.color = Color.red;
            Gizmos.DrawLine(playerCheck.position, 
                new Vector3(playerCheck.position.x + (FacingDir * playerCheckDistance), playerCheck.position.y));
        }
    }
}