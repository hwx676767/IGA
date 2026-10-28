using System;
using UnityEngine;

/// <summary>
/// Detects whether recorded voice resembles 夹子音 (clip / artificially high voice)
/// or 气泡音 (bubble / nasal chest voice) using lightweight spectral heuristics.
/// Intended for voice-chat gameplay where persona performance affects trust.
/// </summary>
public class VoiceTypeAnalyzer : MonoBehaviour
{
    public static VoiceTypeAnalyzer Instance { get; private set; }

    [Header("Analysis")]
    [SerializeField] private int sampleSize = 2048;
    [SerializeField] private float clipVoicePitchThreshold = 260f;
    [SerializeField] private float bubbleLowBandRatioThreshold = 0.42f;
    [SerializeField] private float nasalBandRatioThreshold = 0.28f;
    [SerializeField] private float confidenceThreshold = 0.55f;

    public event Action<VoiceAnalysisResult> OnAnalysisComplete;

    private void Awake()
    {
        if (Instance != null && Instance != this)
        {
            Destroy(gameObject);
            return;
        }

        Instance = this;
    }

    public VoiceAnalysisResult AnalyzeClip(AudioClip clip, int offsetSamples = 0)
    {
        if (clip == null || clip.samples < sampleSize)
            return VoiceAnalysisResult.Unknown();

        var data = new float[sampleSize];
        clip.GetData(data, Mathf.Clamp(offsetSamples, 0, clip.samples - sampleSize));

        return AnalyzeSamples(data, clip.frequency);
    }

    public VoiceAnalysisResult AnalyzeSamples(float[] samples, int sampleRate)
    {
        var pitch = EstimatePitch(samples, sampleRate);
        var spectralCentroid = EstimateSpectralCentroid(samples, sampleRate);
        var lowBandRatio = EstimateBandEnergyRatio(samples, sampleRate, 80f, 300f);
        var midBandRatio = EstimateBandEnergyRatio(samples, sampleRate, 300f, 1200f);
        var highBandRatio = EstimateBandEnergyRatio(samples, sampleRate, 1200f, 4000f);
        var nasalBandRatio = EstimateBandEnergyRatio(samples, sampleRate, 900f, 1800f);

        var clipScore = ScoreClipVoice(pitch, spectralCentroid, highBandRatio, midBandRatio);
        var bubbleScore = ScoreBubbleVoice(pitch, lowBandRatio, nasalBandRatio, midBandRatio);

        var detectedType = VoiceType.Neutral;
        var confidence = Mathf.Max(clipScore, bubbleScore);

        if (clipScore >= confidenceThreshold && clipScore > bubbleScore)
            detectedType = VoiceType.ClipVoice;
        else if (bubbleScore >= confidenceThreshold && bubbleScore > clipScore)
            detectedType = VoiceType.BubbleVoice;

        var result = new VoiceAnalysisResult
        {
            detectedType = detectedType,
            confidence = confidence,
            estimatedPitchHz = pitch,
            spectralCentroidHz = spectralCentroid,
            clipVoiceScore = clipScore,
            bubbleVoiceScore = bubbleScore
        };

        OnAnalysisComplete?.Invoke(result);
        return result;
    }

    private float ScoreClipVoice(float pitch, float centroid, float highRatio, float midRatio)
    {
        var pitchScore = Mathf.InverseLerp(180f, clipVoicePitchThreshold, pitch);
        var centroidScore = Mathf.InverseLerp(900f, 2200f, centroid);
        var brightnessScore = Mathf.InverseLerp(0.15f, 0.45f, highRatio / Mathf.Max(midRatio, 0.001f));
        return Mathf.Clamp01(pitchScore * 0.45f + centroidScore * 0.3f + brightnessScore * 0.25f);
    }

    private float ScoreBubbleVoice(float pitch, float lowRatio, float nasalRatio, float midRatio)
    {
        var lowScore = Mathf.InverseLerp(0.18f, bubbleLowBandRatioThreshold, lowRatio);
        var nasalScore = Mathf.InverseLerp(0.12f, nasalBandRatioThreshold, nasalRatio);
        var pitchPenalty = 1f - Mathf.InverseLerp(220f, 320f, pitch);
        var chestResonance = Mathf.InverseLerp(0.8f, 1.4f, midRatio / Mathf.Max(lowRatio, 0.001f));
        return Mathf.Clamp01(lowScore * 0.35f + nasalScore * 0.35f + pitchPenalty * 0.15f + chestResonance * 0.15f);
    }

    private static float EstimatePitch(float[] samples, int sampleRate)
    {
        var minLag = sampleRate / 500;
        var maxLag = sampleRate / 70;
        var bestLag = minLag;
        var bestCorrelation = 0f;

        for (var lag = minLag; lag < maxLag && lag < samples.Length / 2; lag++)
        {
            var correlation = 0f;
            for (var i = 0; i < samples.Length - lag; i++)
                correlation += samples[i] * samples[i + lag];

            if (correlation > bestCorrelation)
            {
                bestCorrelation = correlation;
                bestLag = lag;
            }
        }

        return sampleRate / (float)bestLag;
    }

    private static float EstimateSpectralCentroid(float[] samples, int sampleRate)
    {
        var windowSize = Mathf.Min(512, samples.Length);
        var magnitudeSum = 0f;
        var weightedSum = 0f;

        for (var i = 1; i < windowSize / 2; i++)
        {
            var magnitude = Mathf.Abs(samples[i]);
            var frequency = i * (sampleRate / (float)windowSize);
            magnitudeSum += magnitude;
            weightedSum += frequency * magnitude;
        }

        return magnitudeSum <= 0f ? 0f : weightedSum / magnitudeSum;
    }

    private static float EstimateBandEnergyRatio(float[] samples, int sampleRate, float minHz, float maxHz)
    {
        var windowSize = Mathf.Min(512, samples.Length);
        var bandEnergy = 0f;
        var totalEnergy = 0f;

        for (var i = 1; i < windowSize / 2; i++)
        {
            var magnitude = Mathf.Abs(samples[i]);
            totalEnergy += magnitude;

            var frequency = i * (sampleRate / (float)windowSize);
            if (frequency >= minHz && frequency <= maxHz)
                bandEnergy += magnitude;
        }

        return totalEnergy <= 0f ? 0f : bandEnergy / totalEnergy;
    }
}

public enum VoiceType
{
    Neutral,
    ClipVoice,
    BubbleVoice
}

[Serializable]
public struct VoiceAnalysisResult
{
    public VoiceType detectedType;
    public float confidence;
    public float estimatedPitchHz;
    public float spectralCentroidHz;
    public float clipVoiceScore;
    public float bubbleVoiceScore;

    public static VoiceAnalysisResult Unknown()
    {
        return new VoiceAnalysisResult
        {
            detectedType = VoiceType.Neutral,
            confidence = 0f
        };
    }

    public bool MatchesTarget(VoiceType targetType)
    {
        return targetType == VoiceType.Neutral || detectedType == targetType;
    }
}
