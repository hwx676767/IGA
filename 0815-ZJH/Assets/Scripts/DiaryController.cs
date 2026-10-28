using System.Collections;
using UnityEngine;

/// <summary>
/// Controls the staged reveal of diary content.
/// Attach it to the active Canvas, then assign the panel and content groups.
/// </summary>
public class DiaryController : MonoBehaviour
{
    [Header("Diary Structure")]
    [SerializeField] private GameObject diaryPanel;
    [SerializeField] private GameObject group01;
    [SerializeField] private GameObject group02;

    [Header("Reveal Timing")]
    [SerializeField, Min(0.05f)] private float childFadeDuration = 0.35f;
    [SerializeField, Min(0f)] private float delayBetweenChildren = 0.1f;

    private Coroutine revealRoutine;
    private bool group01Complete;
    private bool group02Complete;
    private bool group02Queued;

    private void Awake()
    {
        PrepareGroup(group01);
        PrepareGroup(group02);

        if (diaryPanel != null)
        {
            diaryPanel.SetActive(false);
        }
    }

    /// <summary>
    /// Bound to the top-right diary button. Opens the book and reveals page one.
    /// </summary>
    public void OpenDiary()
    {
        OpenIntroDiary();
    }

    /// <summary>
    /// Opens the first diary entry. Its contents are shown one child at a time.
    /// </summary>
    public void OpenIntroDiary()
    {
        if (diaryPanel == null || group01 == null)
        {
            Debug.LogError("DiaryController is missing diaryPanel or group01.", this);
            return;
        }

        StopCurrentReveal();
        PrepareGroup(group01);
        PrepareGroup(group02);
        group01Complete = false;
        group02Complete = false;
        group02Queued = false;

        diaryPanel.SetActive(true);
        revealRoutine = StartCoroutine(RevealGroup01());
    }

    /// <summary>
    /// Opens the diary after the meal. Page one stays visible; page two is revealed
    /// (or shown immediately if it was already unlocked this playthrough).
    /// </summary>
    public void OpenPostMealDiary()
    {
        if (diaryPanel == null || group01 == null || group02 == null)
        {
            Debug.LogError("DiaryController is missing one or more diary groups.", this);
            return;
        }

        StopCurrentReveal();
        PrepareGroup(group01);
        PrepareGroup(group02);
        group01Complete = true;
        group02Queued = false;

        diaryPanel.SetActive(true);
        ShowGroupImmediately(group01);

        if (group02Complete)
        {
            ShowGroupImmediately(group02);
            return;
        }

        revealRoutine = StartCoroutine(RevealGroup02());
    }

    /// <summary>
    /// Call this from the relevant story trigger to reveal the second diary group.
    /// </summary>
    public void RevealGroup02ForStory()
    {
        if (diaryPanel == null || group02 == null)
        {
            Debug.LogError("DiaryController is missing diaryPanel or group02.", this);
            return;
        }

        if (group02Complete) return;

        if (!diaryPanel.activeSelf)
        {
            diaryPanel.SetActive(true);
        }

        if (!group01Complete)
        {
            group02Queued = true;
            return;
        }

        StopCurrentReveal();
        revealRoutine = StartCoroutine(RevealGroup02());
    }

    public bool IsDiaryOpen => diaryPanel != null && diaryPanel.activeSelf;

    public void CloseDiary()
    {
        StopCurrentReveal();

        if (diaryPanel != null)
        {
            diaryPanel.SetActive(false);
        }
    }

    private IEnumerator RevealGroup01()
    {
        yield return RevealGroup(group01);
        group01Complete = true;

        if (group02Queued)
        {
            yield return RevealGroup(group02);
            group02Complete = true;
        }

        revealRoutine = null;
    }

    private IEnumerator RevealGroup02()
    {
        yield return RevealGroup(group02);
        group02Complete = true;
        revealRoutine = null;
    }

    private IEnumerator RevealGroup(GameObject group)
    {
        group.SetActive(true);

        for (var index = 0; index < group.transform.childCount; index++)
        {
            var child = group.transform.GetChild(index).gameObject;
            child.SetActive(true);

            var canvasGroup = child.GetComponent<CanvasGroup>();
            if (canvasGroup == null)
            {
                canvasGroup = child.AddComponent<CanvasGroup>();
            }

            canvasGroup.alpha = 0f;
            canvasGroup.interactable = false;
            canvasGroup.blocksRaycasts = false;

            yield return FadeIn(canvasGroup);

            canvasGroup.interactable = true;
            canvasGroup.blocksRaycasts = true;

            if (delayBetweenChildren > 0f && index < group.transform.childCount - 1)
            {
                yield return new WaitForSeconds(delayBetweenChildren);
            }
        }

    }

    private IEnumerator FadeIn(CanvasGroup canvasGroup)
    {
        var elapsed = 0f;
        while (elapsed < childFadeDuration)
        {
            elapsed += Time.unscaledDeltaTime;
            canvasGroup.alpha = Mathf.Clamp01(elapsed / childFadeDuration);
            yield return null;
        }

        canvasGroup.alpha = 1f;
    }

    private static void ShowGroupImmediately(GameObject group)
    {
        group.SetActive(true);

        for (var index = 0; index < group.transform.childCount; index++)
        {
            var child = group.transform.GetChild(index).gameObject;
            child.SetActive(true);

            var canvasGroup = child.GetComponent<CanvasGroup>();
            if (canvasGroup == null)
            {
                canvasGroup = child.AddComponent<CanvasGroup>();
            }

            canvasGroup.alpha = 1f;
            canvasGroup.interactable = true;
            canvasGroup.blocksRaycasts = true;
        }
    }

    private static void PrepareGroup(GameObject group)
    {
        if (group == null) return;

        for (var index = 0; index < group.transform.childCount; index++)
        {
            group.transform.GetChild(index).gameObject.SetActive(false);
        }

        group.SetActive(false);
    }

    private void StopCurrentReveal()
    {
        if (revealRoutine == null) return;

        StopCoroutine(revealRoutine);
        revealRoutine = null;
    }
}
