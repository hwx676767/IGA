using UnityEngine;

/// <summary>
/// Bootstraps persistent managers for a Life Match scene.
/// Attach to an empty GameObject in the first loaded scene.
/// </summary>
public class GameBootstrap : MonoBehaviour
{
    [Header("Auto Create If Missing")]
    [SerializeField] private bool createManagers = true;

    private void Awake()
    {
        if (!createManagers)
            return;

        Ensure<LocalTextDataLoader>();
        Ensure<PlayerStats>();
        Ensure<GameSaveManager>();
        Ensure<SceneTransitionManager>();
        Ensure<UpgradeSystem>();
        Ensure<ChapterProgressionManager>();
        Ensure<DualIdentityManager>();
        Ensure<SuspicionScandalManager>();
        Ensure<TargetRelationshipManager>();
        Ensure<ChatConversationManager>();
        Ensure<CourseLearningSystem>();
        Ensure<ExposureEventManager>();
        Ensure<VoiceTypeAnalyzer>();
    }

    private static T Ensure<T>() where T : Component
    {
        var existing = FindObjectOfType<T>();
        if (existing != null)
            return existing;

        var go = new GameObject(typeof(T).Name);
        return go.AddComponent<T>();
    }
}
