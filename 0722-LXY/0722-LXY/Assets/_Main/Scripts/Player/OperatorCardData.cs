using UnityEngine;

[CreateAssetMenu(fileName = "OperatorCardData", menuName = "Data/OperatorCardData")]
public class OperatorCardData : ScriptableObject
{
    public string cardId; // Card ID (e.g., "Sniper_001")
    public Sprite cardSprite; // Card image
    public int cost; // Deployment cost
    public GameObject operatorPrefab; // Corresponding operator prefab
    public TileType placeableTileType; // Tile type where the operator can be placed
    public OperatorType operatorType; // Type of operator
    public float attackDamage; // Attack damage or healing amount
    public float attackRange; // Attack or healing range
    public float attackInterval; // Attack or healing cooldown time (in seconds)
    public AnimatorOverrideController animatorController; // Animation controller
}

public enum OperatorType
{
    Melee,   // Melee
    Ranged,  // Ranged
    Healer   // Healer
}