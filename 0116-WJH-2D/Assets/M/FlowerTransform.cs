using UnityEngine;

public class FlowerTransform : MonoBehaviour
{
    public Sprite flowerSprite;  // 变花后的图片
    private SpriteRenderer spriteRenderer;
    private bool isCompleted = false;

    // 这个八音盒是什么类型：0=热气球，1=风车
    public int type; // 0=热气球，1=风车

    private void Start()
    {
        spriteRenderer = GetComponent<SpriteRenderer>();
    }

    private void OnMouseDown()
    {
        if (isCompleted) return;

        // 只有步骤1时才能变花
        if (GameManager.Instance.GetCurrentStep() == 1)
        {
            // 切换图片
            if (flowerSprite != null)
            {
                spriteRenderer.sprite = flowerSprite;
            }
            isCompleted = true;

            // 通知 GameManager
            if (type == 0)
                GameManager.Instance.CompleteHotAirBalloon();
            else
                GameManager.Instance.CompleteWindmill();
        }
    }
}