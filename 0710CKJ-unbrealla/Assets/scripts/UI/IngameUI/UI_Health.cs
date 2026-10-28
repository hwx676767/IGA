using System.Collections.Generic;
using UnityEngine;

public class UI_Health : MonoBehaviour
{
    [SerializeField] private Entity_Health entityHealth;
    [SerializeField] private UI_Blood bloodPrefab;
    [SerializeField] private List<UI_Blood> bloodList = new List<UI_Blood>();
    [SerializeField] public float bloodSpacing = 50f; // Distance between blood icons

    private int lastMaxHp = 0;

    private void Start()
    {
        if (entityHealth != null)
        {
            UpdateHealthDisplay();
        }
    }

    private void Update()
    {
        if (entityHealth != null)
        {
            // Check if max HP changed to update blood count
            if (entityHealth.maxHp != lastMaxHp)
            {
                UpdateBloodCount();
                lastMaxHp = (int)entityHealth.maxHp;
            }
            
            // Update blood states based on current HP
            UpdateBloodStates();
        }
    }

    private void UpdateHealthDisplay()
    {
        UpdateBloodCount();
        UpdateBloodStates();
        UpdateBloodPositions();
    }

    private void UpdateBloodCount()
    {
        int targetCount = (int)entityHealth.maxHp;
        
        // Add blood icons if needed
        while (bloodList.Count < targetCount)
        {
            CreateBloodIcon();
        }
        
        // Remove excess blood icons
        while (bloodList.Count > targetCount)
        {
            RemoveBloodIcon();
        }
        
        UpdateBloodPositions();
    }

    private void CreateBloodIcon()
    {
        if (bloodPrefab != null)
        {
            UI_Blood newBlood = Instantiate(bloodPrefab, transform);
            bloodList.Add(newBlood);
        }
    }

    private void RemoveBloodIcon()
    {
        if (bloodList.Count > 0)
        {
            int lastIndex = bloodList.Count - 1;
            UI_Blood bloodToRemove = bloodList[lastIndex];
            bloodList.RemoveAt(lastIndex);
            
            if (bloodToRemove != null)
            {
                DestroyImmediate(bloodToRemove.gameObject);
            }
        }
    }

    private void UpdateBloodStates()
    {
        for (int i = 0; i < bloodList.Count; i++)
        {
            if (bloodList[i] != null)
            {
                // True if current HP is greater than blood index, false otherwise
                bool isFilled = i < entityHealth.currentHp;
                bloodList[i].SetImageState(isFilled);
            }
        }
    }

    private void UpdateBloodPositions()
    {
        for (int i = 0; i < bloodList.Count; i++)
        {
            if (bloodList[i] != null)
            {
                RectTransform bloodRect = bloodList[i].GetComponent<RectTransform>();
                if (bloodRect != null)
                {
                    // Position each blood icon horizontally
                    bloodRect.anchoredPosition = new Vector2(i * bloodSpacing, 0);
                }
            }
        }
    }

    // Public method to manually refresh the display
    public void RefreshHealthDisplay()
    {
        if (entityHealth != null)
        {
            UpdateHealthDisplay();
        }
    }
}