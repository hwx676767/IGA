
  using UnityEngine;
using UnityEngine.EventSystems;

public class OtterClickable : MonoBehaviour, IPointerClickHandler
{
    [Header("第二只海獭")]
    public GameObject peekingOtterPrefab;
    public Transform hidePoint;
    public Transform showPoint;
    
    [Header("音效特效")]
    public AudioClip clickSound;
    public ParticleSystem clickEffect;
    
    private bool hasClicked = false;
    
    public void OnPointerClick(PointerEventData eventData)
    {
        Debug.Log("海獭被点击了！");
        
        if (hasClicked)
        {
            Debug.Log("已经点击过了");
            return;
        }
        
        if (peekingOtterPrefab == null)
        {
            Debug.LogError("peekingOtterPrefab 未设置");
            return;
        }
        
        if (hidePoint == null || showPoint == null)
        {
            Debug.LogError("hidePoint 或 showPoint 未设置");
            return;
        }
        
        hasClicked = true;
        
        // 播放音效
        if (clickSound != null)
        {
            AudioSource.PlayClipAtPoint(clickSound, Camera.main.transform.position);
        }
        
        // 播放特效
        if (clickEffect != null)
        {
            clickEffect.Play();
        }
        
        // 生成第二只海獭
        Canvas canvas = FindObjectOfType<Canvas>();
        if (canvas != null)
        {
            GameObject otter = Instantiate(peekingOtterPrefab, canvas.transform);
            otter.transform.position = hidePoint.position;
            
            OtterPeek peek = otter.GetComponent<OtterPeek>();
            if (peek != null)
            {
                peek.hidePoint = hidePoint;
                peek.showPoint = showPoint;
                peek.StartPeek();
            }
        }
    }
}