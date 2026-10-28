using System;
using System.Collections;
using UnityEngine;
using UnityEngine.SceneManagement;

/// <summary>
/// Evaluates player stats against upgrade definitions.
/// Supports scene switching and stat mutation upgrades.
/// </summary>
public class UpgradeSystem : MonoBehaviour
{
    public static UpgradeSystem Instance { get; private set; }

    [Header("References")]
    [SerializeField] private SceneTransitionManager sceneTransitionManager;

    public event Action<UpgradeDefinition> OnUpgradeApplied;
    public event Action<UpgradeDefinition> OnUpgradeRejected;

    private void Awake()
    {
        if (Instance != null && Instance != this)
        {
            Destroy(gameObject);
            return;
        }

        Instance = this;
    }

    private void OnEnable()
    {
        if (PlayerStats.Instance != null)
            PlayerStats.Instance.OnStatsChanged += HandleStatsChanged;
    }

    private void OnDisable()
    {
        if (PlayerStats.Instance != null)
            PlayerStats.Instance.OnStatsChanged -= HandleStatsChanged;
    }

    public bool TryApplyUpgrade(string upgradeId)
    {
        var loader = LocalTextDataLoader.Instance;
        var stats = PlayerStats.Instance;
        if (loader == null || stats == null)
            return false;

        var upgrade = loader.Upgrades.upgrades.Find(u => u.upgradeId == upgradeId);
        if (upgrade == null || !loader.MeetsRequirements(upgrade, stats.Data))
        {
            OnUpgradeRejected?.Invoke(upgrade);
            return false;
        }

        ApplyUpgradeEffects(upgrade);
        OnUpgradeApplied?.Invoke(upgrade);
        return true;
    }

    public void EvaluateAutoUpgrades()
    {
        var loader = LocalTextDataLoader.Instance;
        var stats = PlayerStats.Instance;
        if (loader == null || stats == null)
            return;

        foreach (var upgrade in loader.Upgrades.upgrades)
        {
            if (upgrade.triggerType != UpgradeTriggerType.AutoOnThreshold)
                continue;

            if (loader.MeetsRequirements(upgrade, stats.Data))
                ApplyUpgradeEffects(upgrade);
        }
    }

    private void HandleStatsChanged(PlayerStatsData data)
    {
        EvaluateAutoUpgrades();
    }

    private void ApplyUpgradeEffects(UpgradeDefinition upgrade)
    {
        var stats = PlayerStats.Instance;
        if (stats == null)
            return;

        switch (upgrade.effectType)
        {
            case UpgradeEffectType.SwitchScene:
                SwitchScene(upgrade.targetSceneId);
                break;

            case UpgradeEffectType.ModifyStats:
                stats.ApplyModifier(upgrade.statModifier);
                break;

            case UpgradeEffectType.UnlockFeature:
                if (!string.IsNullOrEmpty(upgrade.targetSceneId))
                    stats.UnlockScene(upgrade.targetSceneId);
                stats.ApplyModifier(upgrade.statModifier);
                break;

            case UpgradeEffectType.Combined:
                stats.ApplyModifier(upgrade.statModifier);
                if (!string.IsNullOrEmpty(upgrade.targetSceneId))
                    SwitchScene(upgrade.targetSceneId);
                break;
        }
    }

    private void SwitchScene(string sceneId)
    {
        if (string.IsNullOrEmpty(sceneId))
            return;

        PlayerStats.Instance?.SetCurrentScene(sceneId);

        if (sceneTransitionManager != null)
            sceneTransitionManager.LoadScene(sceneId);
        else
            SceneManager.LoadScene(sceneId);
    }
}
