using UnityEngine;
using UnityEngine.UI;

public class DiverController : MonoBehaviour
{
    [Header("移动设置")]
    public float normalMoveSpeed = 5f;
    public float sprintMoveSpeed = 8f; 
    public float rotationSpeed = 10f;
    
    [Header("下潜设置")]
    public float descendSpeed = 2f;
    public GameObject descendingUIPrefab; // 下潜提示UI预制体
    
    [Header("引用")]
    public MapCamera mapCamera;
    
    private bool isDescending = false;
    private Vector3 targetPosition;
    private int currentLayer = 0;
    private GameObject activeDescendingUI;
    private BatterySystem batterySystem;
    private float currentMoveSpeed;

    private void Start()
    {
        batterySystem = GetComponent<BatterySystem>();
        if (batterySystem == null)
        {
            batterySystem = gameObject.AddComponent<BatterySystem>();
        }
        currentMoveSpeed = normalMoveSpeed;
    }

    void Update()
    {
        if (!HasBattery && !isDescending)
        {
            // 确保不会重复触发
            enabled = false;
            batterySystem.OutOfBattery();
            return;
        }
        
        if (!isDescending)
        {
            HandleHorizontalMovement();
            
            // 保留原有按键控制（可选）
            if (Input.GetKeyDown(KeyCode.DownArrow))
            {
                StartDescend();
            }
        }
        else
        {
            PerformDescend();
        }

        ClampPosition();
    }

    /// <summary>
    /// 外部调用的下潜方法
    /// </summary>
    public void StartDescend()
    {
        if (isDescending) return; // 防止重复调用
        
        currentLayer--;
        
        //数据记录
        GameState.CurrentDepth = Mathf.Abs(currentLayer);
        
        // 更新历史记录
        if(GameState.CurrentDepth > GameState.MaxDepthRecorded)
        {
            GameState.MaxDepthRecorded = GameState.CurrentDepth;
        }
        
        isDescending = true;
        targetPosition = new Vector3(
            transform.position.x,
            currentLayer * GameSettings.Instance.layerHeight,
            transform.position.z
        );
        
        // 显示下潜UI
        ShowDescendingUI();
        
        // 通知地图系统
        MapManager.Instance.Descend();
        if (mapCamera != null) mapCamera.MoveDown();
    }

    void HandleHorizontalMovement()
    {
        float h = Input.GetAxis("Horizontal");
        float v = Input.GetAxis("Vertical");

        Vector3 moveDirection = new Vector3(h, 0, v).normalized;
        float moveDistance = new Vector3(h, 0, v).magnitude * currentMoveSpeed * Time.deltaTime;

        // 检查是否有电池允许移动
        if (moveDirection != Vector3.zero && !batterySystem.TryConsumeBattery(moveDirection, moveDistance))
        {
            return; // 电池耗尽，不能移动
        }

        // 设置移动速度（普通或疾跑）
        currentMoveSpeed = batterySystem.IsSprinting ? sprintMoveSpeed : normalMoveSpeed;

        Vector3 move = moveDirection * currentMoveSpeed * Time.deltaTime;
        transform.Translate(move, Space.World);

        if (move != Vector3.zero)
        {
            Quaternion targetRot = Quaternion.LookRotation(move);
            transform.rotation = Quaternion.Slerp(
                transform.rotation,
                targetRot,
                rotationSpeed * Time.deltaTime
            );
        }
    }
    public bool HasBattery
    {
        get { return batterySystem != null && batterySystem.HasBattery; }
    }

    void PerformDescend()
    {
        transform.position = Vector3.MoveTowards(
            transform.position,
            targetPosition,
            descendSpeed * Time.deltaTime
        );

        if (Vector3.Distance(transform.position, targetPosition) < 0.1f)
        {
            isDescending = false;
            transform.position = targetPosition;
            HideDescendingUI();
        }
    }

    void ShowDescendingUI()
    {
        if (descendingUIPrefab != null && activeDescendingUI == null)
        {
            activeDescendingUI = Instantiate(descendingUIPrefab);
            // 建议将UI放在Canvas下
            if (GameObject.Find("Canvas") != null)
            {
                activeDescendingUI.transform.SetParent(GameObject.Find("Canvas").transform);
                activeDescendingUI.GetComponent<RectTransform>().anchoredPosition = Vector2.zero;
            }
        }
    }

    void HideDescendingUI()
    {
        if (activeDescendingUI != null)
        {
            Destroy(activeDescendingUI);
            activeDescendingUI = null;
        }
    }

    void ClampPosition()
    {
        Vector3 pos = transform.position;
        pos.x = Mathf.Clamp(pos.x, -GameSettings.Instance.mapSize, GameSettings.Instance.mapSize);
        pos.z = Mathf.Clamp(pos.z, -GameSettings.Instance.mapSize, GameSettings.Instance.mapSize);
        transform.position = pos;
    }

    void OnDestroy()
    {
        // 清理UI
        HideDescendingUI();
    }

    void OnDrawGizmosSelected()
    {
        Gizmos.color = Color.red;
        Gizmos.DrawWireSphere(transform.position, 1f);
    }
}