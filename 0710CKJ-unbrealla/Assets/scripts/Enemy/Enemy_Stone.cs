public class Enemy_Stone : Enemy, ICounterable
{
    public bool CanBeCountered { get => canBeStunned; }
    protected override void Awake()
    {
        base.Awake();

        idleState = new EnemyIdleState(this, StateMachine, "idle");
        moveState = new EnemyMoveState(this, StateMachine, "move");
        attackState = new EnemyAttackState(this, StateMachine, "attack");
        battleState = new EnemyBattleState(this, StateMachine, "battle");
        deadState = new EnemyDeadState(this, StateMachine, "die");
        stunnedState = new EnemyStunnedState(this, StateMachine, "stunned");
    }

    protected override void Start()
    {
        base.Start();

        StateMachine.Initialize(idleState);
    }
    
    public void HandleCounter()
    {
        if (CanBeCountered == false)
            return;

        StateMachine.ChangeState(stunnedState);
    }
    
    
}