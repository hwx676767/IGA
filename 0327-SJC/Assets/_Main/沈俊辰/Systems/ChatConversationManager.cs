using System;
using UnityEngine;

/// <summary>
/// Tracks current chat session context for voice / UI systems.
/// </summary>
public class ChatConversationManager : MonoBehaviour
{
    public static ChatConversationManager Instance { get; private set; }

    public string CurrentTargetId { get; private set; }
    public string CurrentChatFileId { get; private set; }

    public event Action<string, string> OnConversationStarted;
    public event Action<string, string> OnNodeCompleted;

    private void Awake()
    {
        if (Instance != null && Instance != this)
        {
            Destroy(gameObject);
            return;
        }

        Instance = this;
        DontDestroyOnLoad(gameObject);
    }

    public void BeginConversation(string targetId, string chatFileId)
    {
        CurrentTargetId = targetId;
        CurrentChatFileId = chatFileId;
        OnConversationStarted?.Invoke(targetId, chatFileId);
    }

    public void MarkNodeComplete(string targetId, string nodeId)
    {
        var relationship = TargetRelationshipManager.Instance?.GetRelationship(targetId);
        if (relationship != null)
            relationship.lastChatNodeId = nodeId;

        OnNodeCompleted?.Invoke(targetId, nodeId);
    }
}
