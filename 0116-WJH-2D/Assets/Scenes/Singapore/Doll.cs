using UnityEngine;
using System.Collections;

public class Doll : MonoBehaviour
{
    [Header("娃娃图片（按顺序拖入：普通→换装1→换装2→最终）")]
    public GameObject[] dollStages;  // 共4个：普通娃娃、换装1、换装2、最终换装
    
    [Header("最终换装完成图片（可选，如果dollStages已包含则留空）")]
    public GameObject finalDoll;
    
    [Header("出现时间设置")]
    public float appearTime = 0f;  // 0秒出现（如需延迟可修改，比如5f）
    
    private int currentIndex = 0;      // 当前是第几套（0=普通）
    private bool canClick = false;     // 是否允许点击
    
    void Start()
    {
        // 初始隐藏所有娃娃
        foreach (GameObject doll in dollStages)
        {
            if (doll != null)
                doll.SetActive(false);
        }
        
        // 隐藏最终娃娃（如果有单独设置）
        if (finalDoll != null)
            finalDoll.SetActive(false);
        
        // 开始计时，等待指定时间后出现第一套娃娃（普通形态）
        StartCoroutine(StartGameAfterDelay(appearTime));
    }
    
    // 等待指定时间后开始游戏
    IEnumerator StartGameAfterDelay(float seconds)
    {
        if (seconds > 0)
            Debug.Log($"等待 {seconds} 秒后娃娃出现...");
        
        yield return new WaitForSeconds(seconds);
        
        // 显示第一套娃娃（普通形态）
        if (dollStages.Length > 0 && dollStages[0] != null)
        {
            dollStages[0].SetActive(true);
            Debug.Log("娃娃出现了！点击3次给它换装");
        }
        
        canClick = true;
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
                // 检查点击的是不是当前应该换装的娃娃
                if (currentIndex < dollStages.Length && hit.collider.gameObject == dollStages[currentIndex])
                {
                    OnDollClicked();
                }
            }
        }
    }
    
    // 点击娃娃，切换到下一套服装
    void OnDollClicked()
    {
        // 隐藏当前娃娃
        if (dollStages[currentIndex] != null)
            dollStages[currentIndex].SetActive(false);
        
        currentIndex++;
        
        // 判断是否完成3次换装
        if (currentIndex >= dollStages.Length)
        {
            // 换装完成，显示最终娃娃
            if (finalDoll != null)
                finalDoll.SetActive(true);
            else if (dollStages.Length > 0 && dollStages[dollStages.Length - 1] != null)
                dollStages[dollStages.Length - 1].SetActive(true);
            
            canClick = false;
            Debug.Log("✨ 换装完成！娃娃变装啦！ ✨");
        }
        else
        {
            // 显示下一套服装
            if (dollStages[currentIndex] != null)
                dollStages[currentIndex].SetActive(true);
            
            Debug.Log($"换装 {currentIndex} 次，继续点击");
        }
    }
    
    // 可选：供外部调用的方法，用于提前开始
    public void ForceStartGame()
    {
        StopAllCoroutines();
        StartCoroutine(StartGameAfterDelay(0f));
    }
    
    // 可选：重置游戏（重新开始）
    public void ResetGame()
    {
        StopAllCoroutines();
        
        // 隐藏所有娃娃
        foreach (GameObject doll in dollStages)
        {
            if (doll != null)
                doll.SetActive(false);
        }
        if (finalDoll != null)
            finalDoll.SetActive(false);
        
        canClick = false;
        currentIndex = 0;
        
        // 重新开始计时
        StartCoroutine(StartGameAfterDelay(appearTime));
    }
}