using System;
using UnityEngine;

/// <summary>
/// Online courses that may improve skills or scam the player.
/// </summary>
public class CourseLearningSystem : MonoBehaviour
{
    public static CourseLearningSystem Instance { get; private set; }

    public event Action<CourseDefinition, bool> OnCourseResolved;

    private void Awake()
    {
        if (Instance != null && Instance != this)
        {
            Destroy(gameObject);
            return;
        }

        Instance = this;
    }

    public bool TryPurchaseCourse(string courseId)
    {
        var loader = LocalTextDataLoader.Instance;
        var stats = PlayerStats.Instance;
        if (loader == null || stats == null)
            return false;

        var course = loader.Courses.courses.Find(c => c.courseId == courseId);
        if (course == null || stats.Data.money < course.price)
            return false;

        stats.ApplyMoneyDelta(-course.price);

        if (stats.Data.completedCourseIds.Contains(courseId))
            return false;

        stats.Data.completedCourseIds.Add(courseId);

        var success = !course.isScam && UnityEngine.Random.value <= course.successChance;
        if (success)
        {
            stats.ApplyModifier(new PlayerStatModifier
            {
                communicationSkillDelta = course.communicationBonus,
                emotionalIntelligenceDelta = course.emotionalIntelligenceBonus,
                crisisManagementDelta = course.crisisManagementBonus
            });
        }
        else
        {
            stats.ApplyMoneyDelta(-course.moneyLossOnScam);
            SuspicionScandalManager.Instance?.ApplyGlobalScandal(course.scandalBonusOnScam);
        }

        OnCourseResolved?.Invoke(course, success);
        return true;
    }
}
