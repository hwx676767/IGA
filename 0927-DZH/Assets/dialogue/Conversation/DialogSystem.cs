using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class DialogSystem : MonoBehaviour
{
    [Header("UI Components")]
    public GameObject conversationPanel;
    public Text textLabel;
    public Text speakerNameText; 

    [Header("Dialogue Settings")]
    public TextAsset textFile;
    public float textSpeed = 0.05f;

    [Header("Control Keys")]
    public KeyCode continueKey = KeyCode.R;

    private List<string> textList = new List<string>();
    private int index;
    private bool textFinished;
    private bool isDialogueActive = false;
    private string currentSpeaker = ""; 

    public static DialogSystem Instance { get; private set; }

    private void Awake()
    {
        if (Instance == null)
        {
            Instance = this;
        }
        else
        {
            Destroy(gameObject);
            return;
        }

        if (textFile != null)
        {
            GetTextFromFile(textFile);
        }

        if (conversationPanel != null)
        {
            conversationPanel.SetActive(false);
        }
    }

    private void Update()
    {
        if (isDialogueActive)
        {
            if ((Input.GetKeyDown(continueKey) || ReadMessage.Instance.isTalk) && textFinished)
            {
                if (index >= textList.Count)
                {
                    EndDialogue();
                    return;
                }
                StartCoroutine(SetTextUI());
            }
            else if ((Input.GetKeyDown(continueKey) || ReadMessage.Instance.isTalk) && !textFinished)
            {
                // If text is not finished, immediately show the full line
                StopAllCoroutines();
                textLabel.text = textList[index];
                textFinished = true;
                index++;
            }
        }
    }

    public void StartDialogue(TextAsset dialogueFile)
    {
        // Pause the game
        Time.timeScale = 0f;

        GetTextFromFile(dialogueFile);
        index = 0;
        isDialogueActive = true;
        conversationPanel.SetActive(true);
        textFinished = true;
        currentSpeaker = "";

        StartCoroutine(SetTextUI());
    }

    void GetTextFromFile(TextAsset file)
    {
        textList.Clear();
        var lineData = file.text.Split('\n');

        foreach (var line in lineData)
        {
            if (!string.IsNullOrWhiteSpace(line.Trim()))
            {
                textList.Add(line.Trim());
            }
        }
    }

    IEnumerator SetTextUI()
    {
        textFinished = false;
        textLabel.text = "";

        // Check if the current line is a speaker tag
        if (index < textList.Count && textList[index].StartsWith("["))
        {
            string line = textList[index];
            if (line.EndsWith("]"))
            {
                // Extract speaker name between brackets
                currentSpeaker = line.Substring(1, line.Length - 2);

                // Update UI speaker name
                if (speakerNameText != null)
                {
                    speakerNameText.text = currentSpeaker;
                }

                index++;

                // If next line is also a speaker tag, skip displaying text
                if (index < textList.Count && textList[index].StartsWith("["))
                {
                    textFinished = true;
                    yield break;
                }
            }
        }

        if (index >= textList.Count)
        {
            EndDialogue();
            yield break;
        }

        // Display current dialogue text gradually
        string currentText = textList[index];
        for (int i = 0; i < currentText.Length; i++)
        {
            textLabel.text += currentText[i];
            yield return new WaitForSecondsRealtime(textSpeed);
        }

        textFinished = true;
        index++;
    }

    void EndDialogue()
    {
        Time.timeScale = 1f;
        isDialogueActive = false;
        conversationPanel.SetActive(false);
        index = 0;
        currentSpeaker = "";
        Debug.Log("Dialogue ended");
    }

    public bool IsDialogueActive()
    {
        return isDialogueActive;
    }

    // Force end the dialogue
    public void ForceEndDialogue()
    {
        EndDialogue();
    }

    // Set default dialogue file
    public void SetDefaultDialogueFile(TextAsset file)
    {
        textFile = file;
    }
}
