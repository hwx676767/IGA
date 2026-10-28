using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class swipe : MonoBehaviour
{
    public GameObject scrollbar, imageContent;
    public Button leftButton, rightButton;

    private List<float> pos = new List<float>();
    private int currentIndex = 0;
    private bool isDragging = false;
    private bool buttonClicked = false;

    // 定义 scroll_pos 变量
    private float scroll_pos = 0f;

    void Start()
    {
        InitializePositions();
        UpdateButtonStates();

        // 确保按钮事件绑定
        leftButton.onClick.AddListener(PreviousLevel);
        rightButton.onClick.AddListener(NextLevel);
    }

    void Update()
    {
        float distance = 1f / (pos.Count - 1f);

        for (int i = 0; i < pos.Count; i++)
        {
            pos[i] = distance * i;
        }

        // 检测鼠标拖拽
        if (Input.GetMouseButton(0))
        {
            isDragging = true;
            buttonClicked = false;
            scroll_pos = scrollbar.GetComponent<Scrollbar>().value;
        }
        else
        {
            if (isDragging)
            {
                // 拖拽结束后，找到最接近的位置进行对齐
                for (int i = 0; i < pos.Count; i++)
                {
                    if (scroll_pos < pos[i] + (distance / 2) && scroll_pos > pos[i] - (distance / 2))
                    {
                        currentIndex = i;
                        break;
                    }
                }
                isDragging = false;
                UpdateButtonStates();
            }
        }

        // 如果没有拖拽且按钮未点击，自动对齐到最近的元素
        if (!isDragging && !buttonClicked)
        {
            scrollbar.GetComponent<Scrollbar>().value = Mathf.Lerp(scrollbar.GetComponent<Scrollbar>().value, pos[currentIndex], 0.1f);
        }

        // 放大缩小逻辑
        for (int i = 0; i < pos.Count; i++)
        {
            if (scroll_pos < pos[i] + (distance / 2) && scroll_pos > pos[i] - (distance / 2))
            {
                // 选中的元素放大
                transform.GetChild(i).localScale = Vector2.Lerp(transform.GetChild(i).localScale, new Vector2(1f, 1f), 0.1f);
                imageContent.transform.GetChild(i).localScale = Vector2.Lerp(imageContent.transform.GetChild(i).localScale, new Vector2(1.2f, 1.2f), 0.1f);
            }
            else
            {
                // 其他元素缩小
                transform.GetChild(i).localScale = Vector2.Lerp(transform.GetChild(i).localScale, new Vector2(0.8f, 0.8f), 0.1f);
                imageContent.transform.GetChild(i).localScale = Vector2.Lerp(imageContent.transform.GetChild(i).localScale, new Vector2(0.8f, 0.8f), 0.1f);
            }
        }
    }

    private void InitializePositions()
    {
        pos.Clear();
        float distance = 1f / (transform.childCount - 1f);
        for (int i = 0; i < transform.childCount; i++)
        {
            pos.Add(distance * i);
        }
    }

    public void NextLevel()
    {
        if (currentIndex < pos.Count - 1)
        {
            currentIndex++;
            UpdateButtonStates();
            MoveToCurrentPosition();
        }
    }

    public void PreviousLevel()
    {
        if (currentIndex > 0)
        {
            currentIndex--;
            UpdateButtonStates();
            MoveToCurrentPosition();
        }
    }

    private void MoveToCurrentPosition()
    {
        // 立即更新滚动条值
        scroll_pos = pos[currentIndex];
        scrollbar.GetComponent<Scrollbar>().value = scroll_pos;
        buttonClicked = false;  // 立即重置按钮点击状态，避免干扰
    }

    private void UpdateButtonStates()
    {
        leftButton.interactable = currentIndex > 0;
        rightButton.interactable = currentIndex < pos.Count - 1;
    }
}
