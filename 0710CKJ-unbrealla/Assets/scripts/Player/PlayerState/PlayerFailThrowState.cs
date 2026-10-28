using UnityEngine;

public class PlayerFailThrowState : PlayerState
{
    public PlayerFailThrowState(Player player, AllStateMachine stateMachine, string animBoolName) : base(player, stateMachine, animBoolName)
    {
    }

    public override void Enter()
    {
        base.Enter();
        Debug.Log("Entering FailState");
        CurrentPlayer.BackSummonBall();
    }

    public override void Update()
    {
        base.Update();
        StateMachine.ChangeState(CurrentPlayer.IdleState);
    }

    public override void Exit()
    {
        base.Exit();
        
    }
}