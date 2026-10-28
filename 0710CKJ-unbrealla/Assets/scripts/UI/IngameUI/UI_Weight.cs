using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class UI_Weight : MonoBehaviour
{
    [SerializeField] private Player player;
    [SerializeField] private TextMeshProUGUI weightText;
    
    private int lastWeight = -1; // Track last weight to avoid unnecessary updates

    private void Start()
    {
        UpdateWeightDisplay();
    }

    private void Update()
    {
        if (player != null && weightText != null)
        {
            int currentWeight = (int)player.mass; // Convert float to int
            
            // Only update if weight has changed
            if (currentWeight != lastWeight)
            {
                UpdateWeightDisplay();
                lastWeight = currentWeight;
            }
        }
    }

    private void UpdateWeightDisplay()
    {
        if (player != null && weightText != null)
        {
            int weight = (int)player.mass; // Convert float to int
            weightText.text = $"Weight: {weight}";
        }
    }

    // Public method to manually refresh the display
    public void RefreshWeightDisplay()
    {
        if (player != null && weightText != null)
        {
            UpdateWeightDisplay();
            lastWeight = (int)player.mass;
        }
    }

    // Public method to set new player reference
    public void SetPlayer(Player newPlayer)
    {
        player = newPlayer;
        lastWeight = -1; // Reset to force update
        UpdateWeightDisplay();
    }
}