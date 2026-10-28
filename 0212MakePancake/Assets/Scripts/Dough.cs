using System;
using UnityEngine;
using Random = UnityEngine.Random;

public class Dough : MonoBehaviour
{
    public GameObject doughPrefab; 

    void Start()
    {
        if (doughPrefab == null)
        {
            doughPrefab = Resources.Load<GameObject>("Prefabs/DoughPrefab");
        }
    }

    private void OnTriggerEnter2D(Collider2D other)
    {
        if (other.tag == "Tool")
        {
            gameObject.SetActive(false);

            Transform parentTransform = transform.parent;

            Vector3 spawnPosition = transform.position; 
            Instantiate(doughPrefab, spawnPosition, Quaternion.identity, parentTransform); 
        
            Destroy(gameObject);
        }
    }

    /*
    void OnMouseDown()
    {
        gameObject.SetActive(false);

        Transform parentTransform = transform.parent;

        Vector3 spawnPosition = transform.position; 
        Instantiate(doughPrefab, spawnPosition, Quaternion.identity, parentTransform); 
        
        Destroy(gameObject);
    }*/
}