using Unity.VisualScripting;
using UnityEngine;

public class Object_ItemPickup : MonoBehaviour
{
    [SerializeField] private Vector2 dropForce = new Vector2(0, -1);
    [SerializeField] public ItemDataSO itemData;

    [Space]
    [SerializeField] private SpriteRenderer sr;
    [SerializeField] private Rigidbody2D rb;
    [SerializeField] private Collider2D col;

    [SerializeField]private Player player = null;
    [SerializeField]public PlayerInputSet input;
    
    // Pickup related variables
    [SerializeField]private bool canPickup = false;
    [SerializeField]private Inventory_Player nearbyInventory = null;
    
    private void OnValidate()
    {
        if (itemData == null)
            return;

        sr = GetComponent<SpriteRenderer>();
        SetupVisuals();
    }

    // Called when item is dropped to setup its properties
    public void SetupItem(ItemDataSO itemData)
    {
        this.itemData = itemData;
        SetupVisuals();

        // Apply random horizontal force when dropped
        float xDropForce = Random.Range(-dropForce.x, dropForce.x);
        rb.linearVelocity = new Vector2(xDropForce, dropForce.y);
        col.isTrigger = false;
    }

    // Setup item visual appearance
    private void SetupVisuals()
    {
        sr.sprite = itemData.itemIcon;
        gameObject.name = "Object_ItemPickup - " + itemData.itemName;
    }

    // When item hits ground, make it pickupable
    private void OnCollisionEnter2D(Collision2D collision)
    {
        if (collision.gameObject.layer == LayerMask.NameToLayer("Ground") && col.isTrigger == false)
        {
            col.isTrigger = true; // Make it a trigger for pickup
            //rb.constraints = RigidbodyConstraints2D.FreezeAll; // Stop physics movement
        }
    }

    // When player enters pickup range
    private void OnTriggerEnter2D(Collider2D collision)
    {
        Inventory_Player inventory = collision.GetComponent<Inventory_Player>();
        player = collision.gameObject.GetComponent<Player>();
        if (player != null)
        {
            input = player.input;
        }

        if (inventory == null)
            return;

        Inventory_Item itemToAdd = new Inventory_Item(itemData);

        // Check if item can be added to inventory
        if (inventory.CanAddItem(itemToAdd))
        {
            canPickup = true;
            nearbyInventory = inventory;
            // Can show "Press F to pickup" UI here
        }
    }

    // When player leaves pickup range
    private void OnTriggerExit2D(Collider2D collision)
    {
        Inventory_Player inventory = collision.GetComponent<Inventory_Player>();

        if (inventory == nearbyInventory)
        {
            canPickup = false;
            nearbyInventory = null;
            // Hide pickup prompt here
        }
        player = null;
        input = null;
    }

    // Check for pickup input
    private void Update()
    {
        if (player != null)
        {
            if (canPickup && nearbyInventory != null && input.Player.Pick.WasPressedThisFrame())
            {
                TryPickupItem();
            }
        }
    }

    // Attempt to pickup the item
    private void TryPickupItem()
    {
        Inventory_Item itemToAdd = new Inventory_Item(itemData);
        
        if (nearbyInventory.CanAddItem(itemToAdd))
        {
            nearbyInventory.AddItem(itemToAdd);
            Destroy(gameObject);
        }
    }
}