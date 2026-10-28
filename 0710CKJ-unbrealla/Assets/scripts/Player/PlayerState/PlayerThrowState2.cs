public class PlayerThrowState2 : PlayerState
{
    // Start is called before the first frame update
    public PlayerThrowState2(Player player, AllStateMachine allStateMachine, string aniBoolName) : base(player, allStateMachine, aniBoolName)
    {
    }


    public override void Enter()
    {
        base.Enter();
        
    }

    public override void Update()
    {
        base.Update();
        if (TriggerCalled)
        {
            StateMachine.ChangeState(CurrentPlayer.IdleState);
        }
        
    }

    public override void Exit()
    {
        base.Exit();
    }
}