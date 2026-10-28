using System.Collections;
using UnityEngine;
using UnityEngine.UI;

public class OpponentController : MonoBehaviour
{
    [Header("动画组件")]
    public Animator animator; // 拖拽Animator组件

    [Header("当前动作状态")]
    public string currentState = "Idle"; // 当前动作状态变量，可在Inspector查看

    [Header("UI显示（可选）")]
    public Text stateText; // 可选：UI Text组件，用于实时显示状态
    public Slider healthSlider;

    [Header("移动设置")]
    public float moveSpeed = 5f; // 移动速度，可在Inspector调整

    [Header("战斗设置")]
    public GameObject player; // 拖拽玩家GameObject
    public float attackRange = 5f; // 攻击范围，可调整
    public float health = 100f; // 初始健康值
    public float damageAmount = 10f; // 每次伤害值，可调整

    [Header("死亡设置")]
    public bool isDead = false; // 死亡标志，防止后续操作

    private void Start()
    {
        // 初始化Animator
        if (animator == null)
            animator = GetComponent<Animator>();

        // 初始播放Idle动画
        PlayAnimation("Idle");
        
        if (healthSlider != null)
            healthSlider.value = health / 100f; // 初始满血
    }

    private void Update()
    {
        // 如果已死亡，跳过输入和移动
        if (isDead) return;

        // 检测小键盘输入（出拳）
        CheckInput();
        
        // 检测上下左右箭头键移动输入
        HandleMovement();
        
        // 可选：实时更新UI显示
        if (stateText != null)
            stateText.text = "当前状态: " + currentState + " | 健康: " + health.ToString("F0") + (isDead ? " | 已死亡" : "");
    }

    /// <summary>
    /// 检测小键盘输入（Keypad0-9，出拳）
    /// </summary>
    private void CheckInput()
    {
        for (int i = 0; i <= 9; i++)
        {
            // 使用"Keypad" + i
            KeyCode keyCode = (KeyCode)System.Enum.Parse(typeof(KeyCode), "Keypad" + i);
            if (Input.GetKeyDown(keyCode))
            {
                // 计算动画名称：0->01, 1->02, ..., 9->10
                string animName = (i + 1).ToString("D2"); // D2确保两位数，如"01"
                
                // 播放对应动画
                PlayAnimation(animName);
                return; // 只处理一个输入
            }
        }
    }

    /// <summary>
    /// 处理上下左右箭头键移动（使用Transform.Translate）
    /// </summary>
    private void HandleMovement()
    {
        Vector3 moveDirection = Vector3.zero;

        // 检测输入
        if (Input.GetKey(KeyCode.RightArrow))
            moveDirection.z += 1f; // 前进
        if (Input.GetKey(KeyCode.LeftArrow))
            moveDirection.z -= 1f; // 后退
        if (Input.GetKey(KeyCode.UpArrow))
            moveDirection.x -= 1f; // 左移
        if (Input.GetKey(KeyCode.DownArrow))
            moveDirection.x += 1f; // 右移

        // 归一化方向（对角线时不加速）
        if (moveDirection.magnitude > 1f)
            moveDirection.Normalize();

        // 应用移动（XZ平面，忽略Y）
        transform.Translate(moveDirection * moveSpeed * Time.deltaTime, Space.World);
    }

