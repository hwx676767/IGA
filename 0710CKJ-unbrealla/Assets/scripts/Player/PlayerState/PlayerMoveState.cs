using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMoveState: PlayerGroundState
{
    // Start is called before the first frame update
    public PlayerMoveState(Player player, AllStateMachine allStateMachine, string aniBoolName) : base(player, allStateMachine, aniBoolName)
    {
        
    }


    public override void Enter()
    {
        base.Enter();
    }

    public override void Update()
    {
        base.Update();
        
        CurrentPlayer.SetVelocity(CurrentPlayer.moveInput.x);
        
        if (CurrentPlayer.moveInput.x == 0)
        {
            StateMachine.ChangeState(CurrentPlayer.IdleState);
        }
    }

    public override void Exit()
    {
        base.Exit();
    }
}


