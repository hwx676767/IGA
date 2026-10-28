using System;
using UnityEngine;

/// <summary>
/// Rolls exposure / collapse events when scandal or suspicion thresholds are exceeded.
/// </summary>
public class ExposureEventManager : MonoBehaviour
{
    public static ExposureEventManager Instance { get; private set; }

    [SerializeField] private ExposureEventDatabase eventDatabase = new ExposureEventDatabase();

    public event Action<ExposureEventDefinition> OnExposureTriggered;

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

    public void EvaluateExposure(string targetId)
    {
        var chance = SuspicionScandalManager.Instance?.GetExposureChance(targetId) ?? 0f;
        if (UnityEngine.Random.value > chance)
            return;

        var relationship = TargetRelationshipManager.Instance?.GetRelationship(targetId);
        var stats = PlayerStats.Instance?.Data;
        if (relationship == null || stats == null)
            return;

        var matched = eventDatabase.events.Find(e =>
            stats.globalScandalLevel >= e.minScandalLevel &&
            relationship.suspicion >= e.minSuspicionLevel);

        if (matched == null)
            return;

        relationship.isExposed = true;
        TriggerExposure(matched);
    }

    public void EvaluateGlobalCollapse()
    {
        var stats = PlayerStats.Instance?.Data;
        if (stats == null)
            return;

        var collapseEvent = eventDatabase.events.Find(e => e.exposureType == ExposureType.SocialDeath);
        if (collapseEvent != null)
            TriggerExposure(collapseEvent);
    }

    private void TriggerExposure(ExposureEventDefinition exposureEvent)
    {
        OnExposureTriggered?.Invoke(exposureEvent);

        if (!string.IsNullOrEmpty(exposureEvent.resultSceneId))
            SceneTransitionManager.Instance?.LoadScene(exposureEvent.resultSceneId);
    }
}
