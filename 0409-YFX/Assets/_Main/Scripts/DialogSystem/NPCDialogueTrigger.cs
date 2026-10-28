using UnityEngine;

public class NPCDialogueTrigger : MonoBehaviour
{
    [Header("NPC 信息")]
    public string npcName;   // ← 这里设置对应NPC的名字（必须和DialogueManager里一致）

    private bool playerInRange = false;

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            playerInRange = true;
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            playerInRange = false;
        }
    }

    private void Update()
    {
        // 玩家在区域内 + 按C + 当前没有正在对话 → 启动对话
        if (playerInRange && Input.GetKeyDown(KeyCode.C) && !DialogueManager.Instance.IsDialogueActive)
        {
            DialogueManager.Instance.StartDialogue(npcName);
        }
    }
}