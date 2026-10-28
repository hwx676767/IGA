using UnityEngine;
using UnityEngine.AI;
using System.Collections.Generic;

[RequireComponent(typeof(NavMeshAgent))]
public class MemoryNavigationAgent : MonoBehaviour
{
    [Header("Actual Navigation Points")]
    public Transform actualStartPoint;
    public Transform actualDestination;

    [Header("Remembered Destination")]
    public Transform rememberedDestination;

    [Header("Travel Time Recording")]
    public bool recordTravelTime = true;

    public float totalTravelTime = 0f;

    private bool hasReachedActualDestination = false;
    private float startTime = 0f;

    [Header("Path Trace Settings")]
    public float lineWidth = 0.2f;
    public float recordDistance = 0.5f;

    // ==================================================
    // Memory Path System
    // ==================================================

    class PathPoint
    {
        public Vector3 position;
        public float memoryStrength;
    }

    private List<PathPoint> pathPoints = new List<PathPoint>();
    private List<LineRenderer> permanentTraces = new List<LineRenderer>();

    public float matchDistance = 0.6f;
    public float memoryIncrease = 0.45f;
    public float memoryDecay = 0.08f;

    // ==================================================
    // Internal Variables
    // ==================================================

    private NavMeshAgent agent;
    private Vector3 lastRecordedPosition;

    private void Start()
    {
        agent = GetComponent<NavMeshAgent>();

        if (actualStartPoint != null)
            transform.position = actualStartPoint.position;

        if (rememberedDestination == null)
        {
            Debug.LogError(
                "[MemoryNavigationAgent] Please assign a Remembered Destination object."
            );
            return;
        }

        if (recordTravelTime)
            startTime = Time.time;

        agent.SetDestination(rememberedDestination.position);

        lastRecordedPosition = transform.position;

        AddNewPathPoint(transform.position);
    }

    private void Update()
    {
        if (hasReachedActualDestination)
            return;

        // Continuously follow the moving remembered destination
        if (rememberedDestination != null)
            agent.SetDestination(rememberedDestination.position);

        CheckArrivalAtRememberedDestination();

        RecordPathIfNeeded();

        DecayMemory();
    }

    /// <summary>
    /// When the agent reaches the remembered destination,
    /// check whether that destination matches reality.
    /// </summary>
    private void CheckArrivalAtRememberedDestination()
    {
        if (Vector3.Distance(
                transform.position,
                rememberedDestination.position) > 0.5f)
            return;

        bool destinationMatchesReality =
            Vector3.Distance(
                rememberedDestination.position,
                actualDestination.position) < 0.3f;

        if (destinationMatchesReality)
        {
            hasReachedActualDestination = true;

            totalTravelTime = Time.time - startTime;

            agent.isStopped = true;
            agent.ResetPath();

            Debug.Log("══════════════════════════════════════");
            Debug.Log("✅ Simulation Complete");
            Debug.Log("The agent successfully reached the actual destination.");
            Debug.Log($"⏱ Travel Time: {totalTravelTime:F2} seconds");
            Debug.Log($"📍 Final Remembered Destination: {rememberedDestination.position}");
            Debug.Log($"🛤 Recorded Path Points: {pathPoints.Count}");
            Debug.Log("══════════════════════════════════════");
        }
        else
        {
            Debug.Log(
                "📍 The agent reached the remembered destination, but it does not match reality. Continuing navigation..."
            );
        }
    }

    // ==================================================
    // Path Recording
    // ==================================================

    private void RecordPathIfNeeded()
    {
        if (Vector3.Distance(
                transform.position,
                lastRecordedPosition) > recordDistance)
        {
            AddNewPathPoint(transform.position);

            lastRecordedPosition = transform.position;
        }
    }

    private void AddNewPathPoint(Vector3 position)
    {
        bool foundMatch = false;

        foreach (var point in pathPoints)
        {
            if (Vector3.Distance(point.position, position) < matchDistance)
            {
                point.memoryStrength += memoryIncrease;
                point.memoryStrength = Mathf.Clamp01(point.memoryStrength);

                foundMatch = true;
                break;
            }
        }

        if (!foundMatch)
        {
            pathPoints.Add(
                new PathPoint
                {
                    position = position,
                    memoryStrength = 0.15f
                }
            );
        }

        if (pathPoints.Count >= 2)
        {
            CreatePermanentTrace(
                pathPoints[pathPoints.Count - 2].position,
                pathPoints[pathPoints.Count - 1].position
            );
        }
    }

    private void CreatePermanentTrace(Vector3 startPos, Vector3 endPos)
    {
        GameObject lineObject =
            new GameObject("MemoryTrace_" + permanentTraces.Count);

        lineObject.transform.parent = transform.parent;

        LineRenderer line = lineObject.AddComponent<LineRenderer>();

        line.widthMultiplier = lineWidth;

        line.material =
            new Material(Shader.Find("Sprites/Default"));

        line.positionCount = 2;

        line.SetPosition(0, startPos);
        line.SetPosition(1, endPos);

        line.startColor =
            line.endColor =
            GetTraceColor();

        permanentTraces.Add(line);
    }

    private Color GetTraceColor()
    {
        float memory =
            pathPoints.Count > 0
            ? pathPoints[pathPoints.Count - 1].memoryStrength
            : 0.5f;

        if (memory < 0.3f)
        {
            return Color.Lerp(
                Color.white,
                Color.yellow,
                memory / 0.3f
            );
        }

        return Color.Lerp(
            Color.yellow,
            Color.green,
            (memory - 0.3f) / 0.7f
        );
    }

    private void DecayMemory()
    {
        for (int i = pathPoints.Count - 1; i >= 0; i--)
        {
            pathPoints[i].memoryStrength -=
                Time.deltaTime * memoryDecay;

            if (pathPoints[i].memoryStrength <= 0.01f)
            {
                pathPoints.RemoveAt(i);
            }
        }
    }

    // ==================================================
    // Public Controls
    // ==================================================

    public void ResetSimulation()
    {
        transform.position = actualStartPoint.position;

        hasReachedActualDestination = false;

        totalTravelTime = 0f;

        startTime = Time.time;

        lastRecordedPosition = transform.position;

        RememberedDestinationController destinationController =
            rememberedDestination.GetComponent<RememberedDestinationController>();

        if (destinationController != null)
        {
            destinationController.ResetRememberedDestination();
        }

        pathPoints.Clear();

        agent.isStopped = false;

        AddNewPathPoint(transform.position);

        Debug.Log(
            "[MemoryNavigationAgent] Simulation reset."
        );
    }
}