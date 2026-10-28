using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class O_Interactable : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler, IPointerClickHandler
{
    private Image image;
    public SO_EventRepo eventRepo;
    private EventDataState[] eventDataStates;

    void Start()
    {
        InitializeInteractable();
    }

    private void InitializeInteractable()
    {
        image = GetComponent<Image>();

        if (eventRepo == null) return;

        eventDataStates = new EventDataState[eventRepo.eventDatas.Length];

        for (int i = 0; i < eventRepo.eventDatas.Length; i++)
        {
            eventDataStates[i] = new EventDataState(eventRepo.eventDatas[i], false, this);
        }
    }

    public void OnPointerEnter(PointerEventData eventData)
    {
        image.material = M_Main.Instance.mat_OutlineSprite;
        //image.material = M_Main.Instance.mat_DefaultSprite;
    }

    public void OnPointerExit(PointerEventData eventData)
    {
        image.material = M_Main.Instance.mat_DefaultSprite;
    }

    public void OnPointerClick(PointerEventData eventData)
    {
        if (eventData.button == PointerEventData.InputButton.Left)
        {
            // Left-click: Open the panel or toggle it based on its state
            O_EventPanel.Instance.EnablePanel(this, eventDataStates);
        }
        else if (eventData.button == PointerEventData.InputButton.Right)
        {
            // Right-click: Close the panel
            O_EventPanel.Instance.DisablePanel();
        }
    }
}


public class EventDataState
{
    public SO_EventData data;
    public bool isLoaded = false;
    public O_Interactable whichInteractable;

    public EventDataState(SO_EventData data, bool isLoaded, O_Interactable whichInteractable)
    {
        this.data = data;
        this.isLoaded = isLoaded;
        this.whichInteractable = whichInteractable;
    }
}
