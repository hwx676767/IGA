using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

/// <summary>
/// Editor-only authoring utility. It creates S3 as a normal editable Unity UI
/// hierarchy; the runtime controller subsequently only binds interaction.
/// </summary>
public static class S3SceneBuilder
{
    private class Prop
    {
        public string name;
        public string hint;
        public Vector2 target;
        public Vector2 size;
        public Color color;

        public Prop(string name, string hint, float x, float y, float width, float height, Color color)
        {
            this.name = name;
            this.hint = hint;
            target = new Vector2(x, y);
            size = new Vector2(width, height);
            this.color = color;
        }
    }

    [MenuItem("Tools/Backstage/Rebuild S3 Scene")]
    public static void CreateOrRebuildScene()
    {
        Scene scene = EditorSceneManager.NewScene(NewSceneSetup.EmptyScene, NewSceneMode.Single);
        Font font = Resources.GetBuiltinResource<Font>("LegacyRuntime.ttf");

        GameObject camera = new GameObject("Main Camera", typeof(Camera), typeof(AudioListener));
        camera.tag = "MainCamera";
        camera.transform.position = new Vector3(0, 0, -10);
        camera.GetComponent<Camera>().orthographic = true;

        new GameObject("EventSystem", typeof(EventSystem), typeof(StandaloneInputModule));
        GameObject manager = new GameObject("S3_StageManager", typeof(S3StageController));

        Canvas canvas = CreateCanvas(manager.transform);
        RectTransform root = canvas.GetComponent<RectTransform>();
        Image backdrop = Image(root, "BackstageBackdrop", new Color(.025f, .04f, .075f, 1f));
        Stretch(backdrop.rectTransform, 0, 0, 0, 0);
        backdrop.raycastTarget = false;

        Text title = Text(root, "Title", font, 36, TextAnchor.MiddleLeft);
        title.text = "S3  排练布景 · 《月下密约》";
        title.fontStyle = FontStyle.Bold;
        Anchors(title.rectTransform, .04f, .91f, .63f, .98f);
        Text score = Text(root, "PerformanceScore", font, 25, TextAnchor.MiddleRight);
        score.text = "演出准备度  0%";
        Anchors(score.rectTransform, .67f, .915f, .96f, .975f);

        RectTransform stage = BuildStage(root, font);
        BuildInstruction(root, font);
        RectTransform tray = BuildTray(root, font);
        RectTransform dragLayer = new GameObject("DragLayer", typeof(RectTransform)).GetComponent<RectTransform>();
        dragLayer.SetParent(root, false);
        Stretch(dragLayer, 0, 0, 0, 0);

        Prop[] props = Props();
        foreach (Prop prop in props) CreateHint(stage, prop, font);
        for (int i = 0; i < props.Length; i++) CreateProp(tray, props[i], i, props.Length, font);

        EditorSceneManager.SaveScene(scene, "Assets/Scenes/S3.unity");
        AssetDatabase.SaveAssets();
        Debug.Log("S3 scene generated as editable hierarchy.");
    }

    private static Canvas CreateCanvas(Transform parent)
    {
        GameObject go = new GameObject("S3StageCanvas", typeof(RectTransform), typeof(Canvas), typeof(CanvasScaler), typeof(GraphicRaycaster));
        go.transform.SetParent(parent, false);
        Canvas canvas = go.GetComponent<Canvas>();
        canvas.renderMode = RenderMode.ScreenSpaceOverlay;
        CanvasScaler scaler = go.GetComponent<CanvasScaler>();
        scaler.uiScaleMode = CanvasScaler.ScaleMode.ScaleWithScreenSize;
        scaler.referenceResolution = new Vector2(1920, 1080);
        scaler.matchWidthOrHeight = .5f;
        return canvas;
    }

