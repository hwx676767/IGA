using TMPro;
using UnityEditor;
using UnityEngine;
using UnityEngine.EventSystems;
using SharedCollection;
using DG.Tweening;
using UnityEngine.UI;

public class O_EventNode : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler, IBeginDragHandler, IDragHandler, IEndDragHandler
{
    private EventDataState thisDataState;
    private static Transform onDraggingNode;

    public void InitializeNode(EventDataState _eventData)
    {
        thisDataState = _eventData;
        GetComponent<Image>().color = thisDataState.data.color;
        transform.Find("Header").GetComponent<TMP_Text>().text = thisDataState.data.Name;
        if (thisDataState.isLoaded) EnterLoadedState();
    }

    public void OnPointerEnter(PointerEventData eventData)
    {
        O_EventTip.Instance.EnablePanel(GetComponentInParent<O_EventPanel>(), thisDataState.data);
    }

    public void OnPointerExit(PointerEventData eventData)
    {
        O_EventTip.Instance.DisablePanel();
    }

    public void OnBeginDrag(PointerEventData eventData)
    {
        if (!thisDataState.isLoaded && onDraggingNode == null)
        {
            Vector3 pos = RectTransformUtility.WorldToScreenPoint(Camera.main, Camera.main.ScreenToWorldPoint(Input.mousePosition));
            onDraggingNode = Instantiate(M_HoriArrangement.Instance.pre_Node, pos, Quaternion.identity).transform;
            if (onDraggingNode.GetComponent<O_EventNodePlugin>() != null) onDraggingNode.GetComponent<O_EventNodePlugin>().InitializeNodePlugin(thisDataState.data);
            onDraggingNode.SetParent(GameObject.Find("Canvas").transform);
        }
    }

    public void OnDrag(PointerEventData eventData)
    {
        if (onDraggingNode != null)
        {
            Vector3 pos = RectTransformUtility.WorldToScreenPoint(Camera.main, Camera.main.ScreenToWorldPoint(Input.mousePosition));
            onDraggingNode.position = pos;

            bool isOverlap = isNodeOverlapWithPanel();
            if (isOverlap) M_HoriArrangement.Instance.InsertNewNode_Prepare(onDraggingNode);
        }
    }

    public void OnEndDrag(PointerEventData eventData)
    {
        if (onDraggingNode == null) return;

        bool isOverlap = isNodeOverlapWithPanel();
        if (isOverlap)
        {
            M_HoriArrangement.Instance.InsertNewNode_Finish(onDraggingNode);
            EnterLoadedState();
            onDraggingNode = null;
        }
        else DestroyCurrentNode();

        void DestroyCurrentNode()
        {
            onDraggingNode.DOScale(0, 0.3f).OnComplete(() => Destroy(onDraggingNode.gameObject, 0.1f));
        }
    }

    private bool isNodeOverlapWithPanel()
    {
        RectTransform rectTrans = onDraggingNode.GetComponent<RectTransform>();
        Rect thisRect = UIDerived.RectTransToScreenPos(rectTrans, null);
        Rect targetRect = UIDerived.RectTransToScreenPos(M_HoriArrangement.Instance.rect_Panel, null);
        bool isOverlap = thisRect.Overlaps(targetRect);
        return isOverlap;
    }

    private void EnterLoadedState()
    {
        thisDataState.isLoaded = true;
        transform.Find("Header").GetComponent<TMP_Text>().color = Color.white;
        GetComponent<Image>().color = Color.black;
    }

    private void ExitLoadedState()
    {
        thisDataState.isLoaded = false;
        transform.Find("Header").GetComponent<TMP_Text>().color = Color.black;
        GetComponent<Image>().color = thisDataState.data.color;
    }
}
