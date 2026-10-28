using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Entity: MonoBehaviour
{
    #region Components
    public Animator Anim { get; private set; }
    public Rigidbody2D RigidBody { get; private set; }
    #endregion
    
    #region States

    public AllStateMachine StateMachine;

    #endregion
    
    #region Facing Direction
    public int FacingDir { get;  set; } = 1;//means facing direction
    private bool facingRight = true;
    #endregion
    
    #region Collision

    [Header("Collision Info")] [SerializeField]
    public float collisionRadius;

    [SerializeField] public Transform collisionCheckDistance;
    [SerializeField] public LayerMask collisionLayer;
    [SerializeField] public Transform groundCheck;
    [SerializeField] public float groundCheckDistance;
    [SerializeField] public LayerMask groundCheckLayer;
    [SerializeField] public float wallCheckDistance;
    [SerializeField] private Transform primaryWallCheck;
    [SerializeField] private Transform secondaryWallCheck;
    [SerializeField] public bool isCheckedGrounded;
    [field: SerializeField] public bool groundDetected { get; private set; }
    [field: SerializeField] public bool wallDetected { get; private set; }
    #endregion
    
    #region Parameters
    [Header("Move Info")]
    public float speed;
    public float speedFactor;
    public int mass;
    #endregion
    
    // Condition variables
    private bool isKnocked;
    private Coroutine knockbackCo;

    protected virtual void Awake()
    {
        StateMachine = new AllStateMachine();
        RigidBody = GetComponent<Rigidbody2D>();
        Anim = GetComponentInChildren<Animator>();
    }
    
    protected virtual void Start()
    {
        
    }
    
    public virtual void EntityDeath()
    {

    }

    public void ReciveKnockback(Vector2 knockback, float duration)
    {
        if(knockbackCo != null)
            StopCoroutine(knockbackCo);

        knockbackCo = StartCoroutine(KnockbackCo(knockback, duration));
    }

    private IEnumerator KnockbackCo(Vector2 knockback, float duration)
    {
        isKnocked = true;
        RigidBody.linearVelocity = knockback;

        yield return new WaitForSeconds(duration);

        RigidBody.linearVelocity = Vector2.zero;
        isKnocked = false;
    }

    protected virtual void Update()
    {
        HandleCollisionDetection();
        isCheckedGrounded = IsGrounded();
        StateMachine.UpdateActiveState();
    }
    
    public void CurrentStateAnimationTrigger()
    {
        StateMachine.CurrentState.CheckTriggerCalled();//给EntityState用的
    }

    #region velocity

    public void CutVelocity(float cutVar)
    {
        RigidBody.linearVelocity *= cutVar;
    }

    public void ZeroVelocity()
    {
        RigidBody.linearVelocity = Vector2.zero;
    }
    
    public void SetVelocity(float xInput)//used for moving
    {
        if (isKnocked)
            return;
        
        Vector2 velocity = new Vector2(xInput * speedFactor, RigidBody.linearVelocity.y);//we don't change the y speed of rigidBody.
        RigidBody.linearVelocity = velocity;
        speed = RigidBody.linearVelocity.magnitude;
        FlipController(xInput * speedFactor);
    }

    public void SetYVelocity(float ySet)
    {
        if (isKnocked)
            return;
        
        Vector2 velocity = new Vector2(RigidBody.linearVelocity.x, ySet);//we don't change the y speed of rigidBody.
        RigidBody.linearVelocity = velocity;
        speed = RigidBody.linearVelocity.magnitude;
    }
    
    public void SetVelocity(Vector2 velocity)//used for jump
    {
        RigidBody.linearVelocity = velocity;
        speed = RigidBody.linearVelocity.magnitude;
        FlipController(velocity.x);
    }
    #endregion
    
    #region flip

    
    public void Flip()
    {
        FacingDir = -FacingDir;
        facingRight = !facingRight;
        transform.Rotate(0, 180, 0);
    }

    public void FlipController(float x)
    {
        if ((x > 0 && !facingRight) || (x < 0 && facingRight))
        {
            Flip();
        }
    }

    #endregion
    
    #region collisionCheck
    public bool IsGrounded() => Physics2D.Raycast(groundCheck.position, Vector2.down, groundCheckDistance, groundCheckLayer);
    private void HandleCollisionDetection()
    {
        groundDetected = Physics2D.Raycast(groundCheck.position, Vector2.down, groundCheckDistance, groundCheckLayer);


        if (secondaryWallCheck != null)
        {
            wallDetected = Physics2D.Raycast(primaryWallCheck.position, Vector2.right * FacingDir, wallCheckDistance, groundCheckLayer)
                           && Physics2D.Raycast(secondaryWallCheck.position, Vector2.right * FacingDir, wallCheckDistance, groundCheckLayer);
        }
        else
            wallDetected = Physics2D.Raycast(primaryWallCheck.position, Vector2.right * FacingDir, wallCheckDistance, groundCheckLayer);

    }

    protected virtual void OnDrawGizmos()
    {
        //Gizmos.DrawLine(groundCheckDistance.position, groundCheckDistance.position + groundCheckDistance.up);
        Gizmos.DrawLine(groundCheck.position, new Vector3(groundCheck.position.x, groundCheck.position.y - groundCheckDistance));
        Gizmos.DrawLine(primaryWallCheck.position, primaryWallCheck.position + new Vector3(wallCheckDistance * FacingDir, 0));

        if(secondaryWallCheck != null)
            Gizmos.DrawLine(secondaryWallCheck.position, secondaryWallCheck.position + new Vector3(wallCheckDistance * FacingDir, 0));
        
    }
    #endregion

}