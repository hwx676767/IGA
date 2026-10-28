using UnityEngine;
using UnityEngine.UI;

public class SectorRaycast : MonoBehaviour
{
    public float radius = 5f;
    public float angle = 60f;
    public LayerMask layerMask;

    private FPController playerController;
    private EnemyPatrol enemyPatrol;

    public Slider detectionSlider;
    private bool isPlayerDetected = false;
    private float countdownTime = 3f;
    private float currentCountdownTime;

    public GameObject gameOverPanel; 

    public bool isCrouching = false;

    // 静态变量，控制全局是否已经展示了 Game Over 面板
    private static bool isGameOverShown = false;

    private void Start()
    {
        playerController = GameObject.FindGameObjectWithTag("Player").GetComponent<FPController>();
        enemyPatrol = GameObject.FindGameObjectWithTag("Enemy").GetComponent<EnemyPatrol>();

        detectionSlider.gameObject.SetActive(false);
        gameOverPanel.SetActive(false); 
        currentCountdownTime = countdownTime;
    }

    private void Update()
    {
        isCrouching = playerController.IsCrouching;

        Vector3 origin = transform.position;
        Vector3 forwardDirection = transform.forward;

        CastSectorRay(origin, forwardDirection, angle, radius);

        if (isPlayerDetected)
        {
            currentCountdownTime -= Time.deltaTime;
            detectionSlider.value = currentCountdownTime / countdownTime;

            if (currentCountdownTime <= 0f && !isGameOverShown)
            {
                // 如果 Game Over 面板还没展示过，展示它
                ShowGameOverPanel();
            }
        }
    }

    void CastSectorRay(Vector3 origin, Vector3 direction, float angle, float radius)
    {
        float angleInRadians = angle * Mathf.Deg2Rad;

        bool playerInRange = false;

        for (float i = -angleInRadians / 2; i <= angleInRadians / 2; i += 0.05f)
        {
            Vector3 rotatedDirection = Quaternion.Euler(0, Mathf.Rad2Deg * i, 0) * direction;

            RaycastHit[] hits = Physics.RaycastAll(origin, rotatedDirection, radius, layerMask);

            foreach (RaycastHit hit in hits)
            {
                Debug.unityLogger.Log(hit.collider.gameObject.name + ": " + hit.collider.gameObject.name);
                if (hit.collider.CompareTag("Obstacle"))
                {
                    break;
                }

                if (hit.collider.CompareTag("Player"))
                {
                    playerInRange = true;

                    Debug.Log(isCrouching); 

                    if (isCrouching)
                    {
                        // 蹲下
                        Debug.Log("Crouching");
                        detectionSlider.gameObject.SetActive(false);
                        isPlayerDetected = false;
                        currentCountdownTime = countdownTime;
                        enemyPatrol.ResumePatrol();
                        return;
                    }

                    // 检测到玩家
                    if (!isPlayerDetected)
                    {
                        detectionSlider.gameObject.SetActive(true);
                        currentCountdownTime = countdownTime;
                        isPlayerDetected = true;
                        enemyPatrol.PausePatrol();
                    }

                    Debug.Log("Player Detected");
                }
            }
        }

        // 玩家不在范围内时恢复正常
        if (!playerInRange && isPlayerDetected)
        {
            detectionSlider.gameObject.SetActive(false);
            isPlayerDetected = false;
            currentCountdownTime = countdownTime;
            enemyPatrol.ResumePatrol();
        }
    }

    private void ShowGameOverPanel()
    {
        // 设置静态变量，防止多个敌人同时展示 Game Over 面板
        isGameOverShown = true;

        detectionSlider.gameObject.SetActive(false);
        // 显示 Game Over 面板
        gameOverPanel.SetActive(true);

        // 暂停游戏
        Time.timeScale = 0f; 
        Debug.Log("Game Over");
    }

    private void OnDrawGizmos()
    {
        Gizmos.color = Color.green * 0.25f;
        Vector3 origin = transform.position;
        Vector3 forwardDirection = transform.forward;

        for (float i = -angle / 2; i <= angle / 2; i += 0.05f)
        {
            Vector3 rotatedDirection = Quaternion.Euler(0, i, 0) * forwardDirection;
            Gizmos.DrawRay(origin, rotatedDirection * radius);
        }
    }
}
