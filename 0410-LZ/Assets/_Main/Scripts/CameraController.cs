using UnityEngine;

public class CameraController : MonoBehaviour
{
    public float moveSpeed = 10f;

    private bool isUIMode = false;

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.C))
        {
            isUIMode = !isUIMode;

            Cursor.visible = isUIMode;
            Cursor.lockState = isUIMode ? CursorLockMode.None : CursorLockMode.Locked;
        }

        if (isUIMode) return;

        MoveCamera();
    }

    void MoveCamera()
    {
        float h = Input.GetAxis("Horizontal"); 
        float v = Input.GetAxis("Vertical");  

        Vector3 move = new Vector3(h, 0, v);
        transform.Translate(move * moveSpeed * Time.deltaTime, Space.World);
    }
}