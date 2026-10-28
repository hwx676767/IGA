using UnityEngine;
using System.Collections;

public class EmotionBall : MonoBehaviour
{
    [Header("小球属性")]
    public bool isSpecialBall = false;
    private Rigidbody rb;
    private bool isInAnalysisZone = false;

    [Header("浮动效果设置")]
    public bool enableFloat = true;
    public float floatAmplitude = 0.2f;
    public float floatSpeed = 2f;

    private float baseY;
    private float floatOffset;
    private bool canFloat = false;

    [Header("生命周期设置")]
    public float lifetimeOutside = 15f;   // 普通小球在场景外存活时间
    public float lifetimeInZone = 4f;     // 进入区域后存活时间
    public float specialBallLifetime = 2f; // 特殊小球生成后 2 秒销毁

    public event System.Action onDestroyed;

    private void Start()
    {
        rb = GetComponent<Rigidbody>();
        floatOffset = Random.Range(0f, Mathf.PI * 2f);

        // ⚡ 特殊小球：先隐藏 → 等待 2 秒 → 爆炸并销毁
        if (isSpecialBall)
        {
            StartCoroutine(SpecialBallBehavior());
        }
        else
        {
            // 普通小球：启动默认生命周期
            StartCoroutine(DestroyAfterSeconds(lifetimeOutside));
        }
    }

    private void Update()
    {
        if (enableFloat && canFloat && !isInAnalysisZone && !isSpecialBall)
        {
            Vector3 pos = transform.position;
            pos.y = baseY + Mathf.Sin(Time.time * floatSpeed + floatOffset) * floatAmplitude;
            transform.position = pos;
        }
    }

    public void ActivateFloating()
    {
        baseY = transform.position.y;
        canFloat = true;
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("AnalysisZone") && !isInAnalysisZone)
        {
            isInAnalysisZone = true;

            if (rb != null)
                rb.useGravity = true;

            // 进入区域后 4 秒消失
            StopAllCoroutines();
            StartCoroutine(DestroyAfterSeconds(lifetimeInZone));
        }
    }

    IEnumerator DestroyAfterSeconds(float time)
    {
        yield return new WaitForSeconds(time);

        if (isSpecialBall || PrefabSpawner.Instance.ballsOutsideScene > 15)
        {
            PlayExplosionEffect();
        }

        onDestroyed?.Invoke();
        Destroy(gameObject);
    }

    IEnumerator SpecialBallBehavior()
    {
        yield return new WaitForSeconds(2f);

        HideBall();

        yield return new WaitForSeconds(specialBallLifetime-2f);

        PlayExplosionEffect();

        onDestroyed?.Invoke();
        Destroy(gameObject);
    }


    private void PlayExplosionEffect()
    {
        if (PrefabSpawner.Instance.particleEffect1 != null)
        {
            ParticleSystem ps1 = PrefabSpawner.Instance.particleEffect1.GetComponent<ParticleSystem>();
            if (ps1 != null) ps1.Play();
        }

        if (PrefabSpawner.Instance.particleEffect2 != null)
        {
            ParticleSystem ps2 = PrefabSpawner.Instance.particleEffect2.GetComponent<ParticleSystem>();
            if (ps2 != null) ps2.Play();
        }
    }

    private void HideBall()
    {
        foreach (var r in GetComponentsInChildren<MeshRenderer>())
            r.enabled = false;

        foreach (var c in GetComponentsInChildren<Collider>())
            c.enabled = false;
    }
}
