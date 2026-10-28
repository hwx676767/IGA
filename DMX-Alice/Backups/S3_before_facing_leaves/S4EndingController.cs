using System.Collections;
using UnityEngine;
using UnityEngine.UI;

/// <summary>
/// Reveals the user-authored S4 scene after S3's transition, holds it for five
/// seconds, then returns to black for the final result.
/// </summary>
[RequireComponent(typeof(Canvas))]
public class S4EndingController : MonoBehaviour
{
    private const float BlackoutDuration = 5f;
    private Canvas _canvas;
    private Image _blackout;
    private GameObject _endingContent;

    private void Start()
    {
        _canvas = GetComponent<Canvas>();
        _blackout = CreateBlackout(_canvas.transform, "S4Blackout");
        StartCoroutine(RevealEnding());
    }

    private IEnumerator RevealEnding()
    {
        // The S3 blackout carries through scene loading, then clears so the
        // player can see the authored S4 image before the final card appears.
        yield return Fade(_blackout, 1f, 0f, .45f);
        yield return new WaitForSecondsRealtime(BlackoutDuration);
        yield return Fade(_blackout, 0f, 1f, .45f);
        _endingContent = CreateEndingContent();
    }

    private GameObject CreateEndingContent()
    {
        GameObject group = new GameObject("EndingText_Runtime", typeof(RectTransform));
        group.transform.SetParent(transform, false);
        group.transform.SetAsLastSibling();
        RectTransform groupRect = group.GetComponent<RectTransform>();
        groupRect.anchorMin = new Vector2(.16f, .22f);
        groupRect.anchorMax = new Vector2(.84f, .78f);
        groupRect.offsetMin = groupRect.offsetMax = Vector2.zero;

        Text end = CreateText(group.transform, "TheEnd", 46, TextAnchor.MiddleCenter);
        end.text = "THE END";
        end.fontStyle = FontStyle.Bold;
        SetAnchors(end.rectTransform, 0f, .66f, 1f, 1f);

        Text title = CreateText(group.transform, "ResultTitle", 31, TextAnchor.MiddleCenter);
        title.text = "The show is over · " + StageEndingResult.Title;
        title.color = StageEndingResult.RequiresAttention ? new Color(1f, .35f, .32f) : Color.white;
        SetAnchors(title.rectTransform, 0f, .40f, 1f, .66f);

        Text detail = CreateText(group.transform, "ResultDetail", 23, TextAnchor.MiddleCenter);
        detail.text = StageEndingResult.Detail;
        detail.horizontalOverflow = HorizontalWrapMode.Wrap;
        SetAnchors(detail.rectTransform, .06f, .12f, .94f, .40f);

        return group;
    }

    private static Image CreateBlackout(Transform parent, string objectName)
    {
        GameObject go = new GameObject(objectName, typeof(RectTransform), typeof(Image));
        go.transform.SetParent(parent, false);
        RectTransform rect = go.GetComponent<RectTransform>();
        rect.anchorMin = Vector2.zero;
        rect.anchorMax = Vector2.one;
        rect.offsetMin = rect.offsetMax = Vector2.zero;
        Image image = go.GetComponent<Image>();
        image.color = Color.black;
        image.raycastTarget = true;
        go.transform.SetAsLastSibling();
        return image;
    }

    private static IEnumerator Fade(Image image, float from, float to, float duration)
    {
        float elapsed = 0f;
        while (elapsed < duration)
        {
            elapsed += Time.unscaledDeltaTime;
            Color color = image.color;
            color.a = Mathf.Lerp(from, to, elapsed / duration);
            image.color = color;
            yield return null;
        }
        Color finalColor = image.color;
        finalColor.a = to;
        image.color = finalColor;
    }

    private static Text CreateText(Transform parent, string objectName, int fontSize, TextAnchor alignment)
    {
        GameObject go = new GameObject(objectName, typeof(RectTransform), typeof(Text));
        go.transform.SetParent(parent, false);
        Text text = go.GetComponent<Text>();
        text.font = FontFromScene();
        text.fontSize = fontSize;
        text.alignment = alignment;
        text.color = Color.white;
        text.raycastTarget = false;
        return text;
    }

    private static Font FontFromScene()
    {
        Text[] texts = FindObjectsOfType<Text>(true);
        for (int i = 0; i < texts.Length; i++)
            if (texts[i] != null && texts[i].font != null)
                return texts[i].font;
        return Resources.GetBuiltinResource<Font>("Arial.ttf");
    }

    private static void SetAnchors(RectTransform rect, float minX, float minY, float maxX, float maxY)
    {
        rect.anchorMin = new Vector2(minX, minY);
        rect.anchorMax = new Vector2(maxX, maxY);
        rect.offsetMin = rect.offsetMax = Vector2.zero;
    }
}
