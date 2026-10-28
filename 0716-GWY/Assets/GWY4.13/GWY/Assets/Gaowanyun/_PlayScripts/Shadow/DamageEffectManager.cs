using UnityEngine;
using UnityEngine.Rendering.PostProcessing;
using UnityEngine.UI;
using TMPro;

public class DamageEffectManager : MonoBehaviour
{
    public PostProcessVolume postProcessVolume;  // 后处理卷
    private Vignette vignette;                   // Vignette效果
    public float damageEffectIntensity = 0.4f;   // 受伤时的效果强度
    public float fadeSpeed;                      // 渐隐速度

    private bool isBreathingEffectActive = false; // 呼吸效果是否激活
    private float currentSmoothness = 0f;         // 当前smoothness值

    public TextMeshProUGUI warningText;                     // UI警告文本
    public Color warningColor = Color.red;       // 警告文本颜色

    private void Start()
    {
        // 获取Vignette效果
        postProcessVolume.profile.TryGetSettings(out vignette);
        if (vignette != null)
        {
            vignette.intensity.value = 0f;        // 初始状态无效果
            vignette.smoothness.value = 0f;       // 初始smoothness为0
        }

        // 初始化警告文本
        if (warningText != null)
        {
            warningText.text = "Get out of the light!"; // 设置警告文本内容
            warningText.color = new Color(warningColor.r, warningColor.g, warningColor.b, 0f); // 初始alpha值为0
        }
    }

    // 调用此函数以激活呼吸闪烁效果
    public void ActivateBreathingEffect()
    {
        isBreathingEffectActive = true;
    }

    private void Update()
    {
        if (isBreathingEffectActive)
        {
            // 如果 vignette intensity 未达到目标强度，逐渐增加到 0.4
            if (vignette.intensity.value < damageEffectIntensity)
            {
                vignette.intensity.value = Mathf.Lerp(vignette.intensity.value, damageEffectIntensity, Time.deltaTime * fadeSpeed);
            }

            // 呼吸闪烁效果，通过正弦波控制 smoothness 在 0.2 到 0.5 之间波动
            currentSmoothness = Mathf.Abs(Mathf.Sin(Time.time * 2f)) * 0.3f + 0.2f;
            vignette.smoothness.value = currentSmoothness;

            // UI 警告文本呼吸效果，通过正弦波控制 alpha 值在 0 到 1 之间波动
            if (warningText != null)
            {
                float alpha = Mathf.Abs(Mathf.Sin(Time.time * 2f)); // 计算alpha值
                warningText.color = new Color(warningColor.r, warningColor.g, warningColor.b, alpha); // 应用alpha值到文本颜色
            }
        }
    }

    // 停止呼吸效果
    public void StopBreathingEffect()
    {
        isBreathingEffectActive = false;
        vignette.smoothness.value = 0f;  // smoothness 还原为 0
        vignette.intensity.value = 0f;   // intensity 还原为 0

        if (warningText != null)
        {
            warningText.color = new Color(warningColor.r, warningColor.g, warningColor.b, 0f); // 隐藏警告文本
        }
    }
}
