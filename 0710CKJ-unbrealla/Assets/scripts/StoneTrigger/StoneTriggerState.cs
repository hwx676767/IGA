using UnityEngine;

public class StoneTriggerState : EntityState
{
    protected StoneTrigger stoneTrigger;
    
    public StoneTriggerState(StoneTrigger stoneTrigger, AllStateMachine stateMachine, string animBoolName) 
        : base(stateMachine, animBoolName)
    {
        this.stoneTrigger = stoneTrigger;
        this.anim = stoneTrigger.Anim;
        this.rb = stoneTrigger.RigidBody;
    }
}