using DG.Tweening;
using UnityEngine;

public class WormSpriteWriggle : MonoBehaviour
{
    [SerializeField] float scaleAmount = 0.2f;
    [SerializeField] float halfCycle = 0.3f; // �������

    Deadline mover;

    void Start()
    {
        mover = GetComponentInParent<Deadline>();

        var seq = DOTween.Sequence();

        seq.Append(transform.DOScale(new Vector3(1f + scaleAmount, 1f - scaleAmount, 1f), halfCycle)
                     .SetEase(Ease.InOutSine));

        seq.Append(transform.DOScale(new Vector3(1f, 1f, 1f), halfCycle)
                     .SetEase(Ease.InOutSine)
                     .OnComplete(() => mover?.RequestStep()));

        seq.SetLoops(-1);
    }
}
