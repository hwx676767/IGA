using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class SelectLevel : MonoBehaviour
{
    public GameObject selectPanel;
    private Button[] levelButtons;
    private int unlockedLevelCount;

    void Start()
    {
        unlockedLevelCount = PlayerPrefs.GetInt("unlockBtnInt", 1);

        if (selectPanel == null)
        {
            return;
        }

        levelButtons = new Button[selectPanel.transform.childCount];

        for (int i = 0; i < levelButtons.Length; i++)
        {
            levelButtons[i] = selectPanel.transform.GetChild(i).GetComponent<Button>();
            if (levelButtons[i] == null)
            {
                continue;
            }

            GameObject lockIndicator = selectPanel.transform.GetChild(i).GetChild(0).gameObject;
            lockIndicator.SetActive(false);
        }

        for (int i = 0; i < levelButtons.Length; i++)
        {
            int levelIndex = i + 1; 
            levelButtons[i].interactable = false; 
            levelButtons[i].onClick.RemoveAllListeners(); 
            levelButtons[i].onClick.AddListener(() =>
            {
                PlayerPrefs.SetInt("levelNum", levelIndex);
                SceneManager.LoadScene(levelIndex);
            });
        }

        for (int i = 0; i < levelButtons.Length; i++)
        {
            bool isUnlocked = i < unlockedLevelCount;
            levelButtons[i].interactable = isUnlocked;
            GameObject lockIndicator = selectPanel.transform.GetChild(i).GetChild(0).gameObject;
            lockIndicator.SetActive(!isUnlocked);
        }
    }

    public void QuitGame()
    {
        Application.Quit();
    }

}