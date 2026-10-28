using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyGroundedState: EnemyState//并不是所有敌人一直都在地上，所以idle和move都写ground里显然是stone的特殊情况。另外这里其实叫peaceState更合适。
{
    public EnemyGroundedState(Enemy enemy, AllStateMachine StateMachine, string animBoolName) : base(enemy, StateMachine, animBoolName)
    {
        if (enemy.groundDetected == false || enemy.wallDetected)
            enemy.Flip();
    }
    
    public override void Update()
    {
        base.Update();
    }
}