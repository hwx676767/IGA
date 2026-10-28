using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Assertions.Must;

public class PlayerJumpState : PlayerState
{
    // Start is called before the first frame update
    public float StateTimer;
    public PlayerJumpState(Player player, AllStateMachine allStateMachine, string aniBoolName) : base(player, allStateMachine, aniBoolName)
    {
        
    }


    public override void Enter()
    {
        base.Enter();
        StateTimer = CurrentPlayer.quickFallTimer[CurrentPlayer.mass];
        CurrentPlayer.RigidBody.gravityScale = 3.5f;
        Vector2 velocity = new Vector2(CurrentPlayer.RigidBody.linearVelocity.x, CurrentPlayer.jumpForce[CurrentPlayer.mass]);
        CurrentPlayer.SetVelocity(velocity);
    }

    public override void Update()
    {
        base.Update();
        StateTimer -= Time.deltaTime;
        CurrentPlayer.SetVelocity(CurrentPlayer.moveInput.x);
        if (input.Player.JumpOrGlide.WasPressedThisFrame())
        {
            StateMachine.ChangeState(CurrentPlayer.GlideState);
        }

        if (input.Player.JumpOrGlide.WasReleasedThisFrame())
        {
            CurrentPlayer.CutVelocity(0.5f);
            if (StateTimer >= 0)
            {
                CurrentPlayer.SetYVelocity(-1);
            }
        }

        if (CurrentPlayer.RigidBody.linearVelocity.y < 0.5f)
        {
            CurrentPlayer.RigidBody.gravityScale = 2.5f;
        }
        //else if (CurrentPlayer.RigidBody.velocity.y < 0)
        //{
        //    StateMachine.ChangeState(CurrentPlayer.AirState);
        //}
    }

    public override void Exit()
    {
        base.Exit();
        CurrentPlayer.RigidBody.gravityScale = 3.5f;
    }
}
