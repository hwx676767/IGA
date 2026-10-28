using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BossController : MonoBehaviour
{
    public Transform player;
    // Boss�ƶ��ٶ�
    public float moveSpeed = 3f;
    // ��ײ�ٶ�
    public float chargeSpeed = 6f;
    // ��ײ����
    public float knockbackForce = 10f;
    // ѣ��ʱ��
    public float stunDuration = 2f;
    // ��Ծ��
    public float jumpForce = 10f;
    // �ӵ�Ԥ����
    public GameObject bulletPrefab;
    // �ӵ������
    public Transform bulletSpawnPoint;
    // �ӵ��ٶ�
    public float bulletSpeed = 10f;
    // �������
    public float attackInterval = 3f;
    // �޵�ʱ��
    public float invincibilityDuration = 1f;
    private Rigidbody2D rb;
    private float attackTimer;
    private bool isStunned;
    private float stunTimer;
    private bool isInvincible;
    private float invincibilityTimer;
    private Animator animator; // ����ж����������
    private enum AttackState { None, Charge, Jump, Shoot }
    private AttackState currentAttack;
    void Start()
    {
        rb = GetComponent<Rigidbody2D>();
        animator = GetComponent<Animator>();
        attackTimer = attackInterval;
    }
    void Update()
    {
        if (isStunned)
        {
            stunTimer -= Time.deltaTime;
            if (stunTimer <= 0)
            {
                isStunned = false;
            }
            return;
        }
        if (isInvincible)
        {
            invincibilityTimer -= Time.deltaTime;
            if (invincibilityTimer <= 0)
            {
                isInvincible = false;
            }
        }
        // �������
        //Vector3 scale = transform.localScale;
        //scale.x = player.position.x < transform.position.x ? -Mathf.Abs(scale.x)
        ///: Mathf.Abs(scale.x);
        //transform.localScale = scale;
        // ��ʱ��������
        attackTimer -= Time.deltaTime;
        if (attackTimer <= 0)
        {
            ChooseAttack();
            attackTimer = attackInterval;
        }
        // �����ƶ�
        if (currentAttack == AttackState.None)
        {
            Vector2 direction = (player.position -
            transform.position).normalized;
            rb.velocity = new Vector2(direction.x * moveSpeed, rb.velocity.y);
        }
    }
    void ChooseAttack()
    {
        int attackChoice = Random.Range(0, 3);
        currentAttack = (AttackState)attackChoice;
        isInvincible = true;
        invincibilityTimer = invincibilityDuration;
        switch (currentAttack)
        {
            case AttackState.Charge:
                StartCharge();
                break;
            case AttackState.Jump:
                StartJumpAttack();
                break;
            case AttackState.Shoot:
                ShootBullet();
                break;
        }
    }
    void StartCharge()
    {
        // �������
        Vector2 direction = (player.position - transform.position).normalized;
        rb.velocity = new Vector2(direction.x * chargeSpeed, rb.velocity.y);
        // ������Ӷ�������
        // animator.SetTrigger("Charge");
    }
    void StartJumpAttack()
    {
        // �������
        Vector2 direction = (player.position - transform.position).normalized;
        rb.AddForce(new Vector2(direction.x * moveSpeed, jumpForce),
        ForceMode2D.Impulse);
        // ������Ӷ�������
        // animator.SetTrigger("Jump");
    }
    void ShootBullet()
    {
        // �����ӵ�
        Vector2 direction = (player.position -
        bulletSpawnPoint.position).normalized;
        GameObject bullet = Instantiate(bulletPrefab, bulletSpawnPoint.position,
        Quaternion.identity);
        bullet.GetComponent<Rigidbody2D>().velocity = direction * bulletSpeed;
        // ������Ӷ�������
        // animator.SetTrigger("Shoot");
    }
    void OnCollisionEnter2D(Collision2D collision)
    {
        if (collision.gameObject.CompareTag("Player") && currentAttack ==
        AttackState.Charge)
        {
            Vector2 knockbackDirection = (collision.transform.position -
            transform.position).normalized;
            collision.gameObject.GetComponent<Rigidbody2D>
            ().AddForce(knockbackDirection * knockbackForce, ForceMode2D.Impulse);

            collision.gameObject.GetComponent<PlayerHealth>().TakeDamage(1);
        }
        else if (collision.gameObject.CompareTag("Player") && currentAttack ==
        AttackState.Jump)
        {
            collision.gameObject.GetComponent<PlayerHealth>().TakeDamage(1);
        }
        else if (!collision.gameObject.CompareTag("Player") && currentAttack ==
        AttackState.Charge)
        {
            isStunned = true;
            stunTimer = stunDuration;
            rb.velocity = Vector2.zero;
            currentAttack = AttackState.None;
            // animator.SetTrigger("Stun");
        }
    }
    void OnCollisionStay2D(Collision2D collision)
    {
        
    }
    public void TakeDamage(float damage)
    {
        if (!isInvincible)
        {
            // ʵ�������߼�
            // health -= damage;
            // if (health <= 0) Die();
        }
    }

}
