using DG.Tweening;
using SharedCollection;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class O_EventNodePlugin : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler, IBeginDragHandler, IDragHandler, IEndDragHandler,IPointerClickHandler
{
    private bool isDragging;

    private float lastClickTime;
    private float doubleClickThreshold = 0.3f; // 双击的时间阈值

    public void InitializeNodePlugin(SO_EventData targetData)
    {
        GetComponent<Image>().color = targetData.color;
        transform.Find("Name").GetComponent<TMPro.TMP_Text>().text = targetData.Name;
    }

    public void OnPointerEnter(PointerEventData eventData)
    {
        Debug.Log("Pointer Entered");
    }

    public void OnPointerExit(PointerEventData eventData)
    {
        Debug.Log("Pointer Exited");
    }

    public void OnBeginDrag(PointerEventData eventData)
    {
        transform.SetParent(GameObject.Find("Canvas").transform);
    }

    public void OnDrag(PointerEventData eventData)
    {
        isDragging = true;
        Vector3 pos = RectTransformUtility.WorldToScreenPoint(Camera.main, Camera.main.ScreenToWorldPoint(Input.mousePosition));
        transform.position = pos;

        bool isOverlap = isNodeOverlapWithPanel();
        if (isOverlap) M_HoriArrangement.Instance.InsertNewNode_Prepare(transform);
    }

    public void OnEndDrag(PointerEventData eventData)
    {
        isDragging = false;
        bool isOverlap = isNodeOverlapWithPanel();
        M_HoriArrangement.Instance.InsertNewNode_Finish(transform);
    }

    private bool isNodeOverlapWithPanel()
    {
        RectTransform rectTrans = GetComponent<RectTransform>();
        Rect thisRect = UIDerived.RectTransToScreenPos(rectTrans, null);
        Rect targetRect = UIDerived.RectTransToScreenPos(M_HoriArrangement.Instance.rect_Panel, null);
        bool isOverlap = thisRect.Overlaps(targetRect);
        return isOverlap;
    }

    public void OnPointerClick(PointerEventData eventData)
    {
        float timeSinceLastClick = Time.time - lastClickTime;
        if (timeSinceLastClick <= doubleClickThreshold)
        {
            Destroy(gameObject); // 双击检测成功，删除节点
        }
        lastClickTime = Time.time;
        Debug.Log("Pointer Clicked");
    }


}
