using UnityEngine;

[CreateAssetMenu(fileName = "EnemyData", menuName = "Data/EnemyData")]
public class EnemyData : ScriptableObject
{
    public string enemyName;
    public float maxHealth;
    public float moveSpeed; // Movement speed (units per second)
    public int damageToBase; // Damage dealt to base when reaching the endpoint
    public float attackDamage; // Attack damage
    public float attackRange; // Attack range (typically 1 tile for melee, 3 tiles for ranged)
    public float attackInterval; // Attack cooldown time (in seconds)
    public Sprite sprite; // Enemy appearance
    public AnimatorOverrideController animatorController; // Animation controller
    public EnemyType enemyType; // Enemy attack type (Melee or Ranged)

    public enum EnemyType
    {
        Melee, // Close-range attack
        Ranged // Long-range attack with arrow
    }
}