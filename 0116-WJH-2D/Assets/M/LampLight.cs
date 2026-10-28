using UnityEngine;

public class LampLight : MonoBehaviour
{
    public Sprite lampOnSprite;  // 亮灯后的图片
    private SpriteRenderer spriteRenderer;
    private bool isCompleted = false;

    // 如果你想让点击脚垫来亮灯，就把这个脚本挂在脚垫上
    // 如果挂在灯上，就直接点灯亮

    private void Start()
    {
        spriteRenderer = GetComponent<SpriteRenderer>();
    }

    private void OnMouseDown()
    {
        if (isCompleted) return;

        if (GameManager.Instance.GetCurrentStep() == 6)
        {
            if (lampOnSprite != null)
                spriteRenderer.sprite = lampOnSprite;
            isCompleted = true;
            GameManager.Instance.CompleteStep(6);
        }
    }
}