using Mono.Cecil;
using UnityEngine;

[CreateAssetMenu(menuName = "RPG Setup/Item Data/Consumable effect/Heal effect", fileName = "Consumable effect data - Heal")]
public class ConsumableEffect_Heal : ConsumableEffect
{
    [SerializeField] private float healAmount = 1f;

    protected override void ExecuteEffect()
    {
        Player player = FindFirstObjectByType<Player>();
        Entity_Health entity = player.GetComponent<Entity_Health>();

        //float healAmount = player.stats.GetMaxHealth() * healPercent;

        float healAmount = 1;

        entity.IncreaseHealth(healAmount);
    }
}