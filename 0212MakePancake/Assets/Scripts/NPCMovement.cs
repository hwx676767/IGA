using System;
using System.Collections;
using UnityEngine;

public class NPCMovement : MonoBehaviour
{
    private Vector3 targetPosition; 
    private Vector3 startPosition; 
    public float moveSpeed = 2f; 
    public GameObject uiPanel;

    public event Action<GameObject> OnNPCDestroyed; // Event triggered when NPC is destroyed

    // Initialize NPC with starting and target positions
    public void Initialize(Vector3 startPos, Vector3 targetPos)
    {
        startPosition = startPos;
        targetPosition = targetPos;
        transform.position = startPosition; 
    }

    void Start()
    {
        StartCoroutine(MoveToTarget());
    }

    IEnumerator MoveToTarget()
    {
        float journeyLength = Vector3.Distance(startPosition, targetPosition); 
        float startTime = Time.time; 

        // Move towards the target position
        while (transform.position != targetPosition)
        {
            float distanceCovered = (Time.time - startTime) * moveSpeed; 
            float fractionOfJourney = distanceCovered / journeyLength; 

            // Add some vertical movement here if needed

            transform.position = Vector3.Lerp(startPosition, targetPosition, fractionOfJourney);

            yield return null;
        }

        // Wait for 3 seconds after reaching the target position
        yield return new WaitForSeconds(3f);

        // Activate the UI panel
        ActivateUIPanel();

        // Wait until the pancake is ready
        yield return new WaitUntil(() => IsPancakeReady());

        // Deactivate the UI panel
        DeactivateUIPanel();

        // NPC leaves
        yield return StartCoroutine(Leave());
    }

    void ActivateUIPanel()
    {
        if (uiPanel != null)
        {
            uiPanel.SetActive(true);
        }
        else
        {
            Debug.LogWarning("UI Panel is not assigned!");
        }
    }

    public void DeactivateUIPanel()
    {
        if (uiPanel != null)
        {
            uiPanel.SetActive(false);
        }
    }

    private bool IsPancakeReady()
    {
        if (Input.GetMouseButtonDown(2)) // Temporary test using middle mouse button
        {
            // Add logic here to check if the pancake is handed to the NPC
            return true;
        }
        else
        {
            return false;
        }
    }

    IEnumerator Leave()
    {
        Vector3 leavePosition = new Vector3(-10f, transform.position.y, transform.position.z);
        while (transform.position != leavePosition)
        {
            transform.position = Vector3.MoveTowards(transform.position, leavePosition, moveSpeed * Time.deltaTime);
            yield return null;
        }

        Destroy(gameObject);
    }

    private void OnDestroy()
    {
        // Trigger the NPC destroyed event
        OnNPCDestroyed?.Invoke(gameObject);
    }
}