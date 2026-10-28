using System.Collections.Generic;
using UnityEditor;
using UnityEditor.Events;
using UnityEditor.SceneManagement;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.InputSystem.UI;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

/// <summary>
/// Authors the game UI into SampleScene. It runs in the editor only and never creates UI in Play Mode.
/// Use the menu items below; this script does not auto-modify scenes on editor load.
/// </summary>
public static class CampusSceneUiBuilder
{
    private const string ScenePath = "Assets/Scenes/SampleScene.unity";

    [MenuItem("Tools/Campus Shop/Generate UI In SampleScene")]
    public static void GenerateInSampleScene()
    {
        var scene = SceneManager.GetActiveScene();
        if (scene.path != ScenePath)
            scene = EditorSceneManager.OpenScene(ScenePath, OpenSceneMode.Single);

        Generate(scene);
    }

    [MenuItem("Tools/Campus Shop/Ensure Trade Choice Buttons")]
    public static void EnsureTradeChoiceButtons()
    {
        var scene = EditorSceneManager.OpenScene("Assets/Scenes/SampleScene.unity");
        var root = GameObject.Find("CampusGameUI");
        if (root == null)
        {
            Debug.LogError("CampusGameUI was not found in SampleScene.");
            return;
        }

        var tradePanel = root.transform.Find("ClassroomTradePanel");
        if (tradePanel == null)
        {
            Debug.LogError("ClassroomTradePanel was not found. CustomerArea was left untouched.");
            return;
        }

        var interact = tradePanel.Find("TradeInteract");
        if (interact == null)
        {
            var interactObject = new GameObject("TradeInteract", typeof(RectTransform));
            interactObject.transform.SetParent(tradePanel, false);
            var interactRect = interactObject.GetComponent<RectTransform>();
            interactRect.anchorMin = new Vector2(.015f, .48f);
            interactRect.anchorMax = new Vector2(.31f, .86f);
            interactRect.offsetMin = Vector2.zero;
            interactRect.offsetMax = Vector2.zero;
            interact = interactObject.transform;
        }

        EnsureNamedTradeButton(interact, "同意", "Accept", new Vector2(.26f, .18f));
        EnsureNamedTradeButton(interact, "拒绝", "Decline", new Vector2(.74f, .18f));

        var legacySell = interact.Find("卖");
        if (legacySell != null)
            legacySell.gameObject.SetActive(false);
        var legacyNoSell = interact.Find("不卖");
        if (legacyNoSell != null)
            legacyNoSell.gameObject.SetActive(false);

        if (interact.Find("CustomerRequest") == null)
        {
            var bubble = CreatePanel("CustomerRequest", interact, new Color(.08f, .12f, .18f, .92f));
            bubble.GetComponent<Image>().raycastTarget = false;
            SetAnchors(bubble.GetComponent<RectTransform>(), new Vector2(0f, .42f), new Vector2(1f, 1f), Vector2.zero, Vector2.zero);
            var text = CreateText("Text", bubble.transform, 20, TextAnchor.MiddleCenter);
            text.text = "Customer request";
            text.horizontalOverflow = HorizontalWrapMode.Wrap;
            text.verticalOverflow = VerticalWrapMode.Overflow;
            text.raycastTarget = false;
            SetAnchors(text.rectTransform, Vector2.zero, Vector2.one, new Vector2(10f, 6f), new Vector2(-10f, -6f));
            bubble.SetActive(true);
        }

        SetButtonDisplayText(interact.Find("同意"), "Accept");
        SetButtonDisplayText(interact.Find("拒绝"), "Decline");
        interact.Find("同意")?.gameObject.SetActive(true);
        interact.Find("拒绝")?.gameObject.SetActive(true);

        EditorSceneManager.MarkSceneDirty(scene);
        EditorSceneManager.SaveScene(scene);
        Debug.Log("TradeInteract uses one button pair: Accept / Decline (scene objects 同意 / 拒绝). Move them under ClassroomTradePanel/TradeInteract.");
    }

