using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class SceneTransform : MonoBehaviour
{
    
    public void LoadScene(int sceenIndex)
    {
        SceneManager.LoadScene(sceenIndex);
        Debug.Log(sceenIndex);
    }

}