    private static RectTransform BuildStage(Transform parent, Font font)
    {
        Image frame = Image(parent, "StageFrame", new Color(.32f, .16f, .12f, 1f));
        Anchors(frame.rectTransform, .035f, .245f, .965f, .875f);
        frame.raycastTarget = false;
        Image stage = Image(frame.transform, "SideViewStage", new Color(.12f, .19f, .22f, 1f));
        Stretch(stage.rectTransform, 20, 20, -20, -20);
        stage.raycastTarget = false;

        Image sky = Image(stage.transform, "NightSkyPlaceholder", new Color(.09f, .15f, .25f, 1f));
        Anchors(sky.rectTransform, 0, .42f, 1, 1);
        sky.raycastTarget = false;
        Text skyText = Text(sky.transform, "BackdropArtPlaceholder", font, 22, TextAnchor.MiddleCenter);
        skyText.text = "【可替换：夜色城堡 / 花园背景】";
        skyText.color = new Color(.63f, .72f, .85f, .8f);
        Stretch(skyText.rectTransform, 0, 0, 0, 0);

        Image floor = Image(stage.transform, "WoodenStageFloor", new Color(.34f, .22f, .14f, 1f));
        Anchors(floor.rectTransform, 0, 0, 1, .42f);
        floor.raycastTarget = false;
        for (int i = 1; i < 5; i++)
        {
            Image plank = Image(floor.transform, "FloorPlank_" + i, new Color(.12f, .07f, .045f, .55f));
            Anchors(plank.rectTransform, 0, i * .18f, 1, i * .18f + .012f);
            plank.raycastTarget = false;
        }

        Image left = Image(stage.transform, "LeftCurtain", new Color(.48f, .07f, .1f, .94f));
        Anchors(left.rectTransform, 0, 0, .07f, 1); left.raycastTarget = false;
        Image right = Image(stage.transform, "RightCurtain", new Color(.48f, .07f, .1f, .94f));
        Anchors(right.rectTransform, .93f, 0, 1, 1); right.raycastTarget = false;
        Image top = Image(stage.transform, "TopCurtain", new Color(.54f, .08f, .12f, .95f));
        Anchors(top.rectTransform, 0, .91f, 1, 1); top.raycastTarget = false;

        Image route = Image(stage.transform, "ActorRouteHint", new Color(.96f, .8f, .3f, .13f));
        Anchors(route.rectTransform, .15f, .10f, .85f, .26f); route.raycastTarget = false;
        Text routeLabel = Text(route.transform, "RouteLabel", font, 18, TextAnchor.MiddleCenter);
        routeLabel.text = "演员会面 / 走位通道（保持中央开阔）";
        routeLabel.color = new Color(1f, .89f, .5f, .74f);
        Stretch(routeLabel.rectTransform, 0, 0, 0, 0);
        Text routeStatus = Text(stage.transform, "RouteStatus", font, 18, TextAnchor.MiddleCenter);
        routeStatus.fontStyle = FontStyle.Bold;
        routeStatus.text = "当前走位：中央通道畅通";
        Anchors(routeStatus.rectTransform, .32f, .82f, .68f, .89f);

        Actor(stage.transform, "Actor_Aileen", "演员 · 艾琳", new Color(.8f, .47f, .72f, 1f), new Vector2(.08f, .19f), font);
        Actor(stage.transform, "Actor_Lorne", "演员 · 洛恩", new Color(.35f, .67f, .95f, 1f), new Vector2(.92f, .19f), font);
        return stage.rectTransform;
    }

    private static void Actor(Transform parent, string objectName, string label, Color color, Vector2 position, Font font)
    {
        Image actor = Image(parent, objectName, color);
        actor.rectTransform.anchorMin = actor.rectTransform.anchorMax = position;
        actor.rectTransform.sizeDelta = new Vector2(102, 145);
        actor.raycastTarget = false;
        Text name = Text(actor.transform, "ActorName", font, 15, TextAnchor.LowerCenter);
        name.text = label;
        Stretch(name.rectTransform, 2, 5, -2, -4);
        Text route = Text(actor.transform, "ActorRoute", font, 13, TextAnchor.UpperCenter);
        route.text = "走位中";
        route.color = new Color(1, 1, 1, .85f);
        Anchors(route.rectTransform, 0, 1.02f, 1, 1.22f);
    }

    private static void BuildInstruction(Transform parent, Font font)
    {
        Image panel = Image(parent, "InstructionPanel", new Color(.07f, .11f, .18f, .96f));
        Anchors(panel.rectTransform, .04f, .18f, .96f, .235f); panel.raycastTarget = false;
        Text instruction = Text(panel.transform, "Instruction", font, 21, TextAnchor.MiddleLeft);
        instruction.text = "任务：把下方道具拖到舞台提示位。错误摆放可保留，但会影响演员走位与演出评分。";
        Anchors(instruction.rectTransform, .018f, .08f, .69f, .92f);
        Button preview = Button(panel.transform, "PreviewButton", "预演走位", font);
        Anchors(preview.GetComponent<RectTransform>(), .73f, .14f, .86f, .86f);
        Button reset = Button(panel.transform, "ResetButton", "收回全部", font);
        Anchors(reset.GetComponent<RectTransform>(), .875f, .14f, .985f, .86f);
        Text result = Text(parent, "PreviewResult", font, 20, TextAnchor.MiddleCenter);
        result.color = new Color(.9f, .83f, .52f, 1f);
        Anchors(result.rectTransform, .2f, .13f, .8f, .17f);
    }

    private static RectTransform BuildTray(Transform parent, Font font)
    {
        Image tray = Image(parent, "PropTray", new Color(.06f, .095f, .14f, 1f));
        Anchors(tray.rectTransform, .04f, .025f, .96f, .125f); tray.raycastTarget = false;
        RectTransform content = new GameObject("PropTrayContent", typeof(RectTransform)).GetComponent<RectTransform>();
        content.SetParent(tray.transform, false);
        Stretch(content, 8, 4, -8, -4);
        Text label = Text(parent, "PropTrayLabel", font, 18, TextAnchor.MiddleLeft);
        label.text = "道具栏";
        label.color = new Color(.67f, .78f, .91f, 1f);
        Anchors(label.rectTransform, .045f, .125f, .16f, .15f);
        return content;
    }

