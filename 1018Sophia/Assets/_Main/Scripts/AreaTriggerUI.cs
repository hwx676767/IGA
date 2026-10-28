using System;
using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class AreaTriggerUI : MonoBehaviour
{
    [Header("UI References")]
    public Text textHead;        // 大标题
    public Text textInside;      // 内容
    public RectTransform insideObject; // 线性移动的UI对象

    [Header("UI Settings")]
    public Vector2 startAnchoredPosition;  // 起始位置（UI本地坐标）
    public Vector2 targetAnchoredPosition; // 目标位置（UI本地坐标）
    public float moveDuration = 1f;        // 移动持续时间

    [Header("Text Content")]
    public string headText;
    [TextArea] public string insideText;

    private bool uiVisible = false;


    private void Start()
    {
        textHead.gameObject.SetActive(false);
        insideObject.gameObject.SetActive(false);
    }

    void Update()
    {
        if (uiVisible && Input.GetKeyDown(KeyCode.Y))
        {
            HideUI();
        }
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            ShowUI();
        }
    }

    void ShowUI()
    {
        textHead.gameObject.SetActive(true);
        
        textHead.text = headText;

        // 设置 text-inside 初始值
        textInside.text = insideText;
        insideObject.anchoredPosition = startAnchoredPosition;

        // 显示UI对象
        insideObject.gameObject.SetActive(true);
        uiVisible = true;

        // 开始移动协程
        StartCoroutine(MoveUI(startAnchoredPosition, targetAnchoredPosition, moveDuration));
    }

    void HideUI()
    {
        textHead.gameObject.SetActive(false);
        insideObject.gameObject.SetActive(false);
        uiVisible = false;
    }

    IEnumerator MoveUI(Vector2 from, Vector2 to, float duration)
    {
        float elapsed = 0f;
        while (elapsed < duration)
        {
            insideObject.anchoredPosition = Vector2.Lerp(from, to, elapsed / duration);
            elapsed += Time.deltaTime;
            yield return null;
        }
        insideObject.anchoredPosition = to;
    }
}