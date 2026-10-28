using System.Runtime.Serialization;
using UnityEngine;

public class Entity_Combat : MonoBehaviour
{
    private Entity_VFX vfx;
    public float damage = 10;
    

    [Header("Target detection")]
    [SerializeField] private Transform targetCheck;
    [SerializeField] private float targetCheckRadius = 1;
    [SerializeField] private LayerMask whatIsTarget;
    [SerializeField] private float attackDuration = 0f;
    [SerializeField] private float attackTimer = 0f;

    private void Awake()
    {
        vfx = GetComponent<Entity_VFX>();
    }

    private void Update()
    {
        attackTimer -= Time.deltaTime;
    }

    public void PerformAttack()
    {
        foreach(var target in GetDetectedColliders())
        {
            IDamgable damgable = target.GetComponent<IDamgable>();

            if (damgable == null)
                continue; // skip target, go to next target

            if (attackTimer < 0)
            {
                damgable.TakeDamage(damage, transform);
                vfx.CreateOnHitVFX(target.transform);
                attackTimer = attackDuration;
            }
            else
            {
                //Debug.Log("can't take damage");
            }
        }
    }

    protected Collider2D[] GetDetectedColliders()
    {
        return Physics2D.OverlapCircleAll(targetCheck.position,targetCheckRadius, whatIsTarget);
    }

    private void OnDrawGizmos()
    {
        Gizmos.DrawWireSphere(targetCheck.position, targetCheckRadius);
    }
}
