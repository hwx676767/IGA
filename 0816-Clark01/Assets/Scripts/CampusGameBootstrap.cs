using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.UI;

/// <summary>
/// Story and classroom-trade controller for the campus convenience-store game.
/// Non-classroom locations only take requests; sales and barter happen in classrooms.
/// </summary>
public sealed class CampusGameBootstrap : MonoBehaviour
{
    private enum SchoolStage { Elementary, Middle, High }

    private sealed class Location
    {
        public readonly string SceneObjectName;
        public readonly string Label;
        public readonly string ActorId;
        public readonly SchoolStage? RequiredStage;

        public Location(string sceneObjectName, string label, string actorId, SchoolStage? requiredStage = null)
        {
            SceneObjectName = sceneObjectName;
            Label = label;
            ActorId = actorId;
            RequiredStage = requiredStage;
        }
    }

    private sealed class Actor
    {
        public readonly string Id;
        public readonly string Name;
        public readonly string Faction;
        public readonly string PortraitResource;
        public readonly SchoolStage? Stage;

        public Actor(string id, string name, string faction, string portraitResource, SchoolStage? stage = null)
        {
            Id = id;
            Name = name;
            Faction = faction;
            PortraitResource = portraitResource;
            Stage = stage;
        }
    }

    private enum VisitorKind { CustomerBuy, Barter, VendorSell }

    private readonly List<Location> locations = new List<Location>
    {
        new Location("场景食堂_0", "Cafeteria", "trend"),
        new Location("场景图书馆_0", "Library", "scholar"),
        new Location("场景操场_0", "Playground", "athlete"),
        new Location("场景美术教室_0", "Art Room", "anime"),
        new Location("场景教室1_0", "Classroom", "scholar", SchoolStage.Elementary),
        new Location("场景教室2_0", "Classroom", "trend", SchoolStage.Middle),
        new Location("场景教室3_0", "Classroom", "anime", SchoolStage.High),
        new Location("场景宿舍_0", "Dorm", "anime"),
        new Location("场景厕所_0", "Restroom", "trend")
    };

    private readonly Dictionary<string, Actor> actors = new Dictionary<string, Actor>
    {
        { "scholar", new Actor("scholar", "Lin Zhiyuan", "Bookworm / Scholar", "NPC书呆子", SchoolStage.Elementary) },
        { "athlete", new Actor("athlete", "Zhou Jin", "Athlete", "NPC体育生") },
        { "trend", new Actor("trend", "Li Mei", "Campus Trendsetter", "NPC非主流", SchoolStage.Middle) },
        { "anime", new Actor("anime", "Xia Cheng", "Anime Fan", "NPC二刺螈", SchoolStage.High) }
    };

    private readonly CampusTradeItem[] catalog = CampusItemCatalog.Items;
    private readonly Dictionary<string, GameObject> sceneObjects = new Dictionary<string, GameObject>();
    private readonly Dictionary<string, Sprite> portraits = new Dictionary<string, Sprite>();
    private readonly Dictionary<string, Sprite> tradeSprites = new Dictionary<string, Sprite>();
    private readonly Dictionary<string, int> favor = new Dictionary<string, int>
    {
        { "scholar", 0 }, { "athlete", 0 }, { "trend", 0 }, { "anime", 0 }
    };
    private readonly HashSet<string> completedBeats = new HashSet<string>();
    private readonly HashSet<string> deliveredActorQuests = new HashSet<string>();
    private readonly Dictionary<string, string> wantedByActor = new Dictionary<string, string>();
    private readonly Dictionary<string, float> actorCooldownUntil = new Dictionary<string, float>();

    private CampusUiReferences uiReferences;
    private Text dayText;
    private Text locationText;
    private Text playerText;
    private Text moneyText;
    private Text favorText;
    private Text objectiveText;
    private GameObject debugPanel;
    private GameObject mapOverlay;
    private GameObject dialoguePanel;
    private Image actorPortrait;
    private Text speakerText;
    private Text dialogueText;
    private Text progressText;
    private Button continueButton;
    private Button closeButton;
    private readonly List<Button> mapButtons = new List<Button>();
    private readonly List<Button> choiceButtons = new List<Button>();
    private GameObject classroomTradePanel;
    private GameObject talkButton;
    private Image customerPortrait;
    private Text customerNameText;
    private Text customerRequestText;
    private Text tradeStatusText;
    private GameObject customerRequestBubble;
    private GameObject tradeYesButton;
    private GameObject tradeNoButton;
    private bool tradeOfferResolved;
    private GameObject restockButton;
    private GameObject restockPanel;
    private Transform restockListContent;
    private Text restockHintText;
    private Transform inventoryContent;
    private RectTransform itemTooltip;
    private Text itemTooltipText;
    private readonly List<Image> inventoryItemImages = new List<Image>();
    private readonly List<Text> inventoryQuantityTexts = new List<Text>();
    private readonly List<Button> inventoryButtons = new List<Button>();

    private Actor activeActor;
    private CampusStoryBeat activeBeat;
    private string[] activeLines;
    private int lineIndex;
    private int locationIndex;
    private int day = 1;
    private int money = CampusItemCatalog.StartingMoney;
    private int[] classroomStock;
    private bool[] itemUnlocked;
    private int wantedItemIndex;
    private int barterOfferIndex;
    private int customerRefreshCount;
    private bool customerPresent;
    private VisitorKind visitorKind;
    private float nextCustomerArrivalTime = -1f;
    private float customerDepartureTime = -1f;
    private float remainingCustomerStay;
    private string classroomVisitorActorId;
    private bool fieldNpcTalkedThisVisit;
    private float nextFieldNpcArrivalTime = -1f;
    private bool restockPanelOpen;
    private bool resultPendingClose;
    private SchoolStage stage = SchoolStage.Elementary;
    private bool playerIsMale;

    // Customers don't respawn instantly after a sale; arrival, stay, and next visit are all randomized.
    private const float CustomerArrivalMinSeconds = 3.5f;
    private const float CustomerArrivalMaxSeconds = 9f;
    private const float CustomerStayMinSeconds = 6f;
    private const float CustomerStayMaxSeconds = 14f;
    private const float BarterStayMinSeconds = 10f;
    private const float BarterStayMaxSeconds = 18f;
    private const float BarterChance = .28f;
    private const float VendorSellChance = .22f;
    private const float FieldNpcArrivalMinSeconds = 0.8f;
    private const float FieldNpcArrivalMaxSeconds = 1.6f;
    private const float FieldNpcCooldownMinSeconds = 28f;
    private const float FieldNpcCooldownMaxSeconds = 55f;
    private const float FactionClassroomVisitChance = .42f;

    private void Awake()
    {
        if (!BindSceneUi())
        {
            Debug.LogError("CampusGameUI is missing. Use Tools > Campus Shop > Generate UI In SampleScene.");
            enabled = false;
            return;
        }

        InitializeCatalogState();
        CacheSceneBackgrounds();
        LoadPortraits();
        LoadTradeSprites();
        ConfigureInventoryViewportMask();
        ConfigureIdentityPanel();
        EnsureClassroomTradeRuntimeFixes();
        SwitchLocation(ClassroomLocationIndexForStage());
        RefreshHud();
    }

    private bool BindSceneUi()
    {
        uiReferences = FindFirstObjectByType<CampusUiReferences>();
        if (uiReferences == null || uiReferences.DayText == null || uiReferences.DialoguePanel == null)
            return false;

        dayText = uiReferences.DayText;
        locationText = uiReferences.LocationText;
        playerText = uiReferences.PlayerText;
        moneyText = uiReferences.MoneyText;
        favorText = uiReferences.FavorText;
        objectiveText = uiReferences.ObjectiveText;
        debugPanel = uiReferences.DebugPanel;
        mapOverlay = uiReferences.MapOverlay;
        dialoguePanel = uiReferences.DialoguePanel;
        actorPortrait = uiReferences.ActorPortrait;
        speakerText = uiReferences.SpeakerText;
        dialogueText = uiReferences.DialogueText;
        progressText = uiReferences.ProgressText;
        continueButton = uiReferences.ContinueButton;
        closeButton = uiReferences.CloseButton;
        classroomTradePanel = uiReferences.ClassroomTradePanel;
        customerPortrait = uiReferences.CustomerPortrait;
        customerNameText = uiReferences.CustomerNameText;
        customerRequestText = uiReferences.CustomerRequestText;
        tradeStatusText = uiReferences.TradeStatusText;
        mapButtons.Clear();
        choiceButtons.Clear();
        inventoryItemImages.Clear();
        inventoryQuantityTexts.Clear();
        if (uiReferences.MapButtons != null)
            mapButtons.AddRange(uiReferences.MapButtons);
        if (uiReferences.ChoiceButtons != null)
            choiceButtons.AddRange(uiReferences.ChoiceButtons);
        if (uiReferences.InventoryItemImages != null)
            inventoryItemImages.AddRange(uiReferences.InventoryItemImages);
        if (uiReferences.InventoryQuantityTexts != null)
            inventoryQuantityTexts.AddRange(uiReferences.InventoryQuantityTexts);
        if (uiReferences.InventoryButtons != null)
            inventoryButtons.AddRange(uiReferences.InventoryButtons);
        talkButton = FindNamedChild(uiReferences.transform, "交谈");
        if (talkButton != null)
            talkButton.SetActive(false);
        if (continueButton != null)
            continueButton.gameObject.SetActive(false);
        if (closeButton != null)
            closeButton.gameObject.SetActive(false);
        foreach (var choice in choiceButtons)
        {
            if (choice != null)
                choice.gameObject.SetActive(false);
        }

        return locationText != null && playerText != null && moneyText != null && favorText != null &&
               objectiveText != null && debugPanel != null && mapOverlay != null && speakerText != null &&
               dialogueText != null && progressText != null && actorPortrait != null &&
               mapButtons.Count >= 7;
    }

