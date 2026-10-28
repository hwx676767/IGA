using UnityEngine;

public class WindowActive : MonoBehaviour
{
    public GameObject objectToActivate;
    
    void Update()
    {
        // 检测鼠标左键点击
        if (Input.GetMouseButtonDown(0))
        {
            // 从摄像机发射射线
            Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
            RaycastHit hit;

            if (Physics.Raycast(ray, out hit))
            {
                // 检测是否点击到了自己
                if (hit.collider.gameObject == gameObject)
                {
                    ActivateObject();
                }
            }
        }
    }

    void ActivateObject()
    {
        objectToActivate.SetActive(true);
    }
}