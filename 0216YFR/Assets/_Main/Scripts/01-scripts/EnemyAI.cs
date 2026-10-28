using UnityEngine;

public class EnemyAI : MonoBehaviour
{
    private Transform player;
    public float moveSpeed = 10f;
    public float detectionRange = 10f;
    public float maxEscapeDistance = 10f;

    private Vector3 escapeDirection;
    private Rigidbody rb;
    private Animator animator;

    void Start()
    {
        rb = GetComponent<Rigidbody>();
        player = GameObject.FindGameObjectWithTag("Player").transform;
        animator = GetComponentInChildren<Animator>();
        rb.useGravity = true;
    }

    void FixedUpdate()
    {
        float distanceToPlayer = Vector3.Distance(transform.position, player.position);

        if (distanceToPlayer < detectionRange)
        {
            EscapeFromPlayer();
        }
        else
        {
            rb.velocity = Vector3.zero;
            animator.SetBool("IsWalking", false);
        }
    }

    private void EscapeFromPlayer()
    {
        escapeDirection = (transform.position - player.position).normalized;

        if (escapeDirection.magnitude < 0.1f)
        {
            escapeDirection = new Vector3(1f, 0f, 0f);
        }

        Vector3 horizontalEscapeDirection = new Vector3(escapeDirection.x, 0f, escapeDirection.z);

        if (horizontalEscapeDirection.magnitude > 0.1f)
        {
            Quaternion targetRotation = Quaternion.LookRotation(horizontalEscapeDirection);
            Vector3 euler = targetRotation.eulerAngles;
            euler.x = 0f; 
            euler.z = 0f;
            targetRotation = Quaternion.Euler(euler);

            transform.rotation = Quaternion.Slerp(transform.rotation, targetRotation, 0.1f);
        }

        rb.velocity = new Vector3(escapeDirection.x, rb.velocity.y, escapeDirection.z) * moveSpeed;

        if (rb.velocity.magnitude > 0.1f)
        {
            animator.SetBool("IsWalking", true);
        }
        else
        {
            animator.SetBool("IsWalking", false); 
        }
    }
}
