using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class NoteSpawner : MonoBehaviour
{
    public GameObject notePrefab;
    public RectTransform pointA;
    public RectTransform pointB;
    public RectTransform pointC;

    private List<NoteDataJson> notesToSpawn;
    private int currentIndex = 0;
    private float startTime;
    private bool spawning = false;

    public bool IsFinished { get; private set; } = false;

    private System.Action onMissCallback;

    public void StartSpawning(List<NoteDataJson> notes, System.Action onMiss)
    {
        notesToSpawn = notes;
        currentIndex = 0;
        startTime = Time.time;
        IsFinished = false;
        spawning = true;
        onMissCallback = onMiss;
    }

    void Update()
    {
        if (!spawning) return;

        float elapsed = Time.time - startTime;

        // 生成 Note
        while (currentIndex < notesToSpawn.Count && notesToSpawn[currentIndex].time <= elapsed)
        {
            SpawnNote(notesToSpawn[currentIndex]);
            currentIndex++;
        }

        // 检查是否所有 Note 都生成完且场景里没有 Note
        if (currentIndex >= notesToSpawn.Count && transform.childCount == 0)
        {
            IsFinished = true;
            spawning = false;
        }
    }

    private void SpawnNote(NoteDataJson data)
    {
        GameObject note = Instantiate(notePrefab, pointA.position, Quaternion.identity, transform);

        // 设置移动轨迹
        var move = note.GetComponent<NoteMove>();
        move.pointA = pointA;
        move.pointB = pointB;
        move.pointC = pointC;
        move.OnMiss = onMissCallback; // Note 被 Miss 时回调

        // 设置方向
        var noteData = note.GetComponent<NoteData>();
        noteData.direction = StringToDirection(data.direction);
    }

    private NoteDirection StringToDirection(string str)
    {
        switch (str)
        {
            case "Up": return NoteDirection.Up;
            case "Down": return NoteDirection.Down;
            case "Left": return NoteDirection.Left;
            case "Right": return NoteDirection.Right;
            case "Circle": return NoteDirection.Circle;
        }
        return NoteDirection.Up;
    }
}
