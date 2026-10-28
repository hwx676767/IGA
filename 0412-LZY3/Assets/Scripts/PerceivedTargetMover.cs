using UnityEngine;

/// <summary>
/// Represents the destination stored in the patient's memory.
/// This location may drift over time due to memory distortion,
/// occasionally aligning with the actual destination.
/// </summary>
public class RememberedDestinationController : MonoBehaviour
{
    [Header("Actual Navigation Points")]
    public Transform actualStartPoint;       // Real starting location
    public Transform actualDestination;      // Real destination

    [Header("Memory Distortion Settings")]

    [Tooltip("Minimum duration before the remembered destination changes (seconds)")]
    public float minStayTime = 3f;

    [Tooltip("Maximum duration before the remembered destination changes (seconds)")]
    public float maxStayTime = 8f;

    [Tooltip("Maximum distance the remembered destination can drift (meters)")]
    public float maxOffset = 6f;

    [Tooltip("Probability that the remembered destination matches the actual destination")]
    [Range(0f, 1f)]
    public float exactDestinationProbability = 0.22f;

    private float decisionTimer = 0f;
    private float currentStayDuration = 0f;

    private void Start()
    {
        // Initialize at the real destination
        if (actualDestination != null)
            transform.position = actualDestination.position;

        SetNewStayDuration();

        Debug.Log(
            "[RememberedDestination] Memory destination initialized and ready."
        );
    }

    private void Update()
    {
        decisionTimer += Time.deltaTime;

        if (decisionTimer >= currentStayDuration)
        {
            DecideNewPosition();

            decisionTimer = 0f;
            SetNewStayDuration();
        }
    }

    private void SetNewStayDuration()
    {
        currentStayDuration = Random.Range(minStayTime, maxStayTime);
    }

    /// <summary>
    /// Determines the next remembered destination based on memory distortion rules.
    /// </summary>
    private void DecideNewPosition()
    {
        float roll = Random.value;

        // Memory becomes completely accurate
        if (roll < exactDestinationProbability)
        {
            transform.position = actualDestination.position;

            Debug.Log(
                $"🟢 [RememberedDestination] Memory aligned with reality. Destination = {transform.position}"
            );

            return;
        }

        // Memory projects beyond the real destination
        if (roll < 0.65f)
        {
            Vector3 directionToDestination =
                (actualDestination.position - actualStartPoint.position).normalized;

            Vector3 newPosition =
                actualDestination.position +
                directionToDestination * Random.Range(0f, maxOffset * 0.8f);

            newPosition += Random.insideUnitSphere * 2.5f;
            newPosition.y = actualDestination.position.y;

            transform.position = newPosition;

            Debug.Log(
                $"➡️ [RememberedDestination] Memory shifted beyond the actual destination → {transform.position}"
            );
        }
        // Memory regresses toward familiar locations
        else
        {
            Vector3 directionToStart =
                (actualStartPoint.position - actualDestination.position).normalized;

            Vector3 newPosition =
                transform.position +
                directionToStart * Random.Range(3f, maxOffset);

            newPosition = Vector3.Lerp(
                newPosition,
                actualStartPoint.position,
                Random.Range(0.2f, 0.6f)
            );

            newPosition += Random.insideUnitSphere * 2f;
            newPosition.y = actualDestination.position.y;

            transform.position = newPosition;

            Debug.Log(
                $"⬅️ [RememberedDestination] Memory drifted back toward the starting location → {transform.position}"
            );
        }
    }

    // ==================================================
    // Public Methods
    // ==================================================

    /// <summary>
    /// Forces the remembered destination to match the actual destination.
    /// Useful for testing or scripted events.
    /// </summary>
    public void ForceToActualDestination()
    {
        transform.position = actualDestination.position;

        Debug.Log(
            "[RememberedDestination] Forced alignment with actual destination."
        );
    }

    /// <summary>
    /// Resets the remembered destination system.
    /// </summary>
    public void ResetRememberedDestination()
    {
        transform.position = actualDestination.position;

        decisionTimer = 0f;

        SetNewStayDuration();

        Debug.Log(
            "[RememberedDestination] System reset."
        );
    }
}