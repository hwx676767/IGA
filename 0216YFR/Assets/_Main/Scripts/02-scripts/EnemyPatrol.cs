using UnityEngine;
using System.Collections;

public class EnemyPatrol : MonoBehaviour
{
    private float minRotationAngle = 45f;
    private float maxRotationAngle = 135f;
    private float minPauseTime = 1f;
    private float maxPauseTime = 2f;
    private bool isPatrolling = true;

    private Coroutine patrolCoroutine; // Store the current patrol coroutine

    private void Start()
    {
        patrolCoroutine = StartCoroutine(Patrol()); // Start patrolling coroutine
    }

    private IEnumerator Patrol()
    {
        while (isPatrolling)
        {
            float rotationAngle = Random.Range(minRotationAngle, maxRotationAngle);
            float rotationDirection = Random.Range(0, 2) == 0 ? 1f : -1f;

            float targetAngle = transform.eulerAngles.y + rotationDirection * rotationAngle;
            float currentAngle = transform.eulerAngles.y;
            float timeToRotate = 1f; 

            float elapsedTime = 0f;
            while (elapsedTime < timeToRotate)
            {
                elapsedTime += Time.deltaTime;
                float angle = Mathf.LerpAngle(currentAngle, targetAngle, elapsedTime / timeToRotate);
                transform.eulerAngles = new Vector3(transform.eulerAngles.x, angle, transform.eulerAngles.z);
                yield return null;
            }

            float pauseTime = Random.Range(minPauseTime, maxPauseTime);
            yield return new WaitForSeconds(pauseTime);
        }
    }

    public void PausePatrol()
    {
        if (isPatrolling) // Only pause if the patrol is running
        {
            isPatrolling = false;
            if (patrolCoroutine != null)
            {
                StopCoroutine(patrolCoroutine); // Stop the current patrol coroutine
                patrolCoroutine = null; // Set the reference to null
            }
        }
    }

    public void ResumePatrol()
    {
        if (!isPatrolling) // Only resume if it's currently paused
        {
            isPatrolling = true;
            patrolCoroutine = StartCoroutine(Patrol()); // Restart the patrol coroutine
        }
    }
}
