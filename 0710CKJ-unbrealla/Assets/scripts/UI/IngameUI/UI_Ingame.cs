using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class UI_Ingame : MonoBehaviour
{
    private Player player;
    private Inventory_Player inventory;

    [SerializeField] private RectTransform healthRect;
    [SerializeField] private UI_Health healthUI;
    [SerializeField] private TextMeshProUGUI healthText;
    [SerializeField] private UI_Weight weightUI;
    private void Start()
    {

        player = FindFirstObjectByType<Player>();

        inventory = player.inventory;
    }
    
}
