using UnityEngine;

public class BulletController : MonoBehaviour
{
    public float speed = 10f; // 子弹速度
    public Vector3 targetPosition; // 子弹的目标位置
    public int damage = 20; // 子弹的伤害值

    void Update()
    {
        // 子弹飞向目标位置
        transform.position = Vector3.MoveTowards(transform.position, targetPosition, speed * Time.deltaTime);

        // 如果子弹到达目标位置，销毁子弹
        if (Vector3.Distance(transform.position, targetPosition) < 0.1f)
        {
            Destroy(gameObject);
        }
    }

    private void OnTriggerEnter(Collider other)
    {
        Debug.Log(other.gameObject.name);
        
        if (other.CompareTag("Enemy"))
        {
            EnemyHealth enemyHealth = other.GetComponent<EnemyHealth>();
            if (enemyHealth != null)
            {
                Debug.Log("hurt");
                enemyHealth.TakeDamage(damage);
            }

            Destroy(gameObject);
        }
        else
        {
            return;
        }
    }
}