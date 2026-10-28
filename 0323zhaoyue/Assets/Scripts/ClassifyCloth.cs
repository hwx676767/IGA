using UnityEngine;
using UnityEngine.UI;
using System.Collections.Generic;

public class ClassifyCloth : MonoBehaviour
{
    [Header("分类框")]
    public List<Image> categories; // 上方的分类框（两个 Image）
    private int selectedCategoryIndex = 0; // 当前选中的分类框索引

    [Header("物品")]
    public List<Image> items; // 下方的物品（五个 Image）
    private int selectedItemIndex = 0; // 当前选中的物品索引

    [Header("选择模式")]
    private bool isSelectingCategory = true; // 当前是否在选择分类框

    private void Update()
    {
        HandleInput();
        UpdateVisuals();
    }

    void HandleInput()
    {
        // 上下切换选择模式
        if (Input.GetKeyDown(KeyCode.W) || Input.GetKeyDown(KeyCode.UpArrow))
        {
            isSelectingCategory = true;
        }
        if (Input.GetKeyDown(KeyCode.S) || Input.GetKeyDown(KeyCode.DownArrow))
        {
            isSelectingCategory = false;
        }

        // 左右选择分类框或物品
        if (isSelectingCategory)
        {
            if (Input.GetKeyDown(KeyCode.A) || Input.GetKeyDown(KeyCode.LeftArrow))
            {
                selectedCategoryIndex = (selectedCategoryIndex - 1 + categories.Count) % categories.Count;
            }
            if (Input.GetKeyDown(KeyCode.D) || Input.GetKeyDown(KeyCode.RightArrow))
            {
                selectedCategoryIndex = (selectedCategoryIndex + 1) % categories.Count;
            }
        }
        else
        {
            if (Input.GetKeyDown(KeyCode.A) || Input.GetKeyDown(KeyCode.LeftArrow))
            {
                selectedItemIndex = (selectedItemIndex - 1 + items.Count) % items.Count;
            }
            if (Input.GetKeyDown(KeyCode.D) || Input.GetKeyDown(KeyCode.RightArrow))
            {
                selectedItemIndex = (selectedItemIndex + 1) % items.Count;
            }
        }

        // 确认选择（空格或回车）
        if (Input.GetKeyDown(KeyCode.Space) || Input.GetKeyDown(KeyCode.Return))
        {
            MoveItemToCategory();
        }
    }

    void UpdateVisuals()
    {
        // 高亮选中的分类框
        for (int i = 0; i < categories.Count; i++)
        {
            if (i == selectedCategoryIndex && isSelectingCategory)
            {
                categories[i].color = Color.yellow; // 高亮选中分类框
            }
            else
            {
                categories[i].color = Color.white; // 恢复默认颜色
            }
        }

        // 高亮选中的物品
        for (int i = 0; i < items.Count; i++)
        {
            if (i == selectedItemIndex && !isSelectingCategory)
            {
                items[i].color = Color.yellow; // 高亮选中物品
            }
            else
            {
                items[i].color = Color.white; // 恢复默认颜色
            }
        }
    }

    void MoveItemToCategory()
    {
        // 将选中的物品移动到选中的分类框中
        if (!isSelectingCategory)
        {
            // 获取选中的物品和分类框
            Image selectedItem = items[selectedItemIndex];
            Image selectedCategory = categories[selectedCategoryIndex];

            // 将物品移动到分类框的位置
            selectedItem.transform.position = selectedCategory.transform.position;
            Debug.Log($"{selectedItem.name} 已被移动到 {selectedCategory.name}");
        }
    }
}