using System;
using System.Collections;
using UnityEngine;

/// <summary>
/// Records microphone input and forwards clips to VoiceTypeAnalyzer.
/// Hook UI feedback through OnRecordingFinished.
/// </summary>
[RequireComponent(typeof(AudioSource))]
public class VoiceRecorder : MonoBehaviour
{
    [Header("Recording")]
    [SerializeField] private int recordLengthSeconds = 4;
    [SerializeField] private int sampleRate = 44100;
    [SerializeField] private string microphoneDevice;

    [Header("Gameplay")]
    [SerializeField] private bool autoAnalyze = true;

    public bool IsRecording { get; private set; }
    public AudioClip LastRecording { get; private set; }

    public event Action<VoiceAnalysisResult> OnRecordingAnalyzed;
    public event Action OnRecordingStarted;
    public event Action OnRecordingStopped;

    private AudioSource audioSource;
    private Coroutine recordRoutine;

    private void Awake()
    {
        audioSource = GetComponent<AudioSource>();
    }

    public void StartRecording()
    {
        if (IsRecording)
            return;

        if (Microphone.devices.Length == 0)
        {
            Debug.LogWarning("[VoiceRecorder] No microphone detected.");
            return;
        }

        if (string.IsNullOrEmpty(microphoneDevice))
            microphoneDevice = Microphone.devices[0];

        recordRoutine = StartCoroutine(RecordRoutine());
    }

    public void StopRecording()
    {
        if (!IsRecording || recordRoutine == null)
            return;

        StopCoroutine(recordRoutine);
        recordRoutine = null;
        FinishRecording();
    }

    public VoiceAnalysisResult AnalyzeLastRecording()
    {
        if (LastRecording == null || VoiceTypeAnalyzer.Instance == null)
            return VoiceAnalysisResult.Unknown();

        return VoiceTypeAnalyzer.Instance.AnalyzeClip(LastRecording);
    }

    private IEnumerator RecordRoutine()
    {
        IsRecording = true;
        OnRecordingStarted?.Invoke();

        LastRecording = Microphone.Start(microphoneDevice, false, recordLengthSeconds, sampleRate);
        yield return new WaitForSeconds(recordLengthSeconds);
        FinishRecording();
    }

    private void FinishRecording()
    {
        if (!IsRecording)
            return;

        Microphone.End(microphoneDevice);
        IsRecording = false;
        OnRecordingStopped?.Invoke();

        if (autoAnalyze && LastRecording != null)
        {
            var result = AnalyzeLastRecording();
            ApplyVoiceGameplay(result);
            OnRecordingAnalyzed?.Invoke(result);
        }
    }

    private void ApplyVoiceGameplay(VoiceAnalysisResult result)
    {
        var targetId = ChatConversationManager.Instance?.CurrentTargetId;
        if (string.IsNullOrEmpty(targetId))
            return;

        var profile = LocalTextDataLoader.Instance?.GetCharacter(targetId);
        if (profile == null)
            return;

        var relationship = TargetRelationshipManager.Instance?.GetRelationship(targetId);
        if (relationship == null)
            return;

        if (result.detectedType == VoiceType.ClipVoice)
        {
            relationship.affection += 4f * result.confidence;
            relationship.suspicion += 1.5f * (1f - result.confidence);
        }
        else if (result.detectedType == VoiceType.BubbleVoice)
        {
            relationship.affection += 3f * result.confidence;
            relationship.suspicion += 2f * result.confidence;
            PlayerStats.Instance?.ApplyModifier(new PlayerStatModifier
            {
                detectabilityDelta = 1.5f * result.confidence
            });
        }

        TargetRelationshipManager.Instance.NotifyRelationshipChanged(targetId);
    }

    public void PlayLastRecording()
    {
        if (LastRecording != null && audioSource != null)
            audioSource.PlayOneShot(LastRecording);
    }
}
