using UnityEngine;
using UnityEngine.UI;

/// <summary>
/// UI feedback for voice recording and clip/bubble detection results.
/// </summary>
public class VoiceUIController : MonoBehaviour
{
    [SerializeField] private VoiceRecorder voiceRecorder;
    [SerializeField] private Button recordButton;
    [SerializeField] private Text statusLabel;
    [SerializeField] private Text resultLabel;
    [SerializeField] private Image confidenceFill;

    private void OnEnable()
    {
        if (voiceRecorder == null)
            voiceRecorder = FindObjectOfType<VoiceRecorder>();

        if (voiceRecorder != null)
        {
            voiceRecorder.OnRecordingStarted += HandleRecordingStarted;
            voiceRecorder.OnRecordingStopped += HandleRecordingStopped;
            voiceRecorder.OnRecordingAnalyzed += HandleRecordingAnalyzed;
        }

        if (recordButton != null)
            recordButton.onClick.AddListener(ToggleRecording);
    }

    private void OnDisable()
    {
        if (voiceRecorder != null)
        {
            voiceRecorder.OnRecordingStarted -= HandleRecordingStarted;
            voiceRecorder.OnRecordingStopped -= HandleRecordingStopped;
            voiceRecorder.OnRecordingAnalyzed -= HandleRecordingAnalyzed;
        }

        if (recordButton != null)
            recordButton.onClick.RemoveListener(ToggleRecording);
    }

    private void ToggleRecording()
    {
        if (voiceRecorder == null)
            return;

        if (voiceRecorder.IsRecording)
            voiceRecorder.StopRecording();
        else
            voiceRecorder.StartRecording();
    }

    private void HandleRecordingStarted()
    {
        if (statusLabel != null)
            statusLabel.text = "Recording...";
    }

    private void HandleRecordingStopped()
    {
        if (statusLabel != null)
            statusLabel.text = "Analyzing voice...";
    }

    private void HandleRecordingAnalyzed(VoiceAnalysisResult result)
    {
        if (statusLabel != null)
            statusLabel.text = "Ready";

        if (resultLabel != null)
        {
            if (result.detectedType == VoiceType.ClipVoice)
                resultLabel.text = string.Format("Detected: Clip Voice (夹子音) · {0:P0}", result.confidence);
            else if (result.detectedType == VoiceType.BubbleVoice)
                resultLabel.text = string.Format("Detected: Bubble Voice (气泡音) · {0:P0}", result.confidence);
            else
                resultLabel.text = "Detected: Neutral / unclear";
        }

        if (confidenceFill != null)
            confidenceFill.fillAmount = result.confidence;
    }
}
