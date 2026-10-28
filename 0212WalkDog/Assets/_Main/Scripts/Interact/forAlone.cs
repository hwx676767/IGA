using System;
using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class forAlone : MonoBehaviour
{
    public Slider aloneValue;
    private bool playerInRange = false;

    public GameObject timelineObject; 
    public GameObject snake;


    private void Start()
    {
        timelineObject.SetActive(false);
    }


    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            playerInRange = true;
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            playerInRange = false;
        }
    }

    private void Update()
    {
        if (playerInRange && Input.GetKeyDown(KeyCode.Alpha8) || Input.GetKeyDown(KeyCode.Alpha1))
        {
            StartCoroutine(DelayedIncrease());
        }

        if (playerInRange && Input.GetKeyDown(KeyCode.E))
        {
            ActivateTimelineAndDestroyObjects();
        }
    }

    private IEnumerator DelayedIncrease()
    {
        yield return new WaitForSeconds(5f);

        aloneValue.value += 10;

        if (aloneValue.value > aloneValue.maxValue)
        {
            aloneValue.value = aloneValue.maxValue;
        }
    }

    private void ActivateTimelineAndDestroyObjects()
    {
        if (timelineObject != null)
        {
            timelineObject.SetActive(true);
        }

        StartCoroutine(DestroyObjectsAfterDelay());
        
        StartCoroutine(DelayedIncrease());
    }

    private IEnumerator DestroyObjectsAfterDelay()
    {
        yield return new WaitForSeconds(10f);

        // destory timelineObject and snake
        if (timelineObject != null)
        {
            Destroy(timelineObject);
        }

        if (snake != null)
        {
            Destroy(snake);
        }
    }
}