    private static void EnsureNamedTradeButton(Transform parent, string objectName, string displayText, Vector2 anchor)
    {
        var existing = parent.Find(objectName);
        if (existing != null)
        {
            SetButtonDisplayText(existing, displayText);
            return;
        }

        var panel = CreatePanel(objectName, parent, new Color(.16f, .36f, .55f, .97f));
        var rect = panel.GetComponent<RectTransform>();
        rect.anchorMin = anchor;
        rect.anchorMax = anchor;
        rect.pivot = new Vector2(.5f, .5f);
        rect.sizeDelta = new Vector2(110f, 40f);
        var button = panel.AddComponent<Button>();
        button.targetGraphic = panel.GetComponent<Image>();
        var text = CreateText("Label", panel.transform, 20, TextAnchor.MiddleCenter);
        text.text = displayText;
        SetAnchors(text.rectTransform, Vector2.zero, Vector2.one, Vector2.zero, Vector2.zero);
        panel.SetActive(true);
    }

    private static void SetButtonDisplayText(Transform buttonTransform, string displayText)
    {
        if (buttonTransform == null)
            return;

        var label = buttonTransform.GetComponentInChildren<Text>(true);
        if (label != null)
            label.text = displayText;
    }

    [MenuItem("Tools/Campus Shop/Add Or Update Classroom Trade UI")]
    public static void AddOrUpdateClassroomTradeUi()
    {
        var scene = SceneManager.GetActiveScene();
        if (scene.path != ScenePath)
            scene = EditorSceneManager.OpenScene(ScenePath, OpenSceneMode.Single);

        Generate(scene);
    }

    [MenuItem("Tools/Campus Shop/Apply Classroom Trade Visual Cleanup")]
    public static void ApplyClassroomTradeVisualCleanup()
    {
        var scene = SceneManager.GetActiveScene();
        if (scene.path != ScenePath)
            scene = EditorSceneManager.OpenScene(ScenePath, OpenSceneMode.Single);

        var root = GameObject.Find("CampusGameUI");
        if (root != null)
            EnsureClassroomTrade(root, scene);
    }

    private static void Generate(Scene scene)
    {
        var existing = GameObject.Find("CampusGameUI");
        if (existing != null)
        {
            EnsureClassroomTrade(existing, scene);
            return;
        }

        EnsureEventSystem();

        var root = new GameObject("CampusGameUI", typeof(RectTransform), typeof(Canvas), typeof(CanvasScaler), typeof(GraphicRaycaster));
        SceneManager.MoveGameObjectToScene(root, scene);
        var canvas = root.GetComponent<Canvas>();
        canvas.renderMode = RenderMode.ScreenSpaceOverlay;
        canvas.sortingOrder = 100;
        var scaler = root.GetComponent<CanvasScaler>();
        scaler.uiScaleMode = CanvasScaler.ScaleMode.ScaleWithScreenSize;
        scaler.referenceResolution = new Vector2(1920f, 1080f);

        var controller = root.AddComponent<CampusGameBootstrap>();
        var references = root.AddComponent<CampusUiReferences>();
        BuildHud(root.transform, controller, references);
        BuildMap(root.transform, controller, references);
        BuildDialogue(root.transform, controller, references);
        BuildClassroomTrade(root.transform, controller, references);

        EditorUtility.SetDirty(root);
        EditorSceneManager.MarkSceneDirty(scene);
        EditorSceneManager.SaveScene(scene);
        Selection.activeGameObject = root;
    }

    private static void EnsureClassroomTrade(GameObject root, Scene scene)
    {
        var references = root.GetComponent<CampusUiReferences>();
        var controller = root.GetComponent<CampusGameBootstrap>();
        if (references == null || controller == null)
            return;

        var existingTradePanel = root.transform.Find("ClassroomTradePanel");
        if (existingTradePanel == null)
            BuildClassroomTrade(root.transform, controller, references);
        else
            UpdateClassroomTradeVisuals(existingTradePanel, references);
        EditorUtility.SetDirty(root);
        EditorSceneManager.MarkSceneDirty(scene);
        EditorSceneManager.SaveScene(scene);
        Selection.activeGameObject = root;
    }

    private static void EnsureEventSystem()
    {
        if (Object.FindFirstObjectByType<EventSystem>() != null)
            return;

        var eventSystem = new GameObject("EventSystem", typeof(EventSystem), typeof(InputSystemUIInputModule));
        Undo.RegisterCreatedObjectUndo(eventSystem, "Create EventSystem");
    }

