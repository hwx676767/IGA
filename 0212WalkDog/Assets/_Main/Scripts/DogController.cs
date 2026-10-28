using UnityEngine;

public class DogController : MonoBehaviour
{
    public static DogController Instance;
    private bool hasItem = false;
    private GameObject currentItem;
    
    private Transform dogMouthPosition; 

    private void Awake()
    {
        if (Instance == null)
            Instance = this;
        else
            Destroy(gameObject);
    }

    private void Start()
    {
        dogMouthPosition = transform.Find("dogMouth");
    }

    public void PickupItem(GameObject item)
    {
        hasItem = true;
        currentItem = item;
        item.transform.SetParent(transform); 
        
        item.GetComponent<CollectableItem>().SetPosition(dogMouthPosition); 

        item.GetComponent<CollectableItem>().Pickup();
    }

    public void DropItem()
    {
        if (!hasItem) return;

        hasItem = false;
        currentItem.transform.SetParent(null); 
        currentItem.GetComponent<CollectableItem>().DropItem(); 

        currentItem.transform.position = transform.position + transform.forward * 2f;
        currentItem.SetActive(true); 

        currentItem = null; 
    }

    public bool HasItem()
    {
        return hasItem;
    }
}