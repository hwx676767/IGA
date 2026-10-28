using UnityEngine;

public class WobbleEffect : MonoBehaviour
{
    public float amplitude = 1f;   // 波动幅度（更大，波动更明显）
    public float frequency = 1.5f; // 波动频率（更慢，像波浪）

    private Vector3 initialPosition; // 初始位置
    private float startTime;         // 开始时间（用于正弦计算）
    private float phaseOffset;       // 随机相位偏移

    void Start()
    {
        initialPosition = transform.position;
        startTime = Time.time;
        phaseOffset = Random.Range(0f, 2f * Mathf.PI); // 随机相位，增强流动感
    }

    void Update()
    {
        // 计算Y轴偏移（基于正弦函数）
        float yOffset = Mathf.Sin((Time.time - startTime) * frequency + phaseOffset) * amplitude;

        // 更新位置：保持X和Z不变，只修改Y
        Vector3 newPosition = transform.position;
        newPosition.y = initialPosition.y + yOffset;
        transform.position = newPosition;
    }
}