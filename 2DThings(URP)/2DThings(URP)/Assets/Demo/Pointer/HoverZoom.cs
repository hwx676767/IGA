using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems; // 需要引入这个命名空间

public class HoverZoom : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler
{
    public float scaleFactor = 1.2f; // 放大的倍数
    private Vector3 originalScale;
    private RectTransform rectTransform;

    void Start()
    {
        // 获取 RectTransform 组件
        rectTransform = GetComponent<RectTransform>();
        // 保存原始的缩放
        originalScale = rectTransform.localScale;
    }

    public void OnPointerEnter(PointerEventData eventData)
    {
        // 鼠标进入时放大
        rectTransform.localScale = originalScale * scaleFactor;
    }

    public void OnPointerExit(PointerEventData eventData)
    {
        // 鼠标离开时恢复原始大小
        rectTransform.localScale = originalScale;
    }
}
