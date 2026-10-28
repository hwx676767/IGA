using UnityEngine;

public class ObstacleController : MonoBehaviour
{
    private Collider2D collider2D;
    private UIManager uiManager;
    private SpriteManager spriteManager;

    void Start()
    {
        collider2D = GetComponent<Collider2D>();
        uiManager = FindObjectOfType<UIManager>();
        spriteManager = FindObjectOfType<SpriteManager>();
    }

    void OnCollisionEnter2D(Collision2D collision)
    {
        if (collision.gameObject.CompareTag("Player"))
        {
            Debug.Log("Player hit obstacle!");
            collider2D.enabled = false; // 禁用碰撞体
            uiManager?.TriggerFlash(); // 触发闪屏和撞击效果
            spriteManager?.RegisterCollision(); // 通知SpriteManager记录碰撞
        }
    }
}