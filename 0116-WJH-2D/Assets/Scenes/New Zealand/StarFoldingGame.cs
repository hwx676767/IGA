using UnityEngine;
using System.Collections;

public class StarFoldingGame : MonoBehaviour
{
    [Header("纸条图片（按顺序拖入 Paper_1 到 Paper_11）")]
    public GameObject[] papers;  // 共11个纸条
    
    [Header("幸运星图片")]
    public GameObject finalStar;
    
    [Header("出现时间设置")]
    public float appearTime = 76f;  // 1分16秒 = 76秒
    
    private int currentIndex = 0;      // 当前折到第几张（0=第一张）
    private bool canClick = false;     // 是否允许点击
    private bool gameStarted = false;  // 游戏是否已开始
    
    void Start()
    {
        // 初始隐藏所有纸条
        foreach (GameObject paper in papers)
        {
            if (paper != null)
                paper.SetActive(false);
        }
        
        // 初始隐藏幸运星
        if (finalStar != null)
            finalStar.SetActive(false);
        
        // 开始计时，等待指定时间后出现第一张纸条
        StartCoroutine(StartGameAfterDelay(appearTime));
    }
    
    // 等待指定时间后开始游戏
    IEnumerator StartGameAfterDelay(float seconds)
    {
        Debug.Log($"等待 {seconds} 秒后纸条出现...");
        yield return new WaitForSeconds(seconds);
        
        // 显示第一张纸条
        if (papers.Length > 0 && papers[0] != null)
        {
            papers[0].SetActive(true);
            Debug.Log("第1张纸条出现了！点击折叠");
        }
        
        canClick = true;
        gameStarted = true;
        currentIndex = 0;
    }
    
    void Update()
    {
        // 如果游戏还没开始或不允许点击，跳过检测
        if (!canClick) return;
        
        // 检测鼠标点击
        if (Input.GetMouseButtonDown(0))
        {
            // 从鼠标位置发射射线（2D游戏）
            Vector2 mousePos = Camera.main.ScreenToWorldPoint(Input.mousePosition);
            RaycastHit2D hit = Physics2D.Raycast(mousePos, Vector2.zero);
            
            // 检查是否点击到了物体
            if (hit.collider != null)
            {
                // 检查点击的是不是当前应该折的那张纸
                if (currentIndex < papers.Length && hit.collider.gameObject == papers[currentIndex])
                {
                    FoldCurrentPaper();
                }
            }
        }
    }
    
    // 折叠当前纸条，切换到下一张
    void FoldCurrentPaper()
    {
        // 隐藏当前纸条
        if (papers[currentIndex] != null)
            papers[currentIndex].SetActive(false);
        
        currentIndex++;
        
        // 判断是否完成11次折叠
        if (currentIndex >= papers.Length)
        {
            // 折完了，显示幸运星
            if (finalStar != null)
                finalStar.SetActive(true);
            
            canClick = false;
            Debug.Log("✨ 恭喜！星星折好啦！ ✨");
        }
        else
        {
            // 显示下一张纸条
            if (papers[currentIndex] != null)
                papers[currentIndex].SetActive(true);
            
            Debug.Log($"已折叠 {currentIndex} 次，继续点击下一张");
        }
    }
    
    // 可选：供外部调用的方法，用于提前开始游戏
    public void ForceStartGame()
    {
        StopAllCoroutines();
        StartCoroutine(StartGameAfterDelay(0f));
    }
    
    // 可选：重置游戏（重新开始）
    public void ResetGame()
    {
        StopAllCoroutines();
        
        // 隐藏所有纸条和幸运星
        foreach (GameObject paper in papers)
        {
            if (paper != null)
                paper.SetActive(false);
        }
        if (finalStar != null)
            finalStar.SetActive(false);
        
        canClick = false;
        gameStarted = false;
        currentIndex = 0;
        
        // 重新开始计时
        StartCoroutine(StartGameAfterDelay(appearTime));
    }
}