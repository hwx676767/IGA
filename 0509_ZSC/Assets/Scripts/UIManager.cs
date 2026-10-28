using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using DG.Tweening;

public class UIManager : MonoBehaviour
{
    public Image flashImage; // 用于闪屏的 UI Image
    //public Image hitEffectImage; // 撞击效果图片
    public Image transitionPic01; // 上方遮挡图片
    public Image transitionPic02; // 下方遮挡图片
    public Canvas canvas; // 引用场景中的 Canvas
    public Camera mainCamera; // 引用主相机用于震屏效果
    //public AudioSource audioSource; // 用于播放音效
    //public AudioClip hitSound; // 撞击音效
    [Range(0.2f, 2f)]
    public float flashDuration = 0.3f; // 闪屏持续时间（秒）
    [Range(0.2f, 2f)]
    public float hitEffectDuration = 0.5f; // 撞击效果持续时间（秒）
    [Range(0.2f, 2f)]
    public float transitionDuration = 0.6f; // 过渡动画持续时间（秒）
    [Range(0.1f, 0.5f)]
    public float cameraShakeStrength = 0.2f; // 相机震动强度
    public Color flashColor = new Color(1, 1, 1, 0.8f); // 初始黑白色（略透明）

    private SpriteManager spriteManager;

    void Start()
    {
        spriteManager = FindObjectOfType<SpriteManager>();

        // 统一设置所有 UI 图片初始隐藏
        if (flashImage != null) flashImage.gameObject.SetActive(false);
        //if (hitEffectImage != null) hitEffectImage.gameObject.SetActive(false);
        if (transitionPic01 != null) transitionPic01.gameObject.SetActive(false);
        if (transitionPic02 != null) transitionPic02.gameObject.SetActive(false);

        // 验证 Canvas 和相机
        if (canvas == null)
        {
            Debug.LogError("UIManager: Canvas reference is not assigned! Please assign it in the Inspector.");
        }
        if (mainCamera == null)
        {
            mainCamera = Camera.main;
            if (mainCamera == null)
            {
                Debug.LogWarning("UIManager: No main camera found. Camera shake effect will be disabled.");
            }
        }
        /*
        if (audioSource == null)
        {
            audioSource = GetComponent<AudioSource>();
            if (audioSource == null)
            {
                Debug.LogWarning("UIManager: No AudioSource found. Sound effects will be disabled.");
            }
        }*/
    }

    public void TriggerFlash()
    {
        if (flashImage != null)
        {
            flashImage.gameObject.SetActive(true);
            flashImage.color = flashColor;
            StartCoroutine(FlashEffect());
        }
        /*
        if (hitEffectImage != null)
        {
            hitEffectImage.gameObject.SetActive(true);
            hitEffectImage.transform.localScale = Vector3.zero;
            StartCoroutine(HitEffect());
        }*/
        if (mainCamera != null)
        {
            mainCamera.transform.DOShakePosition(hitEffectDuration, cameraShakeStrength, 10, 90, false).SetEase(Ease.InOutQuad);
        }
        /*
        if (audioSource != null && hitSound != null)
        {
            audioSource.PlayOneShot(hitSound);
        }*/
    }

    public float GetFlashDuration()
    {
        // 返回闪屏和撞击效果的最大持续时间
        return Mathf.Max(flashDuration, hitEffectDuration);
    }

    public void TriggerTransition(bool toSecondSet)
    {
        if (transitionPic01 != null && transitionPic02 != null && canvas != null)
        {
            StartCoroutine(TransitionEffect(toSecondSet));
        }
        else
        {
            Debug.LogWarning("UIManager: Missing transition images or Canvas reference. Skipping transition effect.");
            if (toSecondSet)
                spriteManager?.SwitchToSecondSet();
            else
                spriteManager?.SwitchToFirstSet();
        }
    }

    private IEnumerator FlashEffect()
    {
        float elapsedTime = 0f;

        while (elapsedTime < flashDuration)
        {
            elapsedTime += Time.deltaTime;
            float alpha = Mathf.Lerp(flashColor.a, 0f, elapsedTime / flashDuration);
            flashImage.color = new Color(flashColor.r, flashColor.g, flashColor.b, alpha);
            yield return null;
        }

        flashImage.color = new Color(flashColor.r, flashColor.g, flashColor.b, 0f);
        flashImage.gameObject.SetActive(false);
    }
    /*
    private IEnumerator HitEffect()
    {
        Sequence sequence = DOTween.Sequence();
        sequence.Append(hitEffectImage.transform.DOScale(1.2f, hitEffectDuration * 0.6f).SetEase(Ease.OutBack))
                .Append(hitEffectImage.transform.DOScale(1f, hitEffectDuration * 0.4f).SetEase(Ease.InOutQuad))
                .Join(hitEffectImage.DOFade(0f, hitEffectDuration * 0.4f));

        yield return new WaitForSeconds(hitEffectDuration);
        hitEffectImage.gameObject.SetActive(false);
    }*/

    private IEnumerator TransitionEffect(bool toSecondSet)
    {
        transitionPic01.gameObject.SetActive(true);
        transitionPic02.gameObject.SetActive(true);
        RectTransform rect01 = transitionPic01.GetComponent<RectTransform>();
        RectTransform rect02 = transitionPic02.GetComponent<RectTransform>();

        float canvasHeight = canvas.GetComponent<RectTransform>().rect.height;
        rect01.anchoredPosition = new Vector2(0, canvasHeight / 2);
        rect02.anchoredPosition = new Vector2(0, -canvasHeight / 2);
        transitionPic01.color = new Color(1, 1, 1, 1);
        transitionPic02.color = new Color(1, 1, 1, 1);

        Sequence sequence = DOTween.Sequence();
        sequence.Append(rect01.DOAnchorPosY(0, transitionDuration / 2).SetEase(Ease.InOutQuad))
               .Join(rect02.DOAnchorPosY(0, transitionDuration / 2).SetEase(Ease.InOutQuad))
               .Join(rect01.DORotate(new Vector3(0, 0, 5), transitionDuration / 2).SetEase(Ease.InOutSine))
               .Join(rect02.DORotate(new Vector3(0, 0, -5), transitionDuration / 2).SetEase(Ease.InOutSine));

        yield return new WaitForSeconds(transitionDuration / 2);
        if (toSecondSet)
            spriteManager?.SwitchToSecondSet();
        else
            spriteManager?.SwitchToFirstSet();

        sequence.Append(rect01.DOAnchorPosY(-canvasHeight / 2, transitionDuration / 2).SetEase(Ease.InOutQuad))
               .Join(rect02.DOAnchorPosY(canvasHeight / 2, transitionDuration / 2).SetEase(Ease.InOutQuad))
               .Join(rect01.DORotate(new Vector3(0, 0, 0), transitionDuration / 2).SetEase(Ease.InOutSine))
               .Join(rect02.DORotate(new Vector3(0, 0, 0), transitionDuration / 2).SetEase(Ease.InOutSine))
               .Join(transitionPic01.DOFade(0, transitionDuration / 2))
               .Join(transitionPic02.DOFade(0, transitionDuration / 2));

        yield return new WaitForSeconds(transitionDuration / 2);
        transitionPic01.gameObject.SetActive(false);
        transitionPic02.gameObject.SetActive(false);
    }
}