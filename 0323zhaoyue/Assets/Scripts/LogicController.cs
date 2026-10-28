using UnityEngine;

public class LogicController : MonoBehaviour
{
    private PlayerController playerController; // 当前玩家的控制器
    private bool isLocked = false; // 当前玩家是否被锁定

    private void Start()
    {
        // 获取当前玩家的 PlayerController 组件
        playerController = GetComponent<PlayerController>();

        if (playerController == null)
        {
            Debug.LogError("未找到 PlayerController 组件！");
        }
    }

    private void Update()
    {
        HandlePlayerLockInput();
    }

    void HandlePlayerLockInput()
    {
        if (gameObject.name == "Player01")
        {
            // Player01 的逻辑（使用主键盘数字键和左 Ctrl）
            if (Input.GetKeyDown(KeyCode.Alpha1)) // 主键盘 1
            {
                LockPlayer();
            }
            if (Input.GetKeyDown(KeyCode.Alpha2)) // 主键盘 2
            {
                LockPlayer();
            }
            if (Input.GetKeyDown(KeyCode.Alpha3)) // 主键盘 3
            {
                LockPlayer();
            }
            if (Input.GetKeyDown(KeyCode.Alpha4)) // 主键盘 4
            {
                LockPlayer();
            }
            if (Input.GetKeyDown(KeyCode.LeftControl)) // 左 Ctrl
            {
                UnlockPlayer();
            }
        }
        else if (gameObject.name == "Player02")
        {
            // Player02 的逻辑（使用小键盘数字键和右 Ctrl）
            if (Input.GetKeyDown(KeyCode.Keypad1)) // 小键盘 1
            {
                LockPlayer();
            }
            if (Input.GetKeyDown(KeyCode.Keypad2)) // 小键盘 2
            {
                LockPlayer();
            }
            if (Input.GetKeyDown(KeyCode.Keypad3)) // 小键盘 3
            {
                LockPlayer();
            }
            if (Input.GetKeyDown(KeyCode.Keypad4)) // 小键盘 4
            {
                LockPlayer();
            }
            if (Input.GetKeyDown(KeyCode.RightControl)) // 右 Ctrl
            {
                UnlockPlayer();
            }
        }
    }

    void LockPlayer()
    {
        if (playerController != null && !isLocked)
        {
            playerController.enabled = false; // 禁用玩家控制器
            isLocked = true;
            Debug.Log($"{gameObject.name} 已锁定，无法移动");
        }
    }

    void UnlockPlayer()
    {
        if (playerController != null && isLocked)
        {
            playerController.enabled = true; // 启用玩家控制器
            isLocked = false;
            Debug.Log($"{gameObject.name} 已解锁，可以移动");
        }
    }
}