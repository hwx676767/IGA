using UnityEngine;
using UnityEngine.SceneManagement;

public class KeyPressTimer : MonoBehaviour
{
    [SerializeField] private string targetSceneName;
    [SerializeField] private float requiredHoldTime = 7f;
    [SerializeField] private KeyCode keyToPress = KeyCode.F;

    private float currentHoldTime = 0f;
    private bool isKeyBeingPressed = false;

    private Transform playerTransform;
    private Transform cameraTransform;

    private void Start()
    {
        // 找到玩家和主摄像机
        playerTransform = GameObject.FindGameObjectWithTag("Player")?.transform;
        cameraTransform = Camera.main.transform;

        if (playerTransform == null)
        {
            Debug.LogError("找不到带有'Player'标签的游戏对象！");
        }
    }

    private void Update()
    {
        if (Input.GetKeyDown(keyToPress))
        {
            isKeyBeingPressed = true;
            currentHoldTime = 0f;
        }

        if (Input.GetKey(keyToPress) && isKeyBeingPressed)
        {
            currentHoldTime += Time.deltaTime;


            if (currentHoldTime >= requiredHoldTime)
            {
                // 保存数据并切换场景
                SceneTransitionManager.Instance.SaveSceneData(playerTransform, cameraTransform);
                SceneTransitionManager.Instance.LoadScene(targetSceneName);
                isKeyBeingPressed = false;
            }
        }

        if (Input.GetKeyUp(keyToPress))
        {
            isKeyBeingPressed = false;
        }
    }
}