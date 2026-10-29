using UnityEngine;
using System.Collections;

public class ReadMessage : MonoBehaviour
{
    public static ReadMessage Instance { get; private set; } // 单例实例

    // 定义布尔变量，确保在 Inspector 中可见
    [SerializeField]
    public bool isBlock = false;
    [SerializeField]
    public bool isMove = false;
    [SerializeField]
    public bool isTalk = false;
    [SerializeField]
    public bool isAttack = false; // 新增Attack状态变量

    // Initialization
    void Awake()
    {
        if (Instance == null)
        {
            Instance = this;
            DontDestroyOnLoad(gameObject); // 可选：跨场景持久
        }
        else
        {
            Destroy(gameObject); // 避免多个实例
        }

        serialController = GameObject.Find("SerialController").GetComponent<SerialController>();
        if (serialController == null)
        {
            Debug.LogError("SerialController not found! Ensure it is attached to a GameObject in the scene.");
        }
        else
        {
            Debug.Log("SerialController initialized successfully.");
        }
    }

    public SerialController serialController;

    // Executed each frame
    void Update()
    {
        // 持续读取所有可用消息
        string message = serialController.ReadSerialMessage();
        while (message != null)
        {
            Debug.Log("Message received: " + message); // 调试确认接收到的消息
            if (ReferenceEquals(message, SerialController.SERIAL_DEVICE_CONNECTED))
            {
                Debug.Log("Connection established");
            }
            else if (ReferenceEquals(message, SerialController.SERIAL_DEVICE_DISCONNECTED))
            {
                Debug.Log("Connection attempt failed or disconnection detected");
            }
            else
            {
                ParseSerialMessage(message);
                Debug.Log("Message parsed: " + message);
            }
            message = serialController.ReadSerialMessage(); // 读取下一条消息
        }
    }

    // 解析串口消息
    void ParseSerialMessage(string message)
    {
        Debug.Log("Parsing message: " + message); // 确认方法被调用
        try
        {
            // 按空格分割字符串，移除空字符串
            string[] parts = message.Split(new[] { ' ' }, System.StringSplitOptions.RemoveEmptyEntries);

            // 重置临时变量
            bool newBlock = isBlock;
            bool newMove = isMove;
            bool newTalk = isTalk;
            bool newAttack = isAttack;

            // 遍历分割后的部分，按键值对处理
            for (int i = 0; i < parts.Length; i += 2)
            {
                string key = parts[i].Trim().ToUpper(); // 忽略大小写
                string value = i + 1 < parts.Length ? parts[i + 1].Trim() : "";

                if (!string.IsNullOrEmpty(value))
                {
                    if (key == "GD:")
                    {
                        if (int.TryParse(value, out int gd))
                        {
                            newBlock = (gd == 1); // GD: 1 设置 isBlock = true
                            Debug.Log($"Parsed GD: {gd}, setting isBlock to {newBlock}");
                        }
                    }
                    else if (key == "SD:")
                    {
                        if (int.TryParse(value, out int sd))
                        {
                            newMove = (sd == 1); // SD: 1 设置 isMove = true
                            Debug.Log($"Parsed SD: {sd}, setting isMove to {newMove}");
                        }
                    }
                    else if (key == "DL:")
                    {
                        if (int.TryParse(value, out int dl))
                        {
                            newTalk = (dl == 1); // DL: 1 设置 isTalk = true
                            Debug.Log($"Parsed DL: {dl}, setting isTalk to {newTalk}");
                        }
                    }
                    else if (key == "ATTACK:")
                    {
                        if (int.TryParse(value, out int attack))
                        {
                            newAttack = (attack == 1);
                            Debug.Log($"Parsed Attack: {attack}, setting isAttack to {newAttack}");
                        }
                        else
                        {
                            Debug.LogWarning($"Failed to parse Attack value: {value}");
                            newAttack = false; // 强制重置为false
                        }
                    }
                }
            }

            // 如果没有找到足够字段，输出警告
            if (parts.Length < 12) // 最小6个键值对（X, Y, GD, SD, DL, Flex）
            {
                Debug.LogWarning($"Incomplete message format, got {parts.Length} parts: {message}");
            }

            // 更新变量
            isBlock = newBlock;
            isMove = newMove;
            isTalk = newTalk;
            isAttack = newAttack;

            // 输出最终状态
            Debug.Log($"Final state - isBlock: {isBlock}, isMove: {isMove}, isTalk: {isTalk}, isAttack: {isAttack}");
        }
        catch (System.Exception e)
        {
            Debug.LogError($"Error parsing message '{message}': {e.Message}");
            isAttack = false; // 强制重置isAttack，避免残留旧值
        }
    }
}