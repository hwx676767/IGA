using System.IO;
using UnityEngine;

/// <summary>
/// Persists player stats and relationship states to local JSON.
/// </summary>
public class GameSaveManager : MonoBehaviour
{
    public static GameSaveManager Instance { get; private set; }

    [SerializeField] private string saveFileName = "life_match_save.json";

    private string SavePath => Path.Combine(Application.persistentDataPath, saveFileName);

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

    [System.Serializable]
    private class SavePayload
    {
        public PlayerStatsData stats;
    }

    public void SaveGame()
    {
        var payload = new SavePayload
        {
            stats = PlayerStats.Instance != null ? PlayerStats.Instance.Data : new PlayerStatsData()
        };

        var json = JsonUtility.ToJson(payload, true);
        File.WriteAllText(SavePath, json);
    }

    public bool LoadGame()
    {
        if (!File.Exists(SavePath))
            return false;

        var json = File.ReadAllText(SavePath);
        var payload = JsonUtility.FromJson<SavePayload>(json);
        PlayerStats.Instance?.Load(payload.stats);
        return true;
    }

    public void DeleteSave()
    {
        if (File.Exists(SavePath))
            File.Delete(SavePath);
    }
}
