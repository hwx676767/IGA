using System;
using System.Collections.Generic;
using UnityEngine;

/// <summary>
/// Maintains real identity vs online persona and evaluates exposure risk
/// when the two personas contradict each other.
/// </summary>
public class DualIdentityManager : MonoBehaviour
{
    public static DualIdentityManager Instance { get; private set; }

    [Header("Risk")]
    [SerializeField] private float contradictionScandalGain = 6f;
    [SerializeField] private float personaConsistencyBonus = 2f;

    public RealIdentity PlayerRealIdentity { get; private set; } = new RealIdentity();
    public OnlinePersona PlayerOnlinePersona { get; private set; } = new OnlinePersona();

    public event Action<float> OnContradictionDetected;

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

    public void Initialize(RealIdentity realIdentity, OnlinePersona onlinePersona)
    {
        PlayerRealIdentity = realIdentity ?? new RealIdentity();
        PlayerOnlinePersona = onlinePersona ?? new OnlinePersona();
    }

    public float EvaluateContradictionRisk(string claimedTag)
    {
        var risk = 0f;

        if (claimedTag.Contains("wealthy") && PlayerRealIdentity.financialStatus == "poor")
            risk += 20f;

        if (claimedTag.Contains("high_class") && PlayerOnlinePersona.socialClassRank != PlayerRealIdentity.background)
            risk += 15f;

        if (claimedTag.Contains("beauty") && PlayerOnlinePersona.beautyScore > PlayerStats.Instance.Data.beautyScore + 15f)
            risk += 12f;

        if (risk > 0f)
        {
            SuspicionScandalManager.Instance?.ApplyGlobalScandal(contradictionScandalGain);
            OnContradictionDetected?.Invoke(risk);
        }
        else
        {
            PlayerStats.Instance?.ApplyModifier(new PlayerStatModifier
            {
                deceptionPowerDelta = personaConsistencyBonus * 0.1f
            });
        }

        return risk;
    }

    public string GetPublicProfileSummary()
    {
        return $"{PlayerOnlinePersona.claimedPersonality} · {PlayerOnlinePersona.claimedLifestyle} · Rank {PlayerOnlinePersona.socialClassRank}";
    }
}
