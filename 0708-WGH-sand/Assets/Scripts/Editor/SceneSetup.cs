using SandSimulator.Core;
using SandSimulator.Presentation;
using SandSimulator.UI;
using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

namespace SandSimulator.Editor
{
    public static class SceneSetup
    {
        private const string ConfigPath = "Assets/Resources/GameConfig.asset";
        private const string MenuPath = "Sand Simulator/Setup Scene";

        [MenuItem(MenuPath)]
        public static void SetupScene()
        {
            var config = EnsureGameConfig();
            SetupEnvironment();
            SetupGround();
            var dust = SetupDustParticles();
            var gameManager = SetupGameManager(config);
            SetupVisibilityDriver(dust);
            SetupUI();
            SetupCamera();

            EditorUtility.SetDirty(gameManager);
            EditorSceneManager.MarkSceneDirty(SceneManager.GetActiveScene());

            Debug.Log("[Sand Simulator] 场景搭建完成！按 Play 运行游戏。");
        }

        [MenuItem(MenuPath, true)]
        private static bool SetupSceneValidate()
        {
            return !Application.isPlaying;
        }

        private static GameConfig EnsureGameConfig()
        {
            var existing = AssetDatabase.LoadAssetAtPath<GameConfig>(ConfigPath);
            if (existing != null)
            {
                return existing;
            }

            if (!AssetDatabase.IsValidFolder("Assets/Resources"))
            {
                AssetDatabase.CreateFolder("Assets", "Resources");
            }

            var config = ScriptableObject.CreateInstance<GameConfig>();
            config.initialMoney = 5000;
            config.initialEnvironment = 25f;
            config.totalTurns = 12;
            config.maxActionsPerTurn = 2;

            AssetDatabase.CreateAsset(config, ConfigPath);
            AssetDatabase.SaveAssets();
            return config;
        }

        private static void SetupEnvironment()
        {
            RenderSettings.fog = true;
            RenderSettings.fogMode = FogMode.ExponentialSquared;
            RenderSettings.fogDensity = 0.04f;
            RenderSettings.fogColor = new Color(0.85f, 0.65f, 0.35f);
            RenderSettings.ambientMode = UnityEngine.Rendering.AmbientMode.Trilight;
            RenderSettings.ambientSkyColor = new Color(0.75f, 0.55f, 0.35f);
            RenderSettings.ambientEquatorColor = new Color(0.55f, 0.4f, 0.28f);
            RenderSettings.ambientGroundColor = new Color(0.45f, 0.32f, 0.2f);

            var lightGo = GameObject.Find("Directional Light");
            if (lightGo != null)
            {
                var light = lightGo.GetComponent<Light>();
                light.color = new Color(0.9f, 0.7f, 0.45f);
                light.intensity = 0.9f;
                light.transform.rotation = Quaternion.Euler(50f, -30f, 0f);
            }

            EnsureVolumeColorAdjustments();
        }

        private static void EnsureVolumeColorAdjustments()
        {
            var volumeGo = GameObject.Find("Global Volume");
            if (volumeGo == null)
            {
                return;
            }

            var volume = volumeGo.GetComponent<Volume>();
            if (volume == null || volume.sharedProfile == null)
            {
                return;
            }

            var profile = volume.sharedProfile;
            if (!profile.TryGet(out ColorAdjustments existing) || existing == null)
            {
                profile.Add<ColorAdjustments>(true);
                EditorUtility.SetDirty(profile);
                AssetDatabase.SaveAssets();
            }
        }

        private static void SetupGround()
        {
            var existing = GameObject.Find("Ground");
            if (existing != null)
            {
                Object.DestroyImmediate(existing);
            }

            var ground = GameObject.CreatePrimitive(PrimitiveType.Plane);
            ground.name = "Ground";
            ground.transform.position = Vector3.zero;
            ground.transform.localScale = new Vector3(4f, 1f, 4f);

            var renderer = ground.GetComponent<Renderer>();
            var mat = new Material(Shader.Find("Universal Render Pipeline/Lit"));
            mat.color = new Color(0.72f, 0.58f, 0.38f);
            mat.SetFloat("_Smoothness", 0.1f);
            renderer.sharedMaterial = mat;
        }

        private static DustParticleController SetupDustParticles()
        {
            var existing = GameObject.Find("DustParticles");
            if (existing != null)
            {
                Object.DestroyImmediate(existing);
            }

            var root = new GameObject("Environment");
            return DustParticleController.Create(root.transform);
        }