    private static void BuildHud(Transform parent, CampusGameBootstrap controller, CampusUiReferences references)
    {
        var topBar = CreatePanel("TopBar", parent, new Color(.04f, .08f, .14f, .82f));
        SetAnchors(topBar.GetComponent<RectTransform>(), new Vector2(0f, 1f), new Vector2(1f, 1f), new Vector2(0f, -72f), Vector2.zero);
        references.DayText = CreateText("Day", topBar.transform, 30, TextAnchor.MiddleLeft);
        SetAnchors(references.DayText.rectTransform, new Vector2(0f, 0f), new Vector2(.18f, 1f), new Vector2(28f, 0f), Vector2.zero);
        references.LocationText = CreateText("Location", topBar.transform, 28, TextAnchor.MiddleCenter);
        SetAnchors(references.LocationText.rectTransform, new Vector2(.18f, 0f), new Vector2(.44f, 1f), Vector2.zero, Vector2.zero);
        references.MoneyText = CreateText("Money", topBar.transform, 30, TextAnchor.MiddleRight);
        references.MoneyText.color = new Color(1f, .86f, .35f);
        SetAnchors(references.MoneyText.rectTransform, new Vector2(.72f, 0f), Vector2.one, Vector2.zero, new Vector2(-30f, 0f));

        references.DebugPanel = CreatePanel("DebugStagePanel", parent, new Color(.09f, .13f, .20f, .93f));
        SetAnchors(references.DebugPanel.GetComponent<RectTransform>(), new Vector2(.22f, .82f), new Vector2(.78f, .92f), Vector2.zero, Vector2.zero);
        var title = CreateText("DebugTitle", references.DebugPanel.transform, 17, TextAnchor.MiddleLeft);
        title.text = "Identity · School stage (dialogue does not advance grade)";
        title.color = new Color(.55f, .84f, 1f);
        SetAnchors(title.rectTransform, new Vector2(0f, .56f), new Vector2(.35f, 1f), new Vector2(18f, 0f), Vector2.zero);
        references.PlayerText = CreateText("Player", references.DebugPanel.transform, 20, TextAnchor.MiddleLeft);
        SetAnchors(references.PlayerText.rectTransform, new Vector2(.35f, .56f), new Vector2(.55f, 1f), Vector2.zero, Vector2.zero);
        AddButton("Swap gender", references.DebugPanel.transform, new Vector2(.62f, .78f), new Vector2(92f, 34f), controller.TogglePlayerIdentityFromUi);
        AddButton("Elementary", references.DebugPanel.transform, new Vector2(.72f, .78f), new Vector2(62f, 34f), controller.SetElementaryFromUi);
        AddButton("Middle", references.DebugPanel.transform, new Vector2(.80f, .78f), new Vector2(62f, 34f), controller.SetMiddleFromUi);
        AddButton("High", references.DebugPanel.transform, new Vector2(.88f, .78f), new Vector2(62f, 34f), controller.SetHighFromUi);
        references.FavorText = CreateText("Favor", references.DebugPanel.transform, 17, TextAnchor.MiddleLeft);
        SetAnchors(references.FavorText.rectTransform, new Vector2(0f, 0f), new Vector2(.64f, .55f), new Vector2(18f, 0f), Vector2.zero);
        references.ObjectiveText = CreateText("Objective", references.DebugPanel.transform, 17, TextAnchor.MiddleRight);
        SetAnchors(references.ObjectiveText.rectTransform, new Vector2(.34f, 0f), new Vector2(.83f, .55f), Vector2.zero, new Vector2(-8f, 0f));
        AddButton("End Day", references.DebugPanel.transform, new Vector2(.91f, .27f), new Vector2(104f, 34f), controller.AdvanceDayFromUi);

        var hint = CreateText("Hint", parent, 21, TextAnchor.MiddleCenter);
        hint.text = "Open the map from the bottom-right; Talk opens dialogue at your current location";
        hint.color = new Color(1f, 1f, 1f, .9f);
        SetAnchors(hint.rectTransform, new Vector2(.20f, 0f), new Vector2(.80f, 0f), new Vector2(0f, 22f), new Vector2(0f, 64f));
        AddButton("Talk", parent, new Vector2(.92f, .18f), new Vector2(132f, 56f), controller.OpenLocationDialogue);
        AddButton("Map", parent, new Vector2(.92f, .10f), new Vector2(132f, 56f), controller.ToggleMapFromUi);
    }

