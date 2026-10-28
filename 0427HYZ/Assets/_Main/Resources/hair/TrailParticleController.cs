using UnityEngine;

public class TrailParticleController : MonoBehaviour
{
    public GameObject particlePrefab; // 你的带有拖尾的Prefab
    public float emissionRate = 5f;  // 每秒发射数量（减少到5，突出拖尾）
    public float speed = 2f;         // 发射速度（降低到2，波动更明显）
    public float lifetime = 3f;      // 粒子存活时间（与拖尾Time匹配）
    public float coneAngle = 5f;     // 圆锥角度（更集中，模拟波浪）
    public int minParticleCount = 2; // 每次发射的最小粒子数量
    public int maxParticleCount = 5; // 每次发射的最大粒子数量

    private float timeSinceLastEmission = 0f;
    private bool isEmitting = false;

    void Update()
    {
        // 按空格键触发连续发射
        if (Input.GetKeyDown(KeyCode.Space))
        {
            isEmitting = true;
        }
        if (Input.GetKeyUp(KeyCode.Space))
        {
            isEmitting = false;
        }

        if (!isEmitting) return;

        // 计算发射间隔
        float emissionInterval = 1f / emissionRate;
        timeSinceLastEmission += Time.deltaTime;

        // 如果到了发射时间，调用 EmitParticle
        if (timeSinceLastEmission >= emissionInterval)
        {
            EmitParticle();
            timeSinceLastEmission = 0f;
        }
    }

    public void EmitParticle()
    {
        // 随机决定发射的粒子数量（2-5）
        int particleCount = Random.Range(minParticleCount, maxParticleCount + 1);

        // 循环发射指定数量的粒子
        for (int i = 0; i < particleCount; i++)
        {
            // 随机方向（基于圆锥形状）
            Vector3 direction = Random.insideUnitSphere;
            float angleRad = coneAngle * Mathf.Deg2Rad;
            direction = Vector3.RotateTowards(Vector3.forward, direction, angleRad, 0f);
            direction = transform.TransformDirection(direction);

            // 实例化Prefab
            GameObject particle = Instantiate(particlePrefab, transform.position, Quaternion.identity);
            
            // 添加WobbleEffect组件来实现Y轴波动
            WobbleEffect wobble = particle.AddComponent<WobbleEffect>();
            wobble.amplitude = 1f;   // 增加幅度，波动更明显
            wobble.frequency = 1.5f; // 降低频率，波动更柔和

            // 设置速度
            Rigidbody rb = particle.GetComponent<Rigidbody>();
            if (rb == null)
            {
                rb = particle.AddComponent<Rigidbody>();
                rb.useGravity = false; // 不受重力影响
            }
            rb.velocity = direction * speed;

            // 销毁粒子（模拟存活时间）
            Destroy(particle, lifetime);
        }
    }
}