using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class Tips : MonoBehaviour
{
    public GameObject uiImagePrefab; 
    public Text uiText;
    public Canvas worldSpaceCanvas;
    public string displayText = "Default Text"; 
    public string secondDisplayText = "Second Default Text";
    public string thirdDisplayText = "Third Default Text"; // Third sentence to display
    
    private GameObject uiImageInstance;
    private float textDisplayTimer = 0f;
    private bool isTextActive = false;
    private Coroutine typewriterCoroutine;

    void Start()
    {
        if (worldSpaceCanvas == null)
        {
            Debug.LogError("未分配World Space Canvas！请在Inspector中拖放World Space Canvas。");
        }
        else if (worldSpaceCanvas.renderMode != RenderMode.WorldSpace)
        {
            Debug.LogWarning("指定的Canvas不是World Space模式，请检查！");
            worldSpaceCanvas.renderMode = RenderMode.WorldSpace;
            worldSpaceCanvas.transform.localScale = new Vector3(0.01f, 0.01f, 0.01f); // 可调整
        }

        if (uiText != null)
        {
            uiText.gameObject.SetActive(false);
        }
        else
        {
            Debug.LogError("未分配UI Text对象！请在Inspector中拖放场景中的Text对象。");
        }
    }

    void OnTriggerEnter2D(Collider2D other)
    {
        if (other.CompareTag("Player")) 
        {
            if (uiImagePrefab != null && uiImageInstance == null && worldSpaceCanvas != null)
            {
                Vector3 uiPosition = new Vector3(transform.position.x + 2f, transform.position.y + 2f, transform.position.z);
                uiImageInstance = Instantiate(uiImagePrefab, uiPosition, Quaternion.identity, worldSpaceCanvas.transform);
                
                uiImageInstance.transform.rotation = Quaternion.Euler(0, 0, 0); // 确保UI正对屏幕
            }
        }
    }

    void Update()
    {
        if (uiImageInstance != null && Input.GetKeyDown(KeyCode.C) && uiText != null)
        {
            if (isTextActive && typewriterCoroutine != null)
            {
                StopCoroutine(typewriterCoroutine); // Stop any ongoing typewriter effect
            }
            uiText.text = ""; // Clear text before starting typewriter effect
            uiText.gameObject.SetActive(true);
            typewriterCoroutine = StartCoroutine(TypewriterEffect(displayText, secondDisplayText, thirdDisplayText));
            // Calculate total duration: first sentence + 2s delay + second sentence + 2s delay + third sentence
            float firstSentenceDuration = displayText.Length * 0.1f;
            float secondSentenceDuration = secondDisplayText.Length * 0.1f;
            float thirdSentenceDuration = thirdDisplayText.Length * 0.1f;
            textDisplayTimer = firstSentenceDuration + secondSentenceDuration + thirdSentenceDuration + 4f + 2f; // 2s delays + 2s final display
            isTextActive = true;
        }

        // 处理Text显示计时
        if (isTextActive && uiText != null)
        {
            textDisplayTimer -= Time.deltaTime;
            if (textDisplayTimer <= 0)
            {
                uiText.gameObject.SetActive(false);
                isTextActive = false;
                if (typewriterCoroutine != null)
                {
                    StopCoroutine(typewriterCoroutine); // Stop typewriter effect when timer runs out
                }
            }
        }
    }

    private IEnumerator TypewriterEffect(string firstText, string secondText, string thirdText)
    {
        uiText.text = "";
        // Display first sentence
        foreach (char c in firstText)
        {
            uiText.text += c;
            yield return new WaitForSeconds(0.1f); // Typing speed for first sentence
        }
        // Wait 2 seconds after first sentence
        yield return new WaitForSeconds(2f);
        // Clear text for second sentence
        uiText.text = "";
        // Display second sentence
        foreach (char c in secondText)
        {
            uiText.text += c;
            yield return new WaitForSeconds(0.1f); // Typing speed for second sentence
        }
        // Wait 2 seconds after second sentence
        yield return new WaitForSeconds(2f);
        // Clear text for third sentence
        uiText.text = "";
        // Display third sentence
        foreach (char c in thirdText)
        {
            uiText.text += c;
            yield return new WaitForSeconds(0.1f); // Typing speed for third sentence
        }
    }

    void OnTriggerExit2D(Collider2D other)
    {
        if (other.CompareTag("Player"))
        {
            if (uiImageInstance != null)
            {
                Destroy(uiImageInstance);
            }
            if (uiText != null)
            {
                uiText.gameObject.SetActive(false);
                isTextActive = false;
                if (typewriterCoroutine != null)
                {
                    StopCoroutine(typewriterCoroutine); // Stop typewriter effect when exiting trigger
                }
            }
        }
    }
}