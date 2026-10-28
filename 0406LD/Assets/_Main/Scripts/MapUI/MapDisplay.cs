using UnityEngine;
using UnityEngine.UI;

public class MapDisplay : MonoBehaviour
{
    [Header("绑定")]
    public RawImage mapImage;      // UI上的RawImage
    public MapCamera mapCamera;    // 地图相机

    [Header("显示设置")]
    [Range(0.1f, 0.8f)] public float screenRatio = 0.4f; // 占屏幕比例
    public float maxPixelSize = 500f; // 最大像素尺寸

    void Start()
    {
        UpdateMapDisplay();
    }

    void Update()
    {
        // 窗口大小变化时自适应
        if (Screen.width != lastScreenWidth || Screen.height != lastScreenHeight)
        {
            UpdateMapDisplay();
        }
    }

    private int lastScreenWidth, lastScreenHeight;
    void UpdateMapDisplay()
    {
        // 计算正方形尺寸
        float minScreenDimension = Mathf.Min(Screen.width, Screen.height);
        float size = minScreenDimension * screenRatio;
        size = Mathf.Min(size, maxPixelSize);

        // 应用尺寸
        mapImage.rectTransform.sizeDelta = new Vector2(size, size);
        
        // 记录当前分辨率
        lastScreenWidth = Screen.width;
        lastScreenHeight = Screen.height;
    }
}