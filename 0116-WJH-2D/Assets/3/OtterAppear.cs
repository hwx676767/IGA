using UnityEngine;
using System.Collections;

public class OtterAppear : MonoBehaviour
{
    [Header("渐显设置")]
    public float fadeInTime = 1f;           // 渐显持续时间
    
    private CanvasGroup canvasGroup;
    
    void Awake()
    {
        canvasGroup = GetComponent<CanvasGroup>();
        if (canvasGroup == null)
            canvasGroup = gameObject.AddComponent<CanvasGroup>();
    }
    
    void Start()
    {
        canvasGroup.alpha = 0f;
        StartCoroutine(FadeIn());
    }
    
    IEnumerator FadeIn()
    {
        float timer = 0;
        while (timer < fadeInTime)
        {
            timer += Time.deltaTime;
            canvasGroup.alpha = timer / fadeInTime;
            yield return null;
        }
        canvasGroup.alpha = 1f;
    }
}