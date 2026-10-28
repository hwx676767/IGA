using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

/// <summary>
/// Listens to ConnectableUI links. When an InferenceRule's clues form one connected group, unlocks it.
/// </summary>
public class InferenceManager : MonoBehaviour
{
    [Header("规则")]
    public InferenceRule[] rules;

    [Header("结果展示（可选）")]
    public TextMeshProUGUI resultText;
    public GameObject resultPanel;

    private readonly HashSet<string> unlocked = new HashSet<string>();

    void OnEnable()
    {
        ConnectableUI.OnNodesConnected += HandleConnected;
    }

    void OnDisable()
    {
        ConnectableUI.OnNodesConnected -= HandleConnected;
    }

    private void HandleConnected(ConnectableUI a, ConnectableUI b)
    {
        EvaluateConnections();
    }

    /// <summary>Public so MindMapBoard can re-check after spawning nodes.</summary>
    public void EvaluateConnections()
    {
        if (rules == null || rules.Length == 0)
        {
            Debug.LogWarning("[InferenceManager] No rules assigned.");
            return;
        }

        var nodes = FindObjectsOfType<ConnectableUI>();
        var adj = new Dictionary<string, HashSet<string>>();

        foreach (var n in nodes)
        {
            if (n == null || !n.isActiveAndEnabled) continue;
            if (string.IsNullOrEmpty(n.clueId)) continue;
            if (!adj.ContainsKey(n.clueId))
                adj[n.clueId] = new HashSet<string>();
        }

        foreach (var n in nodes)
        {
            if (n == null || !n.isActiveAndEnabled) continue;
            if (string.IsNullOrEmpty(n.clueId)) continue;
            foreach (var c in n.Connections)
            {
                var other = c.start == n ? c.end : c.start;
                if (other == null || string.IsNullOrEmpty(other.clueId)) continue;
                adj[n.clueId].Add(other.clueId);
                if (!adj.ContainsKey(other.clueId))
                    adj[other.clueId] = new HashSet<string>();
                adj[other.clueId].Add(n.clueId);
            }
        }

        foreach (var rule in rules)
        {
            if (rule == null || rule.requiredClueIds == null || rule.requiredClueIds.Length == 0)
                continue;

            string key = string.IsNullOrEmpty(rule.inferenceId) ? rule.name : rule.inferenceId;
            if (unlocked.Contains(key)) continue;
            if (ClueProgress.Instance != null && ClueProgress.Instance.HasInference(key))
            {
                unlocked.Add(key);
                continue;
            }

            if (AreAllConnected(adj, rule.requiredClueIds))
            {
                unlocked.Add(key);
                ShowResult(rule);
                ClueProgress.Ensure().UnlockInference(rule);
                Debug.Log($"[InferenceManager] Unlocked: {rule.title}");
            }
        }
    }

    private static bool AreAllConnected(Dictionary<string, HashSet<string>> adj, string[] required)
    {
        var ids = new List<string>();
        foreach (var id in required)
        {
            if (!string.IsNullOrEmpty(id))
                ids.Add(id);
        }
        if (ids.Count == 0) return false;

        // Single clue rule: just needs to exist
        if (ids.Count == 1)
            return adj.ContainsKey(ids[0]);

        foreach (var id in ids)
        {
            if (!adj.ContainsKey(id))
                return false;
        }

        var visited = new HashSet<string>();
        var queue = new Queue<string>();
        queue.Enqueue(ids[0]);
        visited.Add(ids[0]);

        while (queue.Count > 0)
        {
            var cur = queue.Dequeue();
            if (!adj.TryGetValue(cur, out var neighbors)) continue;
            foreach (var nb in neighbors)
            {
                if (visited.Add(nb))
                    queue.Enqueue(nb);
            }
        }

        foreach (var id in ids)
        {
            if (!visited.Contains(id))
                return false;
        }
        return true;
    }

    private void ShowResult(InferenceRule rule)
    {
        string msg = $"<b>Inference: {rule.title}</b>\n\n{rule.resultBody}";
        if (resultPanel != null)
            resultPanel.SetActive(true);
        if (resultText != null)
            resultText.text = msg;
    }

    /// <summary>Debug: allow inferences to unlock again after a reset.</summary>
    public void ClearUnlockedCache()
    {
        unlocked.Clear();
        if (resultText != null)
            resultText.text = string.Empty;
        if (resultPanel != null)
            resultPanel.SetActive(false);
    }
}
