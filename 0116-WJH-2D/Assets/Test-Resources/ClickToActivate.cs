using UnityEngine;
using UnityEngine.UI; // 需要 UI 组件
using System.Collections; // 需要 Coroutine

public class ClickToActivate : MonoBehaviour
{
    [Header("激活设置")]
    public GameObject targetObject; // 要激活的目标对象（可选，如果为空则激活自身）
    public bool toggleMode = true;  // true: 切换激活/禁用；false: 只激活

    [Header("Scroll View 设置")]
    public GameObject scrollViewObject; // Scroll View 的 GameObject（必须指定）
    public ScrollRect scrollRect;       // Scroll View 的 ScrollRect 组件（在 Inspector 中拖入）
    public float scrollDuration = 1f;   // 滑动时间（秒）

    private Collider2D col;

    void Start()
    {
        targetObject.SetActive(false);
        col = GetComponent<Collider2D>();
        if (col == null)
        {
            Debug.LogError("此脚本需要 Collider2D 组件！", this);
        }

        // 如果未指定目标，默认激活自身
        if (targetObject == null)
        {
            targetObject = gameObject;
        }

        // 确保 Scroll View 初始禁用
        if (scrollViewObject != null)
        {
            scrollViewObject.SetActive(false);
        }
        else
        {
            Debug.LogError("请指定 Scroll View 对象！", this);
        }

        // 确保 ScrollRect 已赋值
        if (scrollRect == null)
        {
            Debug.LogError("请拖入 ScrollRect 组件！", this);
        }
    }

    // 鼠标点击时自动调用（适用于有 Collider2D 的 2D 对象）
    void OnMouseDown()
    {
        StartCoroutine(ShowScrollAndActivate());
    }

    private IEnumerator ShowScrollAndActivate()
    {
        if (scrollViewObject == null || scrollRect == null) yield break;

        // 激活 Scroll View
        scrollViewObject.SetActive(true);

        // 重置到顶部（假设垂直滚动，1 为顶部）
        scrollRect.verticalNormalizedPosition = 1f;

        // 动态滑动到底部（0 为底部）
        float elapsed = 0f;
        while (elapsed < scrollDuration)
        {
            elapsed += Time.deltaTime;
            float t = elapsed / scrollDuration;
            scrollRect.verticalNormalizedPosition = Mathf.Lerp(1f, 0f, t);
            yield return null;
        }

        // 确保滑动到底部
        scrollRect.verticalNormalizedPosition = 0f;

        // 关闭 Scroll View
        scrollViewObject.SetActive(false);

        // 激活目标对象
        if (toggleMode)
        {
            targetObject.SetActive(!targetObject.activeSelf);
        }
        else
        {
            targetObject.SetActive(true);
        }

        Debug.Log($"激活了对象: {targetObject.name}");
    }
}