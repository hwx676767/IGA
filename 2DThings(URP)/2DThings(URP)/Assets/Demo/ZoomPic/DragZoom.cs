using UnityEngine;

public class DragZoom : MonoBehaviour
{
    public Vector3 mousePosition;
    public Vector3 dragOffset;
    public Camera _camera;

    public Transform bigPic;
    public Transform smallPic;
    public Transform spriteMaskPic;


    private void OnMouseDown()
    {
        dragOffset = _camera.ScreenToWorldPoint(Input.mousePosition) - transform.position;
    }


    private void OnMouseDrag()
    {
        mousePosition = _camera.ScreenToWorldPoint(Input.mousePosition);
        transform.position = mousePosition - dragOffset;
    }

    private void Update()
    {
        bigPic.position = smallPic.position * 2 - spriteMaskPic.position;
    }
}
