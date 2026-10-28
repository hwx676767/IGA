using UnityEngine;

public class StoneTriggerIdleState : StoneTriggerState
{
    public StoneTriggerIdleState(StoneTrigger stoneTrigger, AllStateMachine stateMachine, string animBoolName) 
        : base(stoneTrigger, stateMachine, animBoolName)
    {
    }
    
    public override void Enter()
    {
        base.Enter();
        stateTimer = stoneTrigger.idleTime;
        stoneTrigger.ZeroVelocity();
    }
    
    public override void Update()
    {
        base.Update();
        if (stateTimer < 0)
        {
            StateMachine.ChangeState(stoneTrigger.moveState);
        }
    }
}