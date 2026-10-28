using UnityEngine;
using System.Collections;

public class SpriteManager : MonoBehaviour
{
    [System.Serializable]
    public struct SpriteSet
    {
        public SpriteRenderer[] spriteRenderers;
        public Sprite firstSetSprite;
        public Sprite secondSetSprite;
    }

    [Header("Sprite Settings")]
    public SpriteSet[] spriteSets;
    [Header("Collision Settings")]
    public int collisionThreshold = 5;
    [Header("Countdown Settings")]
    public float countdownDuration = 10f;

    private int collisionCount = 0;
    private bool isSecondSet = false;
    private UIManager uiManager;
    private Coroutine countdownCoroutine;

    void Awake()
    {
        uiManager = FindObjectOfType<UIManager>();
    }

    void Start()
    {
        // 确保游戏开始时加载第一套图片
        LoadFirstSet();
    }

    // 专门用于加载第一套图片的方法
    private void LoadFirstSet()
    {
        foreach (var set in spriteSets)
        {
            if (set.firstSetSprite != null)
            {
                foreach (var renderer in set.spriteRenderers)
                {
                    if (renderer != null)
                    {
                        renderer.sprite = set.firstSetSprite;
                    }
                    else
                    {
                        Debug.LogWarning("发现空的SpriteRenderer引用");
                    }
                }
            }
            else
            {
                Debug.LogWarning("第一套图片未设置");
            }
        }
        isSecondSet = false;
        collisionCount = 0;
    }

    public void RegisterCollision()
    {
        collisionCount++;
        Debug.Log($"hit count: {collisionCount}");

        if (isSecondSet)
        {
            ResetCountdown();
        }
        else if (collisionCount >= collisionThreshold)
        {
            StartCoroutine(TransitionAfterFlash());
        }
    }

    public void SwitchToSecondSet()
    {
        if (isSecondSet) return;

        foreach (var set in spriteSets)
        {
            Sprite spriteToUse = set.secondSetSprite != null ? set.secondSetSprite : set.firstSetSprite;
            
            foreach (var renderer in set.spriteRenderers)
            {
                if (renderer != null)
                {
                    renderer.sprite = spriteToUse;
                }
            }
        }

        isSecondSet = true;
        Debug.Log("已切换到第二套图片!");
        StartCountdown();
    }

    public void SwitchToFirstSet()
    {
        if (!isSecondSet) return;

        foreach (var set in spriteSets)
        {
            foreach (var renderer in set.spriteRenderers)
            {
                if (renderer != null)
                {
                    renderer.sprite = set.firstSetSprite;
                }
            }
        }

        isSecondSet = false;
        collisionCount = 0;
        Debug.Log("已切换回第一套图片!");
    }

    private void StartCountdown()
    {
        if (countdownCoroutine != null)
        {
            StopCoroutine(countdownCoroutine);
        }
        countdownCoroutine = StartCoroutine(CountdownCoroutine());
    }

    private void ResetCountdown()
    {
        StartCountdown();
    }

    private IEnumerator CountdownCoroutine()
    {
        float timer = countdownDuration;
        while (timer > 0)
        {
            timer -= Time.deltaTime;
            yield return null;
        }
        uiManager?.TriggerTransition(false);
    }

    private IEnumerator TransitionAfterFlash()
    {
        float flashDuration = uiManager != null ? uiManager.GetFlashDuration() : 0.5f;
        yield return new WaitForSeconds(flashDuration);
        uiManager?.TriggerTransition(true);
    }
}