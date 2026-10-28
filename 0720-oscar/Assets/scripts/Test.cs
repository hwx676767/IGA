using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor.SceneManagement;
using UnityEngine.SceneManagement;

public class Test : MonoBehaviour
{
    
    public void LoadScene()
    {
        SceneManager.LoadScene(1);
    }
}
