using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class SceneSwitch : MonoBehaviour
{
    // References to the UI Image objects
    public Image image01; // UI Image for level 1
    public Image image02; // UI Image for level 2
    public Button confirmButton; // Confirm button
    public GameObject uiPanel; // UI panel to show when both images are selected

    // Colors for selection states
    private Color unselectedColor = new Color32(167, 167, 167, 255); // #A7A7A7
    private Color selectedColor = Color.white; // #FFFFFF

    // Track selection state
    private bool isImage01Selected = false;
    private bool isImage02Selected = false;

    // Scene names for levels
    public string level1SceneName = "Level1";
    public string level2SceneName = "Level2";

    void Start()
    {
        // Ensure UI panel is hidden at start
        if (uiPanel != null)
            uiPanel.SetActive(false);

        // Add listeners to images (requires EventTrigger or similar setup in Unity)
        if (image01 != null)
            image01.GetComponent<Button>().onClick.AddListener(ToggleImage01);
        if (image02 != null)
            image02.GetComponent<Button>().onClick.AddListener(ToggleImage02);
        if (confirmButton != null)
            confirmButton.onClick.AddListener(ConfirmSelection);

        // Set initial colors
        UpdateImageColors();
    }

    // Toggle selection state for image01
    void ToggleImage01()
    {
        isImage01Selected = !isImage01Selected;
        UpdateImageColors();
    }

    // Toggle selection state for image02
    void ToggleImage02()
    {
        isImage02Selected = !isImage02Selected;
        UpdateImageColors();
    }

    // Update image colors based on selection state
    void UpdateImageColors()
    {
        if (image01 != null)
        {
            image01.color = isImage01Selected ? selectedColor : unselectedColor;
        }
        if (image02 != null)
        {
            image02.color = isImage02Selected ? selectedColor : unselectedColor;
        }
    }

    // Handle confirm button click
    void ConfirmSelection()
    {
        // Case 1: Only image01 is selected
        if (isImage01Selected && !isImage02Selected)
        {
            SceneManager.LoadScene(level1SceneName);
        }
        // Case 2: Only image02 is selected
        else if (!isImage01Selected && isImage02Selected)
        {
            SceneManager.LoadScene(level2SceneName);
        }
        // Case 3: Both images are selected
        else if (isImage01Selected && isImage02Selected)
        {
            if (uiPanel != null)
                uiPanel.SetActive(true);
        }
        // Case 4: No images selected
        else
        {
            Debug.Log("No level selected!");
        }
    }

    // Method to close the UI panel
    public void ClosePanel()
    {
        if (uiPanel != null)
            uiPanel.SetActive(false);
    }
}