using UnityEngine;
using UnityEngine.EventSystems;

public class DraggableItem : MonoBehaviour, IBeginDragHandler, IDragHandler, IEndDragHandler
{
    private RectTransform rectTransform;
    private CanvasGroup canvasGroup;
    private Canvas canvas;

    void Start()
    {
        rectTransform = GetComponent<RectTransform>();
        canvasGroup = GetComponent<CanvasGroup>();
        canvas = GetComponentInParent<Canvas>();
        if (canvasGroup == null)
            canvasGroup = gameObject.AddComponent<CanvasGroup>();
    }

    public void OnBeginDrag(PointerEventData eventData)
    {
        canvasGroup.alpha = 0.6f;
        canvasGroup.blocksRaycasts = false;
        transform.SetAsLastSibling();
    }

    public void OnDrag(PointerEventData eventData)
    {
        rectTransform.anchoredPosition += eventData.delta / canvas.scaleFactor;
    }

    public void OnEndDrag(PointerEventData eventData)
    {
        Debug.Log("拖拽结束！");
        
        canvasGroup.alpha = 1f;
        canvasGroup.blocksRaycasts = true;
        
        // 直接调用，不判断任何条件
        SnowmanAssembler assembler = FindObjectOfType<SnowmanAssembler>();
        if (assembler != null)
        {
            Debug.Log("调用 AssemblePart");
            assembler.AssemblePart(gameObject);
        }
        else
        {
            Debug.LogError("找不到 SnowmanAssembler！");
        }
        
        // 固定位置到鼠标松开的位置（或者你可以自己设定位置）
        // 注意：不要 Destroy(gameObject)
    }
}