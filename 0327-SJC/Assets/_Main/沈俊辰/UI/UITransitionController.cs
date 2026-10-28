using System.Collections;
using UnityEngine;
using UnityEngine.UI;

/// <summary>
/// Reusable fade / slide transitions for UI panels and buttons.
/// Attach CanvasGroup to panels for smooth alpha transitions.
/// </summary>
public class UITransitionController : MonoBehaviour
{
    [Header("Timing")]
    [SerializeField] private float fadeDuration = 0.28f;
    [SerializeField] private float slideDistance = 36f;

    [Header("Easing")]
    [SerializeField] private AnimationCurve easeCurve = AnimationCurve.EaseInOut(0f, 0f, 1f, 1f);

    public IEnumerator ShowPanel(GameObject panel, SlideDirection direction = SlideDirection.Up)
    {
        if (panel == null)
            yield break;

        panel.SetActive(true);
        var canvasGroup = GetOrAddCanvasGroup(panel);
        var rect = panel.GetComponent<RectTransform>();
        var startOffset = GetSlideOffset(direction, inverted: true);
        var endOffset = Vector2.zero;

        if (rect != null)
            rect.anchoredPosition += startOffset;

        canvasGroup.alpha = 0f;
        canvasGroup.interactable = false;
        canvasGroup.blocksRaycasts = false;

        yield return AnimatePanel(canvasGroup, rect, startOffset, endOffset, 0f, 1f);

        canvasGroup.interactable = true;
        canvasGroup.blocksRaycasts = true;
    }

    public IEnumerator HidePanel(GameObject panel, SlideDirection direction = SlideDirection.Down)
    {
        if (panel == null)
            yield break;

        var canvasGroup = GetOrAddCanvasGroup(panel);
        var rect = panel.GetComponent<RectTransform>();
        var endOffset = GetSlideOffset(direction, inverted: false);

        canvasGroup.interactable = false;
        canvasGroup.blocksRaycasts = false;

        yield return AnimatePanel(canvasGroup, rect, Vector2.zero, endOffset, canvasGroup.alpha, 0f);
        panel.SetActive(false);

        if (rect != null)
            rect.anchoredPosition -= endOffset;
    }

    public void PlayButtonPulse(Button button)
    {
        if (button != null)
            StartCoroutine(ButtonPulseRoutine(button.transform));
    }

    private IEnumerator AnimatePanel(CanvasGroup canvasGroup, RectTransform rect, Vector2 fromOffset, Vector2 toOffset, float fromAlpha, float toAlpha)
    {
        var elapsed = 0f;
        while (elapsed < fadeDuration)
        {
            elapsed += Time.unscaledDeltaTime;
            var t = easeCurve.Evaluate(Mathf.Clamp01(elapsed / fadeDuration));

            canvasGroup.alpha = Mathf.Lerp(fromAlpha, toAlpha, t);
            if (rect != null)
                rect.anchoredPosition += (toOffset - fromOffset) * (t - (elapsed > 0f ? easeCurve.Evaluate(Mathf.Clamp01((elapsed - Time.unscaledDeltaTime) / fadeDuration)) : 0f));

            yield return null;
        }

        canvasGroup.alpha = toAlpha;
    }

    private IEnumerator ButtonPulseRoutine(Transform target)
    {
        var originalScale = target.localScale;
        var pulseScale = originalScale * 1.06f;
        var half = fadeDuration * 0.5f;
        var elapsed = 0f;

        while (elapsed < half)
        {
            elapsed += Time.unscaledDeltaTime;
            target.localScale = Vector3.Lerp(originalScale, pulseScale, elapsed / half);
            yield return null;
        }

        elapsed = 0f;
        while (elapsed < half)
        {
            elapsed += Time.unscaledDeltaTime;
            target.localScale = Vector3.Lerp(pulseScale, originalScale, elapsed / half);
            yield return null;
        }

        target.localScale = originalScale;
    }

    private Vector2 GetSlideOffset(SlideDirection direction, bool inverted)
    {
        var sign = inverted ? -1f : 1f;
        switch (direction)
        {
            case SlideDirection.Up: return new Vector2(0f, slideDistance * sign);
            case SlideDirection.Down: return new Vector2(0f, -slideDistance * sign);
            case SlideDirection.Left: return new Vector2(-slideDistance * sign, 0f);
            case SlideDirection.Right: return new Vector2(slideDistance * sign, 0f);
            default: return Vector2.zero;
        }
    }

    private static CanvasGroup GetOrAddCanvasGroup(GameObject panel)
    {
        var canvasGroup = panel.GetComponent<CanvasGroup>();
        if (canvasGroup == null)
            canvasGroup = panel.AddComponent<CanvasGroup>();

        return canvasGroup;
    }

    public enum SlideDirection
    {
        Up,
        Down,
        Left,
        Right
    }
}
