using UnityEngine;

public class PlayerDeadState : PlayerState
{
    public PlayerDeadState(Player player, AllStateMachine stateMachine, string animBoolName) : base(player, stateMachine, animBoolName)
    {
    }

    public override void Enter()
    {
        base.Enter();
        
        input.Disable();
        rb.simulated = false;
        
    }

    public override void Exit()
    {
        anim.enabled = false;
    }
}