    private void LoadPortraits()
    {
        foreach (var actor in actors.Values)
        {
            var sprites = Resources.LoadAll<Sprite>(actor.PortraitResource);
            portraits[actor.Id] = sprites != null && sprites.Length > 0 ? sprites[0] : null;
        }
    }

    private void LoadTradeSprites()
    {
        foreach (var item in catalog)
        {
            // Prefer loading a single Sprite directly. If the resource path or import state is off,
            // RefreshInventoryView keeps any manually bound images from the scene.
            var sprite = Resources.Load<Sprite>(item.SpriteResource);
            if (sprite == null)
            {
                var sprites = Resources.LoadAll<Sprite>(item.SpriteResource);
                if (sprites != null && sprites.Length > 0)
                    sprite = sprites[0];
            }

            if (sprite != null)
                tradeSprites[item.SpriteResource] = sprite;
        }
    }

    // Older saved scenes used a stencil Mask on the transparent viewport.  A RectMask2D
    // is shader-independent, so standard UI item images remain visible while scrolling.
    private void ConfigureInventoryViewportMask()
    {
        if (classroomTradePanel == null)
            return;

        var viewport = classroomTradePanel.transform.Find("ShopBag/InventoryScrollView/Viewport");
        if (viewport == null)
            return;

        var stencilMask = viewport.GetComponent<Mask>();
        if (stencilMask != null)
            Destroy(stencilMask);
        if (viewport.GetComponent<RectMask2D>() == null)
            viewport.gameObject.AddComponent<RectMask2D>();
    }

    private void Update()
    {
        UpdateCustomerEvents();
        UpdateFieldNpcEvents();

        if (dialoguePanel != null && dialoguePanel.activeSelf)
        {
            if (WasDialogueAdvancePressed())
                AdvanceDialogue();
            return;
        }

        var keyboard = Keyboard.current;
        if (keyboard == null)
            return;

        if (mapOverlay != null && mapOverlay.activeSelf)
        {
            if (keyboard.escapeKey.wasPressedThisFrame || keyboard.mKey.wasPressedThisFrame)
                CloseMap();
            return;
        }

        if (keyboard.leftArrowKey.wasPressedThisFrame || keyboard.aKey.wasPressedThisFrame)
            SwitchLocationByDelta(-1);
        if (keyboard.rightArrowKey.wasPressedThisFrame || keyboard.dKey.wasPressedThisFrame)
            SwitchLocationByDelta(1);
        if (keyboard.f1Key.wasPressedThisFrame)
            ToggleDebugPanel();
        if (keyboard.mKey.wasPressedThisFrame)
            ToggleMap();
    }

    private static bool WasDialogueAdvancePressed()
    {
        var keyboard = Keyboard.current;
        if (keyboard != null &&
            (keyboard.enterKey.wasPressedThisFrame ||
             keyboard.numpadEnterKey.wasPressedThisFrame ||
             keyboard.spaceKey.wasPressedThisFrame ||
             keyboard.escapeKey.wasPressedThisFrame))
            return true;

        var mouse = Mouse.current;
        return mouse != null && mouse.leftButton.wasPressedThisFrame;
    }

    private void CacheSceneBackgrounds()
    {
        foreach (var renderer in FindObjectsByType<SpriteRenderer>(FindObjectsSortMode.None))
        {
            foreach (var location in locations)
            {
                if (renderer.gameObject.name == location.SceneObjectName)
                    sceneObjects[location.SceneObjectName] = renderer.gameObject;
            }
        }

        if (sceneObjects.Count != locations.Count)
            Debug.LogWarning($"Campus story found {sceneObjects.Count}/{locations.Count} expected background objects.");
    }

    private void SwitchLocation(int targetIndex)
    {
        var target = locations[targetIndex];
        if (!IsStageAllowed(target))
        {
            return;
        }

        locationIndex = targetIndex;
        foreach (var pair in sceneObjects)
            pair.Value.SetActive(pair.Key == target.SceneObjectName);

        CloseDialogue();
        CloseMap();
        fieldNpcTalkedThisVisit = false;
        ScheduleFieldNpcForCurrentLocation();
        RefreshClassroomTrade();
        RefreshHud();
    }

    private void SwitchLocationByDelta(int delta)
    {
        for (var step = 1; step <= locations.Count; step++)
        {
            var index = (locationIndex + delta * step + locations.Count) % locations.Count;
            if (IsStageAllowed(locations[index]))
            {
                SwitchLocation(index);
                return;
            }
        }
    }

    private void BeginLocationDialogue()
    {
        var location = locations[locationIndex];
        if (location.RequiredStage.HasValue)
            return;
        if (!TryGetLocationContact(out var actor) || !ActorMatchesPlayerStage(actor))
            return;

        BeginDialogue(location.ActorId);
    }

    // Public UI entry points: these are bound as persistent Button events in SampleScene.
    public void OpenLocationDialogue() => BeginLocationDialogue();
    public void ToggleMapFromUi() => ToggleMap();
    public void CloseMapFromUi() => CloseMap();
    public void AdvanceDialogueFromUi() => AdvanceDialogue();
    public void CloseDialogueFromUi() => CloseDialogue();
    public void AdvanceDayFromUi() => AdvanceDay();
    public void TogglePlayerIdentityFromUi() => TogglePlayerIdentity();
    public void SetElementaryFromUi() => SetStage(SchoolStage.Elementary);
    public void SetMiddleFromUi() => SetStage(SchoolStage.Middle);
    public void SetHighFromUi() => SetStage(SchoolStage.High);
    public void RefreshCustomerFromUi() => ScheduleNextCustomerArrival(0f);
    public void SellItemToCustomerFromUi(int itemIndex) => SellItemToCustomer(itemIndex);
    public void AcceptTradeFromUi() => ResolveTradeOffer(true);
    public void DeclineTradeFromUi() => ResolveTradeOffer(false);
    public void AcceptBarterFromUi() => ResolveTradeOffer(true);
    public void DeclineBarterFromUi() => ResolveTradeOffer(false);
    public void AcceptSaleFromUi() => ResolveTradeOffer(true);
    public void DeclineSaleFromUi() => ResolveTradeOffer(false);
    public void ToggleRestockFromUi() => ToggleRestockPanel();
    public void SelectMapLocation(int index)
    {
        if (index < 0 || index >= mapButtons.Count)
            return;

        var targetIndex = MapButtonTargetIndex(index);
        if (!IsStageAllowed(locations[targetIndex]))
            return;

        SwitchLocation(targetIndex);
    }

    public void BeginDialogue(string actorId)
    {
        if (!actors.TryGetValue(actorId, out activeActor))
            return;
        if (!ActorMatchesPlayerStage(activeActor))
        {
            activeActor = null;
            return;
        }

        nextFieldNpcArrivalTime = -1f;
        activeBeat = SelectBeat(activeActor);
        activeLines = activeBeat.Lines;
        lineIndex = 0;
        resultPendingClose = false;
        actorPortrait.sprite = portraits[actorId];
        speakerText.text = $"{activeActor.Name} · {activeActor.Faction}";
        dialoguePanel.SetActive(true);
        ShowCurrentLine();
    }

    private CampusStoryBeat SelectBeat(Actor actor)
    {
        if (day == 5)
            return CampusStoryScript.Finale(actor.Id, StageLabel(stage), WantedItemName(actor.Id), favor[actor.Id] >= 3);

        var introId = $"{actor.Id}_intro";
        if (!completedBeats.Contains(introId))
            return CampusStoryScript.Intro(actor.Id, StageLabel(stage), WantedItemName(actor.Id), WantedItemId(actor.Id));

        if (wantedByActor.ContainsKey(actor.Id) && !deliveredActorQuests.Contains(actor.Id))
            return CampusStoryScript.Quest(actor.Id, WantedItemName(actor.Id), HasItem(WantedItemId(actor.Id)), StageLabel(stage));

        return CampusStoryScript.Daily(actor.Id, StageLabel(stage), WantedItemName(actor.Id), false, deliveredActorQuests.Contains(actor.Id));
    }

    private string WantedItemId(string actorId)
    {
        return CampusStoryScript.WantedItemId(actorId, StageLabel(stage));
    }

    private string WantedItemName(string actorId)
    {
        return ItemDisplayName(WantedItemId(actorId));
    }

    private string ItemDisplayName(string itemId)
    {
        var item = CampusItemCatalog.Find(itemId);
        return item != null ? item.Name : itemId;
    }

    private int FindItemIndex(string itemId)
    {
        for (var i = 0; i < catalog.Length; i++)
        {
            if (catalog[i].Id == itemId)
                return i;
        }

        return -1;
    }

