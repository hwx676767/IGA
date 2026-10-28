using System;
using System.Collections.Generic;
using UnityEngine;

/// <summary>
/// Tracks affection / suspicion for each target and applies chat choice effects.
/// </summary>
public class TargetRelationshipManager : MonoBehaviour
{
    public static TargetRelationshipManager Instance { get; private set; }

    private readonly Dictionary<string, TargetRelationshipState> relationships = new Dictionary<string, TargetRelationshipState>();

    public event Action<TargetRelationshipState> OnRelationshipChanged;

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

    private void Start()
    {
        if (LocalTextDataLoader.Instance != null)
            LocalTextDataLoader.Instance.OnDataReloaded += InitializeFromCharacters;

        InitializeFromCharacters();
    }

    private void OnDestroy()
    {
        if (LocalTextDataLoader.Instance != null)
            LocalTextDataLoader.Instance.OnDataReloaded -= InitializeFromCharacters;
    }

    public void InitializeFromCharacters()
    {
        relationships.Clear();
        var loader = LocalTextDataLoader.Instance;
        if (loader == null)
            return;

        foreach (var character in loader.Characters.characters)
        {
            relationships[character.id] = new TargetRelationshipState
            {
                targetId = character.id,
                affection = character.initialAffection,
                suspicion = character.initialSuspicion
            };
        }
    }

    public TargetRelationshipState GetRelationship(string targetId)
    {
        relationships.TryGetValue(targetId, out var state);
        return state;
    }

    public void ApplyChoiceEffects(string targetId, ChatChoice choice)
    {
        if (!relationships.TryGetValue(targetId, out var state) || choice == null)
            return;

        state.affection = Mathf.Clamp(state.affection + choice.affectionDelta, 0f, 100f);
        state.suspicion = Mathf.Clamp(state.suspicion + choice.suspicionDelta, 0f, 100f);
        state.lastChatNodeId = choice.nextNodeId;

        NotifyRelationshipChanged(targetId);
        SuspicionScandalManager.Instance?.ApplyGlobalScandal(choice.scandalDelta);
        SuspicionScandalManager.Instance?.ApplyTargetSuspicion(targetId, choice.suspicionDelta);
    }

    public void NotifyRelationshipChanged(string targetId)
    {
        if (relationships.TryGetValue(targetId, out var state))
            OnRelationshipChanged?.Invoke(state);
    }

    public List<TargetRelationshipState> GetActiveRelationships()
    {
        var result = new List<TargetRelationshipState>();
        var activeIds = PlayerStats.Instance?.Data.activeTargetIds;
        if (activeIds == null)
            return result;

        foreach (var id in activeIds)
        {
            if (relationships.TryGetValue(id, out var state))
                result.Add(state);
        }

        return result;
    }
}
