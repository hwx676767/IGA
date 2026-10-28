using UnityEngine;
using UnityEngine.EventSystems;

public class HoverShowWithButtons : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler
{
    [Header("鼠标移入前显示的内容")]
    public GameObject before;

    [Header("鼠标移入后显示的面板（里面可以有Button）")]
    public GameObject toActivePanel;

    private void Start()
    {
        if (before != null) before.SetActive(true);
        if (toActivePanel != null) toActivePanel.SetActive(false);
    }

    public void OnPointerEnter(PointerEventData eventData)
    {
        if (before != null) before.SetActive(false);
        if (toActivePanel != null) toActivePanel.SetActive(true);
    }

    // 关键修改：使用 fullyExited 判断是否真正离开整个区域
    public void OnPointerExit(PointerEventData eventData)
    {
        // 如果鼠标还在 HoverRoot 的子物体上（包括 ToActivePanel 里的 Button），就不隐藏
        if (!eventData.fullyExited)
            return;

        if (before != null) before.SetActive(true);
        if (toActivePanel != null) toActivePanel.SetActive(false);
    }
}