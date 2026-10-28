using System.Collections;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

/// <summary>
/// Scene transitions with optional fade overlay for chapter progression.
/// </summary>
public class SceneTransitionManager : MonoBehaviour
{
    public static SceneTransitionManager Instance { get; private set; }

    [Header("Fade")]
    [SerializeField] private CanvasGroup fadeOverlay;
    [SerializeField] private float fadeDuration = 0.45f;

    private bool isTransitioning;

    private void Awake()
    {
        if (Instance != null && Instance != this)
        {
            Destroy(gameObject);
            return;
        }

        Instance = this;
        DontDestroyOnLoad(gameObject);

        if (fadeOverlay != null)
        {
            fadeOverlay.alpha = 0f;
            fadeOverlay.blocksRaycasts = false;
        }
    }

    public void LoadScene(string sceneName)
    {
        if (!isTransitioning)
            StartCoroutine(LoadSceneRoutine(sceneName));
    }

    public void LoadSceneAsync(string sceneName)
    {
        if (!isTransitioning)
            StartCoroutine(LoadSceneAsyncRoutine(sceneName));
    }

    private IEnumerator LoadSceneRoutine(string sceneName)
    {
        isTransitioning = true;
        yield return Fade(1f);

        SceneManager.LoadScene(sceneName);

        yield return Fade(0f);
        isTransitioning = false;
    }

    private IEnumerator LoadSceneAsyncRoutine(string sceneName)
    {
        isTransitioning = true;
        yield return Fade(1f);

        var operation = SceneManager.LoadSceneAsync(sceneName);
        while (!operation.isDone)
            yield return null;

        yield return Fade(0f);
        isTransitioning = false;
    }

    private IEnumerator Fade(float targetAlpha)
    {
        if (fadeOverlay == null)
            yield break;

        fadeOverlay.blocksRaycasts = targetAlpha > 0.01f;
        var start = fadeOverlay.alpha;
        var elapsed = 0f;

        while (elapsed < fadeDuration)
        {
            elapsed += Time.unscaledDeltaTime;
            fadeOverlay.alpha = Mathf.Lerp(start, targetAlpha, elapsed / fadeDuration);
            yield return null;
        }

        fadeOverlay.alpha = targetAlpha;
    }
}
