using UnityEngine;

public class SpawnTrigger : MonoBehaviour
{
    public Transform customSpawnPoint; 
    public int customNumberOfEnemies = 3; 

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            Debug.Log("Player entered");
            EnemyController.Instance.SpawnEnemies(customSpawnPoint, customNumberOfEnemies);
        }
    }
}