    private static void BuildMap(Transform parent, CampusGameBootstrap controller, CampusUiReferences references)
    {
        references.MapOverlay = CreatePanel("MapOverlay", parent, new Color(0f, 0f, 0f, .62f));
        SetAnchors(references.MapOverlay.GetComponent<RectTransform>(), Vector2.zero, Vector2.one, Vector2.zero, Vector2.zero);
        var mapPanel = CreatePanel("CampusMap", references.MapOverlay.transform, new Color(.08f, .14f, .22f, .98f));
        SetAnchors(mapPanel.GetComponent<RectTransform>(), new Vector2(.14f, .14f), new Vector2(.86f, .86f), Vector2.zero, Vector2.zero);
        var mapTitle = CreateText("MapTitle", mapPanel.transform, 36, TextAnchor.MiddleCenter);
        mapTitle.text = "Campus Map";
        mapTitle.color = new Color(.62f, .88f, 1f);
        SetAnchors(mapTitle.rectTransform, new Vector2(.2f, .86f), new Vector2(.8f, 1f), Vector2.zero, Vector2.zero);
        var subTitle = CreateText("MapSubTitle", mapPanel.transform, 18, TextAnchor.MiddleCenter);
        subTitle.text = "Visit any area freely; the classroom matches your current school stage";
        SetAnchors(subTitle.rectTransform, new Vector2(.15f, .79f), new Vector2(.85f, .87f), Vector2.zero, Vector2.zero);

        var labels = new[] { "Cafeteria", "Library", "Playground", "Art Room", "Classroom", "Dorm", "Restroom" };
        references.MapButtons = new Button[labels.Length];
        for (var i = 0; i < labels.Length; i++)
        {
            var column = i % 3;
            var row = i / 3;
            var button = CreateButton(labels[i], mapPanel.transform, new Vector2(.23f + column * .27f, .64f - row * .25f), new Vector2(210f, 100f));
            UnityEventTools.AddIntPersistentListener(button.onClick, controller.SelectMapLocation, i);
            references.MapButtons[i] = button;
        }
        AddButton("Close", mapPanel.transform, new Vector2(.88f, .91f), new Vector2(100f, 42f), controller.CloseMapFromUi);
        references.MapOverlay.SetActive(false);
    }

    private static void BuildDialogue(Transform parent, CampusGameBootstrap controller, CampusUiReferences references)
    {
        references.DialoguePanel = CreatePanel("DialoguePanel", parent, new Color(.06f, .09f, .15f, .94f));
        SetAnchors(references.DialoguePanel.GetComponent<RectTransform>(), new Vector2(.08f, .06f), new Vector2(.92f, .31f), Vector2.zero, Vector2.zero);
        references.ActorPortrait = CreateImage("NpcPortrait", references.DialoguePanel.transform);
        references.ActorPortrait.preserveAspect = true;
        references.ActorPortrait.raycastTarget = false;
        var portraitRect = references.ActorPortrait.rectTransform;
        portraitRect.anchorMin = new Vector2(.75f, .05f);
        portraitRect.anchorMax = new Vector2(.75f, .05f);
        portraitRect.anchoredPosition = new Vector2(-989f, 59.383f);
        portraitRect.sizeDelta = new Vector2(1162.3356f, 2872f);
        portraitRect.localScale = new Vector3(.5f, .5f, .5f);
        references.SpeakerText = CreateText("Speaker", references.DialoguePanel.transform, 30, TextAnchor.MiddleLeft);
        references.SpeakerText.color = new Color(.45f, .85f, 1f);
        SetAnchors(references.SpeakerText.rectTransform, new Vector2(.05f, .70f), new Vector2(.70f, .94f), Vector2.zero, Vector2.zero);
        references.DialogueText = CreateText("Dialogue", references.DialoguePanel.transform, 29, TextAnchor.UpperLeft);
        references.DialogueText.horizontalOverflow = HorizontalWrapMode.Wrap;
        references.DialogueText.verticalOverflow = VerticalWrapMode.Overflow;
        SetAnchors(references.DialogueText.rectTransform, new Vector2(.05f, .34f), new Vector2(.70f, .70f), Vector2.zero, Vector2.zero);
        references.ProgressText = CreateText("Progress", references.DialoguePanel.transform, 18, TextAnchor.LowerLeft);
        references.ProgressText.color = new Color(.76f, .79f, .86f);
        SetAnchors(references.ProgressText.rectTransform, new Vector2(.05f, .20f), new Vector2(.70f, .34f), Vector2.zero, Vector2.zero);
        references.ContinueButton = AddButton("Continue", references.DialoguePanel.transform, new Vector2(.83f, .14f), new Vector2(126f, 46f), controller.AdvanceDialogueFromUi);
        references.CloseButton = AddButton("Finish", references.DialoguePanel.transform, new Vector2(.70f, .14f), new Vector2(104f, 46f), controller.CloseDialogueFromUi);
        references.ChoiceButtons = new[]
        {
            CreateButton("ChoiceA", references.DialoguePanel.transform, new Vector2(.39f, .16f), new Vector2(500f, 46f)),
            CreateButton("ChoiceB", references.DialoguePanel.transform, new Vector2(.39f, .05f), new Vector2(500f, 46f))
        };
        references.DialoguePanel.SetActive(false);
    }

