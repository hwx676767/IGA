using UnityEngine;

public class CollectableItem : MonoBehaviour
{
    public static CollectableItem Instance;
    
    public bool isCollected = false; 
    public bool canCollect = false;  
    private Rigidbody rb;
    

    private void Awake()
    {
        rb = GetComponent<Rigidbody>();
    }

    private void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.CompareTag("Player") && !isCollected)
        {
            canCollect = true; 
            UIManager.Instance.ShowPickupPrompt(true); 
        }
    }

    private void OnCollisionExit(Collision collision)
    {
        if (collision.gameObject.CompareTag("Player"))
        {
            canCollect = false;  
            UIManager.Instance.ShowPickupPrompt(false); 
        }
    }

    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.E))
        {
            if (canCollect && !isCollected)  
            {
                isCollected = true;
                DogController.Instance.PickupItem(this.gameObject);
                UIManager.Instance.ShowPickupPrompt(false);  
            }
            else if (isCollected) 
            {
                DogController.Instance.DropItem();
                UIManager.Instance.ShowDropPrompt(false);  
                isCollected = false;
            }
        }
    }

    public void DropItem()
    {
        rb.isKinematic = false;  
        rb.useGravity = true;  
        isCollected = false;   
    }

    public void Pickup()
    {
        rb.isKinematic = true;
        rb.useGravity = false;  
    }
    

    public void SetPosition(Transform pickupPosition)
    {
        if (pickupPosition != null)
        {
            transform.position = pickupPosition.position; 
            transform.rotation = pickupPosition.rotation;
        }
    }
}
