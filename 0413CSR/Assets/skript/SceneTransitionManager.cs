using UnityEngine;
using UnityEngine.SceneManagement;
using System.Collections;

public class SceneTransitionManager : MonoBehaviour
{
    public static SceneTransitionManager Instance { get; private set; }

    // 存储玩家和摄像机的数据
    private Vector3 playerPosition;
    private Quaternion playerRotation;
    private Vector3 cameraPosition;
    private Quaternion cameraRotation;

    private void Awake()
    {
        // 确保单例唯一
        if (Instance != null && Instance != this)
        {
            Destroy(gameObject);
            return;
        }

        Instance = this;
        DontDestroyOnLoad(gameObject);
    }

    // 保存当前场景的数据
    public void SaveSceneData(Transform player, Transform camera)
    {
        playerPosition = player.position;
        playerRotation = player.rotation;
        cameraPosition = camera.position;
        cameraRotation = camera.rotation;
    }

    // 恢复之前保存的场景数据
    public void RestoreSceneData(Transform player, Transform camera)
    {
        player.position = playerPosition;
        player.rotation = playerRotation;
        camera.position = cameraPosition;
        camera.rotation = cameraRotation;
    }

    // 加载指定场景
    public void LoadScene(string sceneName)
    {
        SceneManager.LoadScene(sceneName);
    }
}