    private bool HasItem(string itemId)
    {
        var index = FindItemIndex(itemId);
        return index >= 0 && itemUnlocked[index] && classroomStock[index] > 0;
    }

    private void ShowCurrentLine()
    {
        dialogueText.text = DialogueBodyOnly(activeLines[lineIndex]);
        progressText.text = $"{lineIndex + 1} / {activeLines.Length} · Enter or click to continue";
        SetChoicesVisible(false);
        if (continueButton != null)
            continueButton.gameObject.SetActive(false);
        if (closeButton != null)
            closeButton.gameObject.SetActive(false);
    }

    /// <summary>
    /// Speaker already shows the name; strip leading "Name：" / "Name: " / "Name:" from dialogue body text.
    /// </summary>
    private string DialogueBodyOnly(string raw)
    {
        if (string.IsNullOrEmpty(raw))
            return raw;

        var text = raw;
        if (activeActor != null && !string.IsNullOrEmpty(activeActor.Name))
        {
            var name = activeActor.Name;
            if (text.StartsWith(name + "：", StringComparison.Ordinal))
                return text.Substring(name.Length + 1).TrimStart();
            if (text.StartsWith(name + ": ", StringComparison.Ordinal))
                return text.Substring(name.Length + 2).TrimStart();
            if (text.StartsWith(name + ":", StringComparison.Ordinal))
                return text.Substring(name.Length + 1).TrimStart();
        }

        // Fallback for any short "Name:" prefix on the first line.
        var lineBreak = text.IndexOf('\n');
        var firstLine = lineBreak >= 0 ? text.Substring(0, lineBreak) : text;
        var rest = lineBreak >= 0 ? text.Substring(lineBreak) : string.Empty;
        var colon = firstLine.IndexOf('：');
        if (colon < 0)
            colon = firstLine.IndexOf(':');
        if (colon > 0 && colon <= 24)
        {
            var maybeName = firstLine.Substring(0, colon);
            if (maybeName.IndexOf('【') < 0 && maybeName.IndexOf('[') < 0)
                return firstLine.Substring(colon + 1).TrimStart() + rest;
        }

        return text;
    }

    private void AdvanceDialogue()
    {
        if (resultPendingClose || activeBeat == null)
        {
            CloseDialogue();
            return;
        }

        lineIndex++;
        if (lineIndex < activeLines.Length)
        {
            ShowCurrentLine();
            return;
        }

        if (activeBeat.Choices.Length == 0)
        {
            completedBeats.Add(activeBeat.Id);
            RefreshHud();
            CloseDialogue();
            return;
        }

        // Choice UI was removed: auto-pick the primary request option for this location beat.
        ResolveChoice(PickAutoDialogueChoice(activeBeat));
    }

    private static CampusStoryChoice PickAutoDialogueChoice(CampusStoryBeat beat)
    {
        if (beat.Choices == null || beat.Choices.Length == 0)
            return null;

        for (var i = 0; i < beat.Choices.Length; i++)
        {
            if (!string.IsNullOrEmpty(beat.Choices[i].RequestItemId))
                return beat.Choices[i];
        }

        return beat.Choices[0];
    }

    private void ShowChoices()
    {
        // Kept for debug scenes that still have choice buttons; normal flow auto-resolves.
        if (choiceButtons.Count == 0)
        {
            ResolveChoice(PickAutoDialogueChoice(activeBeat));
            return;
        }

        if (continueButton != null)
            continueButton.gameObject.SetActive(false);
        if (closeButton != null)
            closeButton.gameObject.SetActive(false);
        progressText.text = "Pick a response. Buying and trading happen in the classroom.";
        for (var i = 0; i < choiceButtons.Count; i++)
        {
            var button = choiceButtons[i];
            if (button == null)
                continue;
            if (i >= activeBeat.Choices.Length)
            {
                button.gameObject.SetActive(false);
                continue;
            }

            var choice = activeBeat.Choices[i];
            button.gameObject.SetActive(true);
            SetButtonLabel(button, choice.Label);
            button.onClick.RemoveAllListeners();
            button.onClick.AddListener(() => ResolveChoice(choice));
        }
    }

    private void ResolveChoice(CampusStoryChoice choice)
    {
        if (choice == null)
        {
            CloseDialogue();
            return;
        }

        if (!string.IsNullOrEmpty(choice.GiveItemId))
        {
            var index = FindItemIndex(choice.GiveItemId);
            if (index < 0 || classroomStock[index] <= 0)
            {
                dialogueText.text = DialogueBodyOnly(string.IsNullOrEmpty(choice.FailResult)
                    ? $"You don't have [{ItemDisplayName(choice.GiveItemId)}] right now. Restock in the classroom and wait for them to visit."
                    : choice.FailResult);
                speakerText.text = activeActor.Name;
                progressText.text = "No delivery here. Enter or click to close · restock in the classroom.";
                SetChoicesVisible(false);
                if (closeButton != null)
                    closeButton.gameObject.SetActive(false);
                if (continueButton != null)
                    continueButton.gameObject.SetActive(false);
                resultPendingClose = true;
                return;
            }

            classroomStock[index]--;
            deliveredActorQuests.Add(activeActor.Id);
            wantedByActor.Remove(activeActor.Id);
            RefreshInventoryView();
            RefreshHud();
        }

        if (!string.IsNullOrEmpty(choice.RequestItemId))
            wantedByActor[activeActor.Id] = choice.RequestItemId;

        favor[activeActor.Id] += choice.FavorChange;
        completedBeats.Add(activeBeat.Id);
        dialogueText.text = DialogueBodyOnly(choice.Result);
        speakerText.text = activeActor.Name;
        progressText.text = deliveredActorQuests.Contains(activeActor.Id)
            ? "Request fulfilled. Enter or click to close."
            : "Request noted. Enter or click to close · restock in the classroom.";
        SetChoicesVisible(false);
        if (closeButton != null)
            closeButton.gameObject.SetActive(false);
        if (continueButton != null)
            continueButton.gameObject.SetActive(false);
        resultPendingClose = true;
        RefreshHud();
    }

    private void AdvanceDay()
    {
        if (day >= 5)
            return;

        day++;
        UnlockItemsForCurrentDay();
        actorCooldownUntil.Clear();
        fieldNpcTalkedThisVisit = false;
        ScheduleFieldNpcForCurrentLocation();
        RefreshInventoryView();
        RefreshHud();
    }

    private void CloseDialogue()
    {
        if (activeActor != null)
        {
            fieldNpcTalkedThisVisit = true;
            actorCooldownUntil[activeActor.Id] = Time.unscaledTime +
                UnityEngine.Random.Range(FieldNpcCooldownMinSeconds, FieldNpcCooldownMaxSeconds);
        }

        activeActor = null;
        activeBeat = null;
        if (dialoguePanel != null)
            dialoguePanel.SetActive(false);
    }

    private void ToggleDebugPanel()
    {
        if (debugPanel != null)
            debugPanel.SetActive(!debugPanel.activeSelf);
    }

    private void ToggleMap()
    {
        if (mapOverlay == null)
            return;

        if (mapOverlay.activeSelf)
            CloseMap();
        else
            OpenMap();
    }

    private void OpenMap()
    {
        if (mapOverlay == null)
            return;

        RefreshMapButtons();
        mapOverlay.SetActive(true);
        mapOverlay.transform.SetAsLastSibling();
        var reveal = FindMapButtonReveal();
        if (reveal != null)
            reveal.SnapShown();
    }

    private void CloseMap()
    {
        if (mapOverlay != null)
            mapOverlay.SetActive(false);

        var reveal = FindMapButtonReveal();
        if (reveal != null)
        {
            reveal.transform.SetAsLastSibling();
            reveal.SnapRest();
        }
    }

    private MapButtonReveal FindMapButtonReveal()
    {
        if (uiReferences == null)
            return null;
        var mapButton = FindNamedChild(uiReferences.transform, "地图");
        if (mapButton == null)
            return null;
        var reveal = mapButton.GetComponent<MapButtonReveal>();
        if (reveal == null)
            reveal = mapButton.AddComponent<MapButtonReveal>();
        return reveal;
    }

    private void RefreshMapButtons()
    {
        // Preserve author-time CampusMap art; refresh availability + English labels when Text exists.
        for (var i = 0; i < mapButtons.Count; i++)
        {
            var button = mapButtons[i];
            if (button == null)
                continue;

            var isLegacyExtraClassroom = mapButtons.Count > 7 && (i == 5 || i == 6);
            button.gameObject.SetActive(!isLegacyExtraClassroom);
            if (isLegacyExtraClassroom)
                continue;

            button.interactable = true;
            var targetIndex = MapButtonTargetIndex(i);
            var location = locations[targetIndex];
            var label = i == 4 ? "Classroom" : location.Label;
            var text = button.GetComponentInChildren<Text>(true);
            if (text != null)
                text.text = label;
        }
    }

    private int MapButtonTargetIndex(int buttonIndex)
    {
        if (buttonIndex < 4)
            return buttonIndex;
        if (buttonIndex == 4)
            return ClassroomLocationIndexForStage();
        if (mapButtons.Count > 7)
            return buttonIndex;
        return buttonIndex == 5 ? 7 : 8;
    }

