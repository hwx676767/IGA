using UnityEngine;

public class HandTool : MonoBehaviour
{
    private Vector3 offset;  
    private Camera mainCamera;

    void Start()
    {
        mainCamera = Camera.main;  
    }

    void OnMouseDown()
    {
        Vector3 mouseWorldPos = mainCamera.ScreenToWorldPoint(Input.mousePosition);
        mouseWorldPos.z = 0;  
        offset = transform.position - mouseWorldPos;  
    }

    void OnMouseDrag()
    {
        Vector3 mouseWorldPos = mainCamera.ScreenToWorldPoint(Input.mousePosition);
        mouseWorldPos.z = 0;  
        transform.position = mouseWorldPos + offset; 
    }

    // if upMouse
    void OnMouseUp()
    {
        // return to original
    }
}