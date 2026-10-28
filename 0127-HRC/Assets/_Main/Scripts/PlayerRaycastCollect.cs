using UnityEngine;

public class PlayerRaycastCollect : MonoBehaviour
{
    [Header("检测距离")]
    public float rayDistance = 5f;

    [Header("遗物箱")]
    public Transform memoryBox;

    [Header("可检测层")]
    public LayerMask itemLayer;

    private Camera cam;

    private void Start()
    {
        cam = Camera.main;
    }

    private void Update()
    {
        if (Input.GetMouseButtonDown(0))
        {
            DetectItem();
        }
    }

    void DetectItem()
    {
        Ray ray = cam.ScreenPointToRay(Input.mousePosition);

        RaycastHit hit;

        if (Physics.Raycast(ray, out hit, rayDistance, itemLayer))
        {
            MemoryItem item = hit.collider.GetComponent<MemoryItem>();

            if (item != null)
            {
                item.Collect(memoryBox);
            }
        }
    }
}