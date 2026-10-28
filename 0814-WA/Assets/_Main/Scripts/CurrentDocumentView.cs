using System.Collections;
using UnityEngine;
using UnityEngine.UI;

/// <summary>
/// Controls the visual state of the document currently being processed.
/// The three stamp images are authored in the prefab and start hidden.
/// </summary>
[DisallowMultipleComponent]
public sealed class CurrentDocumentView : MonoBehaviour
{
    [SerializeField] private Image documentImage;
    [SerializeField] private Image[] stampMarks;
    [SerializeField] private Transform stampPressPoint;

    public Image DocumentImage => documentImage;
    public Transform StampPressPoint => stampPressPoint;

    private void Awake()
    {
        HideAllStamps();
    }

    public void ShowStamp(int stampIndex)
    {
        if (stampIndex < 0 || stampIndex >= stampMarks.Length)
        {
            Debug.LogWarning($"Stamp index {stampIndex} is out of range.", this);
            return;
        }

        for (var index = 0; index < stampMarks.Length; index++)
        {
            stampMarks[index].gameObject.SetActive(index == stampIndex);
        }
    }

    public void HideAllStamps()
    {
        foreach (var stampMark in stampMarks)
        {
            if (stampMark != null)
            {
                stampMark.gameObject.SetActive(false);
            }
        }
    }

    public IEnumerator RevealStamp(int stampIndex, float duration)
    {
        if (stampIndex < 0 || stampIndex >= stampMarks.Length)
        {
            yield break;
        }

        ShowStamp(stampIndex);
        var stampMark = stampMarks[stampIndex];
        var image = stampMark;
        var originalColor = image.color;
        var originalScale = stampMark.transform.localScale;
        image.color = new Color(originalColor.r, originalColor.g, originalColor.b, 0f);
        stampMark.transform.localScale = originalScale * 1.22f;

        var elapsed = 0f;
        while (elapsed < duration)
        {
            elapsed += Time.unscaledDeltaTime;
            var progress = Mathf.SmoothStep(0f, 1f, elapsed / duration);
            image.color = new Color(originalColor.r, originalColor.g, originalColor.b, progress);
            stampMark.transform.localScale = Vector3.Lerp(originalScale * 1.22f, originalScale, progress);
            yield return null;
        }

        image.color = originalColor;
        stampMark.transform.localScale = originalScale;
    }
}
