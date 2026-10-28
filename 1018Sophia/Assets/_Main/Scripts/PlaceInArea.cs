using UnityEngine;

public class PlaceInArea : MonoBehaviour
{
    public Transform targetPosition; // 指定放置点
    private GameObject objectInArea; // 当前区域内的物体
    private bool isObjectInside = false; // 判断物体是否在区域内

    void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Grabbable"))
        {
            objectInArea = other.gameObject;
            isObjectInside = true;
            Debug.Log("物体进入区域");
        }
    }

    void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("Grabbable"))
        {
            if (objectInArea == other.gameObject)
            {
                objectInArea = null;
                isObjectInside = false;
                Debug.Log("物体离开区域");
            }
        }
    }

    void Update()
    {
        // 检测松开 G 键
        if (isObjectInside && Input.GetKeyUp(KeyCode.G))
        {
            PlaceObject();
        }
    }

    void PlaceObject()
    {
        if (objectInArea != null && targetPosition != null)
        {
            Debug.Log(objectInArea.name);
            // 放置到指定位置
            objectInArea.transform.position = targetPosition.position;

            // 判断物体是否是 GrabBook
            if (objectInArea.name == "GrabBook")
            {
                objectInArea.transform.rotation = Quaternion.Euler(0f, -90f, 0f);
                Debug.Log("设置旋转");
            }
            else
            {
                // 默认使用目标点旋转
                objectInArea.transform.rotation = targetPosition.rotation;
            }

            // 如果物体有刚体，停止运动
            Rigidbody rb = objectInArea.GetComponent<Rigidbody>();
            if (rb != null)
            {
                rb.velocity = Vector3.zero;
                rb.angularVelocity = Vector3.zero;
            }

            // 设置为父物体子级（保持位置不变）
            objectInArea.transform.SetParent(GameObject.Find("PlacedParent").transform, true);

            // 防止重复放置
            isObjectInside = false;
            objectInArea = null;
        }
    }
}