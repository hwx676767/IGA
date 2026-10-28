using UnityEngine;

public class ExhaustEffectController : MonoBehaviour
{
    public ParticleSystem exhaustParticleSystem; // 尾气特效
    public Rigidbody motorbikeRigidbody;         // 摩托车的刚体
    public float minSize = 0.1f;                 // 最小粒子大小
    public float maxSize = 1.0f;                 // 最大粒子大小
    public float maxSpeed = 20.0f;               // 速度上限，达到此速度时粒子大小为最大值

    private ParticleSystem.MainModule exhaustMainModule;

    void Start()
    {
        // 获取粒子系统的Main模块
        exhaustMainModule = exhaustParticleSystem.main;
    }

    void Update()
    {
        // 获取摩托车当前速度（只关注X轴或根据需要改为其它轴）
        float currentSpeed = motorbikeRigidbody.velocity.magnitude;

        // 根据速度线性计算粒子大小
        float newSize = Mathf.Lerp(minSize, maxSize, currentSpeed / maxSpeed);

        // 设置粒子的Start Size
        exhaustMainModule.startSize = newSize;
    }
}
