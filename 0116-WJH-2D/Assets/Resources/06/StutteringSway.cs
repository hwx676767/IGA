// 2D卡帧摇摆动画 - 基于时间的版本
// 这个版本不受帧率影响，可以精确控制变化间隔

using UnityEngine;

public class StutteringSway : MonoBehaviour
{
    [Header("摇摆设置")]
    public float maxSwayAngle = 15f;          
    public float scaleAmplitude = 0.1f;        

    [Header("卡顿时间控制")]
    public float minHoldTime = 0.2f;    // 最小停留时间（秒）
    public float maxHoldTime = 0.8f;    // 最大停留时间（秒）
    
    [Header("变化速度")]
    [Range(0.01f, 1f)] 
    public float changeSpeed = 0.2f;    // 变化到新位置的速度

    // 内部变量
    private float timer = 0f;
    private float currentHoldTime = 0.5f;
    
    private float targetRotZ = 0f;
    private Vector3 targetScale = Vector3.one;
    
    private float currentRotZ = 0f;
    private Vector3 currentScale = Vector3.one;
    
    private float initialRotationZ = 0f;
    private Vector3 initialScale = Vector3.one;

    void Start()
    {
        initialRotationZ = transform.eulerAngles.z;
        initialScale = transform.localScale;
        
        currentRotZ = initialRotationZ;
        targetRotZ = currentRotZ;
        currentScale = initialScale;
        targetScale = initialScale;
        
        // 设置第一个停留时间
        currentHoldTime = Random.Range(minHoldTime, maxHoldTime);
    }

    void Update()
    {
        // 计时器
        timer += Time.deltaTime;
        
        // When the stay duration is reached, update the target value
        if (timer >= currentHoldTime)
        {
            timer = 0f;
            currentHoldTime = Random.Range(minHoldTime, maxHoldTime);
            
            // Generate a new target
            float randomAngle = Random.Range(-maxSwayAngle, maxSwayAngle);
            targetRotZ = initialRotationZ + randomAngle;
            
            float scaleFactor = 1f + Random.Range(-scaleAmplitude, scaleAmplitude);
            targetScale = initialScale * scaleFactor;
        }
        
        // Smoothly transition to the target value
        currentRotZ = Mathf.Lerp(currentRotZ, targetRotZ, changeSpeed);
        currentScale = Vector3.Lerp(currentScale, targetScale, changeSpeed);
        
        // apply
        Vector3 angles = transform.eulerAngles;
        angles.z = currentRotZ;
        transform.eulerAngles = angles;
        
        transform.localScale = currentScale;
    }
}