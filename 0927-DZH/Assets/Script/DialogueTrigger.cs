using UnityEngine;

public class DialogueTrigger : MonoBehaviour
{
    [Header("对话文件")]
    public TextAsset dialogueFile;

    [Header("设置")]
    public bool oneTimeOnly = true;

    private bool hasTriggered = false;

    void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player") && (!hasTriggered || !oneTimeOnly))
        {
            if (DialogSystem.Instance != null && dialogueFile != null)
            {
                DialogSystem.Instance.StartDialogue(dialogueFile);
                hasTriggered = true;
            }
        }
    }

    void OnDrawGizmosSelected()
    {
        Gizmos.color = Color.cyan;
        Collider collider = GetComponent<Collider>();
        if (collider != null && collider.isTrigger)
        {
            if (collider is BoxCollider boxCollider)
            {
                Gizmos.matrix = transform.localToWorldMatrix;
                Gizmos.DrawWireCube(boxCollider.center, boxCollider.size);
            }
        }
    }

    [ContextMenu("测试对话")]
    public void TestDialogue()
    {
        if (dialogueFile != null)
        {
            DialogSystem.Instance.StartDialogue(dialogueFile);
        }
    }

    [ContextMenu("重置触发")]
    public void ResetTrigger()
    {
        hasTriggered = false;
    }
}