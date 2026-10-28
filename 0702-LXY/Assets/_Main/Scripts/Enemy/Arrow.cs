using UnityEngine;

public class Arrow : MonoBehaviour
{
    private GameObject target;
    private float damage;
    private float speed = 10f; // 箭矢移动速度
    private float destroyDelay = 2f; // 箭矢存活时间

    public void Initialize(GameObject targetObject, float damageValue)
    {
        target = targetObject;
        damage = damageValue;
        Destroy(gameObject, destroyDelay); // 自动销毁
    }

    private void Update()
    {
        if (target != null)
        {
            // 朝目标移动
            Vector3 direction = (target.transform.position - transform.position).normalized;
            transform.position += direction * speed * Time.deltaTime;

            // 检测是否到达目标
            float distance = Vector2.Distance(transform.position, target.transform.position);
            if (distance < 0.1f)
            {
                ApplyDamage();
                Destroy(gameObject);
            }
        }
    }

    private void ApplyDamage()
    {
        if (target != null)
        {
            Operator op = target.GetComponent<Operator>();
            if (op != null)
            {
                op.TakeDamage(damage);
                Debug.Log($"Arrow hit {op.data.cardId} for {damage} damage");
            }
        }
    }

    private void OnCollisionEnter2D(Collision2D collision)
    {
        // 碰撞到任何物体时销毁并应用伤害
        ApplyDamage();
        Destroy(gameObject);
    }
}