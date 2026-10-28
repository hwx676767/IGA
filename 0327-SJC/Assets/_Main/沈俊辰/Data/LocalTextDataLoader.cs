using System;
using System.Collections.Generic;
using System.IO;
using UnityEngine;

/// <summary>
/// Loads character profiles, chat scripts, and upgrade tables from StreamingAssets.
/// Large narrative content stays in local files instead of hard-coded in scenes.
/// </summary>
public class LocalTextDataLoader : MonoBehaviour
{
    public static LocalTextDataLoader Instance { get; private set; }

    [Header("Paths (relative to StreamingAssets)")]
    [SerializeField] private string charactersFile = "LifeMatch/characters.json";
    [SerializeField] private string upgradesFile = "LifeMatch/upgrades.json";
    [SerializeField] private string coursesFile = "LifeMatch/courses.json";
    [SerializeField] private string chatFolder = "LifeMatch/chats";

    public CharacterDatabase Characters { get; private set; } = new CharacterDatabase();
    public UpgradeDatabase Upgrades { get; private set; } = new UpgradeDatabase();
    public CourseDatabase Courses { get; private set; } = new CourseDatabase();

    private readonly Dictionary<string, ChatConversation> chatCache = new Dictionary<string, ChatConversation>();

    public event Action OnDataReloaded;

    private void Awake()
    {
        if (Instance != null && Instance != this)
        {
            Destroy(gameObject);
            return;
        }

        Instance = this;
        DontDestroyOnLoad(gameObject);
        ReloadAll();
    }

    public void ReloadAll()
    {
        Characters = LoadJson<CharacterDatabase>(charactersFile) ?? new CharacterDatabase();
        Upgrades = LoadJson<UpgradeDatabase>(upgradesFile) ?? new UpgradeDatabase();
        Courses = LoadJson<CourseDatabase>(coursesFile) ?? new CourseDatabase();
        chatCache.Clear();
        OnDataReloaded?.Invoke();
    }

    public CharacterProfile GetCharacter(string characterId)
    {
        return Characters.characters.Find(c => c.id == characterId);
    }

    public ChatConversation LoadChat(string chatFileId)
    {
        if (chatCache.TryGetValue(chatFileId, out var cached))
            return cached;

        var path = Path.Combine(chatFolder, chatFileId + ".json");
        var conversation = LoadJson<ChatConversation>(path);
        if (conversation != null)
            chatCache[chatFileId] = conversation;

        return conversation;
    }

    /// <summary>
    /// Load plain-text script files for long-form narrative blocks.
    /// </summary>
    public string LoadPlainText(string relativePath)
    {
        var fullPath = Path.Combine(Application.streamingAssetsPath, relativePath);
        if (!File.Exists(fullPath))
        {
            Debug.LogWarning($"[LocalTextDataLoader] Missing text file: {fullPath}");
            return string.Empty;
        }

        return File.ReadAllText(fullPath);
    }

    public List<UpgradeDefinition> GetAvailableUpgrades(PlayerStatsData stats)
    {
        var result = new List<UpgradeDefinition>();
        foreach (var upgrade in Upgrades.upgrades)
        {
            if (MeetsRequirements(upgrade, stats))
                result.Add(upgrade);
        }

        return result;
    }

    public bool MeetsRequirements(UpgradeDefinition upgrade, PlayerStatsData stats)
    {
        if (!string.IsNullOrEmpty(upgrade.requiredChapterId) &&
            upgrade.requiredChapterId != stats.currentChapterId)
            return false;

        if (stats.money < upgrade.requiredMoney)
            return false;

        if (stats.communicationSkill < upgrade.requiredCommunicationSkill)
            return false;

        return true;
    }

    private static T LoadJson<T>(string relativePath) where T : class
    {
        var fullPath = Path.Combine(Application.streamingAssetsPath, relativePath);
        if (!File.Exists(fullPath))
        {
            Debug.LogWarning($"[LocalTextDataLoader] Missing JSON: {fullPath}");
            return null;
        }

        try
        {
            var json = File.ReadAllText(fullPath);
            return JsonUtility.FromJson<T>(json);
        }
        catch (Exception ex)
        {
            Debug.LogError($"[LocalTextDataLoader] Failed to parse {fullPath}: {ex.Message}");
            return null;
        }
    }
}
