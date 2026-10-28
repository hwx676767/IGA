using UnityEngine;

[RequireComponent(typeof(CharacterController))]
public class FirstPersonParkourController : MonoBehaviour
{
    [Header("移动")]
    public float forwardSpeed = 12f;
    public float laneChangeSpeed = 15f;
    public float laneDistance = 4f;

    [Header("跳跃")]
    public float jumpHeight = 2.5f;
    public float gravity = -30f;

    private CharacterController controller;
    private int currentLane = 1; // 0, 1, 2
    private float verticalVelocity;
    private float targetX;

    void Start()
    {
        controller = GetComponent<CharacterController>();
        targetX = transform.position.x;
    }

    void Update()
    {
        HandleInput();
        ApplyMovement();
    }

    void HandleInput()
    {
        // 换道逻辑
        if (Input.GetKeyDown(KeyCode.A) || Input.GetKeyDown(KeyCode.LeftArrow))
            currentLane = Mathf.Max(0, currentLane - 1);

        if (Input.GetKeyDown(KeyCode.D) || Input.GetKeyDown(KeyCode.RightArrow))
            currentLane = Mathf.Min(2, currentLane + 1);
        targetX = (currentLane - 1) * laneDistance;
        // 跳跃逻辑
        if (controller.isGrounded)
        {
            verticalVelocity = -1f; // 保持接地
            if (Input.GetButtonDown("Jump"))
            {
                verticalVelocity = Mathf.Sqrt(jumpHeight * -2f * gravity);
            }
        }
        else
        {
            verticalVelocity += gravity * Time.deltaTime;
        }
    }
    void ApplyMovement()
    {
        // 平滑计算X轴位移
        float newX = Mathf.Lerp(transform.position.x, targetX, Time.deltaTime * laneChangeSpeed);
        float xMotion = newX - transform.position.x;
        // 组合向量 (X: 换道, Y: 跳跃, Z: 自动前进)
        Vector3 move = new Vector3(xMotion, verticalVelocity * Time.deltaTime, forwardSpeed * Time.deltaTime);
        controller.Move(move);
        // 掉落检查
        if (transform.position.y < -5f)
        {
            // 这里可以写死亡逻辑
            UnityEngine.SceneManagement.SceneManager.LoadScene(UnityEngine.SceneManagement.SceneManager.GetActiveScene().name);
        }
    }
}