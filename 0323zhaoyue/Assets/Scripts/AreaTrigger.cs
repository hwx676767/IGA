using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class AreaTrigger : MonoBehaviour
{
    [TextArea]
    public string areaDescription; // 区域描述文字

    [Header("信息 UI 面板")]
    public GameObject infoPanelP1; // 玩家1的 UI 面板
    public GameObject infoPanelP2; // 玩家2的 UI 面板

    private Text[] p1Texts;        // 玩家1的文本组件
    private Text[] p2Texts;        // 玩家2的文本组件
    private bool player01InArea;
    private bool player02InArea;

    private Coroutine hideCoroutineP1;
    private Coroutine hideCoroutineP2;

    private void Start()
    {
        InitializePlayerUI(ref p1Texts, infoPanelP1);
        InitializePlayerUI(ref p2Texts, infoPanelP2);
    }

    void InitializePlayerUI(ref Text[] texts, GameObject panel)
    {
        if (panel != null)
        {
            texts = panel.GetComponentsInChildren<Text>();
            if (texts.Length >= 1)
            {
                panel.SetActive(false);
            }
            else
            {
                Debug.LogError($"{panel.name} 需要至少一个 Text 组件！");
            }
        }
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player01"))
        {
            player01InArea = true;
            UpdatePlayerUI(infoPanelP1, p1Texts, ref hideCoroutineP1);
        }
        else if (other.CompareTag("Player02"))
        {
            player02InArea = true;
            UpdatePlayerUI(infoPanelP2, p2Texts, ref hideCoroutineP2);
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("Player01"))
        {
            player01InArea = false;
            ToggleUI(infoPanelP1, false);
            StopCoroutineSafe(ref hideCoroutineP1);
        }
        else if (other.CompareTag("Player02"))
        {
            player02InArea = false;
            ToggleUI(infoPanelP2, false);
            StopCoroutineSafe(ref hideCoroutineP2);
        }
    }

    void UpdatePlayerUI(GameObject panel, Text[] texts, ref Coroutine hideCoroutine)
    {
        if (texts == null || texts.Length < 1) return;

        texts[0].text = areaDescription;
        ToggleUI(panel, true);

        // 如果有旧的隐藏协程，先停止它
        StopCoroutineSafe(ref hideCoroutine);

        // 启动新的隐藏协程
        hideCoroutine = StartCoroutine(HideAfterSeconds(panel, 2f));
    }

    IEnumerator HideAfterSeconds(GameObject panel, float delay)
    {
        yield return new WaitForSeconds(delay);
        ToggleUI(panel, false);
    }

    void ToggleUI(GameObject panel, bool show)
    {
        if (panel != null && panel.activeSelf != show)
        {
            panel.SetActive(show);
        }
    }

    void StopCoroutineSafe(ref Coroutine coroutine)
    {
        if (coroutine != null)
        {
            StopCoroutine(coroutine);
            coroutine = null;
        }
    }
}