    private int ClassroomLocationIndexForStage()
    {
        switch (stage)
        {
            case SchoolStage.Elementary: return 4;
            case SchoolStage.Middle: return 5;
            default: return 6;
        }
    }

    private void RefreshClassroomTrade()
    {
        if (classroomTradePanel == null)
            return;

        var isClassroom = locations[locationIndex].RequiredStage.HasValue;
        classroomTradePanel.SetActive(isClassroom);
        if (talkButton != null)
            talkButton.SetActive(false);
        if (!isClassroom)
        {
            CloseRestockPanel();
            ClearCustomer();
            return;
        }

        RefreshInventoryView();
        CloseRestockPanel();
        ScheduleNextCustomerArrival();
    }

    private bool IsCurrentLocationClassroom()
    {
        return locations[locationIndex].RequiredStage.HasValue;
    }

    private bool ActorMatchesPlayerStage(Actor actor)
    {
        return actor != null && (!actor.Stage.HasValue || actor.Stage.Value == stage);
    }

    private bool TryGetLocationContact(out Actor actor)
    {
        actor = null;
        var location = locations[locationIndex];
        if (string.IsNullOrEmpty(location.ActorId))
            return false;
        return actors.TryGetValue(location.ActorId, out actor);
    }

    private void ScheduleFieldNpcForCurrentLocation()
    {
        nextFieldNpcArrivalTime = -1f;
        if (IsCurrentLocationClassroom())
            return;
        if (!TryGetLocationContact(out var actor) || !ActorMatchesPlayerStage(actor))
            return;
        if (actorCooldownUntil.TryGetValue(actor.Id, out var until) && Time.unscaledTime < until)
            return;

        nextFieldNpcArrivalTime = Time.unscaledTime +
            UnityEngine.Random.Range(FieldNpcArrivalMinSeconds, FieldNpcArrivalMaxSeconds);
    }

    private void UpdateFieldNpcEvents()
    {
        if (IsCurrentLocationClassroom())
            return;
        if (dialoguePanel != null && dialoguePanel.activeSelf)
            return;
        if (mapOverlay != null && mapOverlay.activeSelf)
            return;
        if (fieldNpcTalkedThisVisit || nextFieldNpcArrivalTime < 0f)
            return;
        if (Time.unscaledTime < nextFieldNpcArrivalTime)
            return;
        if (!TryGetLocationContact(out var actor) || !ActorMatchesPlayerStage(actor))
        {
            nextFieldNpcArrivalTime = -1f;
            return;
        }

        if (actorCooldownUntil.TryGetValue(actor.Id, out var until) && Time.unscaledTime < until)
        {
            nextFieldNpcArrivalTime = -1f;
            return;
        }

        nextFieldNpcArrivalTime = -1f;
        BeginDialogue(actor.Id);
    }

    private void InitializeCatalogState()
    {
        classroomStock = new int[catalog.Length];
        itemUnlocked = new bool[catalog.Length];
        for (var i = 0; i < catalog.Length; i++)
        {
            itemUnlocked[i] = catalog[i].UnlockDay <= day && ItemFitsCurrentStage(catalog[i]);
            classroomStock[i] = itemUnlocked[i] ? catalog[i].StartingStock : 0;
        }
    }

    private void UnlockItemsForCurrentDay()
    {
        for (var i = 0; i < catalog.Length; i++)
        {
            if (itemUnlocked[i] || catalog[i].UnlockDay > day || !ItemFitsCurrentStage(catalog[i]))
                continue;
            itemUnlocked[i] = true;
            if (classroomStock[i] <= 0)
                classroomStock[i] = 1;
        }

        EnsureInventorySlots();
    }

    private void UnlockItem(int itemIndex)
    {
        if (itemIndex < 0 || itemIndex >= catalog.Length || !ItemFitsCurrentStage(catalog[itemIndex]))
            return;
        itemUnlocked[itemIndex] = true;
        EnsureInventorySlots();
    }

    private void RefreshInventoryView()
    {
        EnsureInventorySlots();
        for (var i = 0; i < catalog.Length; i++)
        {
            var unlocked = itemUnlocked[i];
            if (i < inventoryButtons.Count && inventoryButtons[i] != null)
                inventoryButtons[i].gameObject.SetActive(unlocked);
            if (i >= inventoryItemImages.Count || inventoryItemImages[i] == null)
                continue;

            var itemImage = inventoryItemImages[i];
            itemImage.gameObject.SetActive(unlocked);
            if (!unlocked)
                continue;

            if (tradeSprites.TryGetValue(catalog[i].SpriteResource, out var sprite) && sprite != null)
                itemImage.sprite = sprite;

            var inStock = classroomStock[i] > 0;
            var isWanted = customerPresent && !tradeOfferResolved && i == wantedItemIndex &&
                           (visitorKind == VisitorKind.CustomerBuy || visitorKind == VisitorKind.Barter);
            var isVendorOffer = customerPresent && !tradeOfferResolved && visitorKind == VisitorKind.VendorSell &&
                                i == wantedItemIndex;
            if (!inStock && !isVendorOffer)
                itemImage.color = new Color(1f, 1f, 1f, .28f);
            else if (customerPresent && !tradeOfferResolved && visitorKind == VisitorKind.CustomerBuy && !isWanted)
                itemImage.color = new Color(1f, 1f, 1f, .45f);
            else if (isWanted && visitorKind == VisitorKind.Barter)
                itemImage.color = new Color(1f, .92f, .55f, 1f);
            else if (isVendorOffer)
                itemImage.color = new Color(.75f, .9f, 1f, 1f);
            else if (isWanted)
                itemImage.color = new Color(.75f, 1f, .82f, 1f);
            else
                itemImage.color = Color.white;

            var hover = itemImage.GetComponent<ItemHoverFeedback>();
            if (hover != null)
            {
                hover.ItemName = isVendorOffer
                    ? $"{catalog[i].Name}\nOffer ¥ {catalog[i].BuyPrice}"
                    : $"{catalog[i].Name}\nPrice ¥ {catalog[i].SellPrice} · Stock {classroomStock[i]}";
            }

            if (i < inventoryQuantityTexts.Count && inventoryQuantityTexts[i] != null)
            {
                inventoryQuantityTexts[i].text = isVendorOffer
                    ? $"{catalog[i].Name}\nBuy ¥ {catalog[i].BuyPrice}"
                    : $"{catalog[i].Name}\n¥ {catalog[i].SellPrice} · Stock {classroomStock[i]}";
            }
        }
    }

    private void UpdateCustomerEvents()
    {
        if (classroomTradePanel == null || !classroomTradePanel.activeSelf || restockPanelOpen)
            return;

        var now = Time.unscaledTime;
        if (customerPresent && customerDepartureTime >= 0f && now >= customerDepartureTime)
        {
            if (!tradeOfferResolved)
            {
                FinishTradeWithResult("They got tired of waiting and left.");
                return;
            }

            ClearCustomer();
            ScheduleNextCustomerArrival();
            return;
        }

        if (!customerPresent && nextCustomerArrivalTime >= 0f && now >= nextCustomerArrivalTime)
            SpawnCustomer();
    }

    private int PickInStockItemIndex()
    {
        var inStock = new List<int>();
        for (var i = 0; i < classroomStock.Length; i++)
        {
            if (itemUnlocked[i] && classroomStock[i] > 0)
                inStock.Add(i);
        }

        if (inStock.Count == 0)
            return -1;
        return inStock[UnityEngine.Random.Range(0, inStock.Count)];
    }

    private int PickBarterOfferIndex(int wantedIndex)
    {
        var locked = new List<int>();
        var unlockedOthers = new List<int>();
        for (var i = 0; i < catalog.Length; i++)
        {
            if (i == wantedIndex || !ItemFitsCurrentStage(catalog[i]))
                continue;
            if (!itemUnlocked[i])
                locked.Add(i);
            else
                unlockedOthers.Add(i);
        }

        if (locked.Count > 0 && UnityEngine.Random.value < .55f)
            return locked[UnityEngine.Random.Range(0, locked.Count)];
        if (unlockedOthers.Count > 0)
            return unlockedOthers[UnityEngine.Random.Range(0, unlockedOthers.Count)];
        if (locked.Count > 0)
            return locked[0];
        return wantedIndex;
    }

    private bool HasAnyStock()
    {
        for (var i = 0; i < classroomStock.Length; i++)
        {
            if (itemUnlocked[i] && classroomStock[i] > 0)
                return true;
        }

        return false;
    }

    private void ScheduleNextCustomerArrival(float delay = -1f)
    {
        if (classroomTradePanel == null || !classroomTradePanel.activeSelf)
            return;

        visitorKind = VisitorKind.CustomerBuy;
        customerPresent = false;
        tradeOfferResolved = false;
        classroomVisitorActorId = null;
        customerDepartureTime = -1f;
        nextCustomerArrivalTime = Time.unscaledTime + (delay >= 0f
            ? delay
            : UnityEngine.Random.Range(CustomerArrivalMinSeconds, CustomerArrivalMaxSeconds));
        if (customerPortrait != null)
            customerPortrait.gameObject.SetActive(false);
        SetTradeChoicesVisible(false);
        SetCustomerRequest(string.Empty);
        RefreshInventoryView();
    }

