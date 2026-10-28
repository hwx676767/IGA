using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

public class UIHighlightClick : MonoBehaviour, IPointerClickHandler
{
    // 引用当前UI的高亮底图
    public GameObject highlightImage;

    // 高亮持续时间
    public float highlightDuration = 1.0f;

    private bool isHighlighted = false;

    // 当检测到点击事件时触发
    public void OnPointerClick(PointerEventData eventData)
    {
        if (highlightImage != null)
        {
            // 确保每次点击时显示高亮图片
            highlightImage.SetActive(true);
            isHighlighted = true;

            Debug.Log("UI Image 被点击并显示高亮");

            // 在一定时间后隐藏高亮底图
            CancelInvoke();  // 确保没有重复调用
            Invoke("HideHighlight", highlightDuration);
        }
    }

    // 隐藏高亮底图
    void HideHighlight()
    {
        if (highlightImage != null && isHighlighted)
        {
            highlightImage.SetActive(false);
            isHighlighted = false;
        }
    }

    // 防止其他事件隐藏高亮图像，例如鼠标移开事件
    void OnDisable()
    {
        CancelInvoke();  // 确保取消任何挂起的高亮隐藏操作
        if (highlightImage != null)
        {
            highlightImage.SetActive(false);
        }
    }
}
