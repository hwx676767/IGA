using UnityEngine;

public class JarDoor : MonoBehaviour
{
    public Sprite openSprite;  // 开门后有钻石的图片
    private SpriteRenderer spriteRenderer;
    private bool isCompleted = false;

    private void Start()
    {
        spriteRenderer = GetComponent<SpriteRenderer>();
    }

    private void OnMouseDown()
    {
        if (isCompleted) return;

        if (GameManager.Instance.GetCurrentStep() == 4)
        {
            if (openSprite != null)
                spriteRenderer.sprite = openSprite;
            isCompleted = true;
            GameManager.Instance.CompleteStep(4);
        }
    }
}