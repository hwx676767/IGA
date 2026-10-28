using UnityEngine;

public class SpriteClick : MonoBehaviour
{
    public GameObject highlightImage; // 高亮图像，稍大的底图
    private bool isHighlighted = false;

    void Start()
    {
        // 确保高亮图像一开始是隐藏的
        if (highlightImage != null)
        {
            highlightImage.SetActive(false);
        }
    }

    void OnMouseDown()
    {
        if (!isHighlighted && highlightImage != null)
        {
            // 显示高亮底图
            highlightImage.SetActive(true);
            isHighlighted = true;
        }

        // 在此处添加其他点击后的逻辑
        Debug.Log("2D物品被点击并显示高亮图像");

        // 你可以在这里实现更多逻辑
        Invoke("HideHighlight", 1.0f); // 1秒后隐藏高亮底图
    }

    void HideHighlight()
    {
        // 隐藏高亮底图
        if (highlightImage != null)
        {
            highlightImage.SetActive(false);
            isHighlighted = false;
        }
    }
}
