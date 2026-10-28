using UnityEngine;

public class PlayerDashState : PlayerGroundState//dash cool down 在ground那里,还有，这里没有空中冲刺
{
    private int dashDir { get; set; } = 1;
    // Start is called once before the first execution of Update after the MonoBehaviour is created
    public PlayerDashState(Player player, AllStateMachine StateMachine, string aniBoolName) : base(player, StateMachine, aniBoolName)
    {
        
    }

    public override void Enter()
    {
        base.Enter();
        stateTimer = CurrentPlayer.dashTimer;
        CurrentPlayer.dashCooldownTimer = CurrentPlayer.dashCooldown;
        dashDir = CurrentPlayer.moveInput.x != 0 ? ((int)CurrentPlayer.moveInput.x) : CurrentPlayer.FacingDir;
    }

    // Update is called once per frame
    public override void Update()
    {
        base.Update();
        CancelDashIfNeeded();
        stateTimer -= Time.deltaTime;
        if (stateTimer <= 0f || TriggerCalled)
        {
            StateMachine.ChangeState(CurrentPlayer.BackPositionState);
        }

        Vector2 velocity = new Vector2(CurrentPlayer.dashSpeed * dashDir, 0);
        CurrentPlayer.SetVelocity(velocity);
        
    }

    public override void Exit()
    {
        base.Exit();
        CurrentPlayer.SetVelocity(0);
    }
    
    private void CancelDashIfNeeded()
    {
        if (CurrentPlayer.wallDetected)
        {
            //if (CurrentPlayer.groundDetected)
            StateMachine.ChangeState(CurrentPlayer.IdleState);
            //else
                //StateMachine.ChangeState(CurrentPlayer.wallSlideState);
        }
    }
}
