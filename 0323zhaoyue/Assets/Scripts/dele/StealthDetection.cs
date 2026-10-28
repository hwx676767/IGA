using UnityEngine;

public class StealthDetection : MonoBehaviour
{
    public float detectionRadius = 10f;   // ����̽��İ뾶
    public float detectionAngle = 60f;    // ���εĽǶȣ�����60�ȣ�
    //public LayerMask obstructionLayer;    // ���β㣬���ڼ���ϰ��ǽ�ڣ�
    public LayerMask targetLayer;         // Ŀ��㣬���ڼ�ⱻ���Ķ�����ҵȣ�

    private PlayerMoodState playerMoodState; // ����Player1������״̬�ű�
    private bool isPlayer2Fishing = false;   // �ж�Player2�Ƿ�������״̬

    // ��Awake�л�ȡPlayer1��PlayerMoodState�ű�����
    private void Awake()
    {
        // ����Player1�ǳ����е�һ������Player2�Ǳ�������
        playerMoodState = FindObjectOfType<PlayerMoodState>();
    }

    void Update()
    {
        DetectInCone();
    }

    void DetectInCone()
    {
        Vector3 playerPosition = transform.position;
        Vector3 forwardDirection = transform.forward;

        for (float angle = -detectionAngle / 2f; angle <= detectionAngle / 2f; angle += 1f)
        {
            Quaternion rotation = Quaternion.Euler(0f, angle, 0f);
            Vector3 direction = rotation * forwardDirection;

            RaycastHit hit;
            if (Physics.Raycast(playerPosition, direction, out hit, detectionRadius, targetLayer))
            {
                // �����⵽Player2����Player2��״̬������
                if (hit.collider.CompareTag("Player01")) 
                {
                    isPlayer2Fishing = true;
                    
                    if (playerMoodState != null)
                    {
                        playerMoodState.DecreaseMood(10f);  
                    }
                }
            }
            else
            {
                isPlayer2Fishing = false;
            }
        }
    }

    // �����ڼ�⵽Player2����ʱ֪ͨPlayer1�۳�����ֵ
    public bool IsPlayer2Fishing()
    {
        return isPlayer2Fishing;
    }

    private void OnDrawGizmos()
    {
        // ���ӻ����μ�ⷶΧ
        Gizmos.color = Color.yellow;
        Vector3 playerPosition = transform.position;
        Vector3 forwardDirection = transform.forward;

        float step = 1f;
        for (float angle = -detectionAngle / 2f; angle <= detectionAngle / 2f; angle += step)
        {
            Quaternion rotation = Quaternion.Euler(0f, angle, 0f);
            Vector3 direction = rotation * forwardDirection;

            Gizmos.DrawRay(playerPosition, direction * detectionRadius);
        }

        Gizmos.DrawWireSphere(playerPosition + forwardDirection * detectionRadius, 0.1f);
    }
}
