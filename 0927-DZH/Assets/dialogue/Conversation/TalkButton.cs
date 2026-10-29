using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TalkButton : MonoBehaviour
{
    public GameObject conversationPanel;

    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.R))   
        {
            conversationPanel.SetActive(true);
        }
    }
}
