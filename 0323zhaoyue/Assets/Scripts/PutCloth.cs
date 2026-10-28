using System;
using UnityEngine;

public class PutCloth : MonoBehaviour
{
    // 在Inspector中拖放需要激活的GameObject
    [SerializeField] private GameObject clothObject;

    private void Start()
    {
        if (clothObject != null)
        {
            clothObject.SetActive(false);
        }
    }

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Alpha4) || Input.GetKeyDown(KeyCode.Keypad4))
        {
            if (clothObject != null)
            {
                clothObject.SetActive(true);
            }
            else
            {
                Debug.LogWarning("Cloth object reference is not assigned in the Inspector!");
            }
        }
    }
}