    private void SpawnCustomer()
    {
        classroomVisitorActorId = null;
        if (!HasAnyStock())
        {
            // Empty shelf: only allow someone offering to sell you goods.
            if (!TrySpawnVendorSellVisitor())
            {
                customerPresent = false;
                nextCustomerArrivalTime = -1f;
                if (customerPortrait != null)
                    customerPortrait.gameObject.SetActive(false);
                SetCustomerName(string.Empty);
                SetTradeChoicesVisible(false);
                SetCustomerRequest("Shelves are empty. Tap Restock on the bag, or wait — someone may come to sell.");
                RefreshInventoryView();
            }
            return;
        }

        if (TryBeginFactionClassroomVisit())
            return;

        customerRefreshCount++;
        PickVisitorKind();
        if (visitorKind == VisitorKind.VendorSell)
        {
            if (!TrySpawnVendorSellVisitor())
                ScheduleNextCustomerArrival();
            return;
        }

        wantedItemIndex = PickInStockItemIndex();
        if (wantedItemIndex < 0)
        {
            ScheduleNextCustomerArrival();
            return;
        }

        if (visitorKind == VisitorKind.Barter)
        {
            barterOfferIndex = PickBarterOfferIndex(wantedItemIndex);
            if (barterOfferIndex == wantedItemIndex)
                visitorKind = VisitorKind.CustomerBuy;
        }

        if (!ApplyCustomerPortrait(CustomerPortraitResource(UnityEngine.Random.Range(0, 2) == 0)))
        {
            ScheduleNextCustomerArrival();
            return;
        }

        SetCustomerName("Student");
        BeginVisitorStay();
    }

    private void PickVisitorKind()
    {
        var roll = UnityEngine.Random.value;
        if (roll < VendorSellChance)
            visitorKind = VisitorKind.VendorSell;
        else if (roll < VendorSellChance + BarterChance)
            visitorKind = VisitorKind.Barter;
        else
            visitorKind = VisitorKind.CustomerBuy;
    }

    private bool TrySpawnVendorSellVisitor()
    {
        wantedItemIndex = PickVendorOfferItemIndex();
        if (wantedItemIndex < 0)
            return false;

        visitorKind = VisitorKind.VendorSell;
        customerRefreshCount++;
        if (!ApplyCustomerPortrait(CustomerPortraitResource(UnityEngine.Random.Range(0, 2) == 0)))
            return false;

        SetCustomerName("Student");
        BeginVisitorStay();
        return true;
    }

    private int PickVendorOfferItemIndex()
    {
        var locked = new List<int>();
        var unlocked = new List<int>();
        for (var i = 0; i < catalog.Length; i++)
        {
            if (!ItemFitsCurrentStage(catalog[i]))
                continue;
            if (classroomStock[i] >= CampusItemCatalog.MaxStackPerItem)
                continue;
            if (!itemUnlocked[i])
                locked.Add(i);
            else
                unlocked.Add(i);
        }

        if (locked.Count > 0 && UnityEngine.Random.value < .55f)
            return locked[UnityEngine.Random.Range(0, locked.Count)];
        if (unlocked.Count > 0)
            return unlocked[UnityEngine.Random.Range(0, unlocked.Count)];
        if (locked.Count > 0)
            return locked[UnityEngine.Random.Range(0, locked.Count)];
        return -1;
    }

    private bool ApplyCustomerPortrait(string customerResource)
    {
        var sprite = Resources.Load<Sprite>(customerResource);
        if (sprite == null)
        {
            var sprites = Resources.LoadAll<Sprite>(customerResource);
            if (sprites != null && sprites.Length > 0)
                sprite = sprites[0];
        }

        if (customerPortrait != null)
        {
            customerPortrait.sprite = sprite;
            customerPortrait.gameObject.SetActive(sprite != null);
        }

        customerPresent = customerPortrait != null && customerPortrait.gameObject.activeSelf;
        return customerPresent;
    }

    private void BeginVisitorStay()
    {
        var stayMin = visitorKind == VisitorKind.Barter || visitorKind == VisitorKind.VendorSell
            ? BarterStayMinSeconds
            : CustomerStayMinSeconds;
        var stayMax = visitorKind == VisitorKind.Barter || visitorKind == VisitorKind.VendorSell
            ? BarterStayMaxSeconds
            : CustomerStayMaxSeconds;
        customerDepartureTime = Time.unscaledTime + UnityEngine.Random.Range(stayMin, stayMax);
        nextCustomerArrivalTime = -1f;
        ShowVisitorRequest();
        RefreshInventoryView();
    }

    private bool TryBeginFactionClassroomVisit()
    {
        var candidates = new List<Actor>();
        foreach (var actor in actors.Values)
        {
            if (!ActorMatchesPlayerStage(actor))
                continue;
            if (!wantedByActor.ContainsKey(actor.Id) || deliveredActorQuests.Contains(actor.Id))
                continue;
            if (!HasItem(wantedByActor[actor.Id]))
                continue;
            candidates.Add(actor);
        }

        if (candidates.Count == 0 || UnityEngine.Random.value >= FactionClassroomVisitChance)
            return false;

        var visitor = candidates[UnityEngine.Random.Range(0, candidates.Count)];
        wantedItemIndex = FindItemIndex(wantedByActor[visitor.Id]);
        if (wantedItemIndex < 0)
            return false;

        classroomVisitorActorId = visitor.Id;
        visitorKind = UnityEngine.Random.value < .22f ? VisitorKind.Barter : VisitorKind.CustomerBuy;
        if (visitorKind == VisitorKind.Barter)
        {
            barterOfferIndex = PickBarterOfferIndex(wantedItemIndex);
            if (barterOfferIndex == wantedItemIndex)
                visitorKind = VisitorKind.CustomerBuy;
        }

        if (customerPortrait != null)
        {
            customerPortrait.sprite = portraits.ContainsKey(visitor.Id) ? portraits[visitor.Id] : null;
            customerPortrait.gameObject.SetActive(customerPortrait.sprite != null);
        }

        customerPresent = customerPortrait != null && customerPortrait.gameObject.activeSelf;
        if (!customerPresent)
        {
            classroomVisitorActorId = null;
            return false;
        }

        customerRefreshCount++;
        SetCustomerName(visitor.Name);
        var stayMin = visitorKind == VisitorKind.Barter ? BarterStayMinSeconds : CustomerStayMinSeconds;
        var stayMax = visitorKind == VisitorKind.Barter ? BarterStayMaxSeconds : CustomerStayMaxSeconds;
        customerDepartureTime = Time.unscaledTime + UnityEngine.Random.Range(stayMin, stayMax);
        nextCustomerArrivalTime = -1f;
        ShowVisitorRequest();
        RefreshInventoryView();
        return true;
    }

    private void CompleteFactionClassroomVisit()
    {
        if (string.IsNullOrEmpty(classroomVisitorActorId))
            return;

        var actorId = classroomVisitorActorId;
        if (wantedByActor.TryGetValue(actorId, out var itemId) && FindItemIndex(itemId) == wantedItemIndex)
        {
            deliveredActorQuests.Add(actorId);
            wantedByActor.Remove(actorId);
            favor[actorId] += 1;
            completedBeats.Add($"{actorId}_quest");
            RefreshHud();
        }

        classroomVisitorActorId = null;
    }

    private void SetCustomerName(string name)
    {
        if (customerNameText != null)
            customerNameText.text = name ?? string.Empty;
    }

    private void ShowVisitorRequest()
    {
        if (!customerPresent)
        {
            SetTradeChoicesVisible(false);
            SetCustomerRequest(string.Empty);
            return;
        }

        tradeOfferResolved = false;
        if (visitorKind == VisitorKind.Barter)
        {
            SetCustomerRequest($"{VisitorRequestPrefix()}Trade my [{catalog[barterOfferIndex].Name}] for your [{catalog[wantedItemIndex].Name}]? Tap Accept or Decline.");
            SetTradeChoicesVisible(true);
            return;
        }

        if (visitorKind == VisitorKind.VendorSell)
        {
            var offer = catalog[wantedItemIndex];
            SetCustomerRequest($"{VisitorRequestPrefix()}I've got [{offer.Name}] — ¥{offer.BuyPrice}. Want it? Tap Accept or Decline.");
            SetTradeChoicesVisible(true);
            return;
        }

        var item = catalog[wantedItemIndex];
        var extra = string.IsNullOrEmpty(classroomVisitorActorId) ? string.Empty : "This is the one we talked about. ";
        SetCustomerRequest($"{VisitorRequestPrefix()}I'll pay ¥{item.SellPrice} for {item.Name}. {extra}Tap Accept or Decline.");
        SetTradeChoicesVisible(true);
    }

    private string VisitorRequestPrefix()
    {
        if (string.IsNullOrEmpty(classroomVisitorActorId) || !actors.ContainsKey(classroomVisitorActorId))
            return string.Empty;
        return $"{actors[classroomVisitorActorId].Name}: ";
    }

    private void ClearCustomer()
    {
        customerPresent = false;
        visitorKind = VisitorKind.CustomerBuy;
        tradeOfferResolved = false;
        classroomVisitorActorId = null;
        customerDepartureTime = -1f;
        nextCustomerArrivalTime = -1f;
        if (customerPortrait != null)
            customerPortrait.gameObject.SetActive(false);
        SetCustomerName(string.Empty);
        SetTradeChoicesVisible(false);
        SetCustomerRequest(string.Empty);
        RefreshInventoryView();
    }

