using UnityEngine;

public class PlayerDrownState : PlayerState
{
    private Collider2D col;
    private float drownFallSpeed = -1.5f; // Constant downward speed when drowning

    public PlayerDrownState(Player player, AllStateMachine allStateMachine, string aniBoolName) : base(player, allStateMachine, aniBoolName)
    {
        col = player.GetComponent<Collider2D>();
        stateTimer = 100f;
    }

    public override void Enter()
    {
        base.Enter();
        input.Disable();
        
        // Must disable collider so player can sink through water surface
        // (Water has collider, without disabling player collider, player can't sink)
        if (col != null)
        {
            col.enabled = false;
        }
        
        // Set physics for drowning movement
        rb.gravityScale = 0; // Disable gravity to control movement manually
    }

    public override void Update()
    {
        base.Update();
        
        // Apply constant downward movement to sink through water
        rb.linearVelocity = new Vector2(0, drownFallSpeed);
        
        // Check if player is completely submerged and switch to death state
        if (CurrentPlayer.IsPlayerCompletelySubmerged())
        {
            CurrentPlayer.EntityDeath(); // This will trigger death and switch to DeadState
        }
    }

    public override void Exit()
    {
        base.Exit();
        // Player is dying, no need to restore collider
    }
}