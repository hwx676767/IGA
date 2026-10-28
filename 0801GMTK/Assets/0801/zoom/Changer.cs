using UnityEngine;
using System.Collections;

public class Changer : MonoBehaviour
{
    // 公开的位置变量
    [Header("Position Settings")]
    public Vector3 position1; // 位置1
    public Vector3 position2; // 位置2
    
    // 公开的协程等待时间
    [Header("Timing Settings")]
    public float waitTime = 1f; // 协程等待时间（秒）
    
    // 特效预制体
    [Header("Particle Effects")]
    public ParticleSystem effect1; // 位置1的特效
    public ParticleSystem effect2; // 位置2的特效

    void Start()
    {
        // 初始化物体到位置1
        transform.position = position1;
    }

    void Update()
    {
        // 检测右键点击
        if (Input.GetMouseButtonDown(1))
        {
            StartCoroutine(PlayEffectsAndMove());
        }
    }

    IEnumerator PlayEffectsAndMove()
    {
        // 在位置1播放特效1
        if (effect1 != null)
        {
            Instantiate(effect1, position1, Quaternion.identity);
        }

        // 等待指定时间
        yield return new WaitForSeconds(waitTime);

        // 移动到位置2并播放特效2
        transform.position = position2;
        if (effect2 != null)
        {
            Instantiate(effect2, position2, Quaternion.identity);
        }
    }
}