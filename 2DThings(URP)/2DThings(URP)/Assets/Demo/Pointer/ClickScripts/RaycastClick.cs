using UnityEngine;

public class RaycastClick : MonoBehaviour
{
    // 点击后高亮持续的时间
    public float highlightDuration = 1.0f;

    // 引用当前被点击物体的高亮底图
    private GameObject currentHighlight;

    void Update()
    {
        if (Input.GetMouseButtonDown(0)) // 检测鼠标左键点击
        {
            Vector2 mousePosition = Camera.main.ScreenToWorldPoint(Input.mousePosition);
            RaycastHit2D hit = Physics2D.Raycast(mousePosition, Vector2.zero);

            if (hit.collider != null)
            {
                // 获取被点击物体的高亮图像，假设高亮图像是点击物体的子物体
                //currentHighlight = hit.collider.transform.Find("HighlightImage")?.gameObject;
                currentHighlight = hit.collider.transform.GetChild(0).gameObject;

                if (currentHighlight != null)
                {
                    // 显示高亮底图
                    currentHighlight.SetActive(true);

                    // 在一定时间后隐藏高亮底图
                    Invoke("HideHighlight", highlightDuration);

                    // 执行其他逻辑
                    Debug.Log("2D物体被点击: " + hit.collider.name);
                }
                else
                {
                    Debug.LogWarning("高亮底图未找到，请确保物体下有名为 'HighlightImage' 的子对象。");
                }
            }
        }
    }

    // 隐藏高亮底图
    void HideHighlight()
    {
        if (currentHighlight != null)
        {
            currentHighlight.SetActive(false);
        }
    }
}
