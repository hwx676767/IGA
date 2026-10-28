using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class DialogSystem : MonoBehaviour
{
    public GameObject conversationPanel;
    public Text textLabelA;
    public Text textLabelB;
    public Image faceImageA;
    public Image faceImageB;

    public TextAsset textFile;
    public int index;

    List<string> textList = new List<string>();

    public Sprite faceA, faceB;

    private string currentSpeaker = "";

    private void Awake()
    {
        GetTextFromFile(textFile);
    }

    private void Start()
    {
        conversationPanel.SetActive(false);
    }

    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.X))
        {
            if (!conversationPanel.activeSelf)
            {
                conversationPanel.SetActive(true);
                SetTextUI();
            }
            else if (index >= textList.Count)
            {
                conversationPanel.SetActive(false);
                index = 0;
            }
            else
            {
                SetTextUI();
            }
        }
    }

    void GetTextFromFile(TextAsset file)
    {
        textList.Clear();
        index = 0;

        var lineData = file.text.Split('\n'); // 按行切割

        foreach (var line in lineData)
        {
            textList.Add(line);
        }
    }

    void SetTextUI()
    {
        // 隐藏两个Text和Image
        SetUIActive("A", false);
        SetUIActive("B", false);

        switch (textList[index].Trim())
        {
            case "A":
                currentSpeaker = "A";
                faceImageA.sprite = faceA;
                index++;
                break;
            case "B":
                currentSpeaker = "B";
                faceImageB.sprite = faceB;
                index++;
                break;
            default: 
                // 如果没有speaker标记，使用上一个speaker
                break;
        }

        // 直接设置文本
        string dialogText = textList[index];
        if (currentSpeaker == "A")
        {
            textLabelA.text = dialogText;
            SetUIActive("A", true);
        }
        else if (currentSpeaker == "B")
        {
            textLabelB.text = dialogText;
            SetUIActive("B", true);
        }

        index++;
    }

    private void SetUIActive(string speaker, bool active)
    {
        if (speaker == "A")
        {
            faceImageA.gameObject.SetActive(active);
            textLabelA.gameObject.SetActive(active);
            if (active)
            {
                Color color = textLabelA.color;
                color.a = 1f;
                textLabelA.color = color;
            }
        }
        else if (speaker == "B")
        {
            faceImageB.gameObject.SetActive(active);
            textLabelB.gameObject.SetActive(active);
            if (active)
            {
                Color color = textLabelB.color;
                color.a = 1f;
                textLabelB.color = color;
            }
        }
    }
}