using UnityEngine;
using UnityEngine.UI;

public class TaskListManager : MonoBehaviour
{
    public GameObject taskPanel;

    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.C))
        {
            ToggleTaskPanel();
        }
    }

    private void ToggleTaskPanel()
    {
        if (taskPanel != null)
        {
            taskPanel.SetActive(!taskPanel.activeSelf);
        }
    }

    public void ChangeButtonTextColor(Button button)
    {
        Text buttonText = button.GetComponentInChildren<Text>(); 
        if (buttonText != null)
        {
            //Debug.unityLogger.Log(buttonText.text);
            buttonText.color = Color.gray; 
        }
    }
}