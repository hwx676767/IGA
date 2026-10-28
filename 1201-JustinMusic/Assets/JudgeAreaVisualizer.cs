using UnityEngine;

public class JudgeAreaVisualizer : MonoBehaviour
{
    public RectTransform pointC;     // 判定点
    public float hitRange = 30f;     // 判定半径

    private RectTransform rect;

    private void Awake()
    {
        rect = GetComponent<RectTransform>();
    }

    private void Update()
    {
        if (pointC != null)
        {
            // 跟随 C 点
            rect.position = pointC.position;

            // 设置大小（直径 = hitRange * 2）
            rect.sizeDelta = new Vector2(hitRange * 2, hitRange * 2);
        }
    }
}