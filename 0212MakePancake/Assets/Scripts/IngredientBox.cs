using UnityEngine;
using System.Collections.Generic;

public class IngredientBox : MonoBehaviour
{
    public List<GameObject> ingredientPrefabs;
    public Transform pancakePosition;
    private static int currentSortingOrder = 1;
    private int currentIndex = 0;

    void OnMouseDown()
    {
        if (transform.childCount > 0 && currentIndex < ingredientPrefabs.Count)
        {
            Transform ingredientInBox = transform.GetChild(0);
            
            /*float randomX = Random.Range(-1f, 1f);
            float randomY = Random.Range(-1f, 1f);
            Vector3 randomPosition = new Vector3(randomX,randomY,0);
            GameObject newIngredient =
                Instantiate(ingredientPrefab,
                    pancakePosition.position + randomPosition, Quaternion.identity);*/
            
            GameObject newIngredient = Instantiate(ingredientPrefabs[currentIndex], pancakePosition.position, Quaternion.identity);
            newIngredient.transform.SetParent(pancakePosition);
            
            SetLayerAndSortingOrder(newIngredient);
            
            Destroy(ingredientInBox.gameObject);
            
            currentIndex++; // Next ingredient
            
            if (currentIndex >= ingredientPrefabs.Count)
            {
                currentIndex = 0; // Restart the cycle
            }

            if (transform.childCount == 0)
            {
                gameObject.SetActive(false); 
            }
        }
    }

    void SetLayerAndSortingOrder(GameObject ingredient)
    {
        SpriteRenderer spriteRenderer = ingredient.GetComponent<SpriteRenderer>();
        if (spriteRenderer != null)
        {
            spriteRenderer.sortingLayerName = "PancakeLayer";
            spriteRenderer.sortingOrder = currentSortingOrder;
            currentSortingOrder++;
        }
    }
}