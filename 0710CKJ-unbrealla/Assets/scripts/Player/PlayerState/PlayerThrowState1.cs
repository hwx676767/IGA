using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class PlayerThrowState1 : PlayerState
{
    private GameObject currentItem;
    
    public PlayerThrowState1(Player player, AllStateMachine allStateMachine, string aniBoolName) : base(player, allStateMachine, aniBoolName)
    {
    }

    public override void Enter()
    {
        base.Enter();
        // Create ball when entering state
        CurrentPlayer.SummonBall();
        currentItem = CurrentPlayer.GetCurrentSummonedBall();
    }

    public override void Update()
    {
        base.Update();
        if (input.Player.Throw.WasReleasedThisFrame() && CurrentPlayer.GetCurrentSummonedBall())
        {
            StateMachine.ChangeState(CurrentPlayer.FailThrowState);
        }
        // Player class handles Throw key release, so this state focuses on animation
        // Transition to ThrowState2 is handled by Player's ball management
        
    }

    public override void Exit()
    {
        base.Exit();
        // Don't destroy ball here - Player class manages ball lifecycle
        // Ball will be thrown or destroyed based on drag status
    }
}