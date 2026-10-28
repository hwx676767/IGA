using UnityEngine;
using UnityEngine.UI;

/// <summary>
/// Ordered route markers. Drag each child in the Scene view to reshape the actor path.
/// Children are used in hierarchy order.
/// </summary>
[ExecuteAlways]
public class S3WaypointPath : MonoBehaviour
{
    [SerializeField] private Color gizmoColor = new Color(1f, .82f, .28f, .95f);
    [SerializeField] private bool hideMarkersDuringPlay = true;

    public int Count => transform.childCount;

    public RectTransform GetPoint(int index)
    {
        if (index < 0 || index >= transform.childCount) return null;
        return transform.GetChild(index) as RectTransform;
    }

    private void Awake()
    {
        if (Application.isPlaying && hideMarkersDuringPlay)
            SetMarkerVisible(false);
    }

    public void SetMarkerVisible(bool visible)
    {
        for (int i = 0; i < transform.childCount; i++)
        {
            Graphic graphic = transform.GetChild(i).GetComponent<Graphic>();
            if (graphic != null) graphic.enabled = visible;
        }
    }

    private void OnDrawGizmos()
    {
        Gizmos.color = gizmoColor;
        Vector3 previous = Vector3.zero;
        bool hasPrevious = false;
        for (int i = 0; i < transform.childCount; i++)
        {
            Transform point = transform.GetChild(i);
            Gizmos.DrawSphere(point.position, 18f);
            if (hasPrevious) Gizmos.DrawLine(previous, point.position);
            previous = point.position;
            hasPrevious = true;
        }
    }
}
