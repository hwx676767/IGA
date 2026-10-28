using System;
using UnityEngine;
using UnityEngine.UI;

public class SimpleAreaTrigger : MonoBehaviour
{
    [Header("Player UI Panels")]
    public GameObject player01Panel; // Panel for Player 1
    public GameObject player02Panel; // Panel for Player 2

    private bool player01InArea;
    private bool player02InArea;

    private void Start()
    {
        player01Panel.SetActive(false);
        player02Panel.SetActive(false);
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player01"))
        {
            player01InArea = true;
            if(player01Panel != null) player01Panel.SetActive(true);
        }
        else if (other.CompareTag("Player02"))
        {
            player02InArea = true;
            if(player02Panel != null) player02Panel.SetActive(true);
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("Player01"))
        {
            player01InArea = false;
            if(player01Panel != null) player01Panel.SetActive(false);
        }
        else if (other.CompareTag("Player02"))
        {
            player02InArea = false;
            if(player02Panel != null) player02Panel.SetActive(false);
        }
    }

    private void Update()
    {
        // Close both panels when Q is pressed
        if (Input.GetKeyDown(KeyCode.Q) || Input.GetKeyDown(KeyCode.LeftShift) || Input.GetKeyDown(KeyCode.RightShift))
        {
            if(player01InArea && player01Panel != null) player01Panel.SetActive(false);
            if(player02InArea && player02Panel != null) player02Panel.SetActive(false);
        }
    }
}