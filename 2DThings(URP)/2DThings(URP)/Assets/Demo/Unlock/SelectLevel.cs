using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class SelectLevel : MonoBehaviour
{
    // Reference to the level selection panel
    public GameObject selectPanel;
    // Array to store level buttons
    private Button[] levelButtons;
    // Number of unlocked levels
    private int unlockedLevelCount;

    void Start()
    {
        // Retrieve the number of unlocked levels from PlayerPrefs
        unlockedLevelCount = PlayerPrefs.GetInt("unlockBtnInt", 1); // Default to 1 if not set

        // Initialize the level buttons array
        levelButtons = new Button[selectPanel.transform.childCount];

        // Populate the buttons array and set their text
        for (int i = 0; i < levelButtons.Length; i++)
        {
            // Set the button text to display level number (1-based)
            Text buttonText = selectPanel.transform.GetChild(i).GetChild(0).GetComponent<Text>();
            buttonText.text = (i + 1).ToString();
            levelButtons[i] = selectPanel.transform.GetChild(i).GetComponent<Button>();
        }

        // Disable all buttons by default and add click listeners
        foreach (var button in levelButtons)
        {
            button.interactable = false;
            button.onClick.AddListener(() =>
            {
                // Get the level number from the button's text
                Text text = button.GetComponentInChildren<Text>();
                int levelNumber = int.Parse(text.text);
                // Save the selected level number
                PlayerPrefs.SetInt("levelNum", levelNumber);
                // Load the game scene (Scene 1)
                SceneManager.LoadScene(1);
            });
        }

        // Enable buttons for unlocked levels
        for (int i = 0; i < Mathf.Min(unlockedLevelCount, levelButtons.Length); i++)
        {
            levelButtons[i].interactable = true;
        }
    }

    // Quit the application
    public void QuitGame()
    {
        Application.Quit();
    }
}