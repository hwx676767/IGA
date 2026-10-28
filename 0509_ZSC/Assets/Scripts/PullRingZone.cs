using UnityEngine;

public class PullRingZone : MonoBehaviour
{
    private GameObject player; // 存储玩家对象
    private PlayerController playerController; // 玩家的控制器脚本
    private Vector3 startLocalPosition; // 物体初始局部位置
    private Vector3 targetLocalPosition; // 目标局部位置
    private float moveDuration = 2f; // 移动持续时间（2秒）
    private float moveDistance = 9f; // 总移动距离（9个单位，从 -4.5 到 4.5）
    private float moveTimer = 0f; // 移动计时器
    private bool isMoving = false; // 是否正在移动
    public bool playerInZone = false; // 玩家是否在触发区域内

    void Start()
    {
        startLocalPosition = transform.localPosition; // 记录初始局部位置
        Debug.Log("Start Local Position: " + startLocalPosition);
    }

    void OnTriggerEnter2D(Collider2D other)
    {
        if (other.CompareTag("Player"))
        {
            Debug.Log("Player entered the zone");
            player = other.gameObject;
            playerController = player.GetComponent<PlayerController>();
            playerInZone = true; // 玩家进入区域
            
            if (playerController != null)
            {
                playerController.SetInZone(true, this); // 通知玩家进入区域
            }
        }
    }

    void OnTriggerExit2D(Collider2D other)
    {
        if (other.CompareTag("Player"))
        {
            Debug.Log("Player exited the zone");
            playerInZone = false; // 玩家离开区域
            
            if (playerController != null)
            {
                playerController.SetInZone(false, null); // 通知玩家离开区域
                player = null;
                playerController = null;
            }
        }
    }

    // 由 PlayerController 调用，设置玩家为子物体并开始移动
    public void SetPlayerAsChild()
    {
        // 只有玩家在区域内且按下E时才执行
        if (player != null && playerInZone)
        {
            player.transform.SetParent(transform);
            player.transform.localPosition = new Vector3(0, -1.8f, 0); 
            targetLocalPosition = new Vector3(4.5f, 0, 0); // 目标局部位置 (4.5, 0, 0)
            startLocalPosition = new Vector3(-4.5f, 0, 0); // 起始局部位置 (-4.5, 0, 0)
            transform.localPosition = startLocalPosition; // 重置到起始位置
            isMoving = true;
            moveTimer = 0f;
        }
        else
        {
            Debug.Log("Cannot move - player not in zone or null");
        }
    }

    // 由 PlayerController 调用，解除父子关系
    public void ReleasePlayer()
    {
        if (player != null)
        {
            player.transform.SetParent(null); // 解除父子关系
        }
    }

    void Update()
    {
        if (isMoving)
        {
            moveTimer += Time.deltaTime;
            float t = Mathf.Clamp01(moveTimer / moveDuration);
            transform.localPosition = Vector3.Lerp(startLocalPosition, targetLocalPosition, t);

            if (t >= 1f)
            {
                isMoving = false;
                transform.localPosition = targetLocalPosition;
            }
        }
    }
}