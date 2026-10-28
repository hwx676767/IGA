using UnityEngine;

public class PlayerControlSwitcher : MonoBehaviour
{
    public Camera camera1;                 // 玩家1的摄像头
    public Camera camera2;                 // 玩家2的摄像头
    public ThirdPersonPlayerController player1Controller;  // 玩家1控制脚本
    public shadowPlayerController player2Controller;      // 玩家2控制脚本

    private bool isPlayer1Active = true;   // 当前控制的玩家是否是玩家1

    void Start()
    {
        // 默认情况下，玩家1激活，玩家2禁用
        SetPlayerControl(true);
    }

    void Update()
    {
        // 按Tab键切换控制
        if (Input.GetKeyDown(KeyCode.Tab))
        {
            isPlayer1Active = !isPlayer1Active;  // 切换玩家
            SetPlayerControl(isPlayer1Active);
        }
    }

    // 切换控制玩家
    private void SetPlayerControl(bool isPlayer1Active)
    {
        if (isPlayer1Active)
        {
            // 启动玩家1的控制和摄像头，禁用玩家2的控制和摄像头
            player1Controller.enabled = true;
            player2Controller.enabled = false;
            camera1.gameObject.SetActive(true);
            camera2.gameObject.SetActive(false);
        }
        else
        {
            // 启动玩家2的控制和摄像头，禁用玩家1的控制和摄像头
            player1Controller.enabled = false;
            player2Controller.enabled = true;
            camera1.gameObject.SetActive(false);
            camera2.gameObject.SetActive(true);
        }
    }
}
