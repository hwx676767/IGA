using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class escape_timer : MonoBehaviour
{
    public float timeRemaining;
    public bool timeIsRunning = false;
    public TextMeshProUGUI timetext;
    public static escape_timer Instance;
    // Start is called before the first frame update
    void Awake()
    {
        Instance = this; // Assign singleton
    }
    // Update is called once per frame
    void Update()
    {
        if (timeIsRunning)
        {
            if(timeRemaining > 0)
            {
                timeRemaining -= Time.deltaTime;
                float minutes = Mathf.FloorToInt(timeRemaining / 60);
                float seconds = Mathf.FloorToInt(timeRemaining % 60);
                timetext.text = string.Format("{0:00}:{1:00}", minutes, seconds);
            }
            else
            {
                timeRemaining = 0;
                timeIsRunning = false;  
                
            }
            
        }
    }
}
