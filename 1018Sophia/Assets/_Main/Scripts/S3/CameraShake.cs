using UnityEngine;
using UnityEngine.UI;

public class CameraShake : MonoBehaviour
{
    [Header("Shake Settings")]
    [SerializeField] private float shakeSpeed = 1f;
    [SerializeField] private float shakeMultiplier = 1f;
    [SerializeField] private float shakeDuration = 0.5f;

    [Header("Placed Items Settings")]
    [SerializeField] private Transform placedParent; // 指定放置物体的父物体
    [SerializeField] private int targetItemCount = 3; // 目标数量

    [Header("Image Settings")]
    [SerializeField] private RawImage targetImage;
    [SerializeField] private float defaultV = 0.75f; // Value 默认值 75%
    [SerializeField] private float defaultA = 0.35f; // Alpha 默认值 35%
    [SerializeField] private Vector2 shakeVRange = new Vector2(0.75f, 0.85f); // V抖动范围
    [SerializeField] private Vector2 shakeARange = new Vector2(0.35f, 0.6f); // A抖动范围
    
    [Header("Active Project")]
    [SerializeField] private GameObject activeProject;

    private Quaternion originalRotation;
    private float shakeTimer = 0f;
    private bool isShaking = true;

    private float currentV;
    private float currentA;
    private float targetV;
    private float targetA;
    private float imageLerpTimer;

    void Start()
    {
        originalRotation = transform.rotation;
        if (targetImage != null)
        {
            currentV = defaultV;
            currentA = defaultA;
            targetV = defaultV;
            targetA = defaultA;
            SetImageColor(currentV, currentA);
        }
        activeProject.SetActive(false);
        Shake();
    }

    void Update()
    {
        if (!isShaking)
        {
            // 停止抖动，image透明
            if (targetImage != null)
            {
                SetImageColor(currentV, 0f);
                activeProject.SetActive(true);
            }
            return;
        }

        // 检查放置物数量是否达到目标
        if (placedParent != null && placedParent.childCount >= targetItemCount)
        {
            isShaking = false;
            transform.rotation = originalRotation;
            return;
        }

        // 持续抖动相机
        if (shakeTimer > 0)
        {
            shakeTimer -= Time.deltaTime * shakeSpeed;
            if (shakeTimer <= 0)
            {
                Shake();
            }
        }

        // 更新Image的v和a值线性插值
        if (targetImage != null)
        {
            imageLerpTimer += Time.deltaTime * shakeSpeed;
            currentV = Mathf.Lerp(currentV, targetV, imageLerpTimer);
            currentA = Mathf.Lerp(currentA, targetA, imageLerpTimer);
            SetImageColor(currentV, currentA);
        }
    }

    void Shake()
    {
        if (shakeDuration > 0)
        {
            shakeTimer = shakeDuration;
            float zRotation = Random.Range(-5f, 5f) * shakeMultiplier;
            transform.rotation = originalRotation * Quaternion.Euler(0, 0, zRotation);

            // 随机更新Image的目标v和a
            if (targetImage != null)
            {
                targetV = Random.Range(shakeVRange.x, shakeVRange.y);
                targetA = Random.Range(shakeARange.x, shakeARange.y);
                imageLerpTimer = 0f; // 重置插值计时
            }
        }
    }

    void SetImageColor(float v, float a)
    {
        Color color = Color.HSVToRGB(0f, 0f, v); // 假设H=0,S=0为灰色调
        color.a = a;
        targetImage.color = color;
    }
}
