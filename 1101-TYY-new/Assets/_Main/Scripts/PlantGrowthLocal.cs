using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class PlantGrowthLocal : MonoBehaviour
{
    [Header("Plant Growth Settings")]
    public float waitTime = 3f; // 生长间隔
    private bool isGrowing = false; // 是否正在生长

    [Header("Plant Prefabs")]
    public List<GameObject> plantPrefabs; // 植物预制体列表

    private List<GameObject> plantInstances = new List<GameObject>(); 
    private List<int> usedPrefabIndices = new List<int>(); 

    /// <summary>
    /// 从外部（如 GrowArea）调用生成方法，传入触发器位置
    /// </summary>
    public void StartGrowing(Vector3 triggerPosition)
    {
        if (!isGrowing)
        {
            isGrowing = true;

            Vector3 growthPosition = triggerPosition;

            GameObject plantInstance = InstantiateRandomPlantPrefab(growthPosition);

            if (plantInstance != null)
            {
                plantInstances.Add(plantInstance);

                Animator plantAnimator = plantInstance.GetComponent<Animator>();
                if (plantAnimator != null)
                {
                    // if use animation
                    // plantAnimator.SetTrigger("Grow");
                }
            }

            StartCoroutine(ResetGrowingStatusAfterDelay(waitTime)); 
        }
    }

    private GameObject InstantiateRandomPlantPrefab(Vector3 position)
    {
        if (plantPrefabs.Count == 0)
        {
            Debug.LogWarning("no Prefab！");
            return null;
        }

        int randomIndex = GetRandomUnusedPrefabIndex();
        if (randomIndex == -1)
        {
            Debug.LogWarning("random null");
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
}
