using UnityEngine;
using UnityEngine.EventSystems;

public class TooltipTrigger : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler
{
    public string header;
    [TextArea]public string content;
    //[Multiline()] public string content;


    //UI物体
    public void OnPointerEnter(PointerEventData eventData)
    {
        TooltipSystem.Show(content, header);
    }

    public void OnPointerExit(PointerEventData eventData)
    {
        TooltipSystem.Hide();
    }


    //场景物体
    private void OnMouseEnter()
    {
        TooltipSystem.Show(content, header);
    }

    private void OnMouseExit()
    {
        TooltipSystem.Hide();
    }
}
