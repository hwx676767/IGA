using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyAttackState : EnemyState
{
    public EnemyAttackState(Enemy enemy, AllStateMachine StateMachine, string animBoolName) : base(enemy, StateMachine, animBoolName)
    {
    }

    public override void Update()
    {
        base.Update();
        
    }
}