using System.Collections;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

/// <summary>
/// Shared full-screen transition: fade to black, show a white chapter label,
/// load the next scene, then fade the black screen away.
/// </summary>
public class SceneTransition : MonoBehaviour
{
    private static SceneTransition _instance;

    private CanvasGroup _group;
    private Text _label;
    private bool _isTransitioning;

    public static void LoadScene(string sceneName, string chapterLabel)
    {
        if (string.IsNullOrWhiteSpace(sceneName) || !Application.CanStreamedLevelBeLoaded(sceneName))
        {
            Debug.LogWarning("SceneTransition could not load scene: " + sceneName);
            return;
        }

        GetOrCreate().Begin(sceneName, chapterLabel);
    }

    public static void LoadScene(int buildIndex, string chapterLabel)
    {
        if (buildIndex < 0 || buildIndex >= SceneManager.sceneCountInBuildSettings) return;
        GetOrCreate().Begin(buildIndex, chapterLabel);
    }

    private static SceneTransition GetOrCreate()
    {
        if (_instance != null) return _instance;
        GameObject go = new GameObject("SceneTransition_Runtime");
        _instance = go.AddComponent<SceneTransition>();
        return _instance;
    }

    private void Awake()
    {
        if (_instance != null && _instance != this)
        {
            Destroy(gameObject);
            return;
        }

        _instance = this;
        DontDestroyOnLoad(gameObject);
        BuildOverlay();
    }

    private void Begin(string sceneName, string chapterLabel)
    {
        if (!_isTransitioning) StartCoroutine(Transition(sceneName, chapterLabel));
    }

    private void Begin(int buildIndex, string chapterLabel)
    {
        if (!_isTransitioning) StartCoroutine(Transition(buildIndex, chapterLabel));
    }

    private IEnumerator Transition(string sceneName, string chapterLabel)
    {
        _isTransitioning = true;
        _label.gameObject.SetActive(false);
        yield return Fade(0f, 1f, .5f);

        if (!string.IsNullOrWhiteSpace(chapterLabel))
        {
            _label.text = chapterLabel;
            _label.gameObject.SetActive(true);
            yield return new WaitForSecondsRealtime(1.1f);
            _label.gameObject.SetActive(false);
        }

        AsyncOperation loadOperation = SceneManager.LoadSceneAsync(sceneName);
        while (!loadOperation.isDone) yield return null;
        yield return null;

        yield return Fade(1f, 0f, .55f);
        _isTransitioning = false;
    }

    private IEnumerator Transition(int buildIndex, string chapterLabel)
    {
        _isTransitioning = true;
        _label.gameObject.SetActive(false);
        yield return Fade(0f, 1f, .5f);

        if (!string.IsNullOrWhiteSpace(chapterLabel))
        {
            _label.text = chapterLabel;
            _label.gameObject.SetActive(true);
            yield return new WaitForSecondsRealtime(1.1f);
            _label.gameObject.SetActive(false);
        }

        AsyncOperation loadOperation = SceneManager.LoadSceneAsync(buildIndex);
        while (!loadOperation.isDone) yield return null;
        yield return null;

        yield return Fade(1f, 0f, .55f);
        _isTransitioning = false;
    }

    private void BuildOverlay()
    {
        GameObject canvasObject = new GameObject("TransitionCanvas", typeof(Canvas), typeof(CanvasScaler), typeof(GraphicRaycaster), typeof(CanvasGroup));
        canvasObject.transform.SetParent(transform, false);
        Canvas canvas = canvasObject.GetComponent<Canvas>();
        canvas.renderMode = RenderMode.ScreenSpaceOverlay;
        canvas.overrideSorting = true;
        canvas.sortingOrder = 32000;
        CanvasScaler scaler = canvasObject.GetComponent<CanvasScaler>();
        scaler.uiScaleMode = CanvasScaler.ScaleMode.ScaleWithScreenSize;
        scaler.referenceResolution = new Vector2(1920, 1080);
        scaler.matchWidthOrHeight = .5f;
        _group = canvasObject.GetComponent<CanvasGroup>();
        _group.alpha = 0f;
        _group.blocksRaycasts = false;

        GameObject black = new GameObject("Black", typeof(RectTransform), typeof(Image));
        black.transform.SetParent(canvasObject.transform, false);
        RectTransform blackRect = black.GetComponent<RectTransform>();
        Stretch(blackRect);
        Image blackImage = black.GetComponent<Image>();
        blackImage.color = Color.black;
        blackImage.raycastTarget = true;

        GameObject textObject = new GameObject("ChapterLabel", typeof(RectTransform), typeof(Text));
        textObject.transform.SetParent(canvasObject.transform, false);
        RectTransform textRect = textObject.GetComponent<RectTransform>();
        textRect.anchorMin = new Vector2(.15f, .42f);
        textRect.anchorMax = new Vector2(.85f, .58f);
        textRect.offsetMin = textRect.offsetMax = Vector2.zero;
        _label = textObject.GetComponent<Text>();
        _label.font = RuntimeMonaFont.Load();
        _label.fontSize = 42;
        _label.fontStyle = FontStyle.Bold;
        _label.color = Color.white;
        _label.alignment = TextAnchor.MiddleCenter;
        _label.raycastTarget = false;
        textObject.SetActive(false);
    }

    private IEnumerator Fade(float from, float to, float duration)
    {
        _group.blocksRaycasts = true;
        float elapsed = 0f;
        while (elapsed < duration)
        {
            elapsed += Time.unscaledDeltaTime;
            _group.alpha = Mathf.Lerp(from, to, elapsed / duration);
            yield return null;
        }
        _group.alpha = to;
        _group.blocksRaycasts = to > 0f;
    }

    private static void Stretch(RectTransform rect)
    {
        rect.anchorMin = Vector2.zero;
        rect.anchorMax = Vector2.one;
        rect.offsetMin = rect.offsetMax = Vector2.zero;
    }
}
