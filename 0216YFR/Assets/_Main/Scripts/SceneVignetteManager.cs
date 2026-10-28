using UnityEngine;
using UnityEngine.Rendering.PostProcessing;
using UnityEngine.SceneManagement;

public class SceneVignetteManager : MonoBehaviour
{
    [Header("场景1设置")]
    public float scene1Intensity = 0.495f;
    public float scene1Smoothness = 0.707f;
    public Color scene1Color = new Color(0.094f, 0f, 0.192f); // 180031
    public bool scene1Rounded = true;

    [Header("场景2设置")]
    public float scene2Intensity = 0.524f;
    public float scene2Smoothness = 0.34f;
    public Color scene2Color = new Color(0.925f, 0.882f, 0.333f); // ECE155
    public bool scene2Rounded = false;

    [Header("引用")]
    public PostProcessVolume targetVolume;
    private Vignette _vignette;

    void Start()
    {
        // 确保Volume和Profile存在
        if (targetVolume == null)
        {
            targetVolume = FindObjectOfType<PostProcessVolume>();
            if (targetVolume == null)
            {
                Debug.LogError("未找到PostProcessVolume");
                return;
            }
        }

        // 获取或创建Vignette效果
        if (!targetVolume.profile.TryGetSettings(out _vignette))
        {
            _vignette = targetVolume.profile.AddSettings<Vignette>();
            _vignette.enabled.Override(true);
        }

        // 根据场景应用设置
        ApplySceneSettings();
    }

    void ApplySceneSettings()
    {
        string sceneName = UnityEngine.SceneManagement.SceneManager.GetActiveScene().name;

        if (sceneName == "Demo01") // 替换为你的实际场景名
        {
            _vignette.intensity.Override(scene1Intensity);
            _vignette.smoothness.Override(scene1Smoothness);
            _vignette.color.Override(scene1Color);
            _vignette.rounded.Override(scene1Rounded);
        }
        else if (sceneName == "Demo02") // 替换为你的实际场景名
        {
            _vignette.intensity.Override(scene2Intensity);
            _vignette.smoothness.Override(scene2Smoothness);
            _vignette.color.Override(scene2Color);
            _vignette.rounded.Override(scene2Rounded);
        }

        Debug.Log($"应用Vignette设置 - 场景: {sceneName}");
    }

    // 当场景切换时重新加载
    void OnEnable()
    {
        UnityEngine.SceneManagement.SceneManager.sceneLoaded += OnSceneLoaded;
    }

    void OnDisable()
    {
        UnityEngine.SceneManagement.SceneManager.sceneLoaded -= OnSceneLoaded;
    }

    
    private void OnSceneLoaded(Scene scene, LoadSceneMode mode)
    {
        ApplySceneSettings();
    }

    // 颜色转换工具方法
    public static Color HexToColor(string hex)
    {
        hex = hex.Replace("#", "");
        float r = int.Parse(hex.Substring(0, 2), System.Globalization.NumberStyles.HexNumber) / 255f;
        float g = int.Parse(hex.Substring(2, 2), System.Globalization.NumberStyles.HexNumber) / 255f;
        float b = int.Parse(hex.Substring(4, 2), System.Globalization.NumberStyles.HexNumber) / 255f;
        return new Color(r, g, b);
    }
}