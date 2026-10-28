using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Entity_AnimationTriggers : MonoBehaviour
{
    private Entity entity;
    private Entity_Combat entityCombat;

    protected virtual void Awake()
    {
        entity = GetComponentInParent<Entity>();
        entityCombat = GetComponentInParent<Entity_Combat>();
    }

    public void CurrentStateTrigger()
    {
        entity.CurrentStateAnimationTrigger();
    }
    
    private void AttackTrigger()
    {
        entityCombat.PerformAttack();
        //Debug.Log("attack once");
    }

    public void BackPositionFlip()
    {
        entity.Flip();
    }

}