    private static void BuildClassroomTrade(Transform parent, CampusGameBootstrap controller, CampusUiReferences references)
    {
        references.ClassroomTradePanel = new GameObject("ClassroomTradePanel", typeof(RectTransform)).transform.gameObject;
        references.ClassroomTradePanel.transform.SetParent(parent, false);
        var tradePanelRect = references.ClassroomTradePanel.GetComponent<RectTransform>();
        tradePanelRect.anchorMin = new Vector2(.03f, .12f);
        tradePanelRect.anchorMax = new Vector2(.94f, .86f);
        tradePanelRect.anchoredPosition = new Vector2(28.8f, 10.794f);
        tradePanelRect.sizeDelta = new Vector2(172.8f, 280.67f);

        var customerPanel = new GameObject("CustomerArea", typeof(RectTransform));
        customerPanel.transform.SetParent(references.ClassroomTradePanel.transform, false);
        var customerRect = customerPanel.GetComponent<RectTransform>();
        customerRect.anchorMin = new Vector2(0f, .02f);
        customerRect.anchorMax = new Vector2(.29f, .98f);
        customerRect.anchoredPosition = new Vector2(45.218f, 0f);
        customerRect.sizeDelta = new Vector2(90.436f, 0f);
        references.CustomerPortrait = CreateImage("CustomerPortrait", customerPanel.transform);
        references.CustomerPortrait.preserveAspect = true;
        references.CustomerPortrait.raycastTarget = false;
        SetAnchors(references.CustomerPortrait.rectTransform, new Vector2(.03f, .03f), new Vector2(.97f, .97f), Vector2.zero, Vector2.zero);
        references.CustomerNameText = null;
        references.CustomerRequestText = null;

        var shopPanel = CreatePanel("ShopBag", references.ClassroomTradePanel.transform, Color.white);
        shopPanel.GetComponent<Image>().sprite = LoadResourceSprite("BagBack");
        shopPanel.GetComponent<Image>().preserveAspect = false;
        var shopRect = shopPanel.GetComponent<RectTransform>();
        shopRect.anchorMin = new Vector2(.32f, 0f);
        shopRect.anchorMax = new Vector2(1f, 1f);
        shopRect.anchoredPosition = new Vector2(-.000061f, 0f);
        shopRect.sizeDelta = new Vector2(-103.355f, -174.412f);

        var scrollRoot = new GameObject("InventoryScrollView", typeof(RectTransform), typeof(Image), typeof(ScrollRect));
        scrollRoot.transform.SetParent(shopPanel.transform, false);
        var scrollRect = scrollRoot.GetComponent<ScrollRect>();
        scrollRoot.GetComponent<Image>().color = new Color(1f, 1f, 1f, 0f);
        var scrollRectTransform = scrollRoot.GetComponent<RectTransform>();
        scrollRectTransform.anchorMin = new Vector2(.08f, .18f);
        scrollRectTransform.anchorMax = new Vector2(.92f, .83f);
        scrollRectTransform.anchoredPosition = new Vector2(3.230011f, -60.204f);
        scrollRectTransform.sizeDelta = new Vector2(116.274f, 120.41f);
        // RectMask2D clips the scroll area without relying on the Image shader's stencil support.
        // This keeps ordinary UI Image materials visible inside the inventory.
        var viewport = new GameObject("Viewport", typeof(RectTransform), typeof(Image), typeof(RectMask2D));
        viewport.transform.SetParent(scrollRoot.transform, false);
        viewport.GetComponent<Image>().color = new Color(1f, 1f, 1f, 0f);
        SetAnchors(viewport.GetComponent<RectTransform>(), Vector2.zero, Vector2.one, Vector2.zero, Vector2.zero);
        var content = new GameObject("Content", typeof(RectTransform), typeof(GridLayoutGroup), typeof(ContentSizeFitter));
        content.transform.SetParent(viewport.transform, false);
        var contentRect = content.GetComponent<RectTransform>();
        contentRect.anchorMin = new Vector2(.5f, 1f);
        contentRect.anchorMax = new Vector2(.5f, 1f);
        contentRect.pivot = new Vector2(.5f, 1f);
        contentRect.sizeDelta = new Vector2(510f, 0f);
        var grid = content.GetComponent<GridLayoutGroup>();
        grid.cellSize = new Vector2(230f, 150f);
        grid.spacing = new Vector2(22f, 20f);
        grid.padding = new RectOffset(14, 14, 14, 14);
        grid.constraint = GridLayoutGroup.Constraint.FixedColumnCount;
        grid.constraintCount = 2;
        grid.childAlignment = TextAnchor.UpperCenter;
        content.GetComponent<ContentSizeFitter>().verticalFit = ContentSizeFitter.FitMode.PreferredSize;
        scrollRect.viewport = viewport.GetComponent<RectTransform>();
        scrollRect.content = contentRect;
        scrollRect.horizontal = false;
        scrollRect.vertical = true;
        scrollRect.scrollSensitivity = 24f;

        var tooltip = BuildItemTooltip(references.ClassroomTradePanel.transform, out var tooltipText);

        var itemNames = new[] { "Cucumber Chips", "Spicy Gluten Snacks", "Diamond Sword Toy", "Transforming Robot", "Ninja Building Blocks", "RC Off-Road Truck" };
        var itemSprites = new[] { "image 16", "image 17", "image 18", "image 19", "image 20", "image 22" };
        references.InventoryButtons = new Button[itemNames.Length];
        references.InventoryItemImages = new Image[itemNames.Length];
        references.InventoryQuantityTexts = new Text[0];
        for (var i = 0; i < itemNames.Length; i++)
        {
            var itemButton = CreateButton(itemNames[i], content.transform, Vector2.zero, new Vector2(230f, 150f));
            Object.DestroyImmediate(itemButton.GetComponent<Image>());
            itemButton.GetComponent<RectTransform>().anchorMin = new Vector2(.5f, .5f);
            itemButton.GetComponent<RectTransform>().anchorMax = new Vector2(.5f, .5f);
            var label = itemButton.GetComponentInChildren<Text>();
            Object.DestroyImmediate(label.gameObject);
            var icon = CreateImage("ItemIcon", itemButton.transform);
            icon.sprite = LoadResourceSprite(itemSprites[i]);
            icon.preserveAspect = true;
            icon.raycastTarget = true;
            SetAnchors(icon.rectTransform, new Vector2(.05f, .05f), new Vector2(.95f, .95f), Vector2.zero, Vector2.zero);
            itemButton.targetGraphic = icon;
            var hoverFeedback = icon.gameObject.AddComponent<ItemHoverFeedback>();
            hoverFeedback.ItemName = itemNames[i];
            hoverFeedback.Tooltip = tooltip;
            hoverFeedback.TooltipText = tooltipText;
            var index = i;
            UnityEventTools.AddIntPersistentListener(itemButton.onClick, controller.SellItemToCustomerFromUi, index);
            references.InventoryButtons[i] = itemButton;
            references.InventoryItemImages[i] = icon;
        }

        references.TradeStatusText = null;
        references.RefreshCustomerButton = null;
        references.ClassroomTradePanel.SetActive(false);
    }

