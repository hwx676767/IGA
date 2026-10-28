using UnityEngine;
using UnityEngine.UI;
using TMPro;
using System.Collections.Generic;

public class DialogueManager : MonoBehaviour
{
    public static DialogueManager Instance;

    [Header("UI 引用")]
    public GameObject dialoguePanel;          // 对话面板
    public GameObject mainPanel;              

    //public TMP_Text speakerNameText;
    public TMP_Text dialogueText;
    public Image avatarImage;

    [Header("头像资源")]
    public Sprite playerAvatarSprite;

    [System.Serializable]
    public class NPCDialogueData
    {
        public string npcName;
        public Sprite npcAvatarSprite;
        public TextAsset dialogueFile;
    }
    public NPCDialogueData[] npcDialogues;

    private List<DialogueLine> currentDialogueLines = new List<DialogueLine>();
    private int currentLineIndex = 0;
    private Sprite currentNPCAvatar;

    public bool IsDialogueActive { get; private set; } = false;

    private struct DialogueLine
    {
        public string speaker;
        public string text;
    }

    private void Awake()
    {
        if (Instance == null)
            Instance = this;
        else
            Destroy(gameObject);

        dialoguePanel.SetActive(false);
        // 主界面默认应该是打开的
        if (mainPanel != null)
            mainPanel.SetActive(true);
    }

    private string currentNpcName;

    /// <summary>
    /// 开始对话
    /// </summary>
    public void StartDialogue(string npcName)
    {
        currentNpcName = npcName;
        NPCDialogueData data = null;
        foreach (var d in npcDialogues)
        {
            if (d.npcName == npcName)
            {
                data = d;
                break;
            }
        }

        if (data == null || data.dialogueFile == null)
        {
            Debug.LogWarning($"未找到NPC: {npcName} 的对话文件！");
            return;
        }

        currentNPCAvatar = data.npcAvatarSprite;

        ParseDialogueFile(data.dialogueFile);

        if (currentDialogueLines.Count == 0)
        {
            Debug.LogWarning("对话文件解析失败，没有任何对话内容！");
            return;
        }

        // === 关键修改：开始对话时关闭主界面 ===
        if (mainPanel != null)
            mainPanel.SetActive(false);

        currentLineIndex = 0;
        IsDialogueActive = true;
        dialoguePanel.SetActive(true);

        DisplayCurrentLine();
    }

    private void ParseDialogueFile(TextAsset file)
    {
        currentDialogueLines.Clear();
        if (file == null) return;

        string[] separators = { "\r\n", "\r", "\n" };
        string[] lines = file.text.Split(separators, System.StringSplitOptions.RemoveEmptyEntries);

        foreach (string rawLine in lines)
        {
            string line = rawLine.Trim();
            if (string.IsNullOrEmpty(line)) continue;

            int splitIndex = -1;
            int colonIndex = line.IndexOf(':');
            int fullColonIndex = line.IndexOf('：');

            if (colonIndex >= 0 && (fullColonIndex == -1 || colonIndex < fullColonIndex))
                splitIndex = colonIndex;
            else if (fullColonIndex >= 0)
                splitIndex = fullColonIndex;

            if (splitIndex >= 0)
            {
                string speaker = line.Substring(0, splitIndex).Trim();
                string text = line.Substring(splitIndex + 1).Trim();

                if (!string.IsNullOrEmpty(speaker) && !string.IsNullOrEmpty(text))
                {
                    currentDialogueLines.Add(new DialogueLine { speaker = speaker, text = text });
                }
            }
        }
    }

    private void DisplayCurrentLine()
    {
        if (currentLineIndex >= currentDialogueLines.Count) return;

        var line = currentDialogueLines[currentLineIndex];

        //speakerNameText.text = line.speaker + "：";
        dialogueText.text = line.text;

        // 切换头像
        if (IsPlayerSpeaker(line.speaker))
        {
            avatarImage.sprite = playerAvatarSprite;
        }
        else
        {
            avatarImage.sprite = currentNPCAvatar;
        }
    }

    private bool IsPlayerSpeaker(string speaker)
    {
        if (string.IsNullOrEmpty(speaker)) return false;
        string s = speaker.ToLower().Trim();
        return s == "player" || s == "主角" || s.Contains("player") || s.Contains("主角");
    }

    private void NextLine()
    {
        currentLineIndex++;

        if (currentLineIndex < currentDialogueLines.Count)
        {
            DisplayCurrentLine();
        }
        else
        {
            EndDialogue();
        }
    }

    private void EndDialogue()
    {
        IsDialogueActive = false;
        dialoguePanel.SetActive(false);

        if (mainPanel != null)
            mainPanel.SetActive(true);

        GrantDialogueClues(currentNpcName);
        currentNpcName = null;
        currentDialogueLines.Clear();
    }

    private void GrantDialogueClues(string npcName)
    {
        if (string.IsNullOrEmpty(npcName))
            return;

        var progress = ClueProgress.Ensure();
        string n = npcName.Trim().ToLower();
        if (n == "carol")
        {
            progress.UnlockClue("clue_i_am_unknown");
            progress.UnlockClue("clue_shelter_rules");
            progress.UnlockClue("clue_mysterious_diary");
        }
        else if (n == "joanne")
        {
            progress.UnlockClue("clue_gig_life");
        }
        else if (n == "wayne")
        {
            progress.UnlockClue("clue_anniversary_gift");
            progress.UnlockClue("clue_scanner");
            progress.UnlockClue("clue_trouble_classification");
        }
    }

    private void Update()
    {
        if (IsDialogueActive && Input.GetKeyDown(KeyCode.C))
        {
            NextLine();
        }
    }
}