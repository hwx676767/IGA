using System;
using System.Collections;
using UnityEngine;
using UnityEngine.UI;

public class EndGameManager : MonoBehaviour
{
    [Header("角色引用")]
    public PunchController player; 
    public OpponentController opponent; 
    public CoachScript coachScript; 

    [Header("UI元素")]
    public Image successImage;
    public Image failureImage;
    public Text outcomeText; 
    public Text bonusText; 
    public Button revealBonusButton; 

    [Header("揭示设置")]
    public float buttonDelay = 2f;

    private int calculatedBonus = 0;
    private bool isOutcomeShown = false; 

    private void Start()
    {
        // 初始化：隐藏所有结局UI元素，包括揭示按钮
        if (successImage != null) successImage.gameObject.SetActive(false);
        if (failureImage != null) failureImage.gameObject.SetActive(false);
        if (outcomeText != null) outcomeText.gameObject.SetActive(false);
        if (bonusText != null) bonusText.gameObject.SetActive(false);
        if (revealBonusButton != null) revealBonusButton.gameObject.SetActive(false);
    }

    private void Update()
    {
        if (player.isDead || opponent.isDead)
        {
            StartCoroutine(OnEndGameButtonClicked());
        }
        
    }

    /// <summary>
    /// 唯一触发Button点击时调用：游戏判定 → 显示胜负图片 + outcomeText → 启动协程延迟显示揭示按钮
    /// </summary>
    private IEnumerator OnEndGameButtonClicked()
    {
        yield return new WaitForSeconds(3f);
        if (isOutcomeShown) yield break; 

        bool isFakeDetected = coachScript.isFakePunchDetected;
        bool playerWins = (!player.isDead && opponent.isDead); // 玩家赢
        bool playerLoses = (player.isDead && !opponent.isDead); // 玩家输
        
        // 结局判定
        if (playerWins)
        {
            // 01、03:win -> 500
            calculatedBonus = 500;
            if (successImage != null) successImage.gameObject.SetActive(true);
            if (outcomeText != null)
            {
                outcomeText.text = "You Win!";
                outcomeText.gameObject.SetActive(true);
            }
        }
        else if (playerLoses)
        {
            if (isFakeDetected)
            {
                // 02:lose+fake -> 1000
                calculatedBonus = 1000;
            }
            else
            {
                // 04: lose+!fake -> 0
                calculatedBonus = 0;
            }
            if (failureImage != null) failureImage.gameObject.SetActive(true);
            if (outcomeText != null)
            {
                outcomeText.text = "You Lose!";
                outcomeText.gameObject.SetActive(true);
            }
        }
        // other
        isOutcomeShown = true; 

        StartCoroutine(RevealButtonAfterDelay());

        Debug.Log("奖金结算: " + calculatedBonus + " | 是否作弊: " + isFakeDetected);
    }

    /// <summary>
    /// 协程：延迟后激活揭示奖金按钮
    /// </summary>
    private IEnumerator RevealButtonAfterDelay()
    {
        yield return new WaitForSeconds(buttonDelay);

        if (revealBonusButton != null)
        {
            revealBonusButton.gameObject.SetActive(true);
        }

        Debug.Log("揭示奖金按钮已显示（延迟: " + buttonDelay + "s）");
    }

    /// <summary>
    /// 揭示奖金Button点击时调用：隐藏outcomeText，显示bonusText
    /// </summary>
    public void OnRevealBonusButtonClicked()
    {
        if (!isOutcomeShown) return; // 结局未显示，不允许揭示

        // 隐藏结局Text
        if (outcomeText != null) outcomeText.gameObject.SetActive(false);

        // 显示奖金Text
        if (bonusText != null)
        {
            bonusText.text = "Prize Settlement\n" + calculatedBonus.ToString();
            bonusText.gameObject.SetActive(true);
        }

        if (revealBonusButton != null) revealBonusButton.gameObject.SetActive(false);

        Debug.Log("奖金揭示: " + calculatedBonus);
    }
}