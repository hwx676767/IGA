using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerGlideState : PlayerState
{
    
    // Start is called before the first frame update
    public PlayerGlideState(Player player, AllStateMachine allStateMachine, string aniBoolName) : base(player, allStateMachine, aniBoolName)
    {
    }


    public override void Enter()
    {
        base.Enter();
        Vector2 velocity = new Vector2(CurrentPlayer.RigidBody.linearVelocity.x, -1);
        CurrentPlayer.SetVelocity(velocity);
    }

    public override void Update()
    {
        base.Update();
        CurrentPlayer.SetVelocity(CurrentPlayer.moveInput.x);
        if (input.Player.JumpOrGlide.WasPressedThisFrame())
        {
            StateMachine.ChangeState(CurrentPlayer.AirState);
        }
        if (CurrentPlayer.IsGrounded())
        {
            StateMachine.ChangeState(CurrentPlayer.IdleState);
        }
        Vector2 velocity = new Vector2(CurrentPlayer.RigidBody.linearVelocity.x, -1);
        CurrentPlayer.SetVelocity(velocity);
    }

    public override void Exit()
    {
        base.Exit();
    }
}