        private static GameManager SetupGameManager(GameConfig config)
        {
            var existing = GameObject.Find("GameManager");
            if (existing != null)
            {
                Object.DestroyImmediate(existing);
            }

            var go = new GameObject("GameManager");
            var manager = go.AddComponent<GameManager>();

            var so = new SerializedObject(manager);
            so.FindProperty("config").objectReferenceValue = config;
            so.ApplyModifiedPropertiesWithoutUndo();

            return manager;
        }

        private static void SetupVisibilityDriver(DustParticleController dust)
        {
            var existing = GameObject.Find("VisibilityDriver");
            if (existing != null)
            {
                Object.DestroyImmediate(existing);
            }

            var go = new GameObject("VisibilityDriver");
            var driver = go.AddComponent<VisibilityDriver>();

            var so = new SerializedObject(driver);
            so.FindProperty("dustController").objectReferenceValue = dust;
            so.ApplyModifiedPropertiesWithoutUndo();
        }

        private static void SetupUI()
        {
            var existing = GameObject.Find("GameUI");
            if (existing != null)
            {
                Object.DestroyImmediate(existing);
            }

            var canvasGo = new GameObject("GameUI");
            var canvas = canvasGo.AddComponent<Canvas>();
            canvas.renderMode = RenderMode.ScreenSpaceOverlay;
            canvasGo.AddComponent<CanvasScaler>().uiScaleMode = CanvasScaler.ScaleMode.ScaleWithScreenSize;
            canvasGo.GetComponent<CanvasScaler>().referenceResolution = new Vector2(1920, 1080);
            canvasGo.AddComponent<GraphicRaycaster>();

            if (Object.FindObjectOfType<UnityEngine.EventSystems.EventSystem>() == null)
            {
                var eventSystem = new GameObject("EventSystem");
                eventSystem.AddComponent<UnityEngine.EventSystems.EventSystem>();
                eventSystem.AddComponent<UnityEngine.EventSystems.StandaloneInputModule>();
            }

            var hud = canvasGo.AddComponent<GameHUD>();

            // Top bar
            var topBar = CreatePanel(canvasGo.transform, "TopBar",
                new Vector2(0, 1), new Vector2(1, 1), new Vector2(0, 1), new Vector2(0, 1),
                new Vector2(0, -80), Vector2.zero, new Color(0.1f, 0.08f, 0.06f, 0.85f));

            var turnText = CreateText(topBar.transform, "TurnText", "回合 1/12",
                new Vector2(0, 0.5f), new Vector2(0, 0.5f), new Vector2(20, 0), new Vector2(200, 40), 22);
            var moneyText = CreateText(topBar.transform, "MoneyText", "资金: ¥5000",
                new Vector2(0.25f, 0.5f), new Vector2(0.25f, 0.5f), Vector2.zero, new Vector2(250, 40), 22);
            var envText = CreateText(topBar.transform, "EnvText", "环境: 25",
                new Vector2(0.5f, 0.5f), new Vector2(0.5f, 0.5f), Vector2.zero, new Vector2(200, 40), 22);
            var visText = CreateText(topBar.transform, "VisText", "能见度: 25%",
                new Vector2(0.75f, 0.5f), new Vector2(0.75f, 0.5f), Vector2.zero, new Vector2(220, 40), 22);

            // Status bar
            var statusBar = CreatePanel(canvasGo.transform, "StatusBar",
                new Vector2(0, 1), new Vector2(1, 1), new Vector2(0, 1), new Vector2(0, 1),
                new Vector2(0, -130), new Vector2(0, -80), new Color(0.15f, 0.1f, 0.06f, 0.7f));

            var scaleText = CreateText(statusBar.transform, "ScaleText", "开采 0 | 工厂 0 | 绿化 0",
                new Vector2(0, 0.5f), new Vector2(0, 0.5f), new Vector2(20, 0), new Vector2(400, 30), 18);
            var actionsText = CreateText(statusBar.transform, "ActionsText", "本回合剩余行动: 2",
                new Vector2(1, 0.5f), new Vector2(1, 0.5f), new Vector2(-20, 0), new Vector2(300, 30), 18);
            actionsText.alignment = TextAnchor.MiddleRight;
            var statusText = CreateText(statusBar.transform, "StatusText", "在开采、建厂与绿化之间做出抉择",
                new Vector2(0.5f, 0.5f), new Vector2(0.5f, 0.5f), Vector2.zero, new Vector2(600, 30), 16);
            statusText.color = new Color(1f, 0.85f, 0.6f);

            // Bottom action panel
            var bottomPanel = CreatePanel(canvasGo.transform, "BottomPanel",
                new Vector2(0, 0), new Vector2(1, 0), new Vector2(0, 0), new Vector2(0, 0),
                Vector2.zero, new Vector2(0, 280), new Color(0.1f, 0.08f, 0.06f, 0.9f));

            var miningBtn = CreateActionButton(bottomPanel.transform, "MiningButton", "开采",
                new Vector2(0.125f, 0.65f), new Color(0.6f, 0.35f, 0.15f));
            var factoryBtn = CreateActionButton(bottomPanel.transform, "FactoryButton", "建工厂",
                new Vector2(0.375f, 0.65f), new Color(0.5f, 0.3f, 0.2f));
            var treeBtn = CreateActionButton(bottomPanel.transform, "TreeButton", "种树",
                new Vector2(0.625f, 0.65f), new Color(0.2f, 0.5f, 0.25f));
            var passBtn = CreateActionButton(bottomPanel.transform, "PassButton", "观望",
                new Vector2(0.875f, 0.65f), new Color(0.35f, 0.35f, 0.4f));

            var miningPreview = CreateText(bottomPanel.transform, "MiningPreview", "",
                new Vector2(0.125f, 0.3f), new Vector2(0.125f, 0.3f), Vector2.zero, new Vector2(400, 50), 14);
            var factoryPreview = CreateText(bottomPanel.transform, "FactoryPreview", "",
                new Vector2(0.375f, 0.3f), new Vector2(0.375f, 0.3f), Vector2.zero, new Vector2(400, 50), 14);
            var treePreview = CreateText(bottomPanel.transform, "TreePreview", "",
                new Vector2(0.625f, 0.3f), new Vector2(0.625f, 0.3f), Vector2.zero, new Vector2(400, 50), 14);

            miningPreview.alignment = TextAnchor.MiddleCenter;
            factoryPreview.alignment = TextAnchor.MiddleCenter;
            treePreview.alignment = TextAnchor.MiddleCenter;

            var endTurnBtn = CreateActionButton(bottomPanel.transform, "EndTurnButton", "结束回合",
                new Vector2(0.875f, 0.25f), new Color(0.25f, 0.4f, 0.55f));
            var endRect = endTurnBtn.GetComponent<RectTransform>();
            endRect.sizeDelta = new Vector2(160, 45);

            // Log panel
            var logPanel = CreatePanel(canvasGo.transform, "LogPanel",
                new Vector2(0, 0), new Vector2(0, 0), new Vector2(0, 0), new Vector2(0, 0),
                new Vector2(20, 300), new Vector2(420, 300), new Color(0.05f, 0.04f, 0.03f, 0.75f));

            var logText = CreateText(logPanel.transform, "LogText", "",
                new Vector2(0, 0), new Vector2(1, 1), new Vector2(10, 10), new Vector2(-20, -20), 14);
            logText.alignment = TextAnchor.UpperLeft;
            logText.horizontalOverflow = HorizontalWrapMode.Wrap;
            logText.verticalOverflow = VerticalWrapMode.Overflow;

            // Game over panel
            var gameOverPanel = CreatePanel(canvasGo.transform, "GameOverPanel",
                new Vector2(0.5f, 0.5f), new Vector2(0.5f, 0.5f), new Vector2(0.5f, 0.5f), new Vector2(0.5f, 0.5f),
                Vector2.zero, new Vector2(500, 300), new Color(0.08f, 0.06f, 0.04f, 0.95f));
            gameOverPanel.SetActive(false);

            var gameOverText = CreateText(gameOverPanel.transform, "GameOverText", "",
                new Vector2(0.5f, 0.6f), new Vector2(0.5f, 0.6f), Vector2.zero, new Vector2(460, 150), 24);
            gameOverText.alignment = TextAnchor.MiddleCenter;

            var restartBtn = CreateActionButton(gameOverPanel.transform, "RestartButton", "重新开始",
                new Vector2(0.5f, 0.25f), new Color(0.3f, 0.5f, 0.3f));

            // Wire HUD references
            var hudSo = new SerializedObject(hud);
            hudSo.FindProperty("turnText").objectReferenceValue = turnText;
            hudSo.FindProperty("moneyText").objectReferenceValue = moneyText;
            hudSo.FindProperty("environmentText").objectReferenceValue = envText;
            hudSo.FindProperty("visibilityText").objectReferenceValue = visText;
            hudSo.FindProperty("scaleText").objectReferenceValue = scaleText;
            hudSo.FindProperty("actionsText").objectReferenceValue = actionsText;
            hudSo.FindProperty("statusText").objectReferenceValue = statusText;
            hudSo.FindProperty("miningButton").objectReferenceValue = miningBtn;
            hudSo.FindProperty("factoryButton").objectReferenceValue = factoryBtn;
            hudSo.FindProperty("treeButton").objectReferenceValue = treeBtn;
            hudSo.FindProperty("passButton").objectReferenceValue = passBtn;
            hudSo.FindProperty("endTurnButton").objectReferenceValue = endTurnBtn;
            hudSo.FindProperty("miningPreview").objectReferenceValue = miningPreview;
            hudSo.FindProperty("factoryPreview").objectReferenceValue = factoryPreview;
            hudSo.FindProperty("treePreview").objectReferenceValue = treePreview;
            hudSo.FindProperty("logText").objectReferenceValue = logText;
            hudSo.FindProperty("gameOverPanel").objectReferenceValue = gameOverPanel;
            hudSo.FindProperty("gameOverText").objectReferenceValue = gameOverText;
            hudSo.FindProperty("restartButton").objectReferenceValue = restartBtn;
            hudSo.ApplyModifiedPropertiesWithoutUndo();
        }

