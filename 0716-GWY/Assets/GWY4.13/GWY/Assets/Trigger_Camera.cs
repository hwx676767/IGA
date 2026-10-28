using UnityEngine;
using Cinemachine;
using System.Collections;

//using System.Diagnostics;

public class VirtualCameraSwitcher : MonoBehaviour
{
    public CinemachineVirtualCamera mainVirtualCamera; // 主虚拟摄像机
    public CinemachineVirtualCamera alternateVirtualCamera; // 备用虚拟摄像机
    //public CharacterMoveAlongPath characterMoveAlongPath; // 角色 A 的移动脚本
    void Start()
    {
        // 确保游戏开始时主虚拟摄像机优先级较高
        mainVirtualCamera.Priority = 10;
        alternateVirtualCamera.Priority = 5;
    }

    // 当玩家进入触发器区域时调用
    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            // 提高备用虚拟摄像机的优先级以切换视角
            mainVirtualCamera.Priority = 5;
            alternateVirtualCamera.Priority = 10;
            Debug.Log("角色 B 进入触发区域");
            //characterMoveAlongPath.StartMoving();
            StartCoroutine(DelayStartMoving()); // 启动延迟协程
        }

    }

    // 当玩家离开触发器区域时调用（可选）
    private void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            // 恢复主虚拟摄像机的优先级
            mainVirtualCamera.Priority = 10;
            alternateVirtualCamera.Priority = 5;
        }
    }

    private IEnumerator DelayStartMoving()
    {
        yield return new WaitForSeconds(2f); // 延迟两秒
       // characterMoveAlongPath.StartMoving(); // 启动角色 A 的移动
    }

}
    

