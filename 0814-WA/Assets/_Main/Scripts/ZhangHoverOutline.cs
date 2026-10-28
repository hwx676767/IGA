using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;

/// <summary>
/// Adds colliders to the stamp models and shows a thick orange outline while hovered.
/// </summary>
public sealed class ZhangHoverOutline : MonoBehaviour
{
    [SerializeField] private CurrentDocumentSpawner documentSpawner;
    [SerializeField] private string[] targetNames = { "zhang-1", "zhang-2", "zhang-3" };
    [SerializeField, Range(1.001f, 1.15f)] private float outlineScale = 1.06f;
    [SerializeField] private Color outlineColor = new(1f, 0.38f, 0.02f, 1f);

    private readonly List<OutlineTarget> targets = new();
    private Material outlineMaterial;

    private void Start()
    {
        documentSpawner ??= GetComponent<CurrentDocumentSpawner>();
        if (CreateOutlineMaterial() == false)
        {
            enabled = false;
            return;
        }

        foreach (var targetName in targetNames)
        {
            var targetObject = GameObject.Find(targetName);
            if (targetObject == null)
            {
                Debug.LogWarning($"Could not find outline target '{targetName}'.", this);
                continue;
            }

            var target = new OutlineTarget(targetObject.transform, targets.Count);
            CreateCollidersAndOutline(target);
            SetHighlight(target, false);
            targets.Add(target);
        }

        if (targets.Count == 0)
        {
            enabled = false;
        }
    }

    private void Update()
    {
        if (Mouse.current == null || Camera.main == null)
        {
            return;
        }

        var pointerRay = Camera.main.ScreenPointToRay(Mouse.current.position.ReadValue());
        OutlineTarget hoveredTarget = null;
        if (Physics.Raycast(pointerRay, out var hit))
        {
            foreach (var target in targets)
            {
                if (hit.collider.transform == target.root || hit.collider.transform.IsChildOf(target.root))
                {
                    hoveredTarget = target;
                    break;
                }
            }
        }

        foreach (var target in targets)
        {
            SetHighlight(target, target == hoveredTarget);
        }

        if (hoveredTarget != null && Mouse.current.leftButton.wasPressedThisFrame)
        {
            documentSpawner?.StampWith(hoveredTarget.stampIndex, hoveredTarget.root);
        }
    }

    private bool CreateOutlineMaterial()
    {
        var shader = Shader.Find("Universal Render Pipeline/Unlit");
        if (shader == null)
        {
            Debug.LogWarning("URP Unlit shader was not found; stamp outlines are unavailable.", this);
            return false;
        }

        outlineMaterial = new Material(shader) { name = "ZhangHoverOutline_Orange" };
        outlineMaterial.SetColor("_BaseColor", outlineColor);
        outlineMaterial.SetColor("_Color", outlineColor);
        if (outlineMaterial.HasProperty("_Cull"))
        {
            outlineMaterial.SetFloat("_Cull", 1f);
        }

        return true;
    }

    private void CreateCollidersAndOutline(OutlineTarget target)
    {
        foreach (var meshFilter in target.root.GetComponentsInChildren<MeshFilter>())
        {
            if (meshFilter.sharedMesh == null)
            {
                continue;
            }

            if (meshFilter.TryGetComponent<Collider>(out _) == false)
            {
                var collider = meshFilter.gameObject.AddComponent<BoxCollider>();
                collider.center = meshFilter.sharedMesh.bounds.center;
                collider.size = meshFilter.sharedMesh.bounds.size;
            }

            var outlineObject = new GameObject($"{meshFilter.name}_OrangeOutline");
            outlineObject.transform.SetParent(meshFilter.transform, false);
            outlineObject.transform.localScale = Vector3.one * outlineScale;
            var outlineFilter = outlineObject.AddComponent<MeshFilter>();
            outlineFilter.sharedMesh = meshFilter.sharedMesh;
            var outlineRenderer = outlineObject.AddComponent<MeshRenderer>();
            outlineRenderer.sharedMaterial = outlineMaterial;
            outlineRenderer.shadowCastingMode = UnityEngine.Rendering.ShadowCastingMode.Off;
            outlineRenderer.receiveShadows = false;
            target.outlineObjects.Add(outlineObject);
        }
    }

    private static void SetHighlight(OutlineTarget target, bool highlighted)
    {
        if (target.isHighlighted == highlighted)
        {
            return;
        }

        target.isHighlighted = highlighted;
        foreach (var outlineObject in target.outlineObjects)
        {
            outlineObject.SetActive(highlighted);
        }
    }

    private void OnDestroy()
    {
        if (outlineMaterial != null)
        {
            Destroy(outlineMaterial);
        }
    }

    private sealed class OutlineTarget
    {
        public readonly Transform root;
        public readonly List<GameObject> outlineObjects = new();
        public readonly int stampIndex;
        public bool isHighlighted = true;

        public OutlineTarget(Transform root, int stampIndex)
        {
            this.root = root;
            this.stampIndex = stampIndex;
        }
    }
}
