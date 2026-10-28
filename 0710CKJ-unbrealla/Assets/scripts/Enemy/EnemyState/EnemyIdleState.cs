using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyIdleState: EnemyGroundedState
{
    private float stateTimer2;
    public EnemyIdleState(Enemy enemy, AllStateMachine StateMachine, string animBoolName) : base(enemy, StateMachine, animBoolName)
    {
    }
    
    public override void Enter()
    {
        base.Enter();
        stateTimer = enemy.idleTime;
        stateTimer2 = enemy.idleTime / 2.0f;
    }

    public override void Update()
    {
        base.Update();
        stateTimer -= Time.deltaTime;
        if (stateTimer < 0)
            StateMachine.ChangeState(enemy.moveState);
        if (enemy.PlayerDetected() == true && stateTimer2 < 0)//为了从进攻转到休息状态时等待一会儿
            StateMachine.ChangeState(enemy.battleState);
        if (enemy.PlayerDetected() == true)
            StateMachine.ChangeState(enemy.battleState);

    }
}