        private static void SetupCamera()
        {
            var cam = Camera.main;
            if (cam == null)
            {
                return;
            }

            cam.transform.position = new Vector3(0f, 8f, -15f);
            cam.transform.rotation = Quaternion.Euler(25f, 0f, 0f);
            cam.backgroundColor = new Color(0.75f, 0.6f, 0.4f);
        }

        private static GameObject CreatePanel(Transform parent, string name,
            Vector2 anchorMin, Vector2 anchorMax, Vector2 pivot, Vector2 anchorPosPivot,
            Vector2 offsetMin, Vector2 offsetMax, Color color)
        {
            var go = new GameObject(name);
            go.transform.SetParent(parent, false);
            var rect = go.AddComponent<RectTransform>();
            rect.anchorMin = anchorMin;
            rect.anchorMax = anchorMax;
            rect.pivot = pivot;
            rect.offsetMin = offsetMin;
            rect.offsetMax = offsetMax;
            var img = go.AddComponent<Image>();
            img.color = color;
            return go;
        }

        private static Text CreateText(Transform parent, string name, string text,
            Vector2 anchor, Vector2 pivot, Vector2 anchoredPos, Vector2 size, int fontSize)
        {
            var go = new GameObject(name);
            go.transform.SetParent(parent, false);
            var rect = go.AddComponent<RectTransform>();
            rect.anchorMin = anchor;
            rect.anchorMax = anchor;
            rect.pivot = pivot;
            rect.anchoredPosition = anchoredPos;
            rect.sizeDelta = size;
            var uiText = go.AddComponent<Text>();
            uiText.text = text;
            uiText.fontSize = fontSize;
            uiText.color = new Color(0.95f, 0.9f, 0.8f);
            return uiText;
        }

        private static Button CreateActionButton(Transform parent, string name, string label,
            Vector2 anchor, Color bgColor)
        {
            var go = new GameObject(name);
            go.transform.SetParent(parent, false);
            var rect = go.AddComponent<RectTransform>();
            rect.anchorMin = anchor;
            rect.anchorMax = anchor;
            rect.pivot = new Vector2(0.5f, 0.5f);
            rect.sizeDelta = new Vector2(180, 55);
            var img = go.AddComponent<Image>();
            img.color = bgColor;
            var btn = go.AddComponent<Button>();
            btn.targetGraphic = img;

            var textGo = new GameObject("Text");
            textGo.transform.SetParent(go.transform, false);
            var textRect = textGo.AddComponent<RectTransform>();
            textRect.anchorMin = Vector2.zero;
            textRect.anchorMax = Vector2.one;
            textRect.offsetMin = Vector2.zero;
            textRect.offsetMax = Vector2.zero;
            var uiText = textGo.AddComponent<Text>();
            uiText.text = label;
            uiText.fontSize = 20;
            uiText.alignment = TextAnchor.MiddleCenter;
            uiText.color = Color.white;

            return btn;
        }
    }
}