    private string CustomerPortraitResource(bool useMalePortrait)
    {
        switch (stage)
        {
            case SchoolStage.Elementary: return useMalePortrait ? "NPC男小" : "NPC女小";
            case SchoolStage.Middle: return useMalePortrait ? "NPC男初" : "NPC女初";
            default: return useMalePortrait ? "NPC男高" : "NPC女高";
        }
    }

    private void SellItemToCustomer(int itemIndex)
    {
        if (classroomTradePanel == null || !classroomTradePanel.activeSelf || itemIndex < 0 || itemIndex >= catalog.Length)
            return;
        if (!customerPresent || restockPanelOpen || tradeOfferResolved)
            return;
        if (!itemUnlocked[itemIndex])
            return;

        if (visitorKind == VisitorKind.VendorSell)
        {
            var offer = catalog[wantedItemIndex];
            SetCustomerRequest($"They're offering [{offer.Name}] for ¥{offer.BuyPrice}. Tap Accept or Decline.");
            return;
        }

        if (visitorKind == VisitorKind.Barter)
        {
            if (itemIndex == wantedItemIndex)
            {
                SetCustomerRequest($"Confirm trade: your [{catalog[wantedItemIndex].Name}] for their [{catalog[barterOfferIndex].Name}]. Accept or decline.");
                return;
            }

            SetCustomerRequest($"This is a trade: your [{catalog[wantedItemIndex].Name}] for their [{catalog[barterOfferIndex].Name}]. Accept or decline.");
            return;
        }

        var item = catalog[wantedItemIndex];
        if (itemIndex != wantedItemIndex)
        {
            SetCustomerRequest($"Not that one. I'll pay ¥{item.SellPrice} for {item.Name}. Tap Accept or Decline.");
            return;
        }

        SetCustomerRequest($"I'll pay ¥{item.SellPrice} for {item.Name}. Tap Accept or Decline.");
    }

    private void ResolveTradeOffer(bool accepted)
    {
        if (!customerPresent || tradeOfferResolved || restockPanelOpen)
            return;

        switch (visitorKind)
        {
            case VisitorKind.CustomerBuy:
                ResolveCustomerBuy(accepted);
                break;
            case VisitorKind.Barter:
                ResolveBarter(accepted);
                break;
            case VisitorKind.VendorSell:
                ResolveVendorSell(accepted);
                break;
        }
    }

    private void ResolveCustomerBuy(bool accepted)
    {
        if (visitorKind != VisitorKind.CustomerBuy)
            return;

        if (!accepted)
        {
            FinishTradeWithResult("You declined the sale. They left.");
            return;
        }

        if (wantedItemIndex < 0 || classroomStock[wantedItemIndex] <= 0)
        {
            SetCustomerRequest($"{catalog[Mathf.Max(0, wantedItemIndex)].Name} is sold out.");
            return;
        }

        var item = catalog[wantedItemIndex];
        classroomStock[wantedItemIndex]--;
        money += item.SellPrice;
        CompleteFactionClassroomVisit();
        RefreshInventoryView();
        RefreshHud();
        FinishTradeWithResult($"Deal. You earned ¥{item.SellPrice} and sold {item.Name}.");
    }

    private void ResolveBarter(bool accepted)
    {
        if (visitorKind != VisitorKind.Barter) return;

        if (!accepted)
        {
            FinishTradeWithResult("You declined the trade. They left.");
            return;
        }

        if (classroomStock[wantedItemIndex] <= 0)
        {
            SetCustomerRequest($"{catalog[wantedItemIndex].Name} is gone.");
            return;
        }

        if (classroomStock[barterOfferIndex] >= CampusItemCatalog.MaxStackPerItem)
        {
            SetCustomerRequest($"{catalog[barterOfferIndex].Name} shelf is full.");
            return;
        }

        var wanted = catalog[wantedItemIndex];
        var offer = catalog[barterOfferIndex];
        classroomStock[wantedItemIndex]--;
        UnlockItem(barterOfferIndex);
        classroomStock[barterOfferIndex]++;
        CompleteFactionClassroomVisit();
        RefreshInventoryView();
        RefreshHud();
        FinishTradeWithResult($"Trade complete. Gave {wanted.Name}, received {offer.Name}.");
    }

    private void ResolveVendorSell(bool accepted)
    {
        if (visitorKind != VisitorKind.VendorSell)
            return;

        if (!accepted)
        {
            FinishTradeWithResult("You passed. They took their goods and left.");
            return;
        }

        if (wantedItemIndex < 0)
            return;

        var item = catalog[wantedItemIndex];
        if (money < item.BuyPrice)
        {
            SetCustomerRequest($"Not enough money. [{item.Name}] costs ¥{item.BuyPrice}.");
            return;
        }

        if (classroomStock[wantedItemIndex] >= CampusItemCatalog.MaxStackPerItem)
        {
            SetCustomerRequest($"[{item.Name}] shelf is full — no room left.");
            return;
        }

        money -= item.BuyPrice;
        UnlockItem(wantedItemIndex);
        classroomStock[wantedItemIndex]++;
        RefreshInventoryView();
        RefreshHud();
        FinishTradeWithResult($"You paid ¥{item.BuyPrice} for {item.Name}.");
    }

    private void FinishTradeWithResult(string message)
    {
        tradeOfferResolved = true;
        SetTradeChoicesVisible(false);
        SetCustomerRequest(message);
        RefreshInventoryView();
        customerDepartureTime = Time.unscaledTime + 1.8f;
        nextCustomerArrivalTime = -1f;
    }

    private void SetCustomerRequest(string message)
    {
        if (customerRequestText != null)
            customerRequestText.text = message ?? string.Empty;
        if (customerRequestBubble != null)
            customerRequestBubble.SetActive(!string.IsNullOrEmpty(message));
        if (tradeStatusText != null)
            tradeStatusText.text = message ?? string.Empty;
    }

    private void SetTradeChoicesVisible(bool visible)
    {
        if (tradeYesButton != null)
            tradeYesButton.SetActive(visible);
        if (tradeNoButton != null)
            tradeNoButton.SetActive(visible);
    }

    private void RefreshHud()
    {
        var location = locations[locationIndex];
        dayText.text = $"Day {day} / 5";
        locationText.text = LocationHudLabel(location);
        playerText.text = $"Player: {StageLabel(stage)} · {(playerIsMale ? "Male" : "Female")}";
        moneyText.text = $"Money  ¥ {money:N0}";
        favorText.text = $"Favor  Scholar {favor["scholar"]} | Athlete {favor["athlete"]} | Trend {favor["trend"]} | Anime {favor["anime"]}";
        objectiveText.text = "Today's goal: " + CurrentObjective();
        RefreshMapButtons();
    }

    private string CurrentObjective()
    {
        switch (day)
        {
            case 1:
            case 2:
            case 3:
                return ContactObjectiveForStage();
            case 4:
                return "Keep requested items stocked on the classroom shelf. They'll come to buy or trade — don't deliver here.";
            default:
                return $"This run is {StageLabel(stage)}. Contacts from other stages won't appear.";
        }
    }

    private string ContactObjectiveForStage()
    {
        switch (stage)
        {
            case SchoolStage.Elementary:
                return "Visit the library for Lin Zhiyuan, or the playground for Zhou Jin. Note their requests, restock in the classroom, and they'll come to buy or trade.";
            case SchoolStage.Middle:
                return "Visit the cafeteria or restroom for Li Mei, or the playground for Zhou Jin. All trades happen in the classroom.";
            default:
                return "Visit the art room or dorm for Xia Cheng; Zhou Jin still appears at the playground. Restock and wait for them in the classroom.";
        }
    }

    private string LocationHudLabel(Location location)
    {
        if (IsCurrentLocationClassroom())
            return $"Location: {location.Label}";

        if (TryGetLocationContact(out var actor) && ActorMatchesPlayerStage(actor))
            return $"Location: {location.Label} · Waiting for {actor.Name}";

        return $"Location: {location.Label} · No contact at this stage";
    }

    private void SetStage(SchoolStage newStage)
    {
        var identityChanged = stage != newStage;
        stage = newStage;
        if (identityChanged)
        {
            ResetStoryForNewIdentity();
            RefreshStageItemAvailability();
        }

        if (!IsStageAllowed(locations[locationIndex]))
        {
            if (locations[locationIndex].RequiredStage.HasValue)
                SwitchLocation(ClassroomLocationIndexForStage());
            else
                SwitchLocation(0);
            return;
        }

        RefreshInventoryView();
        ScheduleFieldNpcForCurrentLocation();
        RefreshHud();
    }

    private void ResetStoryForNewIdentity()
    {
        wantedByActor.Clear();
        deliveredActorQuests.Clear();
        actorCooldownUntil.Clear();
        classroomVisitorActorId = null;
        fieldNpcTalkedThisVisit = false;
        var stale = new List<string>();
        foreach (var id in completedBeats)
        {
            if (id.EndsWith("_intro") || id.EndsWith("_quest") || id.StartsWith("ending_"))
                stale.Add(id);
        }

        foreach (var id in stale)
            completedBeats.Remove(id);
    }

