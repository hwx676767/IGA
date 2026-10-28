using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class UIDragSpawn2D : MonoBehaviour, IBeginDragHandler, IDragHandler, IEndDragHandler
{
    public GameObject prefabToSpawn;

    private RectTransform rect;
    private RectTransform parentPanel;
    private Canvas canvas;
    private Camera worldCamera;

    private bool isOutsidePanel = false;

    private void Awake()
    {
        rect = GetComponent<RectTransform>();
        parentPanel = transform.parent.GetComponent<RectTransform>();

        canvas = GetComponentInParent<Canvas>();
        worldCamera = Camera.main;
    }

    public void OnBeginDrag(PointerEventData eventData)
    {
        rect.SetAsLastSibling();
    }

    public void OnDrag(PointerEventData eventData)
    {
        rect.position = eventData.position;

        // 是否离开父 Panel
        isOutsidePanel = !RectTransformUtility.RectangleContainsScreenPoint(
            parentPanel,
            rect.position,
            canvas.worldCamera
        );
    }

    public void OnEndDrag(PointerEventData eventData)
    {
        if (isOutsidePanel)
        {
            // 鼠标世界坐标
            Vector3 worldPos = worldCamera.ScreenToWorldPoint(Input.mousePosition);
            worldPos.z = 0;

            // 生成物体
            Instantiate(prefabToSpawn, worldPos, Quaternion.identity);

            // ✔ 生成成功后移除 UI
            Destroy(gameObject);
        }
        else
        {
            // 如果仍在 panel 内 → 回原位
            rect.anchoredPosition = Vector2.zero;
        }

        isOutsidePanel = false;
    }
}