using UnityEngine;
using TMPro; // Make sure to include the TMP namespace
using System.Collections;
using System.Collections.Generic;

public class TextChecker : MonoBehaviour
{
    [Header("答案")]
    public string[] targetStrings; // 设定的目标字符串数组
    public GameObject conversationPanel;

    private List<string> childTexts = new List<string>(); // 存储所有子物体的文本内容
    private int lastChildCount = 0; // 上次检测到的子物体数量
    private List<Vector3> lastChildPositions = new List<Vector3>(); // 上次检测到的子物体位置列表

    private void Start()
    {
        // 初始化检测
        CheckAndStoreChildTexts();
    }

    private void Update()
    {
        // 如果子物体数量或位置发生变化，则重新检测
        if (transform.childCount != lastChildCount || HaveChildPositionsChanged())
        {
            CheckAndStoreChildTexts();
        }
    }

    // 检测并存储子物体的文本
    private void CheckAndStoreChildTexts()
    {
        // 更新子物体数量
        lastChildCount = transform.childCount;
        childTexts.Clear();
        lastChildPositions.Clear();

        // 获取每个子物体的child(0)的TextMeshProUGUI组件文本
        for (int i = 0; i < lastChildCount; i++)
        {
            Transform child = transform.GetChild(i);
            lastChildPositions.Add(child.position); // 存储子物体位置

            // Try to get the TextMeshProUGUI component
            TextMeshProUGUI tmpTextComponent = child.GetChild(0).GetComponent<TextMeshProUGUI>();

            if (tmpTextComponent != null)
            {
                childTexts.Add(tmpTextComponent.text);
                Debug.Log($"Text of child {i}: {tmpTextComponent.text}"); // 打印每个子物体的文本内容
            }
            else
            {
                Debug.LogWarning($"Child {i} does not have a TextMeshProUGUI component in child(0).");
                childTexts.Add(""); // 如果没有找到TMP组件，添加空字符串
            }
        }

        // 延迟检查文本匹配
        StartCoroutine(DelayedCheckForWin());

        // 打印当前childTexts列表内容
        Debug.Log("Current childTexts list: " + string.Join(", ", childTexts));
    }

    // 延迟比对文本内容，进行前缀匹配
    private IEnumerator DelayedCheckForWin()
    {
        yield return null;
        yield return new WaitForSeconds(1f);

        // 如果目标字符串数组长度大于实际字符串长度，则匹配失败
        if (childTexts.Count < targetStrings.Length)
        {
            Debug.Log("Check Failed: Actual strings count is less than target strings count.");
            yield break; // 停止协程
        }

        // 前缀匹配逻辑：检查目标字符串数组每个元素是否是实际字符串数组中对应元素的前缀
        for (int i = 0; i < targetStrings.Length; i++)
        {
            if (!childTexts[i].StartsWith(targetStrings[i]))
            {
                Debug.Log("Check Failed: Target string does not match the start of actual string.");
                yield break; // 停止协程
            }
        }

        // 如果所有目标字符串都是实际字符串数组中对应元素的前缀，则认为成功
        Debug.Log("Check Succeeded: Win");
        StartCoroutine(DelayedSuccessAction());
    }

    // 延迟执行成功操作的协程
    private IEnumerator DelayedSuccessAction()
    {
        // 等待几帧确保物理状态已经更新
        yield return null; // 等待一帧
        yield return null; // 可根据需要添加更多帧等待

        // 成功匹配时执行的具体操作
        Debug.Log("Performing success action!");

        // 复制一份当前的childTexts列表
        List<string> currentChildTexts = new List<string>(childTexts);

        // 反向遍历列表
        for (int i = currentChildTexts.Count - 1; i >= 0; i--)
        {
            // 检查transform.childCount确保i仍然有效
            if (i < transform.childCount)
            {
                if (currentChildTexts[i].StartsWith(targetStrings[i]))  // 判断是否前缀匹配
                {
                    // 销毁子物体
                    Transform child = transform.GetChild(i);
                    Debug.Log($"Destroying child {i} with text: {currentChildTexts[i]}");
                    Destroy(child.gameObject);

                    // 从原始的childTexts中移除元素，保持同步
                    childTexts.RemoveAt(i);
                }
            }
        }
        StartCoroutine(SetTextUI());
        // 注意：这里可能需要额外的逻辑来处理UI更新或其他效果
    }

    IEnumerator SetTextUI()
    {
        yield return new WaitForSeconds(2.0f);
        //激活对话面板
        conversationPanel.SetActive(true);
    }

    // 检查子物体位置是否变化
    private bool HaveChildPositionsChanged()
    {
        if (lastChildPositions.Count != transform.childCount)
            return true;

        for (int i = 0; i < transform.childCount; i++)
        {
            if (transform.GetChild(i).position != lastChildPositions[i])
                return true;
        }

        return false;
    }
}