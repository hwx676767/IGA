using System.Collections;
using UnityEngine;
using UnityEngine.UI;

public class AIOpponentController : MonoBehaviour
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
    public float minAttackDistance = 3f; // 最小攻击距离，AI会尝试保持在这个距离内
    public float decisionInterval = 0.5f; // AI决策间隔（秒），避免过于频繁决策

    [Header("死亡设置")]
    public bool isDead = false; // 死亡标志，防止后续操作

    [Header("AI设置")]
    public float attackProbability = 0.6f; // 攻击概率（0-1），否则防御
    public float defenseProbability = 0.3f; // 在非攻击时，选择防御的概率（否则移动/Idle）
    private float lastDecisionTime = 0f; // 上次决策时间

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
        // 如果已死亡，跳过所有逻辑
        if (isDead) return;

        // AI决策：每隔decisionInterval秒决策一次
        if (Time.time - lastDecisionTime >= decisionInterval)
        {
            AIDecision();
            lastDecisionTime = Time.time;
        }

        // 处理移动（如果当前状态允许移动）
        if (currentState == "Idle")
        {
            HandleAIMovement();
        }

        // 可选：实时更新UI显示
        if (stateText != null)
            stateText.text = "当前状态: " + currentState + " | 健康: " + health.ToString("F0") + (isDead ? " | 已死亡" : "");
    }

    /// <summary>
    /// AI决策逻辑：根据距离和概率决定攻击、防御或Idle
    /// </summary>
    private void AIDecision()
    {
        if (player == null) return;

        float distanceToPlayer = Vector3.Distance(transform.position, player.transform.position);

        if (distanceToPlayer <= attackRange)
        {
            float rand = Random.value;
            if (rand < attackProbability)
            {
                int attackNum = Random.Range(2, 9); // 2~8 random
                string animName = attackNum.ToString("D2");
                PlayAnimation(animName);
            }
            else if (rand < attackProbability + defenseProbability)
            {
                int defenseNum = Random.Range(8, 11); // 8~10 protect
                string animName = defenseNum.ToString("D2");
                PlayAnimation(animName);
            }
            else
            {
                PlayAnimation("Idle");
            }
        }
        else
        {
            PlayAnimation("Idle");
        }
    }

    /// <summary>
    /// 处理AI移动：向玩家接近，但保持最小距离
    /// </summary>
    private void HandleAIMovement()
    {
        if (player == null) return;

        Vector3 directionToPlayer = player.transform.position - transform.position;
        float distanceToPlayer = directionToPlayer.magnitude;

        // close to player
        if (distanceToPlayer > minAttackDistance)
        {
            directionToPlayer.y = 0f; 
            directionToPlayer.Normalize();
            transform.Translate(directionToPlayer * moveSpeed * Time.deltaTime, Space.World);

            transform.LookAt(player.transform.position);
        }
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

        // 如果不是Idle且不是Die，启动协程等待结束
        if (animName != "Idle" && animName != "Die")
        {
            StartCoroutine(WaitForAnimationEnd(animName));
        }

        // 如果是攻击动画 (02-08)，检查是否击中玩家
        if (player != null && int.TryParse(animName, out int animNum) && animNum >= 2 && animNum <= 8)
        {
            // 身前攻击范围检查：前方锥形近似（距离 + 前向偏移）
            Vector3 forwardOffset = transform.forward * (attackRange * 0.5f); // 身前偏移
            float distance = Vector3.Distance(transform.position + forwardOffset, player.transform.position);
            if (distance <= attackRange)
            {
                // 检查玩家当前状态不是08、09、10（假设这些是防御）
                PunchController playerScript = player.GetComponent<PunchController>();
                if (playerScript != null && playerScript.currentState != "08" && playerScript.currentState != "09" && playerScript.currentState != "10")
                {
                    // 调用玩家的TakeDamage
                    playerScript.TakeDamage(damageAmount);
                    Debug.Log("AI对手攻击击中玩家！扣血: " + damageAmount);
                }
            }
        }
    }

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
            Debug.Log("AI Opponent Dead!");
            // 可以添加更多死亡逻辑，如游戏结束、禁用Collider等
        }
        else
        {
            // 受伤：播放Attack动画（假设Attack是受击动画）
            PlayAnimation("Attack");
            Debug.Log("AI对手受到伤害: " + damage + "，剩余健康: " + health);
        }
        
        // 更新UI
        if (healthSlider != null)
        {
            healthSlider.value = health / 100f;
        }
    }

    /// <summary>
    /// 协程：等待动画播放完成，然后返回Idle
    /// </summary>
    private IEnumerator WaitForAnimationEnd(string animName)
    {
        // 获取当前动画clip的长度
        AnimatorClipInfo[] clipInfo = animator.GetCurrentAnimatorClipInfo(0);
        if (clipInfo.Length > 0)
        {
            float animLength = clipInfo[0].clip.length;
            
            // 等待动画长度（减去一点点以避免精度问题）
            yield return new WaitForSeconds(animLength - 0.01f);
        }
        else
        {
            // 如果获取失败，默认等待2秒（可调整）
            yield return new WaitForSeconds(2f);
        }

        // 动画结束，返回Idle（但死亡时不会执行此协程）
        if (!isDead)
        {
            PlayAnimation("Idle");
        }
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