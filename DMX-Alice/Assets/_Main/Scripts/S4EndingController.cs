using System.Collections;
using UnityEngine;
using UnityEngine.UI;

/// <summary>
/// Uses scene-authored S4 objects. Runtime only toggles visibility and fills
/// the ending copy. Player Y eases from -210 to -160 during the hold.
/// </summary>
[RequireComponent(typeof(Canvas))]
public class S4EndingController : MonoBehaviour
{
    private const float BlackoutDuration = 5f;
    private const float PlayerStartY = -210f;
    private const float PlayerEndY = -160f;

    [SerializeField] private string restartSceneName = "S1";
    [SerializeField] private Button endButton;

    private Canvas _canvas;
    private Image _blackout;
    private GameObject _endingContent;
    private Text _endLabel;
    private Text _title;
    private Text _detail;
    private RectTransform _player;

    private void Awake()
    {
        _canvas = GetComponent<Canvas>();
        BindAuthoredObjects();
        if (_endingContent != null) _endingContent.SetActive(false);
        if (_blackout != null)
        {
            _blackout.gameObject.SetActive(true);
            Color color = _blackout.color;
            color.a = 1f;
            _blackout.color = color;
            _blackout.transform.SetAsLastSibling();
        }
    }

    private void Start()
    {
        if (_blackout == null) _blackout = CreateBlackout(_canvas.transform, "S4Blackout");
        StartCoroutine(RevealEnding());
    }

    private void BindAuthoredObjects()
    {
        Transform ending = FindChild(transform, "EndingCard");
        if (ending != null)
        {
            _endingContent = ending.gameObject;
            _endLabel = FindText(ending, "TheEnd");
            _title = FindText(ending, "ResultTitle");
            _detail = FindText(ending, "ResultDetail");
        }

        Transform blackout = FindChild(transform, "S4Blackout");
        if (blackout != null) _blackout = blackout.GetComponent<Image>();

        Transform player = FindChild(transform, "Player");
        if (player != null) _player = player.GetComponent<RectTransform>();

        BindEndButton(ending);
    }

    private void BindEndButton(Transform endingRoot)
    {
        if (endButton == null)
        {
            Transform found = FindChild(transform, "EndButton");
            if (found == null && endingRoot != null) found = FindChild(endingRoot, "EndButton");
            if (found == null && endingRoot != null)
            {
                Button[] buttons = endingRoot.GetComponentsInChildren<Button>(true);
                if (buttons != null && buttons.Length > 0) endButton = buttons[0];
            }
            else if (found != null)
                endButton = found.GetComponent<Button>();
        }

        if (endButton == null) return;
        endButton.onClick.RemoveListener(RestartGame);
        endButton.onClick.AddListener(RestartGame);
    }

    private void RestartGame()
    {
        StageEndingResult.Clear();
        SceneTransition.LoadScene(restartSceneName, string.Empty);
    }

    private IEnumerator RevealEnding()
    {
        if (_player != null)
        {
            Vector2 start = _player.anchoredPosition;
            start.y = PlayerStartY;
            _player.anchoredPosition = start;
        }

        yield return Fade(_blackout, 1f, 0f, .45f);
        yield return MovePlayerDuringHold(BlackoutDuration);
        yield return Fade(_blackout, 0f, 1f, .45f);
        ShowEndingCard();
    }

    private IEnumerator MovePlayerDuringHold(float duration)
    {
        if (_player == null)
        {
            yield return new WaitForSecondsRealtime(duration);
            yield break;
        }

        Vector2 from = _player.anchoredPosition;
        Vector2 to = from;
        from.y = PlayerStartY;
        to.y = PlayerEndY;
        _player.anchoredPosition = from;
        float elapsed = 0f;
        while (elapsed < duration)
        {
            elapsed += Time.unscaledDeltaTime;
            float t = Mathf.SmoothStep(0f, 1f, elapsed / duration);
            _player.anchoredPosition = Vector2.Lerp(from, to, t);
            yield return null;
        }
        _player.anchoredPosition = to;
    }

    private void ShowEndingCard()
    {
        if (_endingContent == null)
            _endingContent = CreateEndingContent();

        if (_endLabel != null) _endLabel.text = "THE END";
        if (_title != null)
        {
            _title.text = "The show is over · " + StageEndingResult.Title;
            _title.color = StageEndingResult.RequiresAttention ? new Color(1f, .35f, .32f) : Color.white;
        }
        if (_detail != null) _detail.text = StageEndingResult.Detail;

        _endingContent.SetActive(true);
        _endingContent.transform.SetAsLastSibling();
    }

    private GameObject CreateEndingContent()
    {
        GameObject group = new GameObject("EndingCard", typeof(RectTransform));
        group.transform.SetParent(transform, false);
        RectTransform groupRect = group.GetComponent<RectTransform>();
        groupRect.anchorMin = new Vector2(.16f, .22f);
        groupRect.anchorMax = new Vector2(.84f, .78f);
        groupRect.offsetMin = groupRect.offsetMax = Vector2.zero;
        _endLabel = CreateText(group.transform, "TheEnd", 46, TextAnchor.MiddleCenter);
        _title = CreateText(group.transform, "ResultTitle", 31, TextAnchor.MiddleCenter);
        _detail = CreateText(group.transform, "ResultDetail", 23, TextAnchor.MiddleCenter);
        SetAnchors(_endLabel.rectTransform, 0f, .66f, 1f, 1f);
        SetAnchors(_title.rectTransform, 0f, .40f, 1f, .66f);
        SetAnchors(_detail.rectTransform, .06f, .12f, .94f, .40f);
        _detail.horizontalOverflow = HorizontalWrapMode.Wrap;
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
        if (image == null) yield break;
        image.gameObject.SetActive(true);
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
        text.font = RuntimeMonaFont.Load();
        text.fontSize = fontSize;
        text.alignment = alignment;
        text.color = Color.white;
        text.raycastTarget = false;
        return text;
    }

    private static Text FindText(Transform root, string objectName)
    {
        Transform found = FindChild(root, objectName);
        return found == null ? null : found.GetComponent<Text>();
    }

    private static Transform FindChild(Transform root, string objectName)
    {
        if (root == null) return null;
        if (root.name == objectName) return root;
        for (int i = 0; i < root.childCount; i++)
        {
            Transform found = FindChild(root.GetChild(i), objectName);
            if (found != null) return found;
        }
        return null;
    }

    private static void SetAnchors(RectTransform rect, float minX, float minY, float maxX, float maxY)
    {
        rect.anchorMin = new Vector2(minX, minY);
        rect.anchorMax = new Vector2(maxX, maxY);
        rect.offsetMin = rect.offsetMax = Vector2.zero;
    }
}
