using System;
using System.Collections.Generic;
using UnityEngine;

/// <summary>
/// Tracks unlocked mind-map clues and inferences.
/// </summary>
public class ClueProgress : MonoBehaviour
{
    public static ClueProgress Instance { get; private set; }

    public static event Action<string> OnClueUnlocked;
    public static event Action<InferenceRule> OnInferenceUnlocked;

    private readonly HashSet<string> unlockedClues = new HashSet<string>();
    private readonly HashSet<string> unlockedInferences = new HashSet<string>();

    void Awake()
    {
        if (Instance != null && Instance != this)
        {
            Destroy(this);
            return;
        }
        Instance = this;
    }

    public static ClueProgress Ensure()
    {
        if (Instance != null) return Instance;
        var go = new GameObject("ClueProgress");
        DontDestroyOnLoad(go);
        return go.AddComponent<ClueProgress>();
    }

    void OnDestroy()
    {
        if (Instance == this)
            Instance = null;
    }

    public bool HasClue(string clueId)
    {
        return !string.IsNullOrEmpty(clueId) && unlockedClues.Contains(clueId);
    }

    public bool HasInference(string inferenceId)
    {
        return !string.IsNullOrEmpty(inferenceId) && unlockedInferences.Contains(inferenceId);
    }

    public bool UnlockClue(string clueId)
    {
        if (string.IsNullOrEmpty(clueId)) return false;
        if (!unlockedClues.Add(clueId)) return false;
        OnClueUnlocked?.Invoke(clueId);
        return true;
    }

    public bool UnlockInference(InferenceRule rule)
    {
        if (rule == null) return false;
        string key = string.IsNullOrEmpty(rule.inferenceId) ? rule.name : rule.inferenceId;
        if (!unlockedInferences.Add(key)) return false;
        OnInferenceUnlocked?.Invoke(rule);
        return true;
    }

    public IReadOnlyCollection<string> GetUnlockedClues() => unlockedClues;
    public IReadOnlyCollection<string> GetUnlockedInferences() => unlockedInferences;

    /// <summary>Debug: wipe all progress without firing unlock events.</summary>
    public void ClearAll()
    {
        unlockedClues.Clear();
        unlockedInferences.Clear();
    }
}
