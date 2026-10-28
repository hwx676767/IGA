using UnityEngine;
using System.Collections; // 用于 Coroutine

public class Exit : MonoBehaviour
{
    [Header("闪烁设置")]
    public float blinkDuration = 0.2f; // 每次闪烁的持续时间（秒）
    public int blinkCount = 2;         // 闪烁次数（默认2）
    public Color blinkColor = new Color(1f, 1f, 1f, 0.5f); // 闪烁时的颜色（半透明白）

    private Collider2D col;
    private SpriteRenderer[] childRenderers; // 父物体下所有子SpriteRenderer

    void Start()
    {
        col = GetComponent<Collider2D>();
        if (col == null)
        {
            Debug.LogError("此脚本需要 Collider2D 组件！", this);
        }

        // 获取父物体下所有SpriteRenderer（包括子物体）
        childRenderers = transform.parent.GetComponentsInChildren<SpriteRenderer>();
        if (childRenderers.Length == 0)
        {
            Debug.LogWarning("父物体下没有 SpriteRenderer！闪烁可能无效。", this);
        }
    }

    // 鼠标点击时自动调用
    void OnMouseDown()
    {
        StartCoroutine(BlinkAndExit());
    }

    private IEnumerator BlinkAndExit()
    {
        GameObject parent = transform.parent.gameObject;

        for (int i = 0; i < blinkCount; i++)
        {
            // 闪烁：改变所有子Renderer颜色
            foreach (var renderer in childRenderers)
            {
                renderer.color = blinkColor;
            }
            yield return new WaitForSeconds(blinkDuration);

            // 恢复原色（假设原色为白色不透明）
            foreach (var renderer in childRenderers)
            {
                renderer.color = Color.white;
            }
            yield return new WaitForSeconds(blinkDuration);
        }

        // 禁用父物体
        parent.SetActive(false);
        Debug.Log($"禁用了父物体: {parent.name}");
    }
}