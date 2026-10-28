using UnityEngine;
using UnityEngine.UI;

public class GameManager : MonoBehaviour
{
    public static GameManager Instance; 

    public int totalItemsCollected = 0; 
    public Text itemCountText; 
    public Text itemCountText02; 

    private void Awake()
    {
        if (Instance == null)
        {
            Instance = this;
        }
        else
        {
            Destroy(gameObject);
        }
    }

    public void CollectItem(int value)
    {
        totalItemsCollected += value;
        UpdateUI();
    }
    
    public void CountDownNum()
    {
        if (totalItemsCollected > 0 )
        {
            totalItemsCollected --;
            UpdateUI();
        }
        
    }

    private void UpdateUI()
    {
        if (itemCountText != null)
        {
            itemCountText.text = totalItemsCollected.ToString();
            itemCountText02.text = totalItemsCollected.ToString();
        }
    }
}