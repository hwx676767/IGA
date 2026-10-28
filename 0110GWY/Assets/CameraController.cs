using UnityEngine;
using Cinemachine;  // 需要引用 Cinemachine 库

public class CameraSwitcher : MonoBehaviour
{
    public CinemachineVirtualCamera virtualCamera1; // 第一个虚拟相机（跟随角色）
    public CinemachineVirtualCamera virtualCamera2; // 第二个虚拟相机（跟随摩托车）

    private bool isCamera1Active = true; // 当前激活的相机

    void Start()
    {
        // 启动时激活第一个虚拟相机，禁用第二个
        SwitchToCamera1();
    }

    void Update()
    {
        // 检测按下 E 键，进行相机切换
        if (Input.GetKeyDown(KeyCode.E))
        {
            if (isCamera1Active)
            {
                SwitchToCamera2();
            }
            else
            {
                SwitchToCamera1();
            }
        }
    }

    void SwitchToCamera1()
    {
        // 启用第一个虚拟相机，禁用第二个
        virtualCamera1.Priority = 10;
        virtualCamera2.Priority = 5;
        isCamera1Active = true;
    }

    void SwitchToCamera2()
    {
        // 启用第二个虚拟相机，禁用第一个
        virtualCamera1.Priority = 5;
        virtualCamera2.Priority = 10;
        isCamera1Active = false;
    }
}
