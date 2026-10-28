using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyBattleState : EnemyState
{
    private Transform player;
    private float lastTimeWasInBattle;

    public EnemyBattleState(Enemy enemy, AllStateMachine StateMachine, string animBoolName) : base(enemy, StateMachine, animBoolName)
    {
        enemy.speedFactor = enemy.moveSpeed * 2.0f;
    }

    public override void Enter()
    {
        base.Enter();
    }

    public override void Exit()
    {
        base.Exit();
    }

    public override void Update()
    {
        base.Update();
        enemy.SetVelocity(enemy.FacingDir);
        if (enemy.PlayerAttacked() == true || enemy.PlayerIsAttacked)//玩家被攻击到了
        {
            Debug.Log("should idle");
            StateMachine.ChangeState(enemy.idleState);
        }
        else if (enemy.PlayerDetected() == false) StateMachine.ChangeState(enemy.idleState);

        if (enemy.groundDetected == false || enemy.wallDetected)
        {
            StateMachine.ChangeState(enemy.idleState);
            enemy.Flip();
        }
    }
    
    private float DistanceToPlayer()
    {
        if (player == null)
            return float.MaxValue;

        return Mathf.Abs(player.position.x - enemy.transform.position.x);
    }

    private int DirectionToPlayer()
    {
        if (player == null)
            return 0;

        return player.position.x > enemy.transform.position.x ? 1 : -1;
    }
}