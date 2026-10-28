using System;
using System.Collections.Generic;

[Serializable]
public class CourseDefinition
{
    public string courseId;
    public string title;
    public string description;
    public float price;
    public bool isScam;
    public float communicationBonus;
    public float emotionalIntelligenceBonus;
    public float crisisManagementBonus;
    public float moneyLossOnScam;
    public float scandalBonusOnScam;
    public float successChance = 0.7f;
}

[Serializable]
public class CourseDatabase
{
    public List<CourseDefinition> courses = new List<CourseDefinition>();
}

[Serializable]
public class TargetRelationshipState
{
    public string targetId;
    public float affection;
    public float suspicion;
    public bool isBlocked;
    public bool isExposed;
    public string lastChatNodeId;
}

[Serializable]
public class ChapterDefinition
{
    public string chapterId;
    public string title;
    public string goalDescription;
    public string pressureDescription;
    public float scandalThreshold;
    public int maxActiveTargets;
    public string nextChapterId;
    public string fallbackSceneId;
}

[Serializable]
public class ChapterDatabase
{
    public List<ChapterDefinition> chapters = new List<ChapterDefinition>();
}

[Serializable]
public class ExposureEventDefinition
{
    public string eventId;
    public string title;
    public string description;
    public ExposureType exposureType;
    public float minScandalLevel;
    public float minSuspicionLevel;
    public string resultSceneId;
}

public enum ExposureType
{
    SocialDeath,
    Arrest,
    SelfScam,
    TargetExposure,
    ContradictionCaught
}

[Serializable]
public class ExposureEventDatabase
{
    public List<ExposureEventDefinition> events = new List<ExposureEventDefinition>();
}
