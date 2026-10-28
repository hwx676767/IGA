using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

[RequireComponent(typeof(DiverController))]
public class BatterySystem : MonoBehaviour
{
    public const string BATTERY_ITEM_ID = "0";
    public const string VOLTAGE_BOOSTER_ID = "3"; // 电压器物品ID

    [Header("电压器设置")]
    public float voltageBoostDuration = 5f; // 电压器持续时间
    public float voltageBoostCooldown = 10f; // 电压器冷却时间
    public float speedMultiplier = 2f; // 速度倍率

    [Header("UI设置")]
    public Text voltageBoostText;
    public Color activeColor = Color.green;
    public Color cooldownColor = Color.red;
    public Color readyColor = Color.yellow;
    public Color warningColor = Color.red;

    private DiverController diverController;
    private bool isSprinting = false;
    private float distanceMoved = 0f;
    private bool hasBattery = true;
    private bool hasVoltageBoosterInInventory = false;

    // 电池消耗阈值
    private float normalMoveThreshold;  // 普通移动消耗阈值 (mapSize * 4)
    private float diagonalMoveThreshold; // 对角线移动消耗阈值 (mapSize * 2 * √2)

    // 电压器相关变量
    private bool isVoltageBoostActive = false;
    private float voltageBoostTimer = 0f;
    private float voltageBoostCooldownTimer = 0f;
    private float originalMoveSpeed;
    private float originalSprintSpeed;

    // 公开属性供外部访问
    public bool IsSprinting => isSprinting;
    public bool HasBattery => hasBattery;
    public bool IsVoltageBoostActive => isVoltageBoostActive;
    public float VoltageBoostCooldownProgress => Mathf.Clamp01(1f - (voltageBoostCooldownTimer / voltageBoostCooldown));

    private void Awake()
    {
        diverController = GetComponent<DiverController>();

        // 初始化消耗阈值
        float mapSize = GameSettings.Instance.mapSize;
        normalMoveThreshold = mapSize * 4f;       // 两个边长
        diagonalMoveThreshold = mapSize * 2f * Mathf.Sqrt(2f); // 对角线

        // 保存原始速度
        originalMoveSpeed = diverController.normalMoveSpeed;
        originalSprintSpeed = diverController.sprintMoveSpeed;

        // 初始化UI为空
        UpdateVoltageBoostUI("", Color.white);
    }

    private void Update()
    {
        // 检测疾跑按键（默认是Shift）
        isSprinting = Input.GetKey(KeyCode.LeftShift) || Input.GetKey(KeyCode.RightShift);

        // 检测电压器使用按键（Z键）
        if (Input.GetKeyDown(KeyCode.Z))
        {
            TryActivateVoltageBoost();
        }

        // 更新电压器计时器
        UpdateVoltageBoostTimers();

        // 检查背包状态
        CheckInventoryForVoltageBooster();
    }

    private void CheckInventoryForVoltageBooster()
    {
        var items = InventorySystem.Instance.GetAllItems();
        bool newStatus = items.Exists(item => item.itemID == VOLTAGE_BOOSTER_ID);

        if (newStatus != hasVoltageBoosterInInventory)
        {
            hasVoltageBoosterInInventory = newStatus;
            if (hasVoltageBoosterInInventory)
            {
                UpdateVoltageBoostUI("Voltage Booster Ready", readyColor);
            }
            else if (!isVoltageBoostActive && voltageBoostCooldownTimer <= 0)
            {
                UpdateVoltageBoostUI("", Color.white);
            }
        }
    }

    private void UpdateVoltageBoostTimers()
    {
        if (isVoltageBoostActive)
        {
            voltageBoostTimer -= Time.deltaTime;
            UpdateVoltageBoostUI($"Voltage Booster Active:{voltageBoostTimer.ToString("F1")}s", activeColor);
            
            if (voltageBoostTimer <= 0f)
            {
                DeactivateVoltageBoost();
            }
        }
        else if (voltageBoostCooldownTimer > 0f)
        {
            voltageBoostCooldownTimer -= Time.deltaTime;
            UpdateVoltageBoostUI($"Cooling Down: {voltageBoostCooldownTimer.ToString("F1")}s", cooldownColor);
        }
        else if (hasVoltageBoosterInInventory)
        {
            UpdateVoltageBoostUI("Voltage Booster Ready", readyColor);
        }
    }

    private void UpdateVoltageBoostUI(string message, Color color)
    {
        if (voltageBoostText != null)
        {
            voltageBoostText.text = message;
            voltageBoostText.color = color;
        }
    }

    private void TryActivateVoltageBoost()
    {
        if (isVoltageBoostActive || voltageBoostCooldownTimer > 0f) return;

        if (!hasVoltageBoosterInInventory)
        {
            UpdateVoltageBoostUI("Voltage Booster Required!", warningColor);
            Debug.Log("背包中没有电压器！");
            return;
        }

        ActivateVoltageBoost();
    }

    private void ActivateVoltageBoost()
    {
        isVoltageBoostActive = true;
        voltageBoostTimer = voltageBoostDuration;
        voltageBoostCooldownTimer = voltageBoostCooldown;

        // 提升移动速度
        diverController.normalMoveSpeed = originalMoveSpeed * speedMultiplier;
        diverController.sprintMoveSpeed = originalSprintSpeed * speedMultiplier;

        UpdateVoltageBoostUI("Voltage Booster Activated! Movement Speed Increased!", activeColor);
        Debug.Log("电压器激活！移动速度提升！");
    }

    private void DeactivateVoltageBoost()
    {
        isVoltageBoostActive = false;

        // 恢复原始移动速度
        diverController.normalMoveSpeed = originalMoveSpeed;
        diverController.sprintMoveSpeed = originalSprintSpeed;

        UpdateVoltageBoostUI("Voltage Booster Effect Ended", cooldownColor);
        Debug.Log("电压器效果结束");
    }

    public bool TryConsumeBattery(Vector3 moveDirection, float moveDistance)
    {
        if (!hasBattery) return false;
        if (moveDirection == Vector3.zero) return true;

        bool isDiagonal = Mathf.Abs(moveDirection.x) > 0.1f && Mathf.Abs(moveDirection.z) > 0.1f;

        // 根据移动类型增加累计距离
        distanceMoved += moveDistance;

        // 检查是否达到消耗阈值
        float threshold = isSprinting || isDiagonal ? diagonalMoveThreshold : normalMoveThreshold;

        // 如果电压器激活，消耗双倍电池
        int batteryCost = isVoltageBoostActive ? 2 : 1;

        if (distanceMoved >= threshold)
        {
            distanceMoved -= threshold; // 保留超额部分

            // 消耗电池
            for (int i = 0; i < batteryCost; i++)
            {
                if (!ConsumeOneBattery())
                {
                    return false;
                }
            }
            return true;
        }

        return true;
    }

    private bool ConsumeOneBattery()
    {
        var items = InventorySystem.Instance.GetAllItems();
        for (int i = 0; i < items.Count; i++)
        {
            if (items[i].itemID == BATTERY_ITEM_ID)
            {
                InventorySystem.Instance.RemoveItem(i);
                return true;
            }
        }

        // 没有找到电池
        hasBattery = false;
        OutOfBattery();
        return false;
    }

    public void OutOfBattery()
    {
        Debug.Log("电池耗尽，游戏结束!");
        diverController.enabled = false;
        
        // 跳转到场景2
        SceneManager.LoadScene(2); // 场景2的build index
    }
}