using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerIdleState : PlayerGroundState
{
    // Start is called before the first frame update
    protected float RestTime;
    public PlayerIdleState(Player player, AllStateMachine allStateMachine, string aniBoolName) : base(player, allStateMachine, aniBoolName)
    {
        RestTime = CurrentPlayer.restTimer;
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
        RestTime -= Time.deltaTime;
        if (RestTime <= 0)
        {
            RestTime = CurrentPlayer.restTimer;
            StateMachine.ChangeState(CurrentPlayer.Idle2State);
        }
    }

    public override void Exit()
    {
        base.Exit();
        RestTime = CurrentPlayer.restTimer;
    }
}
