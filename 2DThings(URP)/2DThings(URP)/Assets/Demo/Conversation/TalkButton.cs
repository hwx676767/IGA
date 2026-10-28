using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TalkButton : MonoBehaviour
{
    //public GameObject signal;     //对话提示
    public GameObject conversationPanel;

    /*
    private void OnTriggerEnter2D(Collider2D collision)
    {
        signal.SetActive(true);
    }

    private void OnTriggerExit2D(Collider2D collision)
    {
        signal.SetActive(false);
    }*/


    private void Update()
    {
        //对话面板
        //if (signal.activeSelf && Input.GetKeyDown(KeyCode.R))
        if (Input.GetKeyDown(KeyCode.R))   //单这样写会有点小bug
        {
            conversationPanel.SetActive(true);
        }
    }
}