    private void RefreshStageItemAvailability()
    {
        if (itemUnlocked == null || classroomStock == null)
            return;

        for (var i = 0; i < catalog.Length; i++)
        {
            var shouldShow = catalog[i].UnlockDay <= day && ItemFitsCurrentStage(catalog[i]);
            if (shouldShow)
            {
                if (!itemUnlocked[i] && classroomStock[i] <= 0)
                    classroomStock[i] = catalog[i].StartingStock;
                itemUnlocked[i] = true;
            }
            else
            {
                itemUnlocked[i] = false;
            }
        }

        EnsureInventorySlots();
    }

    private bool IsStageAllowed(Location location)
    {
        return !location.RequiredStage.HasValue || location.RequiredStage.Value == stage;
    }

    private void TogglePlayerIdentity()
    {
        playerIsMale = !playerIsMale;
        SetStage(stage);
    }

    private CampusItemStage CurrentItemStage()
    {
        switch (stage)
        {
            case SchoolStage.Elementary: return CampusItemStage.Elementary;
            case SchoolStage.Middle: return CampusItemStage.Middle;
            default: return CampusItemStage.High;
        }
    }

    private bool ItemFitsCurrentStage(CampusTradeItem item)
    {
        return item != null && item.Fits(CurrentItemStage());
    }

    private static string StageLabel(SchoolStage schoolStage)
    {
        switch (schoolStage)
        {
            case SchoolStage.Elementary: return "Elementary";
            case SchoolStage.Middle: return "Middle";
            default: return "High";
        }
    }

    private void ConfigureIdentityPanel()
    {
        var title = FindNamedChild(uiReferences.transform, "DebugTitle");
        if (title != null)
        {
            var text = title.GetComponent<Text>();
            if (text != null)
                text.text = "Identity · Stage for this run (dialogue won't advance it)";
        }

        var mapSub = FindNamedChild(uiReferences.transform, "MapSubTitle");
        if (mapSub != null)
        {
            var text = mapSub.GetComponent<Text>();
            if (text != null)
                text.text = "Classrooms match your chosen stage. Elementary / Middle / High is identity, not something dialogue upgrades.";
        }

        if (talkButton != null)
            talkButton.SetActive(false);
    }

    private void EnsureClassroomTradeRuntimeFixes()
    {
        if (classroomTradePanel == null)
            return;

        var leftoverRefresh = classroomTradePanel.transform.Find("ShopBag/刷新顾客");
        if (leftoverRefresh != null)
            leftoverRefresh.gameObject.SetActive(false);

        inventoryContent = classroomTradePanel.transform.Find("ShopBag/InventoryScrollView/Viewport/Content");
        if (inventoryItemImages.Count > 0 && inventoryItemImages[0] != null)
        {
            var hover = inventoryItemImages[0].GetComponent<ItemHoverFeedback>();
            if (hover != null)
            {
                itemTooltip = hover.Tooltip;
                itemTooltipText = hover.TooltipText;
            }
        }

        EnsureTradeInteractUi();
        EnsureRestockUi();
        UnlockItemsForCurrentDay();
        EnsureInventorySlots();
        SetCustomerRequest(string.Empty);
        SetTradeChoicesVisible(false);
    }

    private void EnsureTradeInteractUi()
    {
        // Prefer scene-authored TradeInteract so you can move/replace art in the editor.
        // Only one pair is used: 同意 / 拒绝 (Accept / Decline in scene object names).
        var root = classroomTradePanel.transform.Find("TradeInteract");
        if (root == null)
        {
            Debug.LogError("TradeInteract is missing under ClassroomTradePanel. Re-open SampleScene after the scene save, or run Tools/Campus Shop/Ensure Trade Choice Buttons.");
            return;
        }

        if (customerRequestBubble == null)
        {
            var existingBubble = root.Find("CustomerRequest");
            if (existingBubble != null)
            {
                customerRequestBubble = existingBubble.gameObject;
                if (customerRequestText == null)
                    customerRequestText = existingBubble.GetComponentInChildren<Text>(true);
            }
            else if (customerRequestText != null)
            {
                customerRequestBubble = customerRequestText.transform.parent != null
                    ? customerRequestText.transform.parent.gameObject
                    : customerRequestText.gameObject;
            }
        }

        // Legacy 卖/不卖 buttons are hidden; all offers use 同意/拒绝 (Accept/Decline).
        var legacySell = root.Find("卖");
        if (legacySell != null)
            legacySell.gameObject.SetActive(false);
        var legacyNoSell = root.Find("不卖");
        if (legacyNoSell != null)
            legacyNoSell.gameObject.SetActive(false);

        tradeYesButton = BindTradeChoiceButton(root, "同意", AcceptTradeFromUi);
        tradeNoButton = BindTradeChoiceButton(root, "拒绝", DeclineTradeFromUi);
        SetTradeChoicesVisible(false);
    }

    private static GameObject BindTradeChoiceButton(Transform root, string label, UnityEngine.Events.UnityAction action)
    {
        var existing = root.Find(label);
        if (existing == null)
        {
            Debug.LogError($"Trade button '{label}' is missing under TradeInteract.");
            return null;
        }

        var button = existing.GetComponent<Button>();
        if (button == null)
            button = existing.gameObject.AddComponent<Button>();
        if (button.targetGraphic == null)
            button.targetGraphic = existing.GetComponent<Image>();
        button.onClick.RemoveAllListeners();
        if (action != null)
            button.onClick.AddListener(action);
        return button.gameObject;
    }

    private void EnsureRestockUi()
    {
        var shopBag = classroomTradePanel.transform.Find("ShopBag");
        if (shopBag != null && restockButton == null)
        {
            var existing = shopBag.Find("进货");
            restockButton = existing != null
                ? existing.gameObject
                : CreateUiButton("Restock", shopBag, new Vector2(.78f, .08f), new Vector2(132f, 42f), ToggleRestockFromUi).gameObject;
            restockButton.transform.SetAsLastSibling();
            var restock = restockButton.GetComponent<Button>();
            if (restock != null)
            {
                restock.onClick.RemoveAllListeners();
                restock.onClick.AddListener(ToggleRestockFromUi);
            }
        }

        if (restockPanel != null)
            return;

        restockPanel = CreateUiPanel("RestockPanel", classroomTradePanel.transform, new Color(0f, 0f, 0f, .72f));
        SetUiAnchors(restockPanel.GetComponent<RectTransform>(), Vector2.zero, Vector2.one, Vector2.zero, Vector2.zero);
        restockPanel.transform.SetAsLastSibling();

        var sheet = CreateUiPanel("Sheet", restockPanel.transform, new Color(.07f, .11f, .18f, .98f));
        SetUiAnchors(sheet.GetComponent<RectTransform>(), new Vector2(.18f, .12f), new Vector2(.92f, .88f), Vector2.zero, Vector2.zero);

        var title = CreateUiText("Title", sheet.transform, 28, TextAnchor.MiddleLeft);
        title.text = "Restock";
        title.color = new Color(.62f, .88f, 1f);
        SetUiAnchors(title.rectTransform, new Vector2(.06f, .88f), new Vector2(.7f, .98f), Vector2.zero, Vector2.zero);

        CreateUiButton("Close", sheet.transform, new Vector2(.88f, .93f), new Vector2(100f, 40f), ToggleRestockFromUi);

        var hint = CreateUiText("Hint", sheet.transform, 18, TextAnchor.MiddleLeft);
        hint.color = new Color(.82f, .86f, .92f);
        SetUiAnchors(hint.rectTransform, new Vector2(.06f, .02f), new Vector2(.94f, .12f), Vector2.zero, Vector2.zero);
        restockHintText = hint;

        var scrollRoot = new GameObject("List", typeof(RectTransform), typeof(Image), typeof(ScrollRect));
        scrollRoot.transform.SetParent(sheet.transform, false);
        scrollRoot.GetComponent<Image>().color = new Color(1f, 1f, 1f, .04f);
        var scrollRectTransform = scrollRoot.GetComponent<RectTransform>();
        SetUiAnchors(scrollRectTransform, new Vector2(.05f, .14f), new Vector2(.95f, .86f), Vector2.zero, Vector2.zero);
        var viewport = new GameObject("Viewport", typeof(RectTransform), typeof(Image), typeof(RectMask2D));
        viewport.transform.SetParent(scrollRoot.transform, false);
        viewport.GetComponent<Image>().color = new Color(1f, 1f, 1f, 0f);
        SetUiAnchors(viewport.GetComponent<RectTransform>(), Vector2.zero, Vector2.one, Vector2.zero, Vector2.zero);
        var content = new GameObject("Content", typeof(RectTransform), typeof(VerticalLayoutGroup), typeof(ContentSizeFitter));
        content.transform.SetParent(viewport.transform, false);
        var contentRect = content.GetComponent<RectTransform>();
        contentRect.anchorMin = new Vector2(0f, 1f);
        contentRect.anchorMax = new Vector2(1f, 1f);
        contentRect.pivot = new Vector2(.5f, 1f);
        contentRect.sizeDelta = Vector2.zero;
        var layout = content.GetComponent<VerticalLayoutGroup>();
        layout.padding = new RectOffset(8, 8, 8, 8);
        layout.spacing = 8f;
        layout.childAlignment = TextAnchor.UpperCenter;
        layout.childControlHeight = true;
        layout.childControlWidth = true;
        layout.childForceExpandHeight = false;
        layout.childForceExpandWidth = true;
        content.GetComponent<ContentSizeFitter>().verticalFit = ContentSizeFitter.FitMode.PreferredSize;
        var scroll = scrollRoot.GetComponent<ScrollRect>();
        scroll.viewport = viewport.GetComponent<RectTransform>();
        scroll.content = contentRect;
        scroll.horizontal = false;
        scroll.vertical = true;
        restockListContent = content.transform;
        restockPanel.SetActive(false);
    }

