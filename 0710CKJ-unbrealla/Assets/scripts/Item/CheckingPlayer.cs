using UnityEngine;

public class CheckingPlayer : MonoBehaviour
{
    [Header("组件引用")]
    private Animator squareAnimator;  // 地板的动画
    private Animator doorAnimator;    // 门的动画
    
    [Header("检测设置")]
    [SerializeField] private float requiredMass = 4f;
    [SerializeField] private string playerTag = "Player";
    [SerializeField] private string animatorBoolName = "trigger";
    
    void Awake()
    {
        //Debug.Log("squareAwake");
        // 获取square（直接父物体）的Animator
        squareAnimator = transform.parent?.GetComponent<Animator>();
        
        // 获取door（父物体的父物体）的Animator
        doorAnimator = transform.parent?.parent?.GetComponent<Animator>();
    }
    
    void OnTriggerEnter2D(Collider2D other)
    {
        if (other.CompareTag(playerTag))
        {
            // 获取Player脚本组件
            Player playerScript = other.GetComponent<Player>();
            
            if (playerScript != null)
            {
                float playerMass = playerScript.mass;  // 使用Player脚本的Mass属性
                
                if (playerMass >= requiredMass)
                {
                    // 触发地板下沉动画
                    if (squareAnimator != null)
                    {
                        squareAnimator.SetBool(animatorBoolName, true);
                    }
                    
                    // 触发门打开动画
                    if (doorAnimator != null)
                    {
                        doorAnimator.SetBool(animatorBoolName, true);
                    }
                }
            }
        }
    }
    
    void OnTriggerExit2D(Collider2D other)
    {
        if (other.CompareTag(playerTag))
        {
            // 可选：玩家离开时重置动画
            // ResetAnimations();
        }
    }
    
    public void ResetAnimations()
    {
        if (squareAnimator != null)
        {
            squareAnimator.SetBool(animatorBoolName, false);
        }
        
        if (doorAnimator != null)
        {
            doorAnimator.SetBool(animatorBoolName, false);
        }
    }
    
    public void SetRequiredMass(float newMass)
    {
        requiredMass = newMass;
    }
    
    public float GetRequiredMass()
    {
        return requiredMass;
    }
}