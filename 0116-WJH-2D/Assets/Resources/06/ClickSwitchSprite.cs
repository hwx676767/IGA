using UnityEngine;

public class ClickSwitchSprite : MonoBehaviour
{
    public Sprite[] spriteList;           // 要切换的图片列表
    public bool canBeEmpty = true;         // 是否可以变成空
    
    private SpriteRenderer spriteRenderer;
    private int currentIndex = 0;

    void Start()
    {
        spriteRenderer = GetComponent<SpriteRenderer>();
        if (spriteList.Length > 0)
        {
            //spriteRenderer.sprite = spriteList[0];
            spriteRenderer.sprite = null;
        }
    }

    void Update()
    {
        // 检测鼠标左键点击
        if (Input.GetMouseButtonDown(0))
        {
            // 检查是否点击到了这个物体
            Vector2 mousePos = Camera.main.ScreenToWorldPoint(Input.mousePosition);
            RaycastHit2D hit = Physics2D.Raycast(mousePos, Vector2.zero);
            
            if (hit.collider != null && hit.collider.gameObject == gameObject)
            {
                SwitchToNext();
            }
        }
    }

    void SwitchToNext()
    {
        // 切换到下一张
        currentIndex++;
        
        // 处理索引
        if (currentIndex >= spriteList.Length)
        {
            if (canBeEmpty)
            {
                // 变成空
                spriteRenderer.sprite = null;
                currentIndex = -1;  // 标记为空状态
                return;
            }
            else
            {
                currentIndex = 0;  // 回到第一张
            }
        }
        
        // 设置图片
        if (currentIndex >= 0)
        {
            spriteRenderer.sprite = spriteList[currentIndex];
        }
    }
}