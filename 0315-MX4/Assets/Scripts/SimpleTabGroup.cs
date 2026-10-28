using UnityEngine;
using UnityEngine.UI;

public class SimpleTabGroup : MonoBehaviour
{
    [System.Serializable]
    public class TabPage
    {
        public Toggle toggle;
        public GameObject page;
    }
    
    public TabPage[] tabPages;
    
    void Start()
    {
        // 确保父物体有Toggle Group
        ToggleGroup group = GetComponent<ToggleGroup>();
        if (group == null)
        {
            group = gameObject.AddComponent<ToggleGroup>();
        }
        group.allowSwitchOff = false;
        
        // 设置每个Toggle
        foreach (var tab in tabPages)
        {
            tab.toggle.group = group;
            tab.toggle.onValueChanged.AddListener((isOn) => {
                if (isOn) ShowPage(tab.page);
            });
        }
        
        // 初始化
        foreach (var tab in tabPages)
        {
            if (tab.toggle.isOn)
            {
                ShowPage(tab.page);
                break;
            }
        }
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
}