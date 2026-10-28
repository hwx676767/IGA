using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerIdle2State : PlayerGroundState
{
    // Start is called before the first frame update
    public PlayerIdle2State(Player player, AllStateMachine allStateMachine, string aniBoolName) : base(player, allStateMachine, aniBoolName)
    {
    }


    public override void Enter()
    {
        base.Enter();
    }

    public override void Update()
    {
        base.Update();
        if (CurrentPlayer.moveInput.x != 0)
        {
            StateMachine.ChangeState(CurrentPlayer.MoveState);
        }
    }

    public override void Exit()
    {
        base.Exit();
    }
}
