using TMPro;
using UnityEngine;
using UnityEngine.InputSystem;

public class PlayerMovement : MonoBehaviour
{
    // 移动和跳跃相关
    public Rigidbody2D rb;
    public Transform groundCheck;
    public LayerMask groundLayer;
    public Transform celingCheck;
    public LayerMask celingLayer;
    public BoxCollider2D c1;
    public Animator anim;

    // 攻击相关
    public GameObject hit;
    private float horizontal;
    [SerializeField] private float speed = 8f;
    [SerializeField] private float jumpingPower = 6f;
    private bool isFacingRight = true;

    // 分数和UI
    public int points = 0;
    public TextMeshProUGUI tmp;

    // 攻击计时器
    public float attackDuration = 0.5f;
    private float attackTimer;
    private bool isAttacking = false;

    // 蹲下相关
    private bool isCrouching = false;
    private bool wantsToStand = false;
    
    void Start()
    {
        hit.SetActive(false);
    }

    void Update()
    {
        // 移动控制
        rb.velocity = new Vector2(horizontal * speed, rb.velocity.y);

        // 转向控制
        if (!isFacingRight && horizontal > 0f)
        {
            Flip();
        }
        else if (isFacingRight && horizontal < 0f)
        {
            Flip();
        }

        // 攻击控制
        if (Input.GetKey(KeyCode.X))
        {
            StartAttack();
        }
        if (Input.GetKey(KeyCode.LeftShift))
        {
            Debug.Log("开始冲刺");
            Dashing();
        }

        // 攻击计时器
        if (isAttacking)
        {
            attackTimer -= Time.deltaTime;
            if (attackTimer <= 0f)
            {
                EndAttack();
            }
        }

        // 蹲下逻辑
        HandleCrouchLogic();
        Crouch();
        AnimTrans();
    }


    public void AnimTrans()
    {
        //跑步动画
        anim.SetFloat("Horizontal",Mathf.Abs(horizontal));
        //跳跃动画
        anim.SetBool("isGrounded", IsGrounded());
        //蹲下动画
        anim.SetBool("isCrouch", isCrouching);
        //攻击动画
        anim.SetBool("isAttacking", isAttacking);

    }

    public void Jump(InputAction.CallbackContext context)
    {
        if (context.performed && IsGrounded())
        {
            rb.velocity = new Vector2(rb.velocity.x, jumpingPower);
            anim.SetBool("isJump", true);
        }
        if (context.canceled && rb.velocity.y > 0f)
        {
            rb.velocity = new Vector2(rb.velocity.x, rb.velocity.y * 0.5f);
            anim.SetBool("isJump", false);
        }
    }

    private bool IsGrounded()
    {
        return Physics2D.OverlapCircle(groundCheck.position, 0.2f, groundLayer);
    }

    private bool IsOnCeling()
    {
        return Physics2D.OverlapCircle(celingCheck.position, 0.2f, celingLayer);
    }

    private void Flip()
    {
        isFacingRight = !isFacingRight;
        Vector3 localScale = transform.localScale;
        localScale.x *= -1f;
        transform.localScale = localScale;
    }

    public void Move(InputAction.CallbackContext context)
    {
        horizontal = context.ReadValue<Vector2>().x;
    }

    void Up()
    {
        c1.offset = new Vector2(0, 0);
        c1.size = new Vector2(1, 3);
    }

    void Down()
    {
        c1.offset = new Vector2(0, -1f);
        c1.size = new Vector2(1, 1f);
    }

    private void OnTriggerEnter2D(Collider2D collision)
    {
        if (collision.CompareTag("Collectable"))
        {
            GameObject woshishazi = collision.gameObject;
            woshishazi.SetActive(false);
            points += 10;
            tmp.text = "Points = " + points.ToString();
        }
    }

    // 修复后的攻击方法
    private void StartAttack()
    {
        // 如果已经在攻击中，则不再重复激活
        if (isAttacking) return;

        isAttacking = true;
        attackTimer = attackDuration;
        hit.SetActive(true);

        Debug.Log("攻击开始");
    }

    private void EndAttack()
    {
        isAttacking = false;
        hit.SetActive(false);

        Debug.Log("攻击结束");
    }

    private void Crouch()
    {
        if (Input.GetKeyDown(KeyCode.DownArrow))
        {
            Down();
            isCrouching = true;
        }
        else if (Input.GetKeyUp(KeyCode.DownArrow))
        {
            if (IsOnCeling())
            {
                wantsToStand = true;
            }
            else
            {
                Up();
                isCrouching = false;
                wantsToStand = false;
            }
        }
    }

    private void HandleCrouchLogic()
    {
        if (wantsToStand)
        {
            if (!IsOnCeling())
            {
                Up();
                isCrouching = false;
                wantsToStand = false;
            }
            else
            {
                Down();
            }
        }
    }
    private void Dashing()
    {
        isAttacking = true;
        rb.velocity = new Vector2(rb.velocity.x * 1.5f,rb.velocity.y);
        hit.SetActive(true);
    }
}