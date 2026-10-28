#if UNITY_EDITOR
using UnityEditor;
using UnityEngine;
using TMPro;

/// <summary>
/// One-click setup for explore pickups + clue popup wiring.
/// </summary>
public static class ExploreSetupMenu
{
    [MenuItem("YFX Content/Setup Clue Found Popup (ClueDisplay)")]
    public static void SetupPopup()
    {
        var canvas = GameObject.Find("UI-Canvas");
        var display = FindIncludingInactive("ClueDisplay");
        if (canvas == null)
        {
            Debug.LogError("[YFX] UI-Canvas not found.");
            return;
        }
        if (display == null)
        {
            Debug.LogError("[YFX] ClueDisplay not found under UI-Canvas.");
            return;
        }

        // Remove wrong hosts
        foreach (var stray in Object.FindObjectsOfType<ClueFoundPopup>(true))
        {
            if (stray.gameObject != canvas)
                Undo.DestroyObjectImmediate(stray);
        }

        var popup = canvas.GetComponent<ClueFoundPopup>();
        if (popup == null)
            popup = Undo.AddComponent<ClueFoundPopup>(canvas);

        popup.panel = display;
        popup.BindClueDisplay();
        display.SetActive(false);
        EditorUtility.SetDirty(popup);
        Selection.activeGameObject = display;
        Debug.Log("[YFX] ClueFoundPopup on UI-Canvas → uses existing ClueDisplay.");
    }

    private static GameObject FindIncludingInactive(string name)
    {
        foreach (var t in Resources.FindObjectsOfTypeAll<Transform>())
        {
            if (t == null || t.name != name) continue;
            if (!t.gameObject.scene.IsValid()) continue;
            return t.gameObject;
        }
        return GameObject.Find(name);
    }

    [MenuItem("YFX Content/Place Sample Explore Pickups Near Player")]
    public static void PlaceSamplePickups()
    {
        var player = GameObject.FindGameObjectWithTag("Player");
        if (player == null)
        {
            Debug.LogError("[YFX] No Player tag in scene.");
            return;
        }

        string[] guids = AssetDatabase.FindAssets("t:ItemData", new[] { "Assets/_Main/Content/Items" });
        if (guids.Length == 0)
        {
            Debug.LogError("[YFX] No ItemData under Assets/_Main/Content/Items");
            return;
        }

        Transform root = player.transform.parent;
        GameObject folder = GameObject.Find("ExplorePickups");
        if (folder == null)
        {
            folder = new GameObject("ExplorePickups");
            Undo.RegisterCreatedObjectUndo(folder, "Create ExplorePickups");
            if (root != null)
                folder.transform.SetParent(root, true);
        }

        Vector3 basePos = player.transform.position + player.transform.forward * 3f;
        int placed = 0;
        foreach (var guid in guids)
        {
            string path = AssetDatabase.GUIDToAssetPath(guid);
            var item = AssetDatabase.LoadAssetAtPath<ItemData>(path);
            if (item == null) continue;

            string id = item.clueId ?? "";
            if (id == "clue_diary" || id == "clue_waiting_ticket" || id == "clue_chocolate_wrapper")
                continue;

            string goName = item.itemName;
            if (folder.transform.Find(goName) != null) continue;

            var go = new GameObject(goName);
            Undo.RegisterCreatedObjectUndo(go, "Create explore pickup");
            go.transform.SetParent(folder.transform, true);
            go.transform.position = basePos + new Vector3((placed % 3) * 2.2f, 0.5f, (placed / 3) * 2.2f);

            var sphere = go.AddComponent<SphereCollider>();
            sphere.isTrigger = true;
            sphere.radius = 1.4f;

            var marker = GameObject.CreatePrimitive(PrimitiveType.Sphere);
            Undo.RegisterCreatedObjectUndo(marker, "Create marker");
            marker.name = "Visual";
            marker.transform.SetParent(go.transform, false);
            marker.transform.localScale = Vector3.one * 0.45f;
            Object.DestroyImmediate(marker.GetComponent<Collider>());

            var promptGo = new GameObject("Prompt");
            promptGo.transform.SetParent(go.transform, false);
            promptGo.transform.localPosition = Vector3.up * 1.1f;
            var tmp = promptGo.AddComponent<TextMeshPro>();
            tmp.text = "Press E — " + item.itemName;
            tmp.fontSize = 2.5f;
            tmp.alignment = TextAlignmentOptions.Center;
            tmp.color = new Color(0.55f, 0.85f, 0.75f, 1f);
            promptGo.SetActive(false);

            var explore = go.AddComponent<ExploreInteractable>();
            explore.itemData = item;
            explore.interactKey = KeyCode.E;
            explore.worldVisual = marker;
            explore.promptRoot = promptGo;
            explore.promptWorldText = tmp;
            explore.promptMessage = "Press E — " + item.itemName;

            placed++;
            if (placed >= 5) break;
        }

        var boot = Object.FindObjectOfType<CluePanelBootstrap>();
        if (boot != null)
        {
            Undo.RecordObject(boot, "Set discovery starting items");
            boot.discoveryMode = true;
            var start = new System.Collections.Generic.List<ItemData>();
            if (boot.objectItems != null)
            {
                foreach (var it in boot.objectItems)
                {
                    if (it == null) continue;
                    if (it.clueId == "clue_diary" || it.clueId == "clue_waiting_ticket" ||
                        it.clueId == "clue_chocolate_wrapper" || it.clueId == "clue_pen")
                        start.Add(it);
                }
            }
            boot.startingObjectItems = start.ToArray();
            EditorUtility.SetDirty(boot);
        }

        SetupPopup();
        Selection.activeGameObject = folder;
        Debug.Log($"[YFX] Placed {placed} explore pickups. Walk near, press E → ClueDisplay.");
    }
}
#endif
