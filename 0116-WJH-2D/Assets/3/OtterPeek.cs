using UnityEngine;
using System.Collections;

public class OtterPeek : MonoBehaviour
{
    public float peekDuration = 0.6f;
    public float stayDuration = 3f;      // 停留3秒（改成你想要的）
    public float hideDuration = 0.4f;
    
    public Transform hidePoint;
    public Transform showPoint;
    
    public AudioClip peekSound;
    
    private RectTransform rectTransform;
    private CanvasGroup canvasGroup;
    
    void Awake()
    {
        rectTransform = GetComponent<RectTransform>();
        canvasGroup = GetComponent<CanvasGroup>();
        if (canvasGroup == null)
            canvasGroup = gameObject.AddComponent<CanvasGroup>();
    }
    
    void Start()
    {
        if (hidePoint != null)
            rectTransform.position = hidePoint.position;
        canvasGroup.alpha = 1f;  // 直接不透明
    }
    
    public void StartPeek()
    {
        StartCoroutine(PeekAnimation());
    }
    
    IEnumerator PeekAnimation()
    {
        if (peekSound != null)
            AudioSource.PlayClipAtPoint(peekSound, Camera.main.transform.position);
        
        // 透明度从 1 到 1（无变化）
        yield return StartCoroutine(MoveAndFade(hidePoint.position, showPoint.position, 1f, 1f, peekDuration));
        yield return new WaitForSeconds(stayDuration);
        yield return StartCoroutine(MoveAndFade(showPoint.position, hidePoint.position, 1f, 1f, hideDuration));
        
        Destroy(gameObject);
    }
    
    IEnumerator MoveAndFade(Vector2 startPos, Vector2 endPos, float startAlpha, float endAlpha, float duration)
    {
        float timer = 0;
        while (timer < duration)
        {
            timer += Time.deltaTime;
            float t = timer / duration;
            rectTransform.position = Vector2.Lerp(startPos, endPos, t);
            // 透明度不变，不需要赋值
            yield return null;
        }
        
        rectTransform.position = endPos;
    }
}