using DG.Tweening;
using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.EventSystems;

public class O_EventTip : Singleton<O_EventTip>
{
    private RectTransform rectTrans;
    private float time_PanelOpen = 0.1f;

    private TMP_Text text_Header;
    private TMP_Text text_Summary;

    void Start()
    {
        rectTrans = GetComponent<RectTransform>();
        text_Header = transform.Find("Header").GetComponent<TMP_Text>();
        text_Summary = transform.Find("Summary").GetComponent<TMP_Text>();
    }

    public void EnablePanel(O_EventPanel targetPanel, SO_EventData nodeData)
    {
        AlignPanelPosition(targetPanel);
        SyncTipContent(nodeData);
        Anim_OpenTip();
    }

    public void DisablePanel()
    {
        Anim_CloseTip();
    }

    void SyncTipContent(SO_EventData nodeData)
    {
        text_Header.text = nodeData.Name;
        text_Summary.text = nodeData.Content;
    }

    void Anim_CloseTip()
    {
        transform.DOScale(0, time_PanelOpen);
    }

    void Anim_OpenTip()
    {
        transform.DOScale(1, time_PanelOpen);
    }

    private void AlignPanelPosition(O_EventPanel targetPanel)
    {
        RectTransform targetRect = targetPanel.GetComponent<RectTransform>();

        Vector2 upperCenter = SharedCollection.UIDerived.GetUIPivot(targetRect, SharedCollection.PivotType.BottomCenter);
        rectTrans.SetParent(targetRect.parent);
        rectTrans.anchoredPosition = upperCenter + new Vector2(0, -100);
        rectTrans.SetParent(GameObject.Find("Canvas").transform);
    }
}
