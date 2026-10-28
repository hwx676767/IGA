using UnityEngine;
using TMPro;

public class GameManager : MonoBehaviour
{
    public static GameManager Instance;

    public ParticleSystem confettiEffect;

    private string[] diaryEntries = new string[]
    {
        "Checked into the hotel —\nI love the hotel's cable car!",
        "The hot air balloon and windmill\nin the hotel are both made of flowers!",
        "Take me to see the beautiful carriage\nin the Ice and Snow Wonderland!",
        "I want to be surrounded by gems too!",
        "What's inside the door?",
        "I got my Christmas gift!",
        "Time to go back to the hotel and rest —\nlet's turn on the lights!",
        "What a pawsome trip!"
    };

    private int currentStep = 0;
    private bool hotAirBalloonDone = false;
    private bool windmillDone = false;
    private bool hasPlayedConfetti = false;

    public TMP_Text diaryText;
    public GameObject diaryPanel;

    private void Awake()
    {
        Instance = this;
    }

    private void Start()
    {
        UpdateDiaryText();
        if (confettiEffect != null)
        {
            confettiEffect.gameObject.SetActive(false);
        }
    }

    public int GetCurrentStep()
    {
        return currentStep;
    }

    public void CompleteHotAirBalloon()
    {
        if (currentStep == 1 && !hotAirBalloonDone)
        {
            hotAirBalloonDone = true;
            CheckStep1Completion();
        }
    }

    public void CompleteWindmill()
    {
        if (currentStep == 1 && !windmillDone)
        {
            windmillDone = true;
            CheckStep1Completion();
        }
    }

    private void CheckStep1Completion()
    {
        if (hotAirBalloonDone && windmillDone)
        {
            currentStep++;
            UpdateDiaryText();
        }
    }

    public void CompleteStep(int stepIndex)
    {
        if (currentStep == stepIndex)
        {
            currentStep++;
            UpdateDiaryText();
            
            // 点完灯（步骤6完成后）立即播放彩带
            if (currentStep == 7 && !hasPlayedConfetti)
            {
                PlayConfetti();
            }
        }
    }

    public bool TryCompleteDogStep(int targetStep)
    {
        if (currentStep == targetStep)
        {
            currentStep++;
            UpdateDiaryText();
            return true;
        }
        return false;
    }

    private void UpdateDiaryText()
    {
        if (diaryText != null)
        {
            diaryText.text = diaryEntries[currentStep];
        }
    }

    public void OpenDiary()
    {
        if (diaryPanel != null)
        {
            diaryPanel.SetActive(true);
        }
    }

    public void CloseDiary()
    {
        if (diaryPanel != null)
        {
            diaryPanel.SetActive(false);
        }
    }

    private void PlayConfetti()
    {
        Debug.Log("播放彩带！");
        hasPlayedConfetti = true;

        confettiEffect.gameObject.SetActive(true);
        
        // 不再重置位置，彩带会保持在你在场景中放置的位置
        
        var renderer = confettiEffect.GetComponent<ParticleSystemRenderer>();
        if (renderer != null)
        {
            renderer.sortingLayerName = "UI";
            renderer.sortingOrder = 999;
        }

        confettiEffect.Play();
        Invoke("HideConfetti", 2f);
    }

    private void HideConfetti()
    {
        if (confettiEffect != null)
        {
            confettiEffect.Stop();
            confettiEffect.gameObject.SetActive(false);
        }
    }
}