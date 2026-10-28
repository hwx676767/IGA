using UnityEngine;
using DG.Tweening;

public class PopEffect : MonoBehaviour
{
    [Header("果冻弹出参数")]
    [Tooltip("弹出总时长（建议 0.8~1.5 秒之间）")]
    public float duration = 1.0f;

    [Tooltip("最大放大倍数（1.1~1.4 建议）")]
    public float overshootScale = 1.25f;

    [Tooltip("自动在 Start() 播放")]
    public bool autoPlay = true;

    private Vector3 originalScale;

    void Start()
    {
        originalScale = transform.localScale;

        if (autoPlay)
            Pop();
    }

    [ContextMenu("Pop")]
    public void Pop()
    {
        transform.localScale = Vector3.zero;
        Sequence seq = DOTween.Sequence();

        seq.Append(transform.DOScale(originalScale * overshootScale, duration * 0.45f)
            .SetEase(Ease.OutQuad));

        seq.Append(transform.DOScale(originalScale * 0.97f, duration * 0.25f)
            .SetEase(Ease.InOutSine));

        seq.Append(transform.DOScale(originalScale, duration * 0.3f)
            .SetEase(Ease.OutBack, 0.5f));

        seq.SetUpdate(true); 
    }
}