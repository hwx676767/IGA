using System;
using System.Collections.Generic;

/// <summary>
/// Serializable player stats for save/load and upgrade evaluation.
/// </summary>
[Serializable]
public class PlayerStatsData
{
    public float money;
    public float globalScandalLevel;
    public float detectability;      // higher = easier to be discovered
    public float deceptionPower;     // higher = easier to deceive
    public float beautyScore;
    public float socialClassRank;
    public float communicationSkill;
    public float emotionalIntelligence;
    public float crisisManagement;
    public string currentChapterId = "chapter_01";
    public string currentSceneId = "scene_home";
    public List<string> unlockedSceneIds = new List<string>();
    public List<string> completedCourseIds = new List<string>();
    public List<string> activeTargetIds = new List<string>();
}

[Serializable]
public class UpgradeDefinition
{
    public string upgradeId;
    public string displayName;
    public string description;
    public UpgradeTriggerType triggerType;
    public float requiredMoney;
    public float requiredAffection;
    public float requiredCommunicationSkill;
    public string requiredChapterId;

    public UpgradeEffectType effectType;
    public string targetSceneId;
    public PlayerStatModifier statModifier;
}

public enum UpgradeTriggerType
{
    Manual,
    AutoOnThreshold,
    ChapterComplete
}

public enum UpgradeEffectType
{
    SwitchScene,
    ModifyStats,
    UnlockFeature,
    Combined
}

[Serializable]
public class PlayerStatModifier
{
    public float moneyDelta;
    public float detectabilityDelta;
    public float deceptionPowerDelta;
    public float beautyScoreDelta;
    public float socialClassRankDelta;
    public float scandalLevelDelta;
    public float communicationSkillDelta;
    public float emotionalIntelligenceDelta;
    public float crisisManagementDelta;
}

[Serializable]
public class UpgradeDatabase
{
    public List<UpgradeDefinition> upgrades = new List<UpgradeDefinition>();
}
