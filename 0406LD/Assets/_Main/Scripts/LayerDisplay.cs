using UnityEngine;
using UnityEngine.UI;

public class LayerDisplay : MonoBehaviour
{
    public Text layerText;

    void Start()
    {
        // 初始显示
        UpdateDisplay(MapManager.Instance.CurrentCenterLayer);
        
        // 注册变更事件
        MapManager.Instance.OnLayerChanged += UpdateDisplay;
    }

    void UpdateDisplay(int newLayer)
    {
        layerText.text = $"Current Depth:{newLayer} Level";
    }

    void OnDestroy()
    {
        MapManager.Instance.OnLayerChanged -= UpdateDisplay;
    }
}