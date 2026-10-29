using UnityEngine;
using TMPro;
using System.Collections;
using System.Collections.Generic;

public class DialogueManager : MonoBehaviour
{
    [Header("UI组件 - Text Mesh Pro")]
    public GameObject dialoguePanel;
    public TMP_Text dialogueText;
    public TMP_Text speakerNameText;
    public UnityEngine.UI.Image speakerImage; // Image保持不变

    [Header("设置")]
    public KeyCode continueKey = KeyCode.N;
    public float typingSpeed = 0.05f;

    private Queue<DialogueLine> dialogueQueue;
    private bool isDialogueActive = false;
    private bool isTyping = false;
    private string currentSentence;
    private Coroutine typingCoroutine;

    public static DialogueManager Instance { get; private set; }

    void Awake()
    {
        if (Instance == null)
        {
            Instance = this;
            DontDestroyOnLoad(gameObject);
        }
        else
        {
            Destroy(gameObject);
        }

        dialogueQueue = new Queue<DialogueLine>();
        if (dialoguePanel != null)
            dialoguePanel.SetActive(false);
    }

    void Update()
    {
        if (isDialogueActive && Input.GetKeyDown(continueKey))
        {
            if (isTyping)
            {
                CompleteSentence();
            }
            else
            {
                DisplayNextSentence();
            }
        }
    }

    public void StartDialogue(Dialogue dialogue)
    {
        if (dialoguePanel == null || dialogueText == null)
        {
            Debug.LogError("UI组件未设置！");
            return;
        }

        Time.timeScale = 0f;
        dialogueQueue.Clear();

        foreach (DialogueLine line in dialogue.lines)
        {
            dialogueQueue.Enqueue(line);
        }

        dialoguePanel.SetActive(true);
        isDialogueActive = true;

        DisplayNextSentence();
    }

    public void DisplayNextSentence()
    {
        if (dialogueQueue.Count == 0)
        {
            EndDialogue();
            return;
        }

        DialogueLine line = dialogueQueue.Dequeue();
        currentSentence = line.text;

        // 更新说话者信息
        if (speakerNameText != null)
            speakerNameText.text = line.speakerName;

        if (speakerImage != null && line.speakerImage != null)
            speakerImage.sprite = line.speakerImage;

        typingCoroutine = StartCoroutine(TypeSentence(currentSentence));
    }

    IEnumerator TypeSentence(string sentence)
    {
        isTyping = true;
        dialogueText.text = "";

        // 支持Text Mesh Pro的富文本标签
        foreach (char letter in sentence.ToCharArray())
        {
            dialogueText.text += letter;
            yield return new WaitForSecondsRealtime(typingSpeed);
        }

        isTyping = false;
    }

    void CompleteSentence()
    {
        if (typingCoroutine != null)
            StopCoroutine(typingCoroutine);

        dialogueText.text = currentSentence;
        isTyping = false;
    }

    void EndDialogue()
    {
        Time.timeScale = 1f;
        
        if (dialoguePanel != null)
            dialoguePanel.SetActive(false);
        
        isDialogueActive = false;
    }

    public bool IsDialogueActive()
    {
        return isDialogueActive;
    }

    // 可选：跳过整个对话的方法
    public void SkipDialogue()
    {
        if (isDialogueActive)
        {
            EndDialogue();
        }
    }
}