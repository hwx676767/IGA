using UnityEngine;
using System.Collections;

public class PlayerController : MonoBehaviour
{
    public Light pointLightPrefab; // 点光源预制体
    public Animator playerAnimator; // 玩家的 Animator 组件
    public GameObject bulletPrefab; // 子弹预制体
    public Transform bulletSpawnPoint; // 子弹生成位置

    private Light currentPointLight; // 当前的点光源实例
    private UnityEngine.AI.NavMeshAgent playerAgent; // 玩家的 NavMeshAgent 组件
    private bool isRotating = false; // 是否正在旋转

    private void Start()
    {
        playerAgent = GetComponent<UnityEngine.AI.NavMeshAgent>();
        if (playerAnimator == null)
        {
            playerAnimator = GetComponent<Animator>();
        }
    }

    void Update()
    {
        HandleMovement();
        HandleShoot();
        HandleLight();
    }

    void HandleMovement()
    {
        // 检测鼠标左键点击
        if (Input.GetMouseButtonDown(0))
        {
            Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
            RaycastHit hit;

            if (Physics.Raycast(ray, out hit))
            {
                playerAgent.SetDestination(hit.point);
            }
        }

        // 根据速度设置动画状态
        if (playerAgent.velocity.magnitude > 0.1f)
        {
            playerAnimator.SetBool("IsRunning", true);
        }
        else
        {
            playerAnimator.SetBool("IsRunning", false);
        }
    }

    void HandleShoot()
    {
        if (Input.GetMouseButtonDown(1))
        {
            Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
            RaycastHit hit;

            if (Physics.Raycast(ray, out hit))
            {
                // 播放射击动画
                playerAnimator.SetTrigger("Shoot");

                // 计算玩家朝向点击点的方向
                Vector3 direction = hit.point - transform.position;
                direction.y = 0; // 仅改变Y轴旋转，忽略高度差

                // 如果正在旋转，先停止之前的旋转协程
                if (isRotating)
                {
                    StopCoroutine("RotatePlayerSmoothly");
                }

                // 启动新的旋转协程
                StartCoroutine(RotatePlayerSmoothly(direction));

                // 生成子弹
                GameObject bullet = Instantiate(bulletPrefab, bulletSpawnPoint.position, Quaternion.identity);

                // 设置子弹的目标位置
                BulletController bulletController = bullet.GetComponent<BulletController>();
                if (bulletController != null)
                {
                    bulletController.targetPosition = hit.point;
                }
            }
        }
    }

    IEnumerator RotatePlayerSmoothly(Vector3 direction)
    {
        isRotating = true; // 标记为正在旋转

        Quaternion startRotation = transform.rotation;
        Quaternion targetRotation = Quaternion.LookRotation(direction);
        float rotationSpeed = 10f; // 旋转速度
        float progress = 0f;

        while (progress < 1f)
        {
            progress += Time.deltaTime * rotationSpeed;
            transform.rotation = Quaternion.Slerp(startRotation, targetRotation, progress);
            yield return null;
        }

        transform.rotation = targetRotation; // 确保最终旋转准确
        isRotating = false; // 标记旋转结束
    }

    void HandleLight()
    {
        // 检测鼠标左键点击生成光源
        if (Input.GetMouseButtonDown(0))
        {
            Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
            RaycastHit hit;

            if (Physics.Raycast(ray, out hit))
            {
                if (currentPointLight != null)
                {
                    Destroy(currentPointLight.gameObject);
                }

                Vector3 lightPosition = hit.point + Vector3.up * 0.5f;
                currentPointLight = Instantiate(pointLightPrefab, lightPosition, Quaternion.identity);
            }
        }
    }
}