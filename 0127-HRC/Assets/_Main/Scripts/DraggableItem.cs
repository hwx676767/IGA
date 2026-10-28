using UnityEngine;

public class DraggableItem : MonoBehaviour
{
    [Header("object ID")]
    public string itemID;

    [Header("hight")]
    public float dragHeight = 2f;

    [Header("snap speed")]
    public float snapSpeed = 10f;

    private Camera cam;
    private bool isDragging;

    private Vector3 offset;

    private PlacementZone targetZone;

    private bool isPlaced = false;

    private void Start()
    {
        cam = Camera.main;
    }
    private void OnMouseDown()
    {
        if (isPlaced) return;

        isDragging = true;

        offset = transform.position - GetMouseWorldPosition();

        FindAndShowTargetZone();
    }
    private void OnMouseDrag()
    {
        if (!isDragging || isPlaced) return;

        Vector3 targetPos = GetMouseWorldPosition() + offset;

        targetPos.y = dragHeight;

        transform.position = targetPos;
    }
    private void OnMouseUp()
    {
        isDragging = false;
        TryPlace();
    }

    Vector3 GetMouseWorldPosition()
    {
        Ray ray = cam.ScreenPointToRay(Input.mousePosition);

        Plane plane = new Plane(Vector3.up, Vector3.zero);

        if (plane.Raycast(ray, out float distance))
        {
            return ray.GetPoint(distance);
        }

        return Vector3.zero;
    }

    void FindAndShowTargetZone()
    {
        PlacementZone[] zones = FindObjectsOfType<PlacementZone>();

        foreach (PlacementZone zone in zones)
        {
            if (zone.targetItemID == itemID && !zone.isOccupied)
            {
                targetZone = zone;
                zone.ShowHint();
            }
            else
            {
                zone.HideHint();
            }
        }
    }

    void TryPlace()
    {
        if (targetZone == null) return;

        float distance = Vector3.Distance(
            transform.position,
            targetZone.snapPoint.position
        );

        if (distance < 2f)
        {
            PlaceToZone();
        }
        else
        {
            targetZone.HideHint();
        }
    }

    void PlaceToZone()
    {
        isPlaced = true;

        targetZone.isOccupied = true;

        targetZone.HideHint();

        transform.position = targetZone.snapPoint.position;

        transform.rotation = targetZone.snapPoint.rotation;

        Debug.Log(itemID + " 放置成功");
    }
}