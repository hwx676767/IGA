using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class SimpleTabGroup : MonoBehaviour
{
    [System.Serializable]
    public class TabPage
    {
        public Toggle toggle;
        public GameObject page;
        
        [HideInInspector]   // 不再需要手动拖拽
        public TMP_Text tabText;   // 脚本会自动查找并赋值
    }
    
    public TabPage[] tabPages;

    void Start()
    {
        // 确保有 ToggleGroup
        ToggleGroup group = GetComponent<ToggleGroup>();
        if (group == null)
        {
            group = gameObject.AddComponent<ToggleGroup>();
        }
        group.allowSwitchOff = false;

        // 自动查找每个 Toggle 下的 TMP_Text，并绑定监听
        foreach (var tab in tabPages)
        {
            if (tab.toggle == null) continue;

            // 自动在 Toggle 的子物体中查找 TMP_Text（包括孙子物体）
            if (tab.tabText == null)
            {
                tab.tabText = tab.toggle.GetComponentInChildren<TMP_Text>(true);
            }

            // 如果还是找不到，尝试在同级或父级找（可选加强版）
            if (tab.tabText == null)
            {
                tab.tabText = tab.toggle.transform.parent.GetComponentInChildren<TMP_Text>(true);
            }

            tab.toggle.group = group;

            // 绑定切换事件
            tab.toggle.onValueChanged.AddListener((isOn) =>
            {
                if (isOn)
                {
                    ShowPage(tab.page);
                    UpdateTabHighlights();
                }
            });
        }

        // 初始化显示页面
        bool hasInitial = false;
        foreach (var tab in tabPages)
        {
            if (tab.toggle.isOn)
            {
                ShowPage(tab.page);
                hasInitial = true;
                break;
            }
        }

        if (!hasInitial && tabPages.Length > 0)
        {
            tabPages[0].toggle.isOn = true;
            ShowPage(tabPages[0].page);
        }

        // 初始化高亮
        UpdateTabHighlights();
    }

    void ShowPage(GameObject activePage)
    {
        foreach (var tab in tabPages)
        {
            if (tab.page != null)
            {
                tab.page.SetActive(tab.page == activePage);
            }
        }
    }

    /// <summary>
    /// 更新所有 Tab 文字的透明度
    /// </summary>
    private void UpdateTabHighlights()
    {
        foreach (var tab in tabPages)
        {
            if (tab.tabText == null) continue;

            float alpha = tab.toggle.isOn ? 1f : 0.5f;

            Color color = tab.tabText.color;
            color.a = alpha;
            tab.tabText.color = color;
        }
    }
}