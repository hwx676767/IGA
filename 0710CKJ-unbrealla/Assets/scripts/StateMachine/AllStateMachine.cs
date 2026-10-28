using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AllStateMachine 
{
    public EntityState CurrentState { get; private set; }//can see but can't change it.
    public bool canChangeState;

    public void Initialize(EntityState startState)
    {
        CurrentState = startState;
        CurrentState.Enter();
    }

    public void ChangeState(EntityState newState)
    {
        CurrentState.Exit();
        CurrentState = newState;
        CurrentState.Enter();
    }
    
    public void UpdateActiveState()
    {
        CurrentState.Update();   
        //Debug.Log($"[StateMachine] UpdateActiveState called. CurrentState: {CurrentState?.GetType().Name}");
    }
    
    public void SwitchOffStateMachine() => canChangeState = false;
    
}
