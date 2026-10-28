using UnityEngine;

public class StoneTriggerMoveState : StoneTriggerState
{
    public StoneTriggerMoveState(StoneTrigger stoneTrigger, AllStateMachine stateMachine, string animBoolName) 
        : base(stoneTrigger, stateMachine, animBoolName)
    {
    }
    
    public override void Enter()
    {
        base.Enter();
        stoneTrigger.moveTimer = 0f;
    }
    
    public override void Update()
    {
        base.Update();
        
        // 检测到玩家就停止移动，但不翻转
        if (stoneTrigger.PlayerDetected())
        {
            stoneTrigger.ZeroVelocity();
            return; // 等待玩家离开，继续当前状态
        }
        
        // 没有玩家时正常移动
        stoneTrigger.moveTimer += Time.deltaTime;
        //Debug.Log(stoneTrigger.moveTimer);
        Vector2 velocity = new Vector2(stoneTrigger.moveSpeed * stoneTrigger.FacingDir, 0);
        stoneTrigger.SetVelocity(velocity);
        
        if (stoneTrigger.wallDetected)
        {
            stoneTrigger.Flip();
        }
        
        // 移动时间达到上限，进入idle
        if (stoneTrigger.moveTimer >= stoneTrigger.moveTimeDuration)
        {
            stoneTrigger.moveTimer = 0f;
            StateMachine.ChangeState(stoneTrigger.idleState);
        }
    }
    
    public override void Exit()
    {
        base.Exit();
        stoneTrigger.ZeroVelocity();
    }
}