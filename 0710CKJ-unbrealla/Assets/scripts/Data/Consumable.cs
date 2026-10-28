using UnityEngine;

public class ConsumableEffect : ScriptableObject
{
    [TextArea]
    public string effectDescription;
    
    protected GameObject player;

    public virtual bool CanBeUsed()
    {
        return true;
    }

    public void OnConsume(GameObject player)
    {
        this.player = player;
        ExecuteEffect();
    }

    protected virtual void ExecuteEffect()
    {

    }
}