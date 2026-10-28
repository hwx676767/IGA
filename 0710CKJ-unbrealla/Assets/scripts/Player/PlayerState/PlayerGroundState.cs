using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerGroundState : PlayerState
{
    // Start is called before the first frame update
    
    public PlayerGroundState(Player player, AllStateMachine allStateMachine, string aniBoolName) : base(player, allStateMachine, aniBoolName)
    {
        
    }

    public override void Enter()
    {
        CurrentPlayer.SetVelocity(0);
        CurrentPlayer.RigidBody.gravityScale = 3.5f;
        base.Enter();
    }

    public override void Update()
    {
        base.Update();
        
        if (input.Player.Attack.WasPressedThisFrame() && StateMachine.CurrentState != CurrentPlayer.DashState)
        {
            StateMachine.ChangeState(CurrentPlayer.AttackState);
        }

        if (input.Player.Parry.WasPressedThisFrame() && CurrentPlayer.groundDetected &&
            StateMachine.CurrentState != CurrentPlayer.DashState)
        {
            StateMachine.ChangeState(CurrentPlayer.ParryState);
        }
        
        if (input.Player.JumpOrGlide.WasPressedThisFrame() && CurrentPlayer.IsGrounded())
        {
            StateMachine.ChangeState(CurrentPlayer.JumpState);
        }

        if (input.Player.Dash.WasPressedThisFrame() && CurrentPlayer.IsGrounded() && CurrentPlayer.dashCooldownTimer < 0)
        {
            StateMachine.ChangeState(CurrentPlayer.DashState);
        }
    }

    public override void Exit()
    {
        base.Exit();
    }
}
