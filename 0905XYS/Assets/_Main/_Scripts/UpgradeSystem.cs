using UnityEngine;
using UnityEngine.UI;
using DG.Tweening;
using UnityEngine.SceneManagement;

public class UpgradeSystem : MonoBehaviour
{
    [SerializeField] private int upgradeCost = 1000; // Upgrade cost, set in Inspector or via code
    [SerializeField] private Text moneyText; // UI Text to display current money
    [SerializeField] private GameObject insufficientPanel; // UI Panel or GameObject for "Insufficient Funds" prompt
    [SerializeField] private float deductionAnimationDuration = 1f; // Duration for money deduction animation
    [SerializeField] private float scaleAmount = 1.5f; // Scale factor during deduction
    [SerializeField] private float scaleDuration = 0.5f; // Duration for scale animation

    [SerializeField]private int currentMoney = 5000; // Example current money; replace with your actual money system (e.g., PlayerData.instance.money)
    private bool isUpgraded = false; // Upgrade status

    void Start()
    {
        // Initialize money display
        UpdateMoneyDisplay();
        // Hide insufficient panel initially
        if (insufficientPanel != null)
        {
            insufficientPanel.SetActive(false);
        }
    }

    // Public method for external button call to upgrade
    public void UpgradeGym()
    {
        if (currentMoney < upgradeCost)
        {
            ShowInsufficientUI();
        }
        else
        {
            AnimateMoneyDeduction();
            isUpgraded = true;
        }
    }

    private void ShowInsufficientUI()
    {
        if (insufficientPanel != null)
        {
            insufficientPanel.SetActive(true);
            Invoke("HideInsufficientUI", 2f);
        }
    }

    private void HideInsufficientUI()
    {
        if (insufficientPanel != null)
        {
            insufficientPanel.SetActive(false);
        }
    }

    private void AnimateMoneyDeduction()
    {
        // Store starting money
        int startMoney = currentMoney;

        // Animate scale up and down for emphasis
        Sequence scaleSequence = DOTween.Sequence();
        scaleSequence.Append(moneyText.transform.
            DOScale(scaleAmount, scaleDuration / 2).SetEase(Ease.OutQuad));
        scaleSequence.Append(moneyText.transform.
            DOScale(1f, scaleDuration / 2).SetEase(Ease.InQuad));

        // Animate money value deduction
        DOTween.To(() => startMoney, x => 
        {
            currentMoney = x;
            UpdateMoneyDisplay();
        }, startMoney - upgradeCost, deductionAnimationDuration)
        .SetEase(Ease.InOutSine)
        .OnComplete(() => 
        {
            Debug.Log("Money deducted: " + upgradeCost);
        });
    }

    private void UpdateMoneyDisplay()
    {
        if (moneyText != null)
        {
            moneyText.text = "Earnings  "+ currentMoney.ToString();
        }
    }

    // Public method for external call to switch scenes based on upgrade status
    public void SwitchScene()
    {
        string sceneName = isUpgraded ? "BoxingDemo" : "BoxingDemo-01"; // Replace with your actual scene names
        SceneManager.LoadScene(sceneName);
    }
}