using System;
using System.Collections.Generic;
using UnityEngine;

/// <summary>
/// Four-chapter progression: Starting Out → Expansion → Prosperity → Collapse.
/// All paths eventually lead to failure per the design doc.
/// </summary>
public class ChapterProgressionManager : MonoBehaviour
{
    public static ChapterProgressionManager Instance { get; private set; }

    [SerializeField] private ChapterDatabase chapterDatabase = new ChapterDatabase();

    public event Action<ChapterDefinition> OnChapterChanged;
    public event Action OnFinalCollapse;

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

    public ChapterDefinition GetCurrentChapter()
    {
        var chapterId = PlayerStats.Instance?.Data.currentChapterId;
        return chapterDatabase.chapters.Find(c => c.chapterId == chapterId);
    }

    public bool TryAdvanceChapter()
    {
        var current = GetCurrentChapter();
        if (current == null || string.IsNullOrEmpty(current.nextChapterId))
        {
            OnFinalCollapse?.Invoke();
            return false;
        }

        PlayerStats.Instance?.SetChapter(current.nextChapterId);
        var next = GetCurrentChapter();
        OnChapterChanged?.Invoke(next);

        if (next != null && !string.IsNullOrEmpty(next.fallbackSceneId))
            UpgradeSystem.Instance?.TryApplyUpgrade("chapter_scene_" + next.chapterId);

        return true;
    }

    public bool CanMaintainTargetLoad()
    {
        var chapter = GetCurrentChapter();
        var activeCount = PlayerStats.Instance?.Data.activeTargetIds.Count ?? 0;
        return chapter == null || activeCount <= chapter.maxActiveTargets;
    }

    public void EvaluateChapterPressure()
    {
        var chapter = GetCurrentChapter();
        var stats = PlayerStats.Instance?.Data;
        if (chapter == null || stats == null)
            return;

        if (stats.globalScandalLevel >= chapter.scandalThreshold)
            ExposureEventManager.Instance?.EvaluateGlobalCollapse();
    }
}
