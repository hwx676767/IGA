using UnityEngine;
using System.Collections;

[RequireComponent(typeof(Rigidbody))]
public class EnemyAI02 : MonoBehaviour
{
    [Header("移动设置")]
    [SerializeField] private float moveSpeed = 2f;
    [SerializeField] private float rotationSpeed = 5f;
    [SerializeField] private float minWalkTime = 2f;
    [SerializeField] private float maxWalkTime = 5f;
    [SerializeField] private float minRestTime = 1f;
    [SerializeField] private float maxRestTime = 3f;

    [Header("避障设置")]
    [SerializeField] private float obstacleCheckDistance = 1f;
    [SerializeField] private LayerMask obstacleLayer;
    [SerializeField] private float avoidForce = 5f;

    [Header("动画设置")]
    [SerializeField] private Transform animatorChild; // 包含Animator的子物体
    [SerializeField] private string walkAnimParameter = "IsWalking";
    
    [Header("敌人属性")]
    public bool isPrimaryTarget = true; // 是否为主要目标

    private Animator animator;
    private Rigidbody rb;
    private Vector3 moveDirection;
    private bool isWalking = false;

    private void Awake()
    {
        rb = GetComponent<Rigidbody>();
        
        // 获取子物体的Animator
        if (animatorChild != null)
        {
            animator = animatorChild.GetComponent<Animator>();
            if (animator == null)
            {
                Debug.LogError($"子物体 {animatorChild.name} 上没有找到Animator组件");
            }
        }
        else
        {
            Debug.LogError("未指定包含Animator的子物体");
        }
    }

    private void Start()
    {
        StartCoroutine(AIBehaviorRoutine());
    }

    private void Update()
    {
        UpdateAnimation();
    }

    private void FixedUpdate()
    {
        if (isWalking)
        {
            MoveEnemy();
            AvoidObstacles();
        }
    }

    private IEnumerator AIBehaviorRoutine()
    {
        while (true)
        {
            // 随机决定行走或休息
            if (Random.Range(0, 2) == 0)
            {
                // 行走状态
                isWalking = true;
                float walkTime = Random.Range(minWalkTime, maxWalkTime);
                
                // 随机方向 (确保不是零向量)
                do {
                    moveDirection = new Vector3(
                        Random.Range(-1f, 1f), 
                        0, 
                        Random.Range(-1f, 1f)
                    ).normalized;
                } while (moveDirection == Vector3.zero);
                
                yield return new WaitForSeconds(walkTime);
            }
            else
            {
                // 休息状态
                isWalking = false;
                float restTime = Random.Range(minRestTime, maxRestTime);
                yield return new WaitForSeconds(restTime);
            }
        }
    }

    private void MoveEnemy()
    {
        if (moveDirection != Vector3.zero)
        {
            // 计算旋转（只旋转Y轴）
            Quaternion targetRotation = Quaternion.LookRotation(moveDirection);
            Quaternion newRotation = Quaternion.Slerp(
                rb.rotation, 
                targetRotation, 
                rotationSpeed * Time.fixedDeltaTime
            );
            rb.MoveRotation(Quaternion.Euler(0, newRotation.eulerAngles.y, 0));
            
            // 移动
            Vector3 movement = transform.forward * moveSpeed * Time.fixedDeltaTime;
            rb.MovePosition(rb.position + movement);
        }
    }

    private void AvoidObstacles()
    {
        // 多方向射线检测
        CheckDirection(transform.forward, 1f);    // 前方
        CheckDirection(transform.right, 0.6f);    // 右侧
        CheckDirection(-transform.right, 0.6f);   // 左侧
    }

    private void CheckDirection(Vector3 direction, float distanceMultiplier)
    {
        RaycastHit hit;
        if (Physics.Raycast(
            transform.position + Vector3.up * 0.5f, // 从腰部高度发射
            direction, 
            out hit, 
            obstacleCheckDistance * distanceMultiplier, 
            obstacleLayer))
        {
            // 计算避障方向（反射向量 + 随机偏移）
            Vector3 avoidDir = Vector3.Reflect(direction, hit.normal);
            avoidDir = Quaternion.Euler(0, Random.Range(-30f, 30f), 0) * avoidDir;
            
            // 平滑改变移动方向
            moveDirection = Vector3.Lerp(moveDirection, avoidDir.normalized, 0.3f);
            
            // 物理避障
            rb.AddForce(avoidDir * avoidForce * distanceMultiplier, ForceMode.Impulse);
        }
    }

    private void UpdateAnimation()
    {
        if (animator != null)
        {
            animator.SetBool(walkAnimParameter, isWalking);
        }
    }

    private void OnDrawGizmosSelected()
    {
        if (isActiveAndEnabled)
        {
            // 绘制移动方向
            Gizmos.color = isWalking ? Color.green : Color.gray;
            Gizmos.DrawLine(transform.position, transform.position + moveDirection * 2f);
            
            // 绘制检测射线
            Gizmos.color = Color.red;
            DrawDetectionRay(transform.forward, 1f);   // 前
            DrawDetectionRay(transform.right, 0.6f);   // 右
            DrawDetectionRay(-transform.right, 0.6f);  // 左
        }
    }

    private void DrawDetectionRay(Vector3 direction, float distanceMultiplier)
    {
        Gizmos.DrawRay(
            transform.position + Vector3.up * 0.5f,
            direction * obstacleCheckDistance * distanceMultiplier
        );
    }
}