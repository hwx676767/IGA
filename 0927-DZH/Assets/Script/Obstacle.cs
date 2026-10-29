using UnityEngine;

public class Obstacle : MonoBehaviour
{
    // ��Inspector�з������������
    [Header("��Ҫ���")]
    public Collider blockingCollider; // �����赲��ҵ���ײ�壨��Trigger��
    public Animator animator; // ���ƶ�����Animator���

    [Header("��������")]
    public KeyCode activationKey = KeyCode.Alpha1; // �������Ĭ��Ϊ�����ϵ�1

    // ���ڸ�������Ƿ��ڴ���������
    private bool playerInTrigger = false;

    // ����ȷ������ֻ����һ��
    private bool hasBeenDeactivated = false;

    void Update()
    {
        // ÿ֡��飺���������������Ұ���ָ�����������ϰ�����δʧЧ
        if (playerInTrigger && Input.GetKeyDown(activationKey) && !hasBeenDeactivated)
        {
            DeactivateObstacle();
        }
    }

    // ʹ�ϰ���ʧЧ����Ҫ����
    private void DeactivateObstacle()
    {
        // 1. �����赲��ײ�壬������ڿ���ͨ����
        if (blockingCollider != null)
        {
            blockingCollider.enabled = false;
        }
        else
        {
            Debug.LogWarning("Blocking Colliderδ������Inspector��", this);
        }

        // 2. ����ʧЧ���� - ʹ�����"isCut?"������
        if (animator != null)
        {
            // ������Ϊ"isCut?"�Ķ�������
            animator.SetBool("isCut?", true);
            Debug.Log("�����ϰ��ﶯ��: isCut?");
        }
        else
        {
            Debug.LogWarning("Animatorδ������Inspector��", this);
        }

        // 3. ���Ϊ��ʧЧ����ֹ�ظ�����
        hasBeenDeactivated = true;

        // 4. ��ѡ�����ýű���Update��⣬��Ϊ���������
        // this.enabled = false;
    }

    // ===== Trigger��ⷽ�� =====
    // ��������ײ����뱾�����Trigger����ʱ����
    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            playerInTrigger = true;
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            playerInTrigger = false;
        }
    }

    // (��ѡ) �ڱ༭���п��ӻ�Trigger��Χ�����ڵ���
    private void OnDrawGizmosSelected()
    {
        // ��ȡ����Collider������Trigger
        Collider[] colliders = GetComponents<Collider>();
        foreach (Collider col in colliders)
        {
            if (col.isTrigger)
            {
                // ΪTrigger Collider����һ����͸������ɫ�߿�
                Gizmos.color = new Color(0, 1, 0, 0.2f); // ��ɫ����͸��
                if (col is BoxCollider)
                {
                    BoxCollider boxCol = (BoxCollider)col;
                    // ������ײ��������ռ��еĴ�С��λ��
                    Gizmos.matrix = Matrix4x4.TRS(transform.TransformPoint(boxCol.center), transform.rotation, transform.lossyScale);
                    Gizmos.DrawCube(Vector3.zero, boxCol.size);
                    Gizmos.color = Color.green;
                    Gizmos.DrawWireCube(Vector3.zero, boxCol.size);
                }
            }
            else
            {
                // Ϊ��ͨCollider����һ����͸���ĺ�ɫ�߿�
                Gizmos.color = new Color(1, 0, 0, 0.2f); // ��ɫ����͸��
                if (col is BoxCollider)
                {
                    BoxCollider boxCol = (BoxCollider)col;
                    Gizmos.matrix = Matrix4x4.TRS(transform.TransformPoint(boxCol.center), transform.rotation, transform.lossyScale);
                    Gizmos.DrawCube(Vector3.zero, boxCol.size);
                    Gizmos.color = Color.red;
                    Gizmos.DrawWireCube(Vector3.zero, boxCol.size);
                }
            }
        }
        // ����Gizmos����
        Gizmos.matrix = Matrix4x4.identity;
    }
}