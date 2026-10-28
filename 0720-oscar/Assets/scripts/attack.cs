using UnityEngine;
using System.Collections;
using static Unity.Burst.Intrinsics.X86.Avx;
using UnityEngine.InputSystem.Controls;
using TMPro;
using Unity.VisualScripting;
using UnityEngine.Tilemaps;

public class Attack : MonoBehaviour
{
    [Header("Attack Settings")]
    public LayerMask enemyLayer;
    public LayerMask end_enemyLayer;
    public float attackRange = 0.5f;
    public float knockbackForce = 10f;
    [Range(0, 1)] public float upwardRatio = 0.7f;
    public float invincibleDuration = 0.5f; // Invincibility duration after attack

    public AudioSource audioSource;
    public AudioSource audioSource1;
    
    public PlayerMovement playerMovement;
    GameObject End_Enemy;
    public escape_timer escape_timer;
    public bgm bgm;

    [SerializeField]
    private EnemyHealth _enemyHealth;

    [Header("Debug")]
    public bool showDebugGizmos = true;
    private Transform characterTransform;
    private bool isAttacking = false;
    private Collider2D playerCollider;
    public Tilemap opacity;
    public Tilemap block;
    public End_enemy end_enemy;
    
    private void Awake()
    {
        //end_enemy = GameObject.Find("all/End_enemy").GetComponent<End_enemy>();
        characterTransform = transform.parent ?? transform;
        playerCollider = GetComponentInParent<Collider2D>();
        playerMovement = FindAnyObjectByType<PlayerMovement>();
        
        //block = GetComponent<TilemapCollider2D>();
    }
    
    private void OnEnable()
    {
        StartCoroutine(AttackRoutine());
    }
    
    private void Start()
    {
    }
    
    private IEnumerator AttackRoutine()
    {
        isAttacking = true;

        // Disable collision during attack
        if (playerCollider != null) playerCollider.enabled = false;

        DetectEnemy();

        yield return new WaitForSeconds(invincibleDuration);

        // Re-enable collision
        if (playerCollider != null) playerCollider.enabled = true;
        isAttacking = false;
    }

    private void DetectEnemy()
    {
        Collider2D[] hitEnemies = Physics2D.OverlapCircleAll(transform.position, attackRange, enemyLayer);
        Collider2D[] hitEnemies1 = Physics2D.OverlapCircleAll(transform.position, attackRange, end_enemyLayer);
        foreach (Collider2D enemy in hitEnemies)
        {
            _enemyHealth = enemy.gameObject.GetComponent<EnemyHealth>();
            _enemyHealth.Hurt(1);
            StartCoroutine(KnockbackEnemy(enemy));
        }
        foreach (Collider2D enemy in hitEnemies1)
        {
            StartCoroutine(KnockbackEnemy1(enemy));
        }
    }

    private IEnumerator KnockbackEnemy(Collider2D enemy)
    {
        Rigidbody2D enemyRb = enemy.GetComponent<Rigidbody2D>();
        if (enemyRb != null)
        {
            // 1. Determine character facing direction through scale
            bool isFacingRight = characterTransform.localScale.x < 0;
            // 2. Calculate base knockback direction
            Vector2 baseDirection = isFacingRight ? Vector2.left : Vector2.right;

            // 3. Combine with upward ratio for diagonal knockback
            Vector2 knockbackDirection = new Vector2(
                baseDirection.x,
                upwardRatio
            ).normalized;
            
            // 4. Apply force
            audioSource.Play();
            
            playerMovement.points += 100;
            playerMovement.tmp.text = "Points = " + playerMovement.points.ToString();

            Debug.Log($"Enemy hit! Direction: {knockbackDirection}, Force: {knockbackForce}");
            if (_enemyHealth.health != 0)
            {
                enemyRb.AddForce(knockbackDirection * knockbackForce * 0.5f, ForceMode2D.Impulse);
            }
            else
            {
                _enemyHealth.Die();
                enemyRb.AddForce(knockbackDirection * knockbackForce, ForceMode2D.Impulse);
                enemy.GetComponent<BoxCollider2D>().enabled = false;
            }
            
            yield return new WaitForSeconds(0.3f);
            yield return StartCoroutine(CheckIfOutOfScreen(enemy.gameObject));
        }
    }
    
    private IEnumerator KnockbackEnemy1(Collider2D enemy)
    {
        Rigidbody2D enemyRb = enemy.GetComponent<Rigidbody2D>();
        if (enemyRb != null)
        {
            // 1. Determine character facing direction through scale
            bool isFacingRight = characterTransform.localScale.x < 0;
            // 2. Calculate base knockback direction
            Vector2 baseDirection = isFacingRight ? Vector2.left : Vector2.right;
            
            if (escape_timer.Instance != null)
            {
                escape_timer.Instance.timeIsRunning = true;
            }
            
            if (bgm.Instance != null)
            {
                bgm.Instance.musicIsPlaying = false;
            }
            
            // 3. Combine with upward ratio for diagonal knockback
            Vector2 knockbackDirection = new Vector2(
                baseDirection.x,
                upwardRatio
            ).normalized;
            
            // 4. Apply force
            enemyRb.AddForce(knockbackDirection * knockbackForce, ForceMode2D.Impulse);
            // Play attack sound effect
            audioSource1.Play();
            playerMovement.points += 100;
            playerMovement.tmp.text = "Points = " + playerMovement.points.ToString();
            Debug.Log($"Enemy hit! Direction: {knockbackDirection}, Force: {knockbackForce}");
            
            // Delay before checking collision
            yield return new WaitForSeconds(0.3f);
            enemy.GetComponent<BoxCollider2D>().enabled = false;
            
            if (end_enemy != null)
            {
                end_enemy.isHit = true;
            }
            
            // Check if enemy is knocked out of screen
            yield return StartCoroutine(CheckIfOutOfScreen(enemy.gameObject));
        }
    }

    private IEnumerator CheckIfOutOfScreen(GameObject enemy)
    {
        yield return null;

        while (enemy != null)
        {
            Vector2 screenPosition = 
                Camera.main.WorldToViewportPoint(enemy.transform.position);

            // Check if completely off-screen
            if (screenPosition.x < -0.1f || screenPosition.x > 1.1f ||
                screenPosition.y < -0.1f || screenPosition.y > 1.1f)
            {
                Destroy(enemy);
                yield break;
            }
            yield return null;
        }
    }

    private void OnDrawGizmos()
    {
        if (!showDebugGizmos) return;

        Gizmos.color = Color.red;
        Gizmos.DrawWireSphere(transform.position, attackRange);

        if (characterTransform != null)
        {
            bool isFacingRight = characterTransform.localScale.x > 0;
            Vector2 baseDirection = isFacingRight ? Vector2.left : Vector2.right;
            Vector2 knockbackDirection = new Vector2(baseDirection.x, upwardRatio).normalized;

            Gizmos.color = Color.yellow;
            Gizmos.DrawRay(transform.position, knockbackDirection * 2f);
        }
    }

    // Public method to check if currently attacking
    public bool IsAttacking()
    {
        return isAttacking;
    }
}