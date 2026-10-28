using UnityEngine;

public class GrowArea : MonoBehaviour
{
    public PlantGrowth plantGrowth; 
    public PlantGrowthLocal PlantGrowthLocal; 
    public bool isRandom;
    private bool _isPlayerInArea = false; 

    private void Start()
    {
        //plantGrowth = GameObject.Find("GrowController").GetComponent<PlantGrowth>();
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            _isPlayerInArea = true;
            Debug.Log("Player entered the growth area!");
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            _isPlayerInArea = false;
            Debug.Log("Player left the growth area!");
        }
    }

    private void Update()
    {
        //if (other.CompareTag("Player") && read.message == "1")
        //if (isPlayerInArea && Input.GetMouseButtonDown(0))
        //if (Input.GetKeyDown(KeyCode.Space) && _isPlayerInArea)
        
        if (Input.GetKeyDown(KeyCode.Space) && isRandom)
        {
            Debug.Log("Mouse button pressed, triggering plant growth!");
            plantGrowth.StartGrowing(); 
        }
        if (Input.GetKeyDown(KeyCode.Space) && _isPlayerInArea)
        {
            Debug.Log("Space pressed, growing plant at trigger position!");
            PlantGrowthLocal.StartGrowing(transform.position);
        }
        
    }
}
