using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;

public abstract class PlayerState : EntityState
{
    protected Player CurrentPlayer;
    protected PlayerInputSet input;

    public PlayerState(Player player, AllStateMachine stateMachine, string animBoolName) : base(stateMachine, animBoolName)
    {
        this.CurrentPlayer = player;
        
        anim = player.Anim;
        rb = player.RigidBody;
        input = player.input;
    }

    public override void Enter()
    {
        base.Enter();
    }

    public override void Update()
    {
        base.Update();
        CurrentPlayer.dashCooldownTimer -= Time.deltaTime;
    }

    public override void Exit()
    {
        base.Exit();
    }
    
}
