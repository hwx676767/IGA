public class PlayerThrowStoneState : PlayerState
{
    // Start is called before the first frame update
    public PlayerThrowStoneState(Player player, AllStateMachine allStateMachine, string aniBoolName) : base(player, allStateMachine, aniBoolName)
    {
    }


    public override void Enter()
    {
        base.Enter();
        CurrentPlayer.CutVelocity(0.2f);
        //attackDir = player.moveInput.x != 0 ? ((int)player.moveInput.x) : player.facingDir;
        //Debug.Log("attack:"+ CurrentPlayer.RigidBody.linearVelocity);
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