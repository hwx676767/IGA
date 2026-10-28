using UnityEngine;

public class EnemyDeadState : EnemyState
{
    private Collider2D col;

    public EnemyDeadState(Enemy enemy, AllStateMachine stateMachine, string animBoolName) : base(enemy, stateMachine, animBoolName)
    {
        col = enemy.GetComponent<Collider2D>();
    }

    public override void Enter()
    {
        base.Enter();

    }

    public override void Update()
    {
        if (TriggerCalled)
        {
            anim.enabled = false;
            col.enabled = false;

            rb.gravityScale = 12;
            rb.linearVelocity = new Vector2(rb.linearVelocity.x, -15);

            StateMachine.SwitchOffStateMachine();
        }
    }


}