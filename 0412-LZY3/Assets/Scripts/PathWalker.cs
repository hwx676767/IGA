using UnityEngine;
using UnityEngine.AI;
using System.Collections.Generic;

[RequireComponent(typeof(NavMeshAgent))]
public class PathWalker : MonoBehaviour
{
    public Transform startPoint;
    public Transform endPoint;

    private NavMeshAgent agent;

    // 路径点
    class PathPoint
    {
        public Vector3 position;
        public float memory; // 0~1
    }

    List<PathPoint> points = new List<PathPoint>();

    public float recordDistance = 0.5f;
    public float matchDistance = 0.6f;

    public float memoryIncrease = 0.4f; // 每次经过增强
    public float memoryDecay = 0.1f;    // 遗忘速度

    private Transform currentTarget;

    // 多段LineRenderer（解决颜色问题）
    List<LineRenderer> lines = new List<LineRenderer>();

    void Start()
    {
        agent = GetComponent<NavMeshAgent>();

        transform.position = startPoint.position;
        currentTarget = endPoint;
        agent.SetDestination(currentTarget.position);

        AddOrStrengthenPoint(transform.position);
    }

    void Update()
    {
        CheckArrival();
        RecordPath();
        DecayMemory();
        DrawLines();
    }

    void CheckArrival()
    {
        if (!agent.pathPending && agent.remainingDistance < 0.3f)
        {
            currentTarget = (currentTarget == endPoint) ? startPoint : endPoint;
            agent.SetDestination(currentTarget.position);
        }
    }

    void RecordPath()
    {
        AddOrStrengthenPoint(transform.position);
    }

    void AddOrStrengthenPoint(Vector3 pos)
    {
        foreach (var p in points)
        {
            if (Vector3.Distance(p.position, pos) < matchDistance)
            {
                p.memory += memoryIncrease;
                p.memory = Mathf.Clamp01(p.memory);
                return;
            }
        }

        points.Add(new PathPoint
        {
            position = pos,
            memory = 0.1f
        });
    }

    void DecayMemory()
    {
        foreach (var p in points)
        {
            p.memory -= Time.deltaTime * memoryDecay;
            p.memory = Mathf.Clamp01(p.memory);
        }
    }

    // 根据记忆决定颜色
    Color GetColor(float memory)
    {
        if (memory < 0.3f)
        {
            // 白 → 黄
            return Color.Lerp(Color.white, Color.yellow, memory / 0.3f);
        }
        else
        {
            // 黄 → 绿
            return Color.Lerp(Color.yellow, Color.green, (memory - 0.3f) / 0.7f);
        }
    }

    void DrawLines()
    {
        // 清空旧线
        foreach (var l in lines)
        {
            Destroy(l.gameObject);
        }
        lines.Clear();

        if (points.Count < 2) return;

        // 每两个点一段线（关键！）
        for (int i = 0; i < points.Count - 1; i++)
        {
            GameObject obj = new GameObject("Line_" + i);
            obj.transform.parent = this.transform;

            LineRenderer lr = obj.AddComponent<LineRenderer>();
            lr.widthMultiplier = 0.2f;
            lr.material = new Material(Shader.Find("Sprites/Default"));

            lr.positionCount = 2;
            lr.SetPosition(0, points[i].position);
            lr.SetPosition(1, points[i + 1].position);

            Color c = GetColor(points[i].memory);

            lr.startColor = c;
            lr.endColor = c;

            lines.Add(lr);
        }
    }
}