    private static void CreateHint(Transform parent, Prop prop, Font font)
    {
        Image hint = Image(parent, "Hint_" + prop.name, new Color(.9f, .77f, .25f, .18f));
        hint.rectTransform.anchorMin = hint.rectTransform.anchorMax = prop.target;
        hint.rectTransform.sizeDelta = prop.size + new Vector2(24, 24);
        hint.raycastTarget = false;
        Outline outline = hint.gameObject.AddComponent<Outline>();
        outline.effectColor = new Color(1f, .85f, .28f, .74f);
        outline.effectDistance = new Vector2(2, 2);
        Text label = Text(hint.transform, "HintLabel", font, 16, TextAnchor.LowerCenter);
        label.text = "推荐：" + prop.hint;
        label.color = new Color(1f, .89f, .48f, .95f);
        label.horizontalOverflow = HorizontalWrapMode.Overflow;
        Anchors(label.rectTransform, -1f, -.32f, 2f, .08f);
    }

    private static void CreateProp(Transform parent, Prop prop, int index, int count, Font font)
    {
        Image image = Image(parent, "Prop_" + prop.name, prop.color);
        image.rectTransform.anchorMin = image.rectTransform.anchorMax = new Vector2((index + .5f) / count, .5f);
        image.rectTransform.sizeDelta = new Vector2(184, 86);
        image.gameObject.AddComponent<S3StagePropDraggable>();
        Text icon = Text(image.transform, "PlaceholderIcon", font, 30, TextAnchor.MiddleCenter);
        icon.text = Icon(prop.name);
        icon.fontStyle = FontStyle.Bold;
        Anchors(icon.rectTransform, .04f, .35f, .96f, .92f);
        Text name = Text(image.transform, "Name", font, 16, TextAnchor.MiddleCenter);
        name.text = prop.name;
        Anchors(name.rectTransform, .04f, .08f, .96f, .38f);
        Text state = Text(image.transform, "State", font, 13, TextAnchor.UpperRight);
        state.text = "拖入舞台";
        state.color = new Color(1, 1, 1, .86f);
        Anchors(state.rectTransform, .05f, .78f, .95f, .98f);
    }

    private static Prop[] Props()
    {
        return new[]
        {
            new Prop("树", "左后场 · 森林入口", .16f, .67f, 105, 145, new Color(.22f, .55f, .32f, 1f)),
            new Prop("大炮", "右后场 · 战事远景", .84f, .54f, 132, 82, new Color(.36f, .37f, .42f, 1f)),
            new Prop("桌子", "左侧 · 会面区", .28f, .40f, 126, 72, new Color(.57f, .34f, .17f, 1f)),
            new Prop("椅子", "桌旁 · 会面区", .40f, .35f, 76, 96, new Color(.48f, .27f, .13f, 1f)),
            new Prop("花瓶", "桌面 · 会面区", .28f, .51f, 62, 74, new Color(.47f, .7f, .86f, 1f)),
            new Prop("木箱", "右侧翼 · 待运区", .73f, .37f, 96, 82, new Color(.64f, .43f, .22f, 1f)),
            new Prop("盖白布木箱", "左侧翼 · 备用坐具", .12f, .37f, 112, 80, new Color(.78f, .78f, .7f, 1f))
        };
    }

    private static Image Image(Transform parent, string name, Color color)
    {
        GameObject go = new GameObject(name, typeof(RectTransform), typeof(Image));
        go.transform.SetParent(parent, false);
        Image image = go.GetComponent<Image>();
        image.color = color;
        return image;
    }

    private static Text Text(Transform parent, string name, Font font, int size, TextAnchor alignment)
    {
        GameObject go = new GameObject(name, typeof(RectTransform), typeof(Text));
        go.transform.SetParent(parent, false);
        Text text = go.GetComponent<Text>();
        text.font = font;
        text.fontSize = size;
        text.alignment = alignment;
        text.color = Color.white;
        text.raycastTarget = false;
        return text;
    }

    private static Button Button(Transform parent, string name, string label, Font font)
    {
        Image image = Image(parent, name, new Color(.14f, .38f, .57f, 1f));
        Button button = image.gameObject.AddComponent<Button>();
        Text text = Text(image.transform, "Label", font, 18, TextAnchor.MiddleCenter);
        text.text = label;
        Stretch(text.rectTransform, 4, 3, -4, -3);
        return button;
    }

    private static string Icon(string name)
    {
        switch (name)
        {
            case "树": return "♣";
            case "大炮": return "▰";
            case "桌子": return "┬";
            case "椅子": return "└";
            case "花瓶": return "♧";
            case "木箱": return "▣";
            default: return "▤";
        }
    }

    private static void Anchors(RectTransform rect, float minX, float minY, float maxX, float maxY)
    {
        rect.anchorMin = new Vector2(minX, minY);
        rect.anchorMax = new Vector2(maxX, maxY);
        rect.offsetMin = rect.offsetMax = Vector2.zero;
    }

    private static void Stretch(RectTransform rect, float left, float bottom, float right, float top)
    {
        rect.anchorMin = Vector2.zero;
        rect.anchorMax = Vector2.one;
        rect.offsetMin = new Vector2(left, bottom);
        rect.offsetMax = new Vector2(right, top);
    }
}
