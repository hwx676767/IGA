using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.SceneManagement;

public class DialogSystem : MonoBehaviour
{
    public GameObject conversationPanel;
    public TextMeshProUGUI textLabel;  
    public string nextSceneName;   

    public TextAsset textFile;
    public int index;

    List<string> textList = new List<string>();

    public float textSpeed;
    bool textFinished;

    private void Awake()
    {
        GetTextFromFile(textFile);
    }

    private void OnEnable()
    {
        textFinished = true;
        StartCoroutine(SetTextUI());
    }

    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.R) && index == textList.Count)
        {
            //conversationPanel.SetActive(false);
            Debug.Log("End of dialog");
            index = 0;

            //切换场景
            SceneManager.LoadScene(nextSceneName);
            return;
        }

        if (Input.GetKeyDown(KeyCode.R) && textFinished)
        {
            StartCoroutine(SetTextUI());
        }
    }

    void GetTextFromFile(TextAsset file)
    {
        textList.Clear();
        index = 0;

        var lineData = file.text.Split('\n');  // 按行切割

        foreach (var line in lineData)
        {
            textList.Add(line);
        }
    }

    IEnumerator SetTextUI()
    {
        textFinished = false;
        textLabel.text = "";

        // 逐字显示对话内容
        for (int i = 0; i < textList[index].Length; i++)
        {
            textLabel.text += textList[index][i];
            yield return new WaitForSeconds(textSpeed);
        }

        textFinished = true;
        index++;
    }
}
