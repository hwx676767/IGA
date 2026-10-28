using UnityEngine;
using DG.Tweening;

public class PopEffect : MonoBehaviour
{
    [Header("Jelly-like effect")]
    [Tooltip("弹出总时长（建议 0.8~1.5 秒之间）")]
    public float duration = 1.0f;

    [Tooltip("最大放大倍数（1.1~1.4 建议）")]
    public float overshootScale = 1.25f;

    [Tooltip("自动在 Start() 播放")]
    public bool autoPlay = true;

    private Vector3 originalScale;
    private bool hasPlayed = false;

    void Awake()
    {
        originalScale = transform.localScale;
        // 关键：初始时强制设为不可见
        transform.localScale = Vector3.zero;
    }

    void Start()
    {
        if (autoPlay)
        {
            Pop();
        }
    }

    [ContextMenu("Pop")]
    public void Pop()
    {
        if (hasPlayed) return;
        
        hasPlayed = true;
        
        // 杀掉可能正在运行的动画
        DOTween.Kill(transform);
        
        Sequence seq = DOTween.Sequence();

        seq.Append(transform.DOScale(originalScale * overshootScale, duration * 0.45f)
            .SetEase(Ease.OutQuad));

        seq.Append(transform.DOScale(originalScale * 0.97f, duration * 0.25f)
            .SetEase(Ease.InOutSine));

        seq.Append(transform.DOScale(originalScale, duration * 0.3f)
            .SetEase(Ease.OutBack, 0.5f));

        seq.SetUpdate(true);
    }
    
    public void ResetAndPlay()
    {
        hasPlayed = false;
        transform.localScale = Vector3.zero;
        Pop();
    }
    
    void OnDestroy()
    {
        DOTween.Kill(transform);
    }
    
    void OnEnable()
    {
        // 如果物体被重新激活，重置状态
        if (!hasPlayed)
        {
            transform.localScale = Vector3.zero;
        }
    }
}