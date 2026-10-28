using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;

public class RollingNotification : MonoBehaviour
{
    public List<string> messageList = new List<string>();
    public Text notificationText;
    public float scrollSpeed = 100f;
    public float pauseDuration = 2f;
    
    private RectTransform textRectTransform;
    private RectTransform parentRectTransform;
    private int currentIndex = 0;
    
    void Start()
    {
        textRectTransform = notificationText.GetComponent<RectTransform>();
        parentRectTransform = transform.parent.GetComponent<RectTransform>();
        
        if (messageList.Count > 0)
        {
            StartCoroutine(RollingLoop());
        }
    }
    
    IEnumerator RollingLoop()
    {
        while (true)
        {
            notificationText.text = messageList[currentIndex];
            
            // 等待一帧以确保文字更新
            yield return null;
            
            // 计算移动距离
            float textWidth = notificationText.preferredWidth;
            float startX = parentRectTransform.rect.width;
            float endX = -textWidth;
            
            textRectTransform.anchoredPosition = new Vector2(startX, textRectTransform.anchoredPosition.y);
            
            // 滚动动画
            float duration = (startX - endX) / scrollSpeed;
            float elapsed = 0f;
            
            while (elapsed < duration)
            {
                elapsed += Time.deltaTime;
                float t = elapsed / duration;
                float newX = Mathf.Lerp(startX, endX, t);
                textRectTransform.anchoredPosition = new Vector2(newX, textRectTransform.anchoredPosition.y);
                yield return null;
            }
            
            // 暂停2秒
            yield return new WaitForSeconds(pauseDuration);
            
            // 切换到下一条消息
            currentIndex = (currentIndex + 1) % messageList.Count;
        }
    }
}