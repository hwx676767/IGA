using UnityEngine;
using UnityEngine.UI;

public class ClothesFoldingMinigame : MonoBehaviour
{
    [Header("Player 1 UI")]
    public Slider progressSliderP1;  // Slider for Player 1 (Alpha 3)
    public GameObject panelP1;      // Panel for Player 1

    [Header("Player 2 UI")]
    public Slider progressSliderP2;  // Slider for Player 2 (Keypad 3)
    public GameObject panelP2;      // Panel for Player 2

    [Header("Settings")]
    public float foldDuration = 3f;  // Time needed to complete folding

    private float currentHoldTimeP1 = 0f;
    private float currentHoldTimeP2 = 0f;
    private bool isHoldingKeyP1 = false;
    private bool isHoldingKeyP2 = false;

    private void Start()
    {
        // Initialize both sliders and hide panels
        InitializePanel(progressSliderP1, panelP1);
        InitializePanel(progressSliderP2, panelP2);
    }

    void InitializePanel(Slider slider, GameObject panel)
    {
        slider.maxValue = foldDuration;
        slider.value = foldDuration;
        panel.SetActive(false);
    }

    private void Update()
    {
        // Handle Alpha 3 (Player 1)
        if (Input.GetKeyDown(KeyCode.Alpha3))
        {
            ActivatePanel(progressSliderP1, panelP1);
        }

        // Handle Keypad 3 (Player 2)
        if (Input.GetKeyDown(KeyCode.Keypad3))
        {
            ActivatePanel(progressSliderP2, panelP2);
        }

        // Update Player 1 folding progress
        if (panelP1.activeSelf && Input.GetKey(KeyCode.Alpha3))
        {
            if (!isHoldingKeyP1)
            {
                isHoldingKeyP1 = true;
                currentHoldTimeP1 = 0f;
            }

            currentHoldTimeP1 += Time.deltaTime;
            progressSliderP1.value = foldDuration - currentHoldTimeP1;

            if (currentHoldTimeP1 >= foldDuration)
            {
                CompleteFolding(ref isHoldingKeyP1, ref currentHoldTimeP1, panelP1);
            }
        }
        else if (isHoldingKeyP1)
        {
            isHoldingKeyP1 = false;
            progressSliderP1.value = foldDuration;
        }

        // Update Player 2 folding progress
        if (panelP2.activeSelf && Input.GetKey(KeyCode.Keypad3))
        {
            if (!isHoldingKeyP2)
            {
                isHoldingKeyP2 = true;
                currentHoldTimeP2 = 0f;
            }

            currentHoldTimeP2 += Time.deltaTime;
            progressSliderP2.value = foldDuration - currentHoldTimeP2;

            if (currentHoldTimeP2 >= foldDuration)
            {
                CompleteFolding(ref isHoldingKeyP2, ref currentHoldTimeP2, panelP2);
            }
        }
        else if (isHoldingKeyP2)
        {
            isHoldingKeyP2 = false;
            progressSliderP2.value = foldDuration;
        }
    }

    void ActivatePanel(Slider slider, GameObject panel)
    {
        panel.SetActive(true);
        slider.value = foldDuration; // Reset slider
    }

    void CompleteFolding(ref bool isHoldingFlag, ref float holdTime, GameObject panel)
    {
        isHoldingFlag = false;
        holdTime = 0f;
        panel.SetActive(false);
        Debug.Log(panel.name + " folding completed!");
    }
}