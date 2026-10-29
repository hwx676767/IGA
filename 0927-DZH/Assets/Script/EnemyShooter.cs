using UnityEngine;

public class EnemyShooter : MonoBehaviour
{
    [Header("�������")]
    public float detectionRadius = 5f; // ���뾶
    public float arrowSpeed = 3f; // ��ʸ�ٶ�
    public GameObject arrowPrefab; // ��ʸԤ����
    public Transform shootPoint; // �����

    [Header("�˺�����")]
    public float arrowDamage = 1f;

    private bool hasShot = false;
    private Transform player;
    private PlayerHealth playerHealth;

    void Start()
    {
        player = GameObject.FindGameObjectWithTag("Player")?.transform;
        if (player != null)
        {
            playerHealth = player.GetComponent<PlayerHealth>();
        }
    }

    void Update()
    {
        if (!hasShot && player != null)
        {
            CheckPlayerInRange();
        }
    }

    void CheckPlayerInRange()
    {
        float distance = Vector3.Distance(transform.position, player.position);
        if (distance <= detectionRadius)
        {
            ShootArrow();
            hasShot = true;
        }
    }

    void ShootArrow()
    {
        if (arrowPrefab == null || shootPoint == null) return;

        GameObject arrow = Instantiate(arrowPrefab, shootPoint.position, Quaternion.identity);
        ArrowProjectile arrowScript = arrow.GetComponent<ArrowProjectile>();

        if (arrowScript == null)
        {
            arrowScript = arrow.AddComponent<ArrowProjectile>();
        }
        
        Vector3 direction = (player.position - shootPoint.position).normalized;
        arrow.transform.rotation = Quaternion.LookRotation(direction);
        
        arrowScript.Initialize(direction, arrowSpeed, arrowDamage, playerHealth);
    }

    // ���ӻ���ⷶΧ
    private void OnDrawGizmosSelected()
    {
        Gizmos.color = Color.yellow;
        Gizmos.DrawWireSphere(transform.position, detectionRadius);
    }
}