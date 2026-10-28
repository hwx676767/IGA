using System;
using UnityEngine;

/// <summary>
/// Global scandal pressure + per-target suspicion meters from the design doc.
/// </summary>
public class SuspicionScandalManager : MonoBehaviour
{
    public static SuspicionScandalManager Instance { get; private set; }

    [Header("Thresholds")]
    [SerializeField] private float scandalCollapseThreshold = 85f;
    [SerializeField] private float targetBlockThreshold = 75f;

    public event Action<float> OnScandalChanged;
    public event Action OnScandalCollapsed;

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

    public void ApplyGlobalScandal(float delta)
    {
        var stats = PlayerStats.Instance;
        if (stats == null || Mathf.Approximately(delta, 0f))
            return;

        stats.ApplyModifier(new PlayerStatModifier { scandalLevelDelta = delta });
        OnScandalChanged?.Invoke(stats.Data.globalScandalLevel);

        if (stats.Data.globalScandalLevel >= scandalCollapseThreshold)
            OnScandalCollapsed?.Invoke();
    }

    public void ApplyTargetSuspicion(string targetId, float delta)
    {
        var relationship = TargetRelationshipManager.Instance?.GetRelationship(targetId);
        if (relationship == null)
            return;

        relationship.suspicion = Mathf.Clamp(relationship.suspicion + delta, 0f, 100f);

        if (relationship.suspicion >= targetBlockThreshold)
            relationship.isBlocked = true;

        TargetRelationshipManager.Instance.NotifyRelationshipChanged(targetId);
    }

    public float GetExposureChance(string targetId)
    {
        var stats = PlayerStats.Instance?.Data;
        var relationship = TargetRelationshipManager.Instance?.GetRelationship(targetId);
        if (stats == null || relationship == null)
            return 0f;

        var detectFactor = stats.detectability * 0.35f;
        var scandalFactor = stats.globalScandalLevel * 0.35f;
        var suspicionFactor = relationship.suspicion * 0.3f;
        var deceptionMitigation = stats.deceptionPower * 0.25f;

        return Mathf.Clamp01((detectFactor + scandalFactor + suspicionFactor - deceptionMitigation) / 100f);
    }
}
