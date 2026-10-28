using UnityEngine;

public class TrashProjectile : MonoBehaviour
{
    public float lifetime = 3f;
    public int damage = 1;
    //public GameObject hitEffect;
    
    void Start()
    {
        // 自动销毁
        Destroy(gameObject, lifetime);
    }
    
    void OnTriggerEnter2D(Collider2D other)
    {
        if (other.CompareTag("Player"))
        {
            // 对玩家造成伤害
            PlayerHealth playerHealth = other.GetComponent<PlayerHealth>();
            if (playerHealth != null)
            {
                playerHealth.TakeDamage(damage);
            }
            
            // 生成特效
            /*
            if (hitEffect != null)
            {
                Instantiate(hitEffect, transform.position, Quaternion.identity);
            }*/
            
            // 销毁垃圾
            Destroy(gameObject);
        }
        else if (other.CompareTag("Ground"))
        {
            // 碰到地面也销毁
            /*
            if (hitEffect != null)
            {
                Instantiate(hitEffect, transform.position, Quaternion.identity);
            }*/
            Destroy(gameObject);
        }
    }
}