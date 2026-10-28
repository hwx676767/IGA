using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerAirState : PlayerState
{
    protected float MaxFallSpeed;
    public PlayerAirState(Player player, AllStateMachine allStateMachine, string aniBoolName) : base(player, allStateMachine, aniBoolName)
    {
        MaxFallSpeed = CurrentPlayer.MaxFallSpeed;
    }

    public override void Enter()
    {
        base.Enter();
    }

    public override void Update()
    {
        //Debug.Log("PlayerAirState");
        base.Update();
        CurrentPlayer.SetVelocity(CurrentPlayer.moveInput.x);
        if (input.Player.JumpOrGlide.WasPressedThisFrame())
        {
            StateMachine.ChangeState(CurrentPlayer.GlideState);
        }
        if (CurrentPlayer.isCheckedGrounded)
        {
            //Debug.Log("Ground detected");
            StateMachine.ChangeState(CurrentPlayer.IdleState);
        }

        if (CurrentPlayer.RigidBody.linearVelocity.y < -2)
        {
            CurrentPlayer.RigidBody.gravityScale = 7f;
        }
        if (CurrentPlayer.RigidBody.linearVelocity.y < MaxFallSpeed)
        {
            CurrentPlayer.SetYVelocity(MaxFallSpeed);
        }
    }

    public override void Exit()
    {
        base.Exit();
    }
}
