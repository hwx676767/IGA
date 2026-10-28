using UnityEngine;
using UnityEngine.UI; // 引入 UI 库

public class ItemClickHandler : MonoBehaviour
{
    public GameObject panelToShow; 

    void Start()
    {

        // 确保面板一开始是隐藏的
        if (panelToShow != null)
        {
            panelToShow.SetActive(false);
        }
    }

    private void OnMouseDown()
    {
        ShowPanel();
    }

    // 显示面板
    void ShowPanel()
    {
        if (panelToShow != null)
        {
            panelToShow.SetActive(true);
            Debug.Log("显示面板");
        }
    }
}
