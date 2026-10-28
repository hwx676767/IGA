using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using System.Collections;

public class SceneLoader : MonoBehaviour
{
    public GameObject loadingSlider;  // 显示加载进度的Slider
    public Text loadingText;          // 显示加载进度的文本
    public Camera mainCamera;         // 当前场景的主相机
    public Button[] loadSceneButtons; // 场景切换按钮数组，支持多个按钮
    public string[] sceneNamesToLoad; // 要加载的场景名称数组，对应按钮的场景名
    private bool isSceneLoading = false;  // 防止重复加载的标志位

    private void Start()
    {
        // 初始时隐藏Slider和进度文本
        loadingSlider.SetActive(false);
        loadingText.gameObject.SetActive(false);

        // 切换场景时不销毁主相机
        DontDestroyOnLoad(mainCamera.gameObject);

        // 绑定按钮点击事件
        for (int i = 0; i < loadSceneButtons.Length; i++)
        {
            int index = i;  // 闭包问题解决方案
            loadSceneButtons[i].onClick.AddListener(() => StartSceneLoad(sceneNamesToLoad[index]));
        }
    }

    // 开始加载场景
    private void StartSceneLoad(string sceneName)
    {
        if (isSceneLoading) return;

        isSceneLoading = true;

        // 禁用所有按钮防止重复点击
        foreach (var button in loadSceneButtons)
        {
            button.interactable = false;
        }

        StartCoroutine(LoadSceneAsync(sceneName));
    }

    // 异步加载场景
    private IEnumerator LoadSceneAsync(string sceneName)
    {
        // 显示加载进度条和文本
        loadingSlider.SetActive(true);
        loadingText.gameObject.SetActive(true);

        AsyncOperation asyncLoad = SceneManager.LoadSceneAsync(sceneName);
        asyncLoad.allowSceneActivation = false;

        // 更新进度条
        while (!asyncLoad.isDone)
        {
            float progress = Mathf.Clamp01(asyncLoad.progress / 0.9f);
            loadingSlider.GetComponent<Slider>().value = progress;
            loadingText.text = "Loading... " + (progress * 100) + "%";

            if (asyncLoad.progress >= 0.9f)
            {
                asyncLoad.allowSceneActivation = true;
            }

            yield return null;
        }

        loadingSlider.SetActive(false);
        loadingText.gameObject.SetActive(false);
        isSceneLoading = false;
    }
}