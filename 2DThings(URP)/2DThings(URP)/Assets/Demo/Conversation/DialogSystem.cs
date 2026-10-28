using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class DialogSystem : MonoBehaviour
{
    public GameObject conversationPanel;
    public Text textLable;
    public Image faceImage;

    public TextAsset textFile;
    public int index;


    List<string> textList = new List<string>();

    public float textSpeed;
    bool textFinished;

    public Sprite faceA, faceB;


    private void Awake()
    {
        GetTextFromFile(textFile);
    }
    private void OnEnable()
    {
        //textLable.text = textList[index];
        //index++;
        textFinished = true;
        StartCoroutine(SetTextUI());
    }

    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.R) && index == textList.Count)
        {
            conversationPanel.SetActive(false);
            Debug.Log("000000000");
            index = 0;
            return;
        }
        if (Input.GetKeyDown(KeyCode.R) && textFinished )
        {
            //textLable.text = textList[index];
            //index++;

            StartCoroutine(SetTextUI());

        }
    }


    void GetTextFromFile(TextAsset file)
    {
        textList.Clear();
        index = 0;

        var lineDate = file.text.Split('\n');     //按行切割

        foreach (var line in lineDate)
        {
            textList.Add(line);
        }
    }

    IEnumerator SetTextUI()
    {
        textFinished = false;
        textLable.text = "";

        
        switch (textList[index].Trim().ToString())
        {
            case "A":
                faceImage.sprite = faceA;
                index++;
                break;
            case "B":
                faceImage.sprite = faceB;
                index++;
                break;
            default: 
                break;
        }

        for (int i = 0; i < textList[index].Length ; i++)
        {
            textLable.text += textList[index][i];

            yield return new WaitForSeconds(textSpeed);
        }
        textFinished = true;
        index++;
    }
}
