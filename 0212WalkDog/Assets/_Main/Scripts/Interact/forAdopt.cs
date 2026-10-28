using UnityEngine;
using UnityEngine.UI;
using System.Collections; 

public class forAdopt : MonoBehaviour
{
    public Slider adoptValue; 
    private bool playerInRange = false;

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
        if (playerInRange && Input.GetKeyDown(KeyCode.Alpha2))
        {
            StartCoroutine(DelayedIncrease());
        }
    }

    private IEnumerator DelayedIncrease()
    {
        yield return new WaitForSeconds(5f);

        adoptValue.value += 10;

        if (adoptValue.value > adoptValue.maxValue)
        {
            adoptValue.value = adoptValue.maxValue;
        }
    }
}