    private void ToggleRestockPanel()
    {
        if (restockPanel == null)
            return;
        if (restockPanel.activeSelf)
            CloseRestockPanel();
        else
            OpenRestockPanel();
    }

    private void OpenRestockPanel()
    {
        restockPanelOpen = true;
        if (customerPresent)
            remainingCustomerStay = Mathf.Max(.5f, customerDepartureTime - Time.unscaledTime);
        RebuildRestockList();
        restockPanel.SetActive(true);
        restockPanel.transform.SetAsLastSibling();
    }

    private void CloseRestockPanel()
    {
        if (restockPanel != null)
            restockPanel.SetActive(false);
        restockPanelOpen = false;
        if (customerPresent)
            customerDepartureTime = Time.unscaledTime + remainingCustomerStay;
        else if (classroomTradePanel != null && classroomTradePanel.activeSelf && nextCustomerArrivalTime < 0f && HasAnyStock())
            ScheduleNextCustomerArrival();
    }

    private void RebuildRestockList()
    {
        if (restockListContent == null)
            return;

        for (var i = restockListContent.childCount - 1; i >= 0; i--)
            Destroy(restockListContent.GetChild(i).gameObject);

        var listed = 0;
        for (var i = 0; i < catalog.Length; i++)
        {
            if (!itemUnlocked[i])
                continue;
            listed++;
            CreateRestockRow(i);
        }

        if (restockHintText != null)
        {
            restockHintText.text = listed == 0
                ? "Nothing to restock yet. Advance days or unlock new items through trades."
                : $"Wholesale restock costs money. Max {CampusItemCatalog.MaxStackPerItem} per slot. Add items in CampusItemCatalog.";
        }
    }

    private void CreateRestockRow(int itemIndex)
    {
        var item = catalog[itemIndex];
        var row = CreateUiPanel(item.Name, restockListContent, new Color(.12f, .18f, .26f, .95f));
        var layout = row.AddComponent<LayoutElement>();
        layout.minHeight = 64f;
        layout.preferredHeight = 64f;

        var icon = new GameObject("Icon", typeof(RectTransform), typeof(Image)).GetComponent<Image>();
        icon.transform.SetParent(row.transform, false);
        icon.preserveAspect = true;
        icon.raycastTarget = false;
        if (tradeSprites.TryGetValue(item.SpriteResource, out var sprite))
            icon.sprite = sprite;
        SetUiAnchors(icon.rectTransform, new Vector2(0f, .1f), new Vector2(.12f, .9f), new Vector2(8f, 0f), new Vector2(0f, 0f));

        var info = CreateUiText("Info", row.transform, 20, TextAnchor.MiddleLeft);
        info.text = $"{item.Name}    Cost ¥ {item.BuyPrice}    Price ¥ {item.SellPrice}    Stock {classroomStock[itemIndex]}/{CampusItemCatalog.MaxStackPerItem}";
        SetUiAnchors(info.rectTransform, new Vector2(.14f, 0f), new Vector2(.74f, 1f), Vector2.zero, Vector2.zero);

        var buy = CreateUiButton("Buy 1", row.transform, new Vector2(.88f, .5f), new Vector2(120f, 40f), () => RestockItem(itemIndex));
        buy.transform.SetAsLastSibling();
    }

    private void RestockItem(int itemIndex)
    {
        if (itemIndex < 0 || itemIndex >= catalog.Length || !itemUnlocked[itemIndex])
            return;

        var item = catalog[itemIndex];
        if (classroomStock[itemIndex] >= CampusItemCatalog.MaxStackPerItem)
        {
            if (restockHintText != null)
                restockHintText.text = $"{item.Name} is full.";
            return;
        }

        if (money < item.BuyPrice)
        {
            if (restockHintText != null)
                restockHintText.text = $"Not enough money. Sell stock first, then restock {item.Name}.";
            return;
        }

        money -= item.BuyPrice;
        classroomStock[itemIndex]++;
        RefreshHud();
        RefreshInventoryView();
        RebuildRestockList();
    }

    private void EnsureInventorySlots()
    {
        if (inventoryContent == null)
            return;

        for (var i = 0; i < catalog.Length; i++)
        {
            if (i < inventoryButtons.Count && inventoryButtons[i] != null)
            {
                inventoryButtons[i].gameObject.SetActive(itemUnlocked[i]);
                continue;
            }

            if (!itemUnlocked[i])
                continue;
            CreateInventorySlot(i);
        }
    }

    private void CreateInventorySlot(int itemIndex)
    {
        var item = catalog[itemIndex];
        var slot = new GameObject(item.Name, typeof(RectTransform), typeof(Button));
        slot.transform.SetParent(inventoryContent, false);
        var rect = slot.GetComponent<RectTransform>();
        rect.anchorMin = new Vector2(.5f, .5f);
        rect.anchorMax = new Vector2(.5f, .5f);
        rect.sizeDelta = new Vector2(230f, 150f);
        var icon = new GameObject("ItemIcon", typeof(RectTransform), typeof(Image)).GetComponent<Image>();
        icon.transform.SetParent(slot.transform, false);
        icon.preserveAspect = true;
        icon.raycastTarget = true;
        SetUiAnchors(icon.rectTransform, new Vector2(.05f, .05f), new Vector2(.95f, .95f), Vector2.zero, Vector2.zero);
        if (tradeSprites.TryGetValue(item.SpriteResource, out var sprite))
            icon.sprite = sprite;
        var button = slot.GetComponent<Button>();
        button.targetGraphic = icon;
        var captured = itemIndex;
        button.onClick.AddListener(() => SellItemToCustomer(captured));
        var hover = icon.gameObject.AddComponent<ItemHoverFeedback>();
        hover.ItemName = item.Name;
        hover.Tooltip = itemTooltip;
        hover.TooltipText = itemTooltipText;
        inventoryButtons.Add(button);
        inventoryItemImages.Add(icon);
    }

    private static GameObject CreateUiPanel(string name, Transform parent, Color color)
    {
        var panel = new GameObject(name, typeof(RectTransform), typeof(Image));
        panel.transform.SetParent(parent, false);
        panel.GetComponent<Image>().color = color;
        return panel;
    }

    private static Text CreateUiText(string name, Transform parent, int fontSize, TextAnchor alignment)
    {
        var text = new GameObject(name, typeof(RectTransform), typeof(Text)).GetComponent<Text>();
        text.transform.SetParent(parent, false);
        text.font = Resources.GetBuiltinResource<Font>("LegacyRuntime.ttf");
        text.fontSize = fontSize;
        text.alignment = alignment;
        text.color = Color.white;
        return text;
    }

    private static Button CreateUiButton(string label, Transform parent, Vector2 anchor, Vector2 size, UnityEngine.Events.UnityAction action)
    {
        var panel = CreateUiPanel(label, parent, new Color(.16f, .36f, .55f, .97f));
        var rect = panel.GetComponent<RectTransform>();
        rect.anchorMin = anchor;
        rect.anchorMax = anchor;
        rect.pivot = new Vector2(.5f, .5f);
        rect.sizeDelta = size;
        var button = panel.AddComponent<Button>();
        button.targetGraphic = panel.GetComponent<Image>();
        if (action != null)
            button.onClick.AddListener(action);
        var text = CreateUiText("Label", panel.transform, 20, TextAnchor.MiddleCenter);
        text.text = label;
        SetUiAnchors(text.rectTransform, Vector2.zero, Vector2.one, Vector2.zero, Vector2.zero);
        return button;
    }

    private static void SetUiAnchors(RectTransform rect, Vector2 anchorMin, Vector2 anchorMax, Vector2 offsetMin, Vector2 offsetMax)
    {
        rect.anchorMin = anchorMin;
        rect.anchorMax = anchorMax;
        rect.offsetMin = offsetMin;
        rect.offsetMax = offsetMax;
    }

    private static GameObject FindNamedChild(Transform root, string name)
    {
        if (root == null)
            return null;

        foreach (var child in root.GetComponentsInChildren<Transform>(true))
        {
            if (child.name == name)
                return child.gameObject;
        }

        return null;
    }

    private static void PlaceMapButton(Button button, Vector2 anchor)
    {
        var rect = button.GetComponent<RectTransform>();
        rect.anchorMin = anchor;
        rect.anchorMax = anchor;
        rect.anchoredPosition = Vector2.zero;
    }

    private void SetChoicesVisible(bool visible)
    {
        foreach (var button in choiceButtons)
            button.gameObject.SetActive(visible);
    }

    private static void SetButtonLabel(Button button, string label)
    {
        button.GetComponentInChildren<Text>().text = label;
    }
}
