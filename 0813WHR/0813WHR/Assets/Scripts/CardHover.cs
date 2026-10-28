using UnityEngine;
using UnityEngine.EventSystems;

public class CardHover : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler
{
    private Vector3 originalPosition;
    private RectTransform rectTransform;
    private float hoverOffset = 100f; // 悬停时Y轴偏移
    private bool isHovering = false;

    void Start()
    {
        rectTransform = GetComponent<RectTransform>();
        originalPosition = rectTransform.anchoredPosition;
    }

    void Update()
    {
        if (isHovering)
        {
            // 确保所有重叠卡牌都上升到同一高度
            rectTransform.SetAsLastSibling(); // 置顶显示
            rectTransform.anchoredPosition = Vector3.Lerp(rectTransform.anchoredPosition, 
                new Vector3(originalPosition.x, originalPosition.y + hoverOffset, originalPosition.z), 
                Time.deltaTime * 10f);
        }
        else
        {
            rectTransform.anchoredPosition = Vector3.Lerp(rectTransform.anchoredPosition, originalPosition, Time.deltaTime * 10f);
        }
    }

    public void OnPointerEnter(PointerEventData eventData)
    {
        isHovering = true;
    }

    public void OnPointerExit(PointerEventData eventData)
    {
        isHovering = false;
    }
}