using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.InputSystem;
using UnityEngine.UI;

/// <summary>
/// Finds CanvasUI children named area-X and connects them to the area detail panel.
/// </summary>
[RequireComponent(typeof(Canvas))]
public sealed class MapAreaInteractionController : MonoBehaviour
{
    [SerializeField] private AreaDetailPanel panelPrefab;
    [SerializeField, Min(1f)] private float areaHoverScale = 1.08f;

    private AreaDetailPanel panelInstance;
    private readonly List<AreaMapInteractable> areas = new();
    private readonly List<RaycastResult> raycastResults = new();
    private Canvas canvas;
    private GraphicRaycaster graphicRaycaster;

    private void Awake()
    {
        canvas = GetComponent<Canvas>();
        graphicRaycaster = GetComponent<GraphicRaycaster>();
        CreatePanel();
        RegisterAreas();
    }

    private void Update()
    {
        if (Mouse.current == null || (panelInstance != null && panelInstance.gameObject.activeSelf))
        {
            SetHoveredArea(null);
            return;
        }

        var pointer = Mouse.current.position.ReadValue();
        var hoveredArea = FindHoveredArea(pointer);

        SetHoveredArea(hoveredArea);
        if (hoveredArea != null && Mouse.current.leftButton.wasPressedThisFrame)
        {
            ShowArea(hoveredArea.name);
        }
    }

    public void ShowArea(string areaName)
    {
        if (panelInstance == null)
        {
            CreatePanel();
        }

        panelInstance?.Show(areaName);
    }

    private void CreatePanel()
    {
        if (panelPrefab == null)
        {
            Debug.LogWarning("AreaDetailPanel prefab is not assigned on CanvasUI.", this);
            return;
        }

        panelInstance = Instantiate(panelPrefab, transform);
        panelInstance.Hide();
    }

    private void RegisterAreas()
    {
        areas.Clear();
        var allTransforms = GetComponentsInChildren<RectTransform>(true);
        foreach (var child in allTransforms)
        {
            if (!child.name.StartsWith("area-", System.StringComparison.OrdinalIgnoreCase))
            {
                continue;
            }

            var interactable = child.GetComponent<AreaMapInteractable>();
            if (interactable == null)
            {
                interactable = child.gameObject.AddComponent<AreaMapInteractable>();
            }

            interactable.Initialize(this, areaHoverScale);
            areas.Add(interactable);
            CreateAreaMarker(child, interactable);
        }
    }

    private static void CreateAreaMarker(RectTransform area, AreaMapInteractable interactable)
    {
        if (area.GetComponentInChildren<AreaRegionMarker>(true) != null)
        {
            return;
        }

        var markerPrefab = Resources.Load<AreaRegionMarker>("AreaRegionMarker");
        if (markerPrefab == null)
        {
            return;
        }

        var marker = Instantiate(markerPrefab, area);
        var markerRect = marker.GetComponent<RectTransform>();
        markerRect.anchorMin = markerRect.anchorMax = new Vector2(0.5f, 0.5f);
        markerRect.anchoredPosition = Vector2.zero;
        marker.SetArea(interactable.name);
    }

    private void SetHoveredArea(AreaMapInteractable hoveredArea)
    {
        foreach (var area in areas)
        {
            area.SetHovered(area == hoveredArea);
        }
    }

    private AreaMapInteractable FindHoveredArea(Vector2 pointer)
    {
        // Let the Canvas raycaster do the world-space camera conversion. This also
        // respects the alpha hit threshold on the transparent area sprites.
        if (graphicRaycaster != null && EventSystem.current != null)
        {
            raycastResults.Clear();
            var pointerData = new PointerEventData(EventSystem.current) { position = pointer };
            graphicRaycaster.Raycast(pointerData, raycastResults);
            foreach (var result in raycastResults)
            {
                var area = result.gameObject.GetComponentInParent<AreaMapInteractable>();
                if (area != null)
                {
                    return area;
                }
            }
        }

        // Fallback for scenes where no EventSystem has been configured.
        var eventCamera = canvas.worldCamera != null ? canvas.worldCamera : Camera.main;
        for (var i = areas.Count - 1; i >= 0; i--)
        {
            if (areas[i].ContainsScreenPoint(pointer, eventCamera))
            {
                return areas[i];
            }
        }

        return null;
    }
}
