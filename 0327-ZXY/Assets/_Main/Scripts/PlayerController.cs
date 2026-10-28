using System;
using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class PlayerController : MonoBehaviour
{
    public float moveSpeed = 5f;
    public float jumpForce = 10f;
    private Rigidbody2D rb2d;
    private Animator animator;
    [Header("碰撞体")]
    [SerializeField]private CapsuleCollider2D idleCapsule2d;
    [SerializeField]private CapsuleCollider2D crouchCapsule2d;
    public bool isCrouch;
    
    public Transform groundCheck;
    public LayerMask groundMask;
    private float groundCheckRadius = 0.2f;
    private bool isGrounded;

    public LayerMask cellingMask;

    public GameObject attackObject;
    
    // Start is called before the first frame update
    void Start()
    {
        rb2d = GetComponent<Rigidbody2D>();
        animator = GetComponent<Animator>();
        
        idleCapsule2d.enabled = true;
        crouchCapsule2d.enabled = false;
        
        attackObject = transform.GetChild(1).gameObject;
        attackObject.SetActive(false);
    }

    // Update is called once per frame
    void Update()
    {

        Jump();
        Crouch();
        
        float horizontal = Input.GetAxis("Horizontal");

        if ( horizontal != 0)
        {
            rb2d.velocity = new Vector2(horizontal * moveSpeed, rb2d.velocity.y);
            
        }

        if (Input.GetKeyDown(KeyCode.Alpha0))
        {
            Attack();
        }
        
        animator.SetFloat("move", Mathf.Abs(horizontal));
        animator.SetFloat("vertical", rb2d.velocity.y);
        animator.SetBool("isGrounded", isGrounded);
        animator.SetBool("isCrouch", isCrouch);
    }


    private void Jump()
    {
        isGrounded = Physics2D.OverlapCircle(groundCheck.position, groundCheckRadius, groundMask);

        if (isGrounded)
        {
            if (Input.GetKeyDown(KeyCode.Space))
            {
                Debug.Log("Space");
            
                rb2d.velocity = new Vector2(rb2d.velocity.x, jumpForce);
            }
        }
    }

    
    void OnDrawGizmos()
    {
        Gizmos.DrawWireSphere(groundCheck.position, groundCheckRadius);
        Gizmos.DrawCube(transform.position, new Vector3(0.2f, 0.8f, 1f));
    }

    private void Crouch()
    {
        if (isGrounded && Input.GetKey(KeyCode.LeftControl)&& !isCrouch)
        {
            
            isCrouch = true;
            idleCapsule2d.enabled = false;
            crouchCapsule2d.enabled = true;
        }
        else if(isCrouch && !Input.GetKey(KeyCode.LeftControl))
        {
            //松开ctrl 判断是不是可以站起来
            Debug.Log("站起");
            Collider2D hitOcolision = Physics2D.OverlapBox(transform.position, new Vector2(0.2f, 0.8f),0f, cellingMask);
            if (hitOcolision)
            {
                Debug.Log("头顶有东西");
                Debug.Log(hitOcolision.gameObject.name);
            }
            else
            {
                Debug.Log("可以站起");
                isCrouch = false;
                idleCapsule2d.enabled = true;
                crouchCapsule2d.enabled = false;
            }
            
        }
    }

    public void Attack()
    {
        attackObject.SetActive(true);
    }
}
