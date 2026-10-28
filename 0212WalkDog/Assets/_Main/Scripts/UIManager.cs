// UIManager.cs
using UnityEngine;

public class UIManager : MonoBehaviour
{
    public static UIManager Instance;

    public GameObject pickupPrompt;  
    public GameObject dropPrompt;   

    private void Awake()
    {
        Instance = this;
        pickupPrompt.SetActive(false);
        dropPrompt.SetActive(false);
    }

    public void ShowPickupPrompt(bool show)
    {
        pickupPrompt.SetActive(show);
    }

    public void ShowDropPrompt(bool show)
    {
        dropPrompt.SetActive(show);
    }
}