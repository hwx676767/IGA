using UnityEngine;
using UnityEngine.UI;
using System.Collections;  // 需要引用这个命名空间才能使用 Coroutine

public class forHome : MonoBehaviour
{
    public Slider homeValue;
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
        if (playerInRange && Input.GetKeyDown(KeyCode.F1))
        {
            StartCoroutine(DelayedIncrease());
        }
    }

    private IEnumerator DelayedIncrease()
    {
        yield return new WaitForSeconds(5f);

        homeValue.value += 10;

        if (homeValue.value > homeValue.maxValue)
        {
            homeValue.value = homeValue.maxValue;  
        }
    }
}