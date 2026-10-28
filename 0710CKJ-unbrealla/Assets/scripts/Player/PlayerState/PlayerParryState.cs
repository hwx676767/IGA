using UnityEngine;

public class PlayerParryState : PlayerGroundState
{
    private Player_Combat combat;
    private bool counteredSombody;
    public PlayerParryState(Player player, AllStateMachine allStateMachine, string aniBoolName) : base(player, allStateMachine, aniBoolName)
    {
        combat = player.GetComponent<Player_Combat>();
    }
    
    public override void Enter()
    {
        base.Enter();
        Debug.Log("ImParrying");
        CurrentPlayer.CutVelocity(0.5f);
        counteredSombody = combat.CounterAttackPerformed();

        anim.SetBool("counterAttackPerformed", counteredSombody);
    }

    public override void Update()
    {
        CurrentPlayer.CutVelocity(0.5f);
        
        if (TriggerCalled )
        {
            StateMachine.ChangeState(CurrentPlayer.IdleState);
            Debug.Log("parryTurnToIdleState");
        }
    }
}
