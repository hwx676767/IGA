using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EntityState
{
    protected AllStateMachine StateMachine;
    protected float XInput, YInput;
    protected string _aniBoolName;
    
    protected Animator anim;
    protected Rigidbody2D rb;

    protected float stateTimer;
    public bool TriggerCalled;
    
    public EntityState(AllStateMachine stateMachine, string animBoolName)
    {
        this.StateMachine = stateMachine;
        this._aniBoolName = animBoolName;
    }
    
    public virtual void Enter()
    {
        //Debug.Log("Enter playerState " + _aniBoolName);
        anim.SetBool(_aniBoolName, true);
        UpdateAnimationParameters();
        TriggerCalled = false;
    }
    
    public virtual void Update()
    {
        //Debug.Log("Update playerState " + _aniBoolName);
        stateTimer -= Time.deltaTime;
    }
    
    public virtual void Exit()
    {
        //Debug.Log("Exit playerState " + _aniBoolName);
        anim.SetBool(_aniBoolName, false);
    }
    
    public void CheckTriggerCalled()
    {
        TriggerCalled = true;
    }

    public virtual void UpdateAnimationParameters()
    {
        anim.SetFloat("yVelocity", rb.linearVelocity.y);
    }

}