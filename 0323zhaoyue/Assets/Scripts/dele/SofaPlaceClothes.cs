using UnityEngine;

public class SofaPlaceClothes : MonoBehaviour
{
    public GameObject clothesStorageUI; // 分类衣服的UI面板


    private void Start()
    {
        clothesStorageUI.SetActive(false);
    }

    private void Update()
    {
        // 按下数字键2或小键盘2显示面板
        if (Input.GetKeyDown(KeyCode.Alpha2) || Input.GetKeyDown(KeyCode.Keypad2))
        {
            TogglePanel();
        }
    }

    // 切换面板显示状态
    private void TogglePanel()
    {
        if (clothesStorageUI != null)
        {
            bool isActive = clothesStorageUI.activeSelf;
            clothesStorageUI.SetActive(!isActive); // 切换面板的显示状态
            Debug.Log($"面板显示状态：{!isActive}");
        }
        else
        {
            Debug.LogError("clothesStorageUI 未赋值！");
        }
    }
}