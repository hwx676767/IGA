using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class PlantGrowth : MonoBehaviour
{
    [Header("Plant Growth Settings")]
    public float growDistance = 2f; 
    public Vector3 growthAreaSize = new Vector3(10f, 0f, 10f); 
    public float waitTime = 3f;
    private bool isGrowing = false; 

    private Transform playerTransform;  

    [Header("Plant Prefabs")]
    public List<GameObject> plantPrefabs; 

    private List<GameObject> plantInstances = new List<GameObject>(); 
    private List<int> usedPrefabIndices = new List<int>(); 

    void Start()
    {
        GameObject player = GameObject.FindGameObjectWithTag("Player");

        if (player == null)
        {
            Debug.LogError("找不到player");
            return;
        }

        playerTransform = player.transform;
        Debug.Log("获取玩家位置" + playerTransform.name);
    }

    public void StartGrowing()
    {
        if (!isGrowing)
        {
            isGrowing = true;
            SetGrowthPosition();

            GameObject plantInstance = InstantiateRandomPlantPrefab(transform.position);

            if (plantInstance != null)
            {
                plantInstances.Add(plantInstance);

                Animator plantAnimator = plantInstance.GetComponent<Animator>();
                if (plantAnimator != null)
                {
                    // plantAnimator.SetTrigger("Grow");
                }
            }

            StartCoroutine(ResetGrowingStatusAfterDelay(waitTime)); 
        }
    }

    private void SetGrowthPosition()
    {
        Vector3 growthPosition = playerTransform.position + playerTransform.forward * growDistance;

        growthPosition.x += Random.Range(-growthAreaSize.x / 2f, growthAreaSize.x / 2f);
        growthPosition.z += Random.Range(-growthAreaSize.z / 2f, growthAreaSize.z / 2f);

        RaycastHit hit;
        if (Physics.Raycast(growthPosition, Vector3.down, out hit, 10f)) 
        {
            transform.position = hit.point;
        }
        else
        {
            transform.position = growthPosition;
        }
    }

    private GameObject InstantiateRandomPlantPrefab(Vector3 position)
    {
        if (plantPrefabs.Count == 0)
        {
            Debug.LogWarning("没有prefab");
            return null;
        }

        int randomIndex = GetRandomUnusedPrefabIndex();
        if (randomIndex == -1) 
        {
            Debug.LogWarning("随机数列为空");
            return null;
        }

        GameObject plantPrefab = plantPrefabs[randomIndex];

        GameObject plantInstance = Instantiate(plantPrefab, position, Quaternion.identity);

        usedPrefabIndices.Add(randomIndex);

        return plantInstance;
    }

    private int GetRandomUnusedPrefabIndex()
    {
        List<int> unusedIndices = new List<int>();

        for (int i = 0; i < plantPrefabs.Count; i++)
        {
            if (!usedPrefabIndices.Contains(i))
            {
                unusedIndices.Add(i);
            }
        }

        if (unusedIndices.Count == 0)
        {
            usedPrefabIndices.Clear();
            unusedIndices.AddRange(System.Linq.Enumerable.Range(0, plantPrefabs.Count));
        }

        return unusedIndices[Random.Range(0, unusedIndices.Count)];
    }

    public void ClearAllPlants()
    {
        foreach (var plant in plantInstances)
        {
            if (plant != null)
            {
                Destroy(plant);
            }
        }
        plantInstances.Clear();
        usedPrefabIndices.Clear(); 
    }

    private IEnumerator ResetGrowingStatusAfterDelay(float delay)
    {
        yield return new WaitForSeconds(delay);
        isGrowing = false;
    }

    private void OnDrawGizmos()
    {
        if (playerTransform != null)
        {
            Gizmos.color = Color.green;
            Vector3 growthPosition = playerTransform.position + playerTransform.forward * growDistance;

            Gizmos.DrawWireCube(growthPosition, growthAreaSize);
        }
    }
}
