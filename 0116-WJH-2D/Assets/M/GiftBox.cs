using UnityEngine;

public class GiftBox : MonoBehaviour
{
    public Sprite openSprite;  // 打开后有小狗的图片
    private SpriteRenderer spriteRenderer;
    private bool isCompleted = false;

    private void Start()
    {
        spriteRenderer = GetComponent<SpriteRenderer>();
    }

    private void OnMouseDown()
    {
        if (isCompleted) return;

        if (GameManager.Instance.GetCurrentStep() == 5)
        {
            if (openSprite != null)
                spriteRenderer.sprite = openSprite;
            isCompleted = true;
            GameManager.Instance.CompleteStep(5);
        }
    }
}