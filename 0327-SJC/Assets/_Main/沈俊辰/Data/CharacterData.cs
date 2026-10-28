using System;
using System.Collections.Generic;

/// <summary>
/// Character / target profile loaded from local JSON.
/// Supports dual-identity contrast: real background vs online persona.
/// </summary>
[Serializable]
public class CharacterProfile
{
    public string id;
    public string displayName;
    public string avatarKey;

    public RealIdentity realIdentity;
    public OnlinePersona onlinePersona;

    public float initialAffection;
    public float initialSuspicion;
    public string preferredVoiceType; // "ClipVoice" | "BubbleVoice" | "Any"
    public List<string> chatFileIds = new List<string>();
    public List<string> tags = new List<string>();
}

[Serializable]
public class RealIdentity
{
    public string appearance;
    public string financialStatus;
    public string background;
    public string hiddenSecret;
}

[Serializable]
public class OnlinePersona
{
    public string claimedWealth;
    public string claimedPersonality;
    public string claimedLifestyle;
    public string socialClassRank;
    public float beautyScore;
}

[Serializable]
public class CharacterDatabase
{
    public List<CharacterProfile> characters = new List<CharacterProfile>();
}
