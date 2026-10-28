using System.Collections.Generic;
using UnityEngine;

/// <summary>
/// Teleport player from map buttons. Uses Rigidbody-safe move
/// (plain transform.position is often overwritten by PlayerMovement FixedUpdate).
/// Press M to open/close the map panel.
/// </summary>
public class MinimapTeleport : MonoBehaviour
{
    [System.Serializable]
    public class TeleportPoint
    {
        public string name;
        public Transform point;
    }

    public List<TeleportPoint> points = new List<TeleportPoint>();
    public Transform player;

    [Header("Map UI")]
    [Tooltip("The map GameObject to toggle with M (scene object named map / Map / mapPanel).")]
    public GameObject mapPanel;
    public KeyCode toggleMapKey = KeyCode.M;
    public bool closeMapAfterTeleport = true;

    private Rigidbody playerRb;
    private CharacterController playerCc;

    void Awake()
    {
        ResolvePlayer();
        ResolveMapPanel();
    }

    void Update()
    {
        if (!Input.GetKeyDown(toggleMapKey)) return;

        // Don't open map over dialogue / clue popup
        if (DialogueManager.Instance != null && DialogueManager.Instance.IsDialogueActive)
            return;
        if (ClueFoundPopup.Instance != null && ClueFoundPopup.Instance.IsShowing)
            return;

        ToggleMap();
    }

    public void OpenMap()
    {
        ResolveMapPanel();
        if (mapPanel == null) return;
        mapPanel.SetActive(true);
    }

    public void CloseMap()
    {
        ResolveMapPanel();
        if (mapPanel == null) return;
        mapPanel.SetActive(false);
    }

    public void ToggleMap()
    {
        ResolveMapPanel();
        if (mapPanel == null)
        {
            Debug.LogWarning("[MinimapTeleport] map panel not found.");
            return;
        }
        mapPanel.SetActive(!mapPanel.activeSelf);
    }

    public void TeleportTo(int index)
    {
        ResolvePlayer();
        if (player == null)
        {
            Debug.LogWarning("[MinimapTeleport] Player not assigned.");
            return;
        }

        if (index < 0 || index >= points.Count)
        {
            Debug.LogWarning("[MinimapTeleport] Teleport index out of range: " + index);
            return;
        }

        if (points[index].point == null)
        {
            Debug.LogWarning("[MinimapTeleport] Teleport point is null at index " + index);
            return;
        }

        ApplyTeleport(points[index].point.position);
    }

    public void TeleportTo(string pointName)
    {
        ResolvePlayer();
        if (player == null)
        {
            Debug.LogWarning("[MinimapTeleport] Player not assigned.");
            return;
        }

        if (string.IsNullOrWhiteSpace(pointName))
        {
            Debug.LogWarning("[MinimapTeleport] TeleportTo called with empty name (check Button OnClick).");
            return;
        }

        string key = pointName.Trim();
        foreach (var p in points)
        {
            if (p == null || p.point == null || string.IsNullOrEmpty(p.name))
                continue;
            if (string.Equals(p.name.Trim(), key, System.StringComparison.OrdinalIgnoreCase))
            {
                ApplyTeleport(p.point.position);
                return;
            }
        }

        Debug.LogWarning("[MinimapTeleport] Teleport point not found: " + pointName);
    }

    private void ApplyTeleport(Vector3 worldPos)
    {
        // Keep current height if point is at y≈0 and player is grounded slightly above
        Vector3 target = worldPos;
        if (Mathf.Abs(target.y) < 0.01f && player.position.y > 0.1f)
            target.y = player.position.y;

        if (playerCc != null && playerCc.enabled)
        {
            playerCc.enabled = false;
            player.position = target;
            playerCc.enabled = true;
        }
        else if (playerRb != null)
        {
            playerRb.velocity = Vector3.zero;
            playerRb.angularVelocity = Vector3.zero;
            playerRb.position = target;
            player.position = target;
        }
        else
        {
            player.position = target;
        }

        if (closeMapAfterTeleport)
            CloseMap();

        Debug.Log($"[MinimapTeleport] Teleported to {target}");
    }

    private void ResolvePlayer()
    {
        if (player == null)
        {
            var tagged = GameObject.FindGameObjectWithTag("Player");
            if (tagged != null)
                player = tagged.transform;
            else
            {
                var pm = FindObjectOfType<PlayerMovement>();
                if (pm != null)
                    player = pm.transform;
            }
        }

        if (player == null) return;

        if (playerRb == null)
            playerRb = player.GetComponent<Rigidbody>();
        if (playerCc == null)
            playerCc = player.GetComponent<CharacterController>();
    }

    private void ResolveMapPanel()
    {
        if (mapPanel != null) return;

        mapPanel = FindNamed("map")
                   ?? FindNamed("mapPanel")
                   ?? FindNamed("Map");
    }

    private static GameObject FindNamed(string objectName)
    {
        foreach (var t in Resources.FindObjectsOfTypeAll<Transform>())
        {
            if (t == null || t.name != objectName) continue;
            if (!t.gameObject.scene.IsValid()) continue;
            return t.gameObject;
        }
        return GameObject.Find(objectName);
    }
}
