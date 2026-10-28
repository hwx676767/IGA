using UnityEngine;


public class ForceEnableCanvas : MonoBehaviour
{
    public Canvas uiCanvas;  // 你要强制显示的Canvas

    void Start()
    {
        if (uiCanvas != null)
        {
            uiCanvas.enabled = true;  // 启用Canvas
            uiCanvas.gameObject.SetActive(true);  // 激活Canvas的GameObject
        }
    }

}
