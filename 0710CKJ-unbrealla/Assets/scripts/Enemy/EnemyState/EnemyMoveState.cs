using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyMoveState : EnemyGroundedState
{
    public EnemyMoveState(Enemy enemy, AllStateMachine StateMachine, string animBoolName) : base(enemy, StateMachine, animBoolName)
    {
        enemy.speedFactor = enemy.moveSpeed;
    }
    
    public override void Enter()
    {
        base.Enter();
        
    }


    public override void Update()
    {
        base.Update();
        enemy.moveTimer += Time.deltaTime;
        enemy.SetVelocity(enemy.FacingDir);

        if (enemy.groundDetected == false || enemy.wallDetected)
        {
            enemy.Flip();
            StateMachine.ChangeState(enemy.idleState);
        }
        if (enemy.PlayerDetected() == true)
            StateMachine.ChangeState(enemy.battleState);
        if (enemy.moveTimer > enemy.moveTimeDuration)
        {
            enemy.Flip();
            enemy.moveTimer = 0;
            StateMachine.ChangeState(enemy.idleState);
        }
    }
}