using System;
using System.Collections.Generic;

/// <summary>
/// Chat script data loaded from local text/JSON files.
/// </summary>
[Serializable]
public class ChatMessage
{
    public string speakerId; // "player" | target character id | "system"
    public string text;
    public float delaySeconds;
    public List<ChatChoice> choices = new List<ChatChoice>();
    public ChatEffect effect;
}

[Serializable]
public class ChatChoice
{
    public string choiceId;
    public string label;
    public float affectionDelta;
    public float suspicionDelta;
    public float scandalDelta;
    public float moneyDelta;
    public string nextNodeId;
    public string requiredSkillId;
    public int requiredSkillLevel;
}

[Serializable]
public class ChatEffect
{
    public string voiceHint; // optional voice performance hint for player
    public bool triggersExposureCheck;
    public string unlockSceneId;
}

[Serializable]
public class ChatConversation
{
    public string conversationId;
    public string targetCharacterId;
    public string chapterId;
    public string startNodeId;
    public List<ChatNode> nodes = new List<ChatNode>();
}

[Serializable]
public class ChatNode
{
    public string nodeId;
    public List<ChatMessage> messages = new List<ChatMessage>();
}