    /// <summary>
    /// 播放指定动画，并启动协程等待结束返回Idle
    /// </summary>
    private void PlayAnimation(string animName)
    {
        // 更新当前状态
        currentState = animName;
        
        // 立即播放动画
        animator.Play(animName);
        //animator.CrossFade(animName, 0.1f); 

        // 如果不是Idle且不是Die，启动协程等待结束
        if (animName != "Idle" && animName != "Die")
        {
            StartCoroutine(WaitForAnimationEnd(animName));
        }

        // 如果是攻击动画 (02-08，对应1-7)，检查是否击中玩家
        if (player != null && int.TryParse(animName, out int animNum) && animNum >= 2 && animNum <= 7)
        {
            // 身前攻击范围检查：前方锥形近似（距离 + 前向偏移）
            Vector3 forwardOffset = transform.forward * (attackRange * 0.5f); // 身前偏移
            float distance = Vector3.Distance(transform.position + forwardOffset, player.transform.position);
            if (distance <= attackRange)
            {
                // 检查玩家当前状态不是08、09、10
                PunchController playerScript = player.GetComponent<PunchController>();
                if (playerScript != null && playerScript.currentState != "07" && playerScript.currentState != "08" && playerScript.currentState != "09" && playerScript.currentState != "10")
                {
                    // 【这里调用TakeDamage】
                    playerScript.TakeDamage(damageAmount);
                    Debug.Log("对手攻击击中玩家！扣血: " + damageAmount); // 可选调试日志
                }
            }
        }
    }

    /// <summary>
    /// 受到伤害：减少健康值，根据情况播放Attack或Die动画
    /// </summary>
    /// <summary>
    /// 受到伤害：减少健康值，根据情况播放Attack或Die动画
    /// </summary>
    public void TakeDamage(float damage)
    {
        if (isDead) return; // 已死亡，不再扣血

        health -= damage;
        if (health < 0) health = 0; // 防止负值

        if (health <= 0)
        {
            // 死亡：播放Die动画
            isDead = true;
            PlayAnimation("Die");
            Debug.Log("Player Dead!");
            // 可以添加更多死亡逻辑，如游戏结束、禁用Collider等
        }
        else
        {
            // 受伤：延迟1秒后播放Attack动画
            StartCoroutine(DelayedPlayAnimation("Attack", 1f));
            Debug.Log("玩家受到伤害: " + damage + "，剩余健康: " + health); // 可选调试日志
        }
    
        // 更新UI
        if (healthSlider != null)
        {
            healthSlider.value = health / 100f;
        }
    }

    /// <summary>
    /// 协程：延迟播放指定动画
    /// </summary>
    private IEnumerator DelayedPlayAnimation(string animName, float delay)
    {
        yield return new WaitForSeconds(delay);
        PlayAnimation(animName);
    }

    /// <summary>
    /// 协程：等待动画播放完成，然后返回Idle
    /// </summary>
    private IEnumerator WaitForAnimationEnd(string animName)
    {
        yield return null; // 等待切换到新动画

        // 等到切换完成
        while (!animator.GetCurrentAnimatorStateInfo(0).IsName(animName))
            yield return null;

        // 等待动画播放完成
        while (animator.GetCurrentAnimatorStateInfo(0).normalizedTime < 1f)
            yield return null;

        if (!isDead)
            PlayAnimation("Idle");
    }

    /// <summary>
    /// 可视化身前攻击范围（Scene视图Gizmos）
    /// </summary>
    private void OnDrawGizmos()
    {
        if (Application.isPlaying || !Application.isEditor) return; // 只在编辑器中绘制

        // 身前攻击范围：前方偏移 + 球形范围
        Vector3 gizmoPos = transform.position + transform.forward * (attackRange * 0.5f);
        Gizmos.color = Color.red;
        Gizmos.DrawWireSphere(gizmoPos, attackRange);
        
        // 可选：绘制前方射线（从角色到范围中心）
        Gizmos.color = Color.yellow;
        Gizmos.DrawRay(transform.position, transform.forward * (attackRange * 0.5f));
    }

    private void OnDrawGizmosSelected()
    {
        // 选中时高亮显示
        Gizmos.color = Color.green;
        Vector3 gizmoPos = transform.position + transform.forward * (attackRange * 0.5f);
        Gizmos.DrawWireSphere(gizmoPos, attackRange);
        
        Gizmos.color = Color.yellow;
        Gizmos.DrawRay(transform.position, transform.forward * (attackRange * 0.5f));
    }
}