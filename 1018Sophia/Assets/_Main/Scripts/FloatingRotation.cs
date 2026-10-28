using UnityEngine;

public class FloatingRotation : MonoBehaviour
{
    [Header("浮动设置")]
    public float floatAmplitude = 0.25f; // 浮动幅度
    public float floatFrequency = 1f;   // 浮动速度

    [Header("旋转设置")]
    public Vector3 rotationSpeed = new Vector3(10f, 20f, 5f); // 每秒旋转角度

    private Vector3 startPos;

    void Start()
    {
        // 记录初始位置
        startPos = transform.position;
    }

    void Update()
    {
        // 浮动效果（上下浮动）
        float newY = startPos.y + Mathf.Sin(Time.time * floatFrequency) * floatAmplitude;
        transform.position = new Vector3(startPos.x, newY, startPos.z);

        // 轻微旋转
        transform.Rotate(rotationSpeed * Time.deltaTime);
    }
}