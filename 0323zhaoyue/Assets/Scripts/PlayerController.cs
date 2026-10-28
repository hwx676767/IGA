using UnityEngine;

public class PlayerController : MonoBehaviour
{
    public float walkSpeed = 5f;     // �����ٶ�
    public float runSpeed = 10f;     // �ܲ��ٶ�
    public float rotateSpeed = 100f; // ��ת�ٶȣ�������
    private Animator animator;
    private Vector3 moveDirection;
    private bool isRunning;
    private float verticalInput;     // ��ֱ���루W/S��
    private float horizontalInput;   // ˮƽ���루A/D��

    void Start()
    {
        animator = GetComponent<Animator>();
    }

    void Update()
    {
        GetInput();
        HandleRotation();  // ������ת
        HandleMovement();  // �����ƶ�
        HandleAnimation();
    }

    void GetInput()
    {
        if (gameObject.name == "Player01" || gameObject.name == "Bonnie" )
        {
            verticalInput = Input.GetAxis("Vertical");
            horizontalInput = Input.GetAxis("Horizontal");
            isRunning = Input.GetKey(KeyCode.LeftShift);
        }
        else if (gameObject.name == "Player02" || gameObject.name == "Nancy")
        {
            verticalInput = Input.GetAxis("Vertical_P2");
            horizontalInput = Input.GetAxis("Horizontal_P2");
            isRunning = Input.GetKey(KeyCode.RightShift);
        }

        // �ƶ�����ʼ��Ϊ��ɫ�泯����
        moveDirection = transform.forward * verticalInput;
    }

    void HandleRotation()
    {
        // ʹ��A/D����������ת
        if (horizontalInput != 0)
        {
            float rotationAmount = horizontalInput * rotateSpeed * Time.deltaTime;
            transform.Rotate(0, rotationAmount, 0);
        }
    }

    void HandleMovement()
    {
        if (moveDirection.magnitude > 0.1f)
        {
            float currentSpeed = isRunning ? runSpeed : walkSpeed;
            transform.position += moveDirection * currentSpeed * Time.deltaTime;
        }
    }

    void HandleAnimation()
    {
        // ���ô�ֱ������ƶ���
        float speed = Mathf.Abs(verticalInput) * (isRunning ? 2 : 1);
        animator.SetFloat("Speed", speed);
        //animator.SetBool("IsRunning", isRunning);
    }
}