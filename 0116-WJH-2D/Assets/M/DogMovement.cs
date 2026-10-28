using UnityEngine;

public class DogMovement : MonoBehaviour
{
    private SpriteRenderer spriteRenderer;
    private int location = 0; // 0=地上，1=马车上，2=宝石桥上

    // 不同位置的图片
    public Sprite groundSprite;
    public Sprite carriageSprite;
    public Sprite bridgeSprite;

    // 马车和宝石桥的 Transform（用来定位）
    public Transform carriagePosition;
    public Transform bridgePosition;

    private void Start()
    {
        spriteRenderer = GetComponent<SpriteRenderer>();
        location = 0;
        spriteRenderer.sprite = groundSprite;
    }

    // 由马车调用：把小狗移到马车上
    public void MoveToCarriage()
    {
        if (location == 0 && GameManager.Instance.GetCurrentStep() == 2)
        {
            location = 1;
            spriteRenderer.sprite = carriageSprite;
            if (carriagePosition != null)
                transform.position = carriagePosition.position;
            GameManager.Instance.TryCompleteDogStep(2);
        }
    }

    // 由宝石桥调用：把小狗移到宝石桥上
    public void MoveToBridge()
    {
        if (location == 1 && GameManager.Instance.GetCurrentStep() == 3)
        {
            location = 2;
            spriteRenderer.sprite = bridgeSprite;
            if (bridgePosition != null)
                transform.position = bridgePosition.position;
            GameManager.Instance.TryCompleteDogStep(3);
        }
    }
}