using System;
using System.Collections.Generic;
using System.IO;
using UnityEngine;

/// <summary>
/// One dialogue option. RequestItemId records a named demand for classroom trade; GiveItemId is unused in the field.
/// </summary>
public sealed class CampusStoryChoice
{
    public readonly string Label;
    public readonly int FavorChange;
    public readonly string Result;
    public readonly string RequestItemId;
    public readonly string GiveItemId;
    public readonly string FailResult;

    public CampusStoryChoice(string label, int favorChange, string result, string requestItemId = null, string giveItemId = null, string failResult = null)
    {
        Label = label;
        FavorChange = favorChange;
        Result = result;
        RequestItemId = requestItemId;
        GiveItemId = giveItemId;
        FailResult = failResult;
    }
}

public sealed class CampusStoryBeat
{
    public readonly string Id;
    public readonly string[] Lines;
    public readonly CampusStoryChoice[] Choices;

    public CampusStoryBeat(string id, string[] lines, params CampusStoryChoice[] choices)
    {
        Id = id;
        Lines = lines ?? Array.Empty<string>();
        Choices = choices ?? Array.Empty<CampusStoryChoice>();
    }
}

/// <summary>
/// Loads story text from StreamingAssets/Dialogue/campus_story.json so non-programmers can edit lines
/// without touching C#. Placeholders: {itemName}, {stageLabel}, {trust}, {itemId}.
/// </summary>
public static class CampusStoryScript
{
    private const string RelativePath = "Dialogue/campus_story.json";

    private static CampusStoryFile data;
    private static bool loadAttempted;
    private static string loadError;

    [Serializable]
    private sealed class CampusStoryFile
    {
        public WantedItemRow[] wantedItems;
        public BeatRow[] beats;
        public string trustEnough;
        public string trustNotEnough;
    }

    [Serializable]
    private sealed class WantedItemRow
    {
        public string actorId;
        public string elementary;
        public string middle;
        public string high;
    }

    [Serializable]
    private sealed class BeatRow
    {
        public string id;
        public string actorId;
        public string kind;
        public string[] lines;
        public ChoiceRow[] choices;
    }

    [Serializable]
    private sealed class ChoiceRow
    {
        public string label;
        public int favorChange;
        public string result;
        public bool requestWantedItem;
        public string giveItemId;
        public string failResult;
    }

    public static string WantedItemId(string actorId, string stageLabel)
    {
        EnsureLoaded();
        if (data?.wantedItems == null)
            return null;

        foreach (var row in data.wantedItems)
        {
            if (row == null || row.actorId != actorId)
                continue;

            if (stageLabel == "Elementary")
                return row.elementary;
            if (stageLabel == "Middle")
                return row.middle;
            return row.high;
        }

        return null;
    }

    public static CampusStoryBeat Intro(string actorId, string stageLabel, string itemName, string itemId)
    {
        return BuildBeat(actorId, "intro", stageLabel, itemName, itemId, null);
    }

    public static CampusStoryBeat Quest(string actorId, string itemName, bool hasItem, string stageLabel = null)
    {
        return BuildBeat(actorId, hasItem ? "quest_ready" : "quest_missing", stageLabel, itemName, null, null);
    }

    public static CampusStoryBeat Daily(string actorId, string stageLabel, string itemName, bool waitingForItem, bool delivered)
    {
        var kind = waitingForItem ? "daily_waiting" : delivered ? "daily_done" : "daily_idle";
        return BuildBeat(actorId, kind, stageLabel, itemName, null, null);
    }

    public static CampusStoryBeat Finale(string actorId, string stageLabel, string itemName, bool enoughTrust)
    {
        EnsureLoaded();
        var trust = enoughTrust
            ? (data?.trustEnough ?? "You've been delivering off the list these past few days.")
            : (data?.trustNotEnough ?? "The list isn't complete yet, but you can see where this path leads.");
        return BuildBeat(actorId, "finale", stageLabel, itemName, null, trust);
    }

    /// <summary>Force reload after editing the JSON while the Editor is open.</summary>
    public static void Reload()
    {
        data = null;
        loadAttempted = false;
        loadError = null;
        EnsureLoaded();
    }

    private static CampusStoryBeat BuildBeat(
        string actorId,
        string kind,
        string stageLabel,
        string itemName,
        string itemId,
        string trust)
    {
        EnsureLoaded();
        var row = FindBeat(actorId, kind);
        if (row == null)
        {
            Debug.LogError($"Campus story beat missing: actor={actorId}, kind={kind}. {loadError}");
            return new CampusStoryBeat($"{actorId}_{kind}", new[] { "(Missing dialogue data.)" });
        }

        if (string.IsNullOrEmpty(itemId))
            itemId = WantedItemId(actorId, stageLabel ?? "Elementary");

        var lines = ApplyAll(row.lines, itemName, stageLabel, itemId, trust);
        var choices = BuildChoices(row.choices, itemName, stageLabel, itemId, trust);
        return new CampusStoryBeat(string.IsNullOrEmpty(row.id) ? $"{actorId}_{kind}" : row.id, lines, choices);
    }

    private static CampusStoryChoice[] BuildChoices(
        ChoiceRow[] rows,
        string itemName,
        string stageLabel,
        string itemId,
        string trust)
    {
        if (rows == null || rows.Length == 0)
            return Array.Empty<CampusStoryChoice>();

        var list = new List<CampusStoryChoice>(rows.Length);
        foreach (var row in rows)
        {
            if (row == null)
                continue;

            var requestId = row.requestWantedItem ? itemId : null;
            list.Add(new CampusStoryChoice(
                Apply(row.label, itemName, stageLabel, itemId, trust),
                row.favorChange,
                Apply(row.result, itemName, stageLabel, itemId, trust),
                requestId,
                string.IsNullOrEmpty(row.giveItemId) ? null : row.giveItemId,
                string.IsNullOrEmpty(row.failResult) ? null : Apply(row.failResult, itemName, stageLabel, itemId, trust)));
        }

        return list.ToArray();
    }

    private static BeatRow FindBeat(string actorId, string kind)
    {
        if (data?.beats == null)
            return null;

        foreach (var beat in data.beats)
        {
            if (beat != null && beat.actorId == actorId && beat.kind == kind)
                return beat;
        }

        return null;
    }

    private static string[] ApplyAll(string[] source, string itemName, string stageLabel, string itemId, string trust)
    {
        if (source == null || source.Length == 0)
            return Array.Empty<string>();

        var result = new string[source.Length];
        for (var i = 0; i < source.Length; i++)
            result[i] = Apply(source[i], itemName, stageLabel, itemId, trust);
        return result;
    }

    private static string Apply(string text, string itemName, string stageLabel, string itemId, string trust)
    {
        if (string.IsNullOrEmpty(text))
            return string.Empty;

        return text
            .Replace("{itemName}", itemName ?? string.Empty)
            .Replace("{stageLabel}", stageLabel ?? string.Empty)
            .Replace("{itemId}", itemId ?? string.Empty)
            .Replace("{trust}", trust ?? string.Empty);
    }

    private static void EnsureLoaded()
    {
        if (loadAttempted)
            return;

        loadAttempted = true;
        var path = Path.Combine(Application.streamingAssetsPath, RelativePath);
        if (!File.Exists(path))
        {
            loadError = $"Story file not found: {path}";
            Debug.LogError(loadError);
            return;
        }

        try
        {
            var json = File.ReadAllText(path);
            data = JsonUtility.FromJson<CampusStoryFile>(json);
            if (data == null || data.beats == null || data.beats.Length == 0)
            {
                loadError = "Story JSON parsed empty.";
                Debug.LogError(loadError);
            }
        }
        catch (Exception ex)
        {
            loadError = ex.Message;
            Debug.LogError($"Failed to load campus story JSON: {ex.Message}");
        }
    }
}
