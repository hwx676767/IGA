using UnityEngine;

public class SceneInitializer : MonoBehaviour
{
    private void Start()
    {
        // 找到玩家和主摄像机
        var player = GameObject.FindGameObjectWithTag("Player");
        var camera = Camera.main;

        if (player != null && camera != null)
        {
            // 恢复之前场景的数据
            SceneTransitionManager.Instance.RestoreSceneData(player.transform, camera.transform);
        }
    }
}