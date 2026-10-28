using Unity.VisualScripting;

public class PlayerBackPositionState: PlayerState
{
    // Start is called before the first frame update
    public PlayerBackPositionState(Player player, AllStateMachine allStateMachine, string aniBoolName) : base(player, allStateMachine, aniBoolName)
    {
    }


    public override void Enter()
    {
        base.Enter();
        CurrentPlayer.SetVelocity(0);

    }

    public override void Update()
    {
        CurrentPlayer.SetVelocity(0);
        if (TriggerCalled)
        {
            StateMachine.ChangeState(CurrentPlayer.IdleState);
        }
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