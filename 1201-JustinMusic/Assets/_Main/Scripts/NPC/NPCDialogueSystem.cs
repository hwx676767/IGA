using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.IO;

public class NPCDialogueSystem : MonoBehaviour
{
    public AudioClip[] audioClips; // 在Inspector中赋值你的音频片段1-5（索引0=片段1，1=片段2 等）
    public GameObject dialogObject; // 播放期间要激活的GameObject
    public TextAsset csvFile; // 在Inspector中赋值你的CSV文件（例如从Resources文件夹）

    private List<List<int>> sequenceRows = new List<List<int>>(); // 每项是一个行的序列
    private AudioSource audioSource;
    private int currentRowIndex = 0;
    private bool isPlaying = false;

    void Start()
    {
        if (dialogObject != null)
        {
            dialogObject.SetActive(false); // 初始时确保不激活
        }

        audioSource = GetComponent<AudioSource>();
        if (audioSource == null)
        {
            audioSource = gameObject.AddComponent<AudioSource>();
        }

        // 从CSV加载序列（假设每行逗号分隔的数字，如"1,2,3\n4,5"）
        if (csvFile != null)
        {
            string[] lines = csvFile.text.Split('\n');
            foreach (string line in lines)
            {
                string trimmed = line.Trim();
                if (!string.IsNullOrEmpty(trimmed))
                {
                    string[] parts = trimmed.Split(',');
                    List<int> row = new List<int>();
                    foreach (string part in parts)
                    {
                        string partTrimmed = part.Trim();
                        if (int.TryParse(partTrimmed, out int num))
                        {
                            row.Add(num);
                        }
                    }
                    if (row.Count > 0)
                    {
                        sequenceRows.Add(row);
                    }
                }
            }

            if (sequenceRows.Count == 0)
            {
                Debug.LogWarning("No valid sequence rows loaded from CSV.");
            }
            else
            {
                // 调试：打印所有行
                for (int i = 0; i < sequenceRows.Count; i++)
                {
                    Debug.Log($"Row {i}: " + string.Join(", ", sequenceRows[i]));
                }
            }
        }
        else
        {
            Debug.LogError("CSV file not assigned!");
        }
    }

    void OnMouseDown()
    {
        // 仅在未播放且有剩余行时触发
        if (!isPlaying && currentRowIndex < sequenceRows.Count)
        {
            StartCoroutine(PlayNextRow());
        }
    }

    IEnumerator PlayNextRow()
    {
        isPlaying = true;

        List<int> currentRow = sequenceRows[currentRowIndex];

        // 激活对话对象（整行开始）
        if (dialogObject != null)
        {
            dialogObject.SetActive(true);
        }

        // 顺序播放行内所有clips
        foreach (int clipNumber in currentRow)
        {
            int clipIndex = clipNumber - 1; // 序列为1-based，数组为0-based

            // 添加额外日志以调试
            Debug.Log($"Playing clipNumber: {clipNumber}, clipIndex: {clipIndex}");

            if (clipIndex >= 0 && clipIndex < audioClips.Length && audioClips[clipIndex] != null)
            {
                // 播放音频
                audioSource.clip = audioClips[clipIndex];
                audioSource.Play();

                // 等待当前音频完成
                yield return new WaitForSeconds(audioSource.clip.length);
            }
            else
            {
                Debug.LogError($"Invalid clip index ({clipIndex}) or clip not assigned! Check sequence and audioClips array.");
                // 可选择 break 或 continue，根据需求
            }
        }

        // 整行完成后额外等待2秒
        yield return new WaitForSeconds(2f);

        // 停用对话对象
        if (dialogObject != null)
        {
            dialogObject.SetActive(false);
        }

        // 调用GameManager的协程（假设GameManager是单例）
        if (GameManager.Instance != null)
        {
            GameManager.Instance.StartCoroutine(GameManager.Instance.StartGameRoutine("part0"+currentRowIndex));
        }
        else
        {
            Debug.LogError("GameManager Instance not found!");
        }

        currentRowIndex++;
        isPlaying = false;
    }
}