    private static RectTransform BuildItemTooltip(Transform parent, out Text tooltipText)
    {
        var tooltip = CreatePanel("ItemTooltip", parent, new Color(.03f, .05f, .08f, .94f));
        var tooltipRect = tooltip.GetComponent<RectTransform>();
        tooltipRect.anchorMin = new Vector2(.5f, .5f);
        tooltipRect.anchorMax = new Vector2(.5f, .5f);
        tooltipRect.pivot = new Vector2(0f, 1f);
        tooltipRect.sizeDelta = new Vector2(210f, 46f);
        tooltipText = CreateText("Text", tooltip.transform, 19, TextAnchor.MiddleCenter);
        SetAnchors(tooltipText.rectTransform, Vector2.zero, Vector2.one, new Vector2(8f, 4f), new Vector2(-8f, -4f));
        tooltip.SetActive(false);
        return tooltipRect;
    }

    private static void UpdateClassroomTradeVisuals(Transform tradePanel, CampusUiReferences references)
    {
        references.ClassroomTradePanel = tradePanel.gameObject;
        DestroyNamedChildren(tradePanel, "CustomerName", "CustomerRequest", "TradeStatus", "RefreshCustomer", "ShopTitle", "ItemInfo", "刷新顾客");

        var customerArea = FindDescendant(tradePanel, "CustomerArea");
        if (customerArea != null)
        {
            var portrait = FindDescendant(customerArea, "CustomerPortrait");
            references.CustomerPortrait = portrait != null ? portrait.GetComponent<Image>() : null;
            if (references.CustomerPortrait != null)
            {
                references.CustomerPortrait.raycastTarget = false;
                references.CustomerPortrait.preserveAspect = true;
            }
        }

        references.CustomerNameText = null;
        references.CustomerRequestText = null;
        references.TradeStatusText = null;
        references.RefreshCustomerButton = null;

        var tooltip = FindDescendant(tradePanel, "ItemTooltip");
        var tooltipRect = tooltip != null ? tooltip.GetComponent<RectTransform>() : BuildItemTooltip(tradePanel, out _);
        var tooltipText = tooltipRect.GetComponentInChildren<Text>(true);
        tooltipRect.gameObject.SetActive(false);

        var content = FindDescendant(tradePanel, "Content");
        var scrollView = FindDescendant(tradePanel, "InventoryScrollView");
        if (scrollView != null)
        {
            var scrollBackground = scrollView.GetComponent<Image>();
            if (scrollBackground != null)
                scrollBackground.color = new Color(1f, 1f, 1f, 0f);
            var viewport = FindDescendant(scrollView, "Viewport");
            var viewportBackground = viewport != null ? viewport.GetComponent<Image>() : null;
            if (viewportBackground != null)
                viewportBackground.color = new Color(1f, 1f, 1f, 0f);
            if (viewport != null)
            {
                var legacyMask = viewport.GetComponent<Mask>();
                if (legacyMask != null)
                    Object.DestroyImmediate(legacyMask);
                if (viewport.GetComponent<RectMask2D>() == null)
                    viewport.gameObject.AddComponent<RectMask2D>();
            }
        }
        var buttons = content != null ? content.GetComponentsInChildren<Button>(true) : new Button[0];
        var itemNames = new[] { "Cucumber Chips", "Spicy Gluten Snacks", "Diamond Sword Toy", "Transforming Robot", "Ninja Building Blocks", "RC Off-Road Truck" };
        var itemImages = new List<Image>();
        for (var i = 0; i < buttons.Length; i++)
        {
            var button = buttons[i];
            var buttonBackground = button.GetComponent<Image>();
            if (buttonBackground != null)
                Object.DestroyImmediate(buttonBackground);
            var iconTransform = FindDescendant(button.transform, "ItemIcon");
            var icon = iconTransform != null ? iconTransform.GetComponent<Image>() : null;
            if (icon == null)
                continue;

            icon.raycastTarget = true;
            icon.preserveAspect = true;
            icon.material = null;
            SetAnchors(icon.rectTransform, new Vector2(.05f, .05f), new Vector2(.95f, .95f), Vector2.zero, Vector2.zero);
            button.targetGraphic = icon;
            var hover = icon.GetComponent<ItemHoverFeedback>();
            if (hover == null)
                hover = icon.gameObject.AddComponent<ItemHoverFeedback>();
            hover.ItemName = itemNames[Mathf.Min(i, itemNames.Length - 1)];
            hover.Tooltip = tooltipRect;
            hover.TooltipText = tooltipText;
            itemImages.Add(icon);
        }

        references.InventoryButtons = buttons;
        references.InventoryItemImages = itemImages.ToArray();
        references.InventoryQuantityTexts = new Text[0];
    }

    private static void DestroyNamedChildren(Transform root, params string[] names)
    {
        var allChildren = root.GetComponentsInChildren<Transform>(true);
        foreach (var child in allChildren)
        {
            if (child == root)
                continue;
            foreach (var name in names)
            {
                if (child.name == name)
                {
                    Object.DestroyImmediate(child.gameObject);
                    break;
                }
            }
        }
    }

    private static Transform FindDescendant(Transform root, string name)
    {
        foreach (var child in root.GetComponentsInChildren<Transform>(true))
        {
            if (child.name == name)
                return child;
        }

        return null;
    }

    private static Sprite LoadResourceSprite(string resourceName)
    {
        var assets = AssetDatabase.LoadAllAssetsAtPath("Assets/Resources/" + resourceName + ".png");
        foreach (var asset in assets)
        {
            var sprite = asset as Sprite;
            if (sprite != null)
                return sprite;
        }

        return null;
    }

    private static GameObject CreatePanel(string name, Transform parent, Color color)
    {
        var panel = new GameObject(name, typeof(RectTransform), typeof(Image));
        panel.transform.SetParent(parent, false);
        panel.GetComponent<Image>().color = color;
        return panel;
    }

    private static Image CreateImage(string name, Transform parent)
    {
        var image = new GameObject(name, typeof(RectTransform), typeof(Image)).GetComponent<Image>();
        image.transform.SetParent(parent, false);
        return image;
    }

    private static Text CreateText(string name, Transform parent, int fontSize, TextAnchor alignment)
    {
        var text = new GameObject(name, typeof(RectTransform), typeof(Text)).GetComponent<Text>();
        text.transform.SetParent(parent, false);
        text.font = Resources.GetBuiltinResource<Font>("LegacyRuntime.ttf");
        text.fontSize = fontSize;
        text.alignment = alignment;
        text.color = Color.white;
        return text;
    }

    private static Button CreateButton(string label, Transform parent, Vector2 anchor, Vector2 size)
    {
        var panel = CreatePanel(label, parent, new Color(.16f, .36f, .55f, .97f));
        var rect = panel.GetComponent<RectTransform>();
        rect.anchorMin = anchor;
        rect.anchorMax = anchor;
        rect.pivot = new Vector2(.5f, .5f);
        rect.sizeDelta = size;
        var button = panel.AddComponent<Button>();
        button.targetGraphic = panel.GetComponent<Image>();
        var text = CreateText("Label", panel.transform, 18, TextAnchor.MiddleCenter);
        text.text = label;
        SetAnchors(text.rectTransform, Vector2.zero, Vector2.one, Vector2.zero, Vector2.zero);
        return button;
    }

    private static Button AddButton(string label, Transform parent, Vector2 anchor, Vector2 size, UnityEngine.Events.UnityAction action)
    {
        var button = CreateButton(label, parent, anchor, size);
        UnityEventTools.AddPersistentListener(button.onClick, action);
        return button;
    }

    private static void SetAnchors(RectTransform rect, Vector2 anchorMin, Vector2 anchorMax, Vector2 offsetMin, Vector2 offsetMax)
    {
        rect.anchorMin = anchorMin;
        rect.anchorMax = anchorMax;
        rect.offsetMin = offsetMin;
        rect.offsetMax = offsetMax;
    }
}
