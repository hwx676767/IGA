using UnityEngine;
using System.Collections;

public class DamageScript : MonoBehaviour
{
    [Header("伤害设置")]
    public float damageDelay = 2f;
    public GameObject damageEffect;
    public bool requireMouseClick = true;
    
    [Header("引用")]
    private DamageManager damageManager;
    
    private bool isDamaging = false;
    private GameObject currentEnemy;
    private bool enemyInRange = false;

    private void Start()
    {
        damageManager = FindObjectOfType<DamageManager>();
    }

    private void Update()
    {
        if (requireMouseClick && enemyInRange && Input.GetMouseButtonDown(0))
        {
            TriggerDamage();
        }
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Enemy") && !isDamaging)
        {
            currentEnemy = other.gameObject;
            enemyInRange = true;
            
            if (!requireMouseClick)
            {
                TriggerDamage();
            }
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("Enemy"))
        {
            enemyInRange = false;
            currentEnemy = null;
        }
    }

    private void TriggerDamage()
    {
        if (isDamaging || currentEnemy == null) return;
        
        isDamaging = true;
        enemyInRange = false;
        
        // 获取敌人属性
        EnemyAI02 enemyAI = currentEnemy.GetComponent<EnemyAI02>();
        bool isPrimaryTarget = enemyAI != null && enemyAI.isPrimaryTarget;
        
        // 创建特效
        Vector3 effectPosition = currentEnemy.transform.position + new Vector3(0, 2f, 0);
        GameObject effect = Instantiate(damageEffect, effectPosition, Quaternion.identity);
        
        // 注册伤害
        if (damageManager != null)
        {
            damageManager.RegisterDamage(isPrimaryTarget);
        }
        
        StartCoroutine(DestroyEnemyAndEffectAfterDelay(currentEnemy, effect));
    }

    private IEnumerator DestroyEnemyAndEffectAfterDelay(GameObject enemy, GameObject effect)
    {
        Destroy(enemy);
        currentEnemy = null;
        
        yield return new WaitForSeconds(damageDelay);
        
        ParticleSystem particleSystem = effect.GetComponent<ParticleSystem>();
        if (particleSystem != null)
        {
            yield return new WaitForSeconds(particleSystem.main.duration);
        }

        Destroy(effect);
        isDamaging = false;
    }
}