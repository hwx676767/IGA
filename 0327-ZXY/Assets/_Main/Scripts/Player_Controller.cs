using System.Collections;
using System.Collections.Generic;
using System.ComponentModel.Design.Serialization;
using Unity.VisualScripting.Dependencies.Sqlite;
//using UnityEditor.iOS.Xcode;
using UnityEngine;

public class Player_Controller : MonoBehaviour
{
    public float moveSpeed;
    public float jumpForce;
    public float climbSpeed = 2f;
    public float groundCheckRadius = 0.2f;

    float horizontal;
    float vertical;
    float faceForward;

    public Rigidbody2D rigidBody;
    public Collider2D playercoll;
    private Collider2D currentClimbWall;
    [Header("��ײ��")]
    [SerializeField]private CapsuleCollider2D idleCapsule2d;
    [SerializeField] private CapsuleCollider2D crouchCapsule2d;
    public Animator animator;
    public Transform groundCheck;
    public LayerMask groundMask;
    public LayerMask ceilingMask;

    private bool isGround;
    [SerializeField]private bool isClimb;
    [SerializeField]private bool canClimb;
    private bool isCrouch;


    // Start is called before the first frame update
    void Start()
    {
        rigidBody = GetComponent<Rigidbody2D>();
        playercoll = GetComponent<Collider2D>();
        animator = GetComponent<Animator>();

        idleCapsule2d.enabled = true;
        crouchCapsule2d.enabled = false;
    }

    

    // Update is called once per frame
    void FixedUpdate()
    {
        horizontal = Input.GetAxis("Horizontal");
        vertical = Input.GetAxis("Vertical");
        faceForward = Input.GetAxisRaw("Horizontal");

        jump();

        if (horizontal != 0)
        {
            //Debug.Log("�����" + horizontal);
            rigidBody.velocity = new Vector2(horizontal * moveSpeed, rigidBody.velocity.y);

            if (faceForward != 0)
            {
                this.transform.localScale = new Vector3(faceForward, this.transform.localScale.y, this.transform.lossyScale.z);
            }
        }

        if(canClimb && vertical > 0.1f && !isClimb)
        {
            startClimb();
        }

        if (isClimb)
        {
            climbMove();

            if (Input.GetKeyDown(KeyCode.Space))
            {
                stopClimb();
            }

            return;
        }
        crouch();

        AmiantionUpdate();
        
        Debug.Log("爬"+isClimb);
    }

    private void AmiantionUpdate()
    {
        animator.SetFloat("isMove", Mathf.Abs(horizontal));
        animator.SetFloat("vertical", rigidBody.velocity.y);
        animator.SetBool("isGround", isGround);
        animator.SetBool("isCrouch", isCrouch);
        animator.SetBool("isClimb", isClimb);
    }

    private void jump()
    {
        isGround = Physics2D.OverlapCircle(groundCheck.position, groundCheckRadius, groundMask);

        if (Input.GetKeyDown(KeyCode.Space) && isGround)
        {

            rigidBody.velocity = new Vector2(rigidBody.velocity.x, jumpForce);
        }
    }

    private void OnTriggerEnter2D(Collider2D other)
    {
        if (other.CompareTag("Climbable"))
        {
            canClimb = true;
            currentClimbWall = other;
        }
    }

    private void OnTriggerExit2D(Collider2D other)
    {
        if (other.CompareTag("Climbable"))
        {
            canClimb = false;
            currentClimbWall = null;

            if (isClimb)
            {
                stopClimb();
            }
        }
    }

    private void startClimb()
    {
        isClimb = true;
        rigidBody.gravityScale = 0;
        rigidBody.velocity = Vector2.zero;
    }

    private void stopClimb()
    {
        isClimb = false;
        rigidBody.gravityScale = 1;
    }

    private void climbMove()
    {
        rigidBody.velocity = new Vector2(rigidBody.velocity.x, vertical * climbSpeed);
    }

    private void crouch()
    {
        if (isGround && Input.GetKey(KeyCode.LeftControl) && !isCrouch)
        {
            isCrouch = true;
            idleCapsule2d.enabled = false;
            crouchCapsule2d.enabled = true;
        }
        else if(isCrouch && !Input.GetKey(KeyCode.LeftControl) && isCrouch)
        {
            if(!Physics2D.OverlapBox(transform.position , new Vector2(0.1f, 1.2f), 0f, ceilingMask))
            {
                isCrouch = false;
                idleCapsule2d.enabled = true;
                crouchCapsule2d.enabled = false;
            }
        }
    }
}
