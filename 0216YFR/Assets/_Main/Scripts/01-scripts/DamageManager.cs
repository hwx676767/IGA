using UnityEngine;
using UnityEngine.UI;

public class DamageManager : MonoBehaviour
{
    [Header("伤害目标设置")]
    public float targetDamage = 5f;          // 需要完成的总伤害值
    public float primaryDamage = 1f;         // 主要目标扣减值
    public float secondaryDamage = 0.5f;     // 次要目标扣减值
    
    [Header("进度显示")]
    public Text progressText;                // 进度显示文本
    //public Slider progressSlider;            // 进度条（可选）
    //public Image progressFill;               // 进度条填充（可选颜色变化）
    
    [Header("完成设置")]
    public Color incompleteColor = Color.red;
    public Color completeColor = Color.green;
    public string completeMessage = "目标达成!";

    private float currentDamage = 0f;
    private bool isComplete = false;

    void Start()
    {
        UpdateProgressDisplay();
    }

    public void RegisterDamage(bool isPrimaryTarget)
    {
        if (isComplete) return;
        
        // 计算伤害值
        currentDamage += isPrimaryTarget ? primaryDamage : secondaryDamage;
        currentDamage = Mathf.Min(currentDamage, targetDamage);
        
        // 检查是否完成
        if (currentDamage >= targetDamage)
        {
            CompleteObjective();
        }
        
        UpdateProgressDisplay();
    }

    private void UpdateProgressDisplay()
    {
        // 更新文本
        if (progressText != null)
        {
            progressText.text = $"进度: {currentDamage:F1}/{targetDamage}";
            
            // 完成时改变颜色
            if (isComplete)
            {
                progressText.text = completeMessage;
                progressText.color = completeColor;
            }
            else
            {
                progressText.color = incompleteColor;
            }
        }
        
        // 更新进度条
        /*
        if (progressSlider != null)
        {
            progressSlider.maxValue = targetDamage;
            progressSlider.value = currentDamage;
            
            // 更新填充颜色
            if (progressFill != null)
            {
                progressFill.color = isComplete ? completeColor : incompleteColor;
            }
        }*/
    }

    private void CompleteObjective()
    {
        isComplete = true;
        Debug.Log($"目标达成! 累计伤害: {currentDamage}/{targetDamage}");
        
        // 触发其他游戏事件
        // 例如：解锁成就、播放音效等
    }

    // 重置进度（可选）
    public void ResetProgress()
    {
        currentDamage = 0f;
        isComplete = false;
        UpdateProgressDisplay();
    }
}