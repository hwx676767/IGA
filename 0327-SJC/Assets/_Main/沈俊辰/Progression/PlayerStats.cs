using System;
using UnityEngine;

/// <summary>
/// Runtime wrapper around PlayerStatsData with change events for UI / systems.
/// </summary>
public class PlayerStats : MonoBehaviour
{
    public static PlayerStats Instance { get; private set; }

    [SerializeField] private PlayerStatsData data = new PlayerStatsData();

    public PlayerStatsData Data => data;

    public event Action<PlayerStatsData> OnStatsChanged;

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

    public void ApplyModifier(PlayerStatModifier modifier)
    {
        if (modifier == null)
            return;

        data.money += modifier.moneyDelta;
        data.detectability += modifier.detectabilityDelta;
        data.deceptionPower += modifier.deceptionPowerDelta;
        data.beautyScore += modifier.beautyScoreDelta;
        data.socialClassRank += modifier.socialClassRankDelta;
        data.globalScandalLevel += modifier.scandalLevelDelta;
        data.communicationSkill += modifier.communicationSkillDelta;
        data.emotionalIntelligence += modifier.emotionalIntelligenceDelta;
        data.crisisManagement += modifier.crisisManagementDelta;

        ClampValues();
        NotifyChanged();
    }

    public void ApplyMoneyDelta(float delta)
    {
        data.money += delta;
        ClampValues();
        NotifyChanged();
    }

    public void UnlockScene(string sceneId)
    {
        if (!data.unlockedSceneIds.Contains(sceneId))
            data.unlockedSceneIds.Add(sceneId);

        NotifyChanged();
    }

    public void SetChapter(string chapterId)
    {
        data.currentChapterId = chapterId;
        NotifyChanged();
    }

    public void SetCurrentScene(string sceneId)
    {
        data.currentSceneId = sceneId;
        NotifyChanged();
    }

    public void Load(PlayerStatsData saved)
    {
        data = saved ?? new PlayerStatsData();
        ClampValues();
        NotifyChanged();
    }

    private void ClampValues()
    {
        data.money = Mathf.Max(0f, data.money);
        data.globalScandalLevel = Mathf.Clamp(data.globalScandalLevel, 0f, 100f);
        data.detectability = Mathf.Clamp(data.detectability, 0f, 100f);
        data.deceptionPower = Mathf.Clamp(data.deceptionPower, 0f, 100f);
        data.beautyScore = Mathf.Clamp(data.beautyScore, 0f, 100f);
        data.socialClassRank = Mathf.Clamp(data.socialClassRank, 0f, 100f);
        data.communicationSkill = Mathf.Clamp(data.communicationSkill, 0f, 100f);
        data.emotionalIntelligence = Mathf.Clamp(data.emotionalIntelligence, 0f, 100f);
        data.crisisManagement = Mathf.Clamp(data.crisisManagement, 0f, 100f);
    }

    private void NotifyChanged()
    {
        OnStatsChanged?.Invoke(data);
    }
}
