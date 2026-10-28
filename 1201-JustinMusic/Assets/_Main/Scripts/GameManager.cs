using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
public class NoteDataJson
{
    public float time;
    public string direction;
}

[System.Serializable]
public class NoteDataList
{
    public List<NoteDataJson> notes;
}

public class GameManager : MonoBehaviour
{
    public static GameManager Instance { get; private set; }

    public GameObject gamePanel;
    public NoteSpawner noteSpawner;

    [Header("JSON 基础路径（Resources 下）")]
    public string jsonBasePath = "Music/json/"; // 例如 Assets/Resources/Music/json/

    private bool gameRunning = false;
    private bool missOccurred = false;

    void Awake()
    {
        if (Instance == null)
        {
            Instance = this;
            // DontDestroyOnLoad(gameObject); // 如果需要在场景间持久化，取消注释
        }
        else
        {
            Destroy(gameObject);
        }
    }

    void Start()
    {
        gamePanel.SetActive(false);
    }

    void Update()
    {
        if (!gameRunning && Input.GetKeyDown(KeyCode.Return))
        {
            // 只传 JSON 文件名（不用带路径和扩展名）
            StartCoroutine(StartGameRoutine("part01")); // beatmap.json
        }
    }

    public IEnumerator StartGameRoutine(string jsonFileName)
    {
        gameRunning = true;
        gamePanel.SetActive(true);
        missOccurred = false;

        // 读取 JSON
        string fullPath = jsonBasePath + jsonFileName; // Resources 下路径
        TextAsset jsonTextAsset = Resources.Load<TextAsset>(fullPath);

        if (jsonTextAsset == null)
        {
            Debug.LogError("找不到 JSON 文件：" + fullPath);
            yield break;
        }

        string jsonText = jsonTextAsset.text;

        // ⚡ 将顶层数组包成对象，兼容 JsonUtility
        jsonText = "{ \"notes\": " + jsonText + "}";

        // 使用 JsonUtility 解析
        NoteDataList noteList = JsonUtility.FromJson<NoteDataList>(jsonText);

        // 开始生成 Note
        noteSpawner.StartSpawning(noteList.notes, OnNoteMissed);

        // 等待 NoteSpawner 完成
        while (!noteSpawner.IsFinished)
        {
            yield return null;
        }

        // 游戏结束
        gamePanel.SetActive(false);
        gameRunning = false;

        if (missOccurred)
            Debug.Log("音游结束，有 Miss！");
        else
            Debug.Log("音游结束，全命中！");
    }

    private void OnNoteMissed()
    {
        missOccurred = true;
    }
}