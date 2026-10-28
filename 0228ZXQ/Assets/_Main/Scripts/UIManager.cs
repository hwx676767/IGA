using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UIManager : MonoBehaviour
{
    public GameObject UIToShow;
    private bool isShowing = false;
    
    void Start()
    {
        UIToShow.SetActive(false);
    }

    void Update()
    {
        if (Input.GetMouseButtonDown(2))
        {
            isShowing = !isShowing;
            Time.timeScale = isShowing ? 0 : 1;
            UIToShow.SetActive(isShowing);
        }
    }


    
    
    
}
