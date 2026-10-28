using UnityEngine;
using System.Collections.Generic;
using System.IO;
using System.Text;

public class JsonGenerator : MonoBehaviour
{
    [Header("输入序列 (1-5)")]
    public int[] sequence;

    [Header("JSON文件名 (不带扩展名)")]
    public string jsonFileName = "part01";

    [Header("时间起始和间隔")]
    public float startTime = 0.5f;
    public float timeInterval = 0.5f;

    private Dictionary<int, string> directionMap = new Dictionary<int, string>
    {
        {1, "Up"},
        {2, "Down"},
        {3, "Left"},
        {4, "Right"},
        {5, "Circle"}
    };

    // 在 Inspector 右键或 Editor 按钮调用
    [ContextMenu("Generate JSON")]
    public void GenerateJson()
    {
        if (sequence == null || sequence.Length == 0)
        {
            Debug.LogError("序列为空！请在 Inspector 中输入 1-5 的序列。");
            return;
        }

        List<NoteDataJson> list = new List<NoteDataJson>();

        float currentTime = startTime;
        foreach (int num in sequence)
        {
            if (directionMap.TryGetValue(num, out string dir))
            {
                list.Add(new NoteDataJson { time = currentTime, direction = dir });
                currentTime += timeInterval;
            }
            else
            {
                Debug.LogWarning($"无效序列值: {num}，跳过。");
            }
        }

        // 将每个 Note 用 JsonUtility 序列化为紧凑对象字符串，然后拼接为一个数组
        StringBuilder sb = new StringBuilder();
        sb.Append("[");
        for (int i = 0; i < list.Count; i++)
        {
            // 不使用 pretty print（第二参数 false or omit），得到紧凑格式
            string itemJson = JsonUtility.ToJson(list[i]);
            sb.Append(itemJson);
            if (i < list.Count - 1)
                sb.Append(",");
        }
        sb.Append("]");

        string jsonArrayText = sb.ToString();

        // 写入 Resources/Music/<jsonFileName>.json
        string resourcesDir = Application.dataPath + "/Resources/Music/";
        if (!Directory.Exists(resourcesDir))
            Directory.CreateDirectory(resourcesDir);

        string filePath = Path.Combine(resourcesDir, jsonFileName + ".json");
        File.WriteAllText(filePath, jsonArrayText, Encoding.UTF8);

        Debug.Log($"JSON 文件生成成功（数组格式）: {filePath}");

#if UNITY_EDITOR
        UnityEditor.AssetDatabase.Refresh();
#endif
    }
}
