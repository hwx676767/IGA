using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class O_EventPanel : Singleton<O_EventPanel>
{
    public GameObject pre_EventNode;
    private RectTransform rectTrans;
    private bool isPanelOpen = false;
    private float time_PanelOpen = 0.1f;

    void Start()
    {
        rectTrans = GetComponent<RectTransform>();
    }

    public void EnablePanel(O_Interactable targetInteractable, EventDataState[] targetEvents)
    {
        if (!isPanelOpen)
        {
            AlignPanelPosition(targetInteractable);
            InstantiateNewNodes();
            Anim_OpenPanel();
        }
        else
        {
            Sequence s = DOTween.Sequence();
            s.AppendCallback(() => Anim_ClosePanel());
            s.AppendInterval(time_PanelOpen);
            s.AppendCallback(() => AlignPanelPosition(targetInteractable));
            s.AppendCallback(() => InstantiateNewNodes());
            s.AppendCallback(() => Anim_OpenPanel());
        }

        void InstantiateNewNodes()
        {
            for (int i = 0; i < targetEvents.Length; i++)
            {
                O_EventNode node = Instantiate(pre_EventNode, transform).GetComponent<O_EventNode>();
                node.InitializeNode(targetEvents[i]);
            }
        }
    }

    public void DisablePanel()
    {
        Anim_ClosePanel();
    }

    void Anim_ClosePanel()
    {
        transform.DOScale(0, time_PanelOpen);
        for (int i = 0; i < transform.childCount; i++)
            Destroy(transform.GetChild(i).gameObject);
        isPanelOpen = false;
    }

    void Anim_OpenPanel()
    {
        transform.DOScale(1, time_PanelOpen);
        isPanelOpen = true;
    }

    private void AlignPanelPosition(O_Interactable targetInteractable)
    {
        RectTransform targetRect = targetInteractable.GetComponent<RectTransform>();

        Vector2 upperCenter = SharedCollection.UIDerived.GetUIPivot(targetRect, SharedCollection.PivotType.UpperCenter);
        rectTrans.SetParent(targetRect.parent);
        rectTrans.anchoredPosition = upperCenter + new Vector2(0, 40);
        rectTrans.SetParent(GameObject.Find("Canvas").transform);
    }
}
