using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

/// <summary>
/// Renders chat nodes loaded from local JSON and dispatches choice effects
/// to relationship / scandal / upgrade systems.
/// </summary>
public class ChatUIController : MonoBehaviour
{
    [Header("UI")]
    [SerializeField] private Text speakerLabel;
    [SerializeField] private Text messageLabel;
    [SerializeField] private Transform choiceRoot;
    [SerializeField] private GameObject choiceButtonPrefab;
    [SerializeField] private UITransitionController transitionController;

    [Header("Typing")]
    [SerializeField] private float charactersPerSecond = 42f;
    [SerializeField] private bool useTypewriterEffect = true;

    private ChatConversation activeConversation;
    private string activeTargetId;
    private string currentNodeId;
    private int messageIndex;
    private bool isTyping;

    public void StartConversation(string targetId, string chatFileId)
    {
        activeTargetId = targetId;
        activeConversation = LocalTextDataLoader.Instance?.LoadChat(chatFileId);
        if (activeConversation == null)
        {
            Debug.LogWarning($"[ChatUIController] Chat not found: {chatFileId}");
            return;
        }

        currentNodeId = string.IsNullOrEmpty(activeConversation.startNodeId)
            ? activeConversation.nodes[0].nodeId
            : activeConversation.startNodeId;

        messageIndex = 0;
        DisplayCurrentNode();
    }

    private void DisplayCurrentNode()
    {
        var node = FindNode(currentNodeId);
        if (node == null || node.messages.Count == 0)
            return;

        StopAllCoroutines();
        StartCoroutine(DisplayMessageRoutine(node.messages[messageIndex]));
    }
    private IEnumerator DisplayMessageRoutine(ChatMessage message)
    {
        ClearChoices();
        SetSpeakerLabel(message.speakerId);

        if (useTypewriterEffect)
        {
            isTyping = true;
            messageLabel.text = string.Empty;
            foreach (var ch in message.text)
            {
                messageLabel.text += ch;
                yield return new WaitForSeconds(1f / charactersPerSecond);
            }

            isTyping = false;
        }
        else
        {
            messageLabel.text = message.text;
        }

        if (message.delaySeconds > 0f)
            yield return new WaitForSeconds(message.delaySeconds);

        if (message.choices != null && message.choices.Count > 0)
        {
            BuildChoices(message.choices);
            yield break;
        }

        yield return AdvanceOrFinish(message);
    }

    private IEnumerator AdvanceOrFinish(ChatMessage message)
    {
        ApplyPassiveEffects(message.effect);

        var node = FindNode(currentNodeId);
        messageIndex++;

        if (node != null && messageIndex < node.messages.Count)
        {
            DisplayCurrentNode();
            yield break;
        }

        ChatConversationManager.Instance?.MarkNodeComplete(activeTargetId, currentNodeId);
    }

    private void BuildChoices(List<ChatChoice> choices)
    {
        ClearChoices();

        foreach (var choice in choices)
        {
            if (!CanSelectChoice(choice))
                continue;

            var buttonObj = Instantiate(choiceButtonPrefab, choiceRoot);
            var label = buttonObj.GetComponentInChildren<Text>();
            if (label != null)
                label.text = choice.label;

            var button = buttonObj.GetComponent<Button>();
            if (button != null)
            {
                var captured = choice;
                button.onClick.AddListener(() => OnChoiceSelected(captured));
                transitionController?.PlayButtonPulse(button);
            }
        }
    }

    private bool CanSelectChoice(ChatChoice choice)
    {
        if (string.IsNullOrEmpty(choice.requiredSkillId))
            return true;

        var stats = PlayerStats.Instance?.Data;
        if (stats == null)
            return false;

        switch (choice.requiredSkillId)
        {
            case "communication":
                return stats.communicationSkill >= choice.requiredSkillLevel;
            case "emotional_intelligence":
                return stats.emotionalIntelligence >= choice.requiredSkillLevel;
            case "crisis_management":
                return stats.crisisManagement >= choice.requiredSkillLevel;
            default:
                return true;
        }
    }

    private void OnChoiceSelected(ChatChoice choice)
    {
        TargetRelationshipManager.Instance?.ApplyChoiceEffects(activeTargetId, choice);
        SuspicionScandalManager.Instance?.ApplyGlobalScandal(choice.scandalDelta);
        PlayerStats.Instance?.ApplyMoneyDelta(choice.moneyDelta);

        if (!string.IsNullOrEmpty(choice.nextNodeId))
        {
            currentNodeId = choice.nextNodeId;
            messageIndex = 0;
            DisplayCurrentNode();
            return;
        }

        ChatConversationManager.Instance?.MarkNodeComplete(activeTargetId, currentNodeId);
    }

    private void ApplyPassiveEffects(ChatEffect effect)
    {
        if (effect == null)
            return;

        if (effect.triggersExposureCheck)
            ExposureEventManager.Instance?.EvaluateExposure(activeTargetId);

        if (!string.IsNullOrEmpty(effect.unlockSceneId))
            PlayerStats.Instance?.UnlockScene(effect.unlockSceneId);
    }

    private ChatNode FindNode(string nodeId)
    {
        return activeConversation?.nodes.Find(n => n.nodeId == nodeId);
    }

    private void SetSpeakerLabel(string speakerId)
    {
        if (speakerLabel == null)
            return;

        if (speakerId == "player")
        {
            speakerLabel.text = "You";
            return;
        }

        if (speakerId == "system")
        {
            speakerLabel.text = "System";
            return;
        }

        var profile = LocalTextDataLoader.Instance?.GetCharacter(speakerId);
        speakerLabel.text = profile != null ? profile.displayName : speakerId;
    }

    private void ClearChoices()
    {
        if (choiceRoot == null)
            return;

        foreach (Transform child in choiceRoot)
            Destroy(child.gameObject);
    }
}
