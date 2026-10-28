using UnityEngine;
using UnityEngine.SceneManagement;

public class SnowmanAssembler : MonoBehaviour
{
    private int partsAssembled = 0;
    private const int TOTAL_PARTS = 9;  // 改成你的部件总数
    
    // 保存部件及其位置
    public static GameObject[] assembledParts;
    public static Vector3[] assembledPositions;
    
    public void AssemblePart(GameObject part)
    {
        partsAssembled++;
        Debug.Log("已放置：" + part.name + "，进度：" + partsAssembled + "/" + TOTAL_PARTS);
        
        if (partsAssembled >= TOTAL_PARTS)
        {
            Debug.Log("条件满足！准备跳转到 ResultScene");
            
            // 收集所有拼好的部件
            assembledParts = GameObject.FindGameObjectsWithTag("SnowmanPart");
            assembledPositions = new Vector3[assembledParts.Length];
            
            // 保存每个部件的位置
            for (int i = 0; i < assembledParts.Length; i++)
            {
                assembledPositions[i] = assembledParts[i].transform.position;
            }
            
            // 脱离父物体并标记为不销毁
            foreach (GameObject obj in assembledParts)
            {
                obj.transform.SetParent(null);
                DontDestroyOnLoad(obj);
            }
            
            // 跳转
            SceneManager.LoadScene("ResultScene");
        }
    }
}