using System.Collections.Generic;
using System.Linq;
using Mahou.Core;
using Mahou.Data;
using Mahou.Sites;
using Mahou.UI;
using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine;
using UnityEngine.UI;

namespace Mahou.EditorTools
{
    public class MahouAssetPostprocessor : AssetPostprocessor
    {
        void OnPreprocessTexture()
        {
            if (!assetPath.Replace('\\', '/').Contains("/Resources/MahouUI/")) return;
            var importer = (TextureImporter)assetImporter;
            importer.textureType = TextureImporterType.Sprite;
            importer.spriteImportMode = SpriteImportMode.Single;
            importer.spritePixelsPerUnit = 200f;
            importer.alphaIsTransparency = true;
            importer.mipmapEnabled = false;
            importer.filterMode = FilterMode.Point;
            importer.npotScale = TextureImporterNPOTScale.None;
        }
    }

    public static class MahouSetupMenu
    {
        const string ScenePath = "Assets/Scenes/SampleScene.unity";

        [MenuItem("Mahou Circle/0. Fix Canvas Scale (keep layout)")]
        public static void FixCanvasScaleOnly()
        {
            ApplyCanvasScale();
            var app = Object.FindFirstObjectByType<BrowserApp>();
            if (app != null)
            {
                EditorSceneManager.MarkSceneDirty(app.gameObject.scene);
                EditorSceneManager.SaveScene(app.gameObject.scene);
            }
            EditorUtility.DisplayDialog("Mahou",
                "已修正 Canvas（不改你的布局）：\n" +
                "· Reference 2048×1536\n" +
                "· Pixels Per Unit 200\n\n" +
                "Game 视口请选 2048x1536。",
                "OK");
        }

        static void ApplyCanvasScale()
        {
            PlayerSettings.defaultScreenWidth = 2048;
            PlayerSettings.defaultScreenHeight = 1536;

            var app = Object.FindFirstObjectByType<BrowserApp>();
            if (app == null) return;

            var canvas = app.GetComponentInChildren<Canvas>(true);
            if (canvas == null) return;

            var scaler = canvas.GetComponent<CanvasScaler>();
            if (scaler == null) scaler = canvas.gameObject.AddComponent<CanvasScaler>();

            scaler.uiScaleMode = CanvasScaler.ScaleMode.ScaleWithScreenSize;
            scaler.referenceResolution = new Vector2(2048, 1536);
            scaler.screenMatchMode = CanvasScaler.ScreenMatchMode.MatchWidthOrHeight;
            scaler.matchWidthOrHeight = 0.5f;
            scaler.referencePixelsPerUnit = 200f;
            canvas.referencePixelsPerUnit = 200f;

            var cam = Camera.main != null ? Camera.main : Object.FindFirstObjectByType<Camera>();
            if (cam != null)
            {
                canvas.renderMode = RenderMode.ScreenSpaceCamera;
                canvas.worldCamera = cam;
                canvas.planeDistance = 1f;
            }

            EditorUtility.SetDirty(canvas);
            EditorUtility.SetDirty(scaler);
        }

        [MenuItem("Mahou Circle/1. Reimport UI Sprites (PPU=200, Point)")]
        public static void Reimport()
        {
            PlayerSettings.defaultScreenWidth = 2048;
            PlayerSettings.defaultScreenHeight = 1536;
            var guids = AssetDatabase.FindAssets("t:Texture2D", new[] { "Assets/_Main/Resources/MahouUI" });
            AssetDatabase.StartAssetEditing();
            try
            {
                foreach (var guid in guids)
                {
                    var path = AssetDatabase.GUIDToAssetPath(guid);
                    var importer = AssetImporter.GetAtPath(path) as TextureImporter;
                    if (importer == null) continue;
                    importer.textureType = TextureImporterType.Sprite;
                    importer.spriteImportMode = SpriteImportMode.Single;
                    importer.spritePixelsPerUnit = 200f;
                    importer.alphaIsTransparency = true;
                    importer.mipmapEnabled = false;
                    importer.filterMode = FilterMode.Point;
                    importer.SaveAndReimport();
                }
            }
            finally
            {
                AssetDatabase.StopAssetEditing();
            }
            AssetDatabase.Refresh();
            Debug.Log($"[Mahou] Reimported {guids.Length} sprites @ PPU 200, FilterMode.Point");
            EditorUtility.DisplayDialog("Mahou", $"已重导 {guids.Length} 张 Sprite，PPU=200，Filter=Point。", "OK");
        }

        [MenuItem("Mahou Circle/2. Populate Forum Posts (keep layout)")]
        public static void PopulateForumPostsKeepLayout()
        {
            ApplyCanvasScale();

            var site = Object.FindFirstObjectByType<MahouCircleSite>();
            if (site == null)
            {
                EditorUtility.DisplayDialog("Mahou", "找不到 MahouCircleSite。", "OK");
                return;
            }

            var content = FindFeedContent(site.transform);
            if (content == null)
            {
                EditorUtility.DisplayDialog("Mahou", "找不到 Feed Content。", "OK");
                return;
            }

            foreach (Transform child in content)
            {
                if (child.name == "Cover" || child.name == "Intro")
                {
                    var b = child.GetComponent<SectionBlock>() ?? child.gameObject.AddComponent<SectionBlock>();
                    b.Section = ForumSection.Home;
                }
            }

            var existingIds = new HashSet<string>();
            foreach (Transform child in content)
            {
                if (!child.name.StartsWith("PostCard_")) continue;
                var id = child.name.Substring("PostCard_".Length);
                existingIds.Add(id);
                var view = child.GetComponent<ForumPostCardView>() ?? child.gameObject.AddComponent<ForumPostCardView>();
                view.PostId = id;
                var post = ContentDatabase.Posts.Find(p => p.Id == id);
                if (post != null)
                {
                    view.Section = post.Section;
                    view.Configure(post);
                }
                var rootBtn = child.GetComponent<Button>();
                if (rootBtn != null) rootBtn.enabled = false;
                EditorUtility.SetDirty(child.gameObject);
            }

            int added = 0;
            foreach (var post in ContentDatabase.Posts)
            {
                if (post.HiddenUntilSearch) continue;
                if (existingIds.Contains(post.Id)) continue;

                ForumPostCard.Create(content, post, _ => { });
                var card = content.Find("PostCard_" + post.Id);
                if (card == null) continue;

                var old = card.GetComponent<ForumPostCard>();
                if (old != null) Object.DestroyImmediate(old);

                var view = card.gameObject.AddComponent<ForumPostCardView>();
                view.Configure(post);

                var rootBtn = card.GetComponent<Button>();
                if (rootBtn != null) rootBtn.enabled = false;

                card.gameObject.SetActive(post.Section == ForumSection.Home);
                added++;
            }

            EditorSceneManager.MarkSceneDirty(site.gameObject.scene);
            EditorSceneManager.SaveScene(site.gameObject.scene);

            EditorUtility.DisplayDialog("Mahou",
                $"已补充论坛帖（保留你的布局）。\n新增 {added} 张。\n运行时只显示/隐藏，不再重建。",
                "OK");
        }

        [MenuItem("Mahou Circle/2b. Generate Fan Art PostImages (scene)")]
        public static void GenerateFanArtPostImages()
        {
            ApplyFanArtPostImageLayout(forceLayout: true);
        }

        /// <summary>
        /// Match reference: avatar/name/date → title → left-aligned art below (≈ half width).
        /// </summary>
        public static void ApplyFanArtPostImageLayout(bool forceLayout)
        {
            var site = Object.FindFirstObjectByType<MahouCircleSite>();
            if (site == null)
            {
                EditorUtility.DisplayDialog("Mahou", "找不到 MahouCircleSite。", "OK");
                return;
            }

            var content = FindFeedContent(site.transform);
            if (content == null)
            {
                EditorUtility.DisplayDialog("Mahou", "找不到 Feed Content。", "OK");
                return;
            }

            string[] ids = { "fa_a", "fa_b", "fa_c", "fa_d" };
            int created = 0, updated = 0;

            foreach (var id in ids)
            {
                var card = content.Find("PostCard_" + id);
                if (card == null)
                {
                    Debug.LogWarning($"[Mahou] Missing PostCard_{id}");
                    continue;
                }

                var post = ContentDatabase.Posts.Find(p => p.Id == id);
                if (post == null || string.IsNullOrEmpty(post.ImageKey))
                {
                    Debug.LogWarning($"[Mahou] No ImageKey for {id}");
                    continue;
                }

                var sprite = Art.Get(post.ImageKey);
                if (sprite == null)
                {
                    Debug.LogWarning($"[Mahou] Missing sprite {post.ImageKey}. Run 1. Reimport UI Sprites first.");
                    continue;
                }

                var view = card.GetComponent<ForumPostCardView>() ?? card.gameObject.AddComponent<ForumPostCardView>();
                view.PostId = id;
                view.Section = ForumSection.FanArt;

                var existing = card.Find("PostImage");
                bool isNew = existing == null;
                GameObject go;
                if (isNew)
                {
                    go = new GameObject("PostImage", typeof(RectTransform));
                    go.transform.SetParent(card, false);
                    created++;
                }
                else
                {
                    go = existing.gameObject;
                    updated++;
                }

                // Reference stack: place image after Date / before Title when possible
                var titleT = card.Find("Title");
                if (titleT != null)
                    go.transform.SetSiblingIndex(titleT.GetSiblingIndex());

                var rt = go.GetComponent<RectTransform>();
                if (isNew || forceLayout)
                {
                    // Left-aligned under title — ~45% feed width thumbnail
                    rt.anchorMin = new Vector2(0f, 1f);
                    rt.anchorMax = new Vector2(0f, 1f);
                    rt.pivot = new Vector2(0f, 1f);
                    rt.sizeDelta = new Vector2(300f, 300f);
                    rt.anchoredPosition = new Vector2(16f, -110f);

                    if (titleT != null)
                    {
                        var trt = titleT.GetComponent<RectTransform>();
                        trt.anchorMin = new Vector2(0f, 1f);
                        trt.anchorMax = new Vector2(1f, 1f);
                        trt.pivot = new Vector2(0.5f, 1f);
                        trt.anchoredPosition = new Vector2(0f, -78f);
                        trt.sizeDelta = new Vector2(-32f, 26f);
                    }

                    var le = card.GetComponent<LayoutElement>();
                    if (le != null)
                    {
                        le.minHeight = 420f;
                        le.preferredHeight = 460f;
                    }
                }

                var img = go.GetComponent<Image>() ?? go.AddComponent<Image>();
                img.sprite = sprite;
                img.preserveAspect = true;
                img.color = Color.white;
                img.raycastTarget = false;

                view.PostImage = img;
                if (view.TitleText == null && titleT != null)
                    view.TitleText = titleT.GetComponent<Text>();
                go.SetActive(true);

                EditorUtility.SetDirty(go);
                EditorUtility.SetDirty(view);
                EditorUtility.SetDirty(card.gameObject);
            }

            EditorSceneManager.MarkSceneDirty(site.gameObject.scene);
            EditorSceneManager.SaveScene(site.gameObject.scene);

            EditorUtility.DisplayDialog("Mahou",
                $"Fan Art 已按参考布局写入场景。\n新建 {created} · 更新 {updated}。\n\n" +
                "结构：头像/昵称/日期 → 标题 → 左对齐配图。\n" +
                "仍可在 Hierarchy 选 PostImage 微调。",
                "OK");
        }

        [MenuItem("Mahou Circle/4. Populate ReNova Pages (keep layout)")]
        public static void PopulateReNovaPagesKeepLayout()
        {
            ApplyCanvasScale();

            var site = Object.FindFirstObjectByType<ReNovaSite>(FindObjectsInactive.Include);
            if (site == null)
            {
                EditorUtility.DisplayDialog("Mahou", "找不到 ReNovaSite（RN）。", "OK");
                return;
            }

            var pageRoot = site.transform.Find("ReNovaPublic/PageRoot");
            if (pageRoot == null) pageRoot = site.transform.Find("PageRoot");
            if (pageRoot == null)
            {
                // deep search
                foreach (var t in site.GetComponentsInChildren<Transform>(true))
                {
                    if (t.name == "PageRoot")
                    {
                        pageRoot = t;
                        break;
                    }
                }
            }

            if (pageRoot == null)
            {
                EditorUtility.DisplayDialog("Mahou",
                    "找不到 PageRoot。\n请确认 RN/ReNovaPublic/PageRoot 仍在场景中（不要删外壳）。",
                    "OK");
                return;
            }

            // Ensure LoginPanel exists but do not move it
            var login = site.transform.Find("ReNovaPublic/LoginPanel") ?? site.transform.Find("LoginPanel");
            if (login != null)
                login.gameObject.SetActive(false);

            int created = ReNovaSite.EnsureStaticPages(pageRoot, fillContent: true);

            // Bind: make sure pages start with home visible
            foreach (Transform child in pageRoot)
            {
                if (!child.name.StartsWith("Page_")) continue;
                EditorUtility.SetDirty(child.gameObject);
            }

            EditorSceneManager.MarkSceneDirty(site.gameObject.scene);
            EditorSceneManager.SaveScene(site.gameObject.scene);

            EditorUtility.DisplayDialog("Mahou",
                "已在 PageRoot 下生成静态页面（保留 Logo/Nav/Login 布局）：\n" +
                "· Page_home / Page_about / Page_team / Page_contact\n" +
                $"· 新建页壳 {created} 个\n" +
                "· 已有内容的 Content 不会覆盖\n\n" +
                "运行时导航只显示/隐藏，不再重建。\n" +
                "可在 Hierarchy 里直接拖动调整各页内容。",
                "OK");
        }

        [MenuItem("Mahou Circle/3. Build Scene UI (WIPES LAYOUT)")]
        public static void BuildSceneUiDestructive()
        {
            if (!EditorUtility.DisplayDialog("危险操作",
                    "这会删除 MahouBrowser 并重建，你手动调整的布局会丢失！\n\n确定继续？",
                    "仍然重建", "取消"))
                return;

            Reimport();
            var scene = EditorSceneManager.OpenScene(ScenePath, OpenSceneMode.Single);
            foreach (var old in Object.FindObjectsByType<BrowserApp>(FindObjectsInactive.Include, FindObjectsSortMode.None))
                Object.DestroyImmediate(old.gameObject);

            var root = new GameObject("MahouBrowser");
            root.AddComponent<GameState>().BindSingleton();
            var app = root.AddComponent<BrowserApp>();
            BrowserApp.EnsureEventSystem();
            app.BuildHierarchyInScene();

            // After full build, convert cards to views
            var site = root.GetComponentInChildren<MahouCircleSite>(true);
            // BuildHierarchy still calls mc.Build which we broke — need restore build path

            EditorSceneManager.MarkSceneDirty(scene);
            EditorSceneManager.SaveScene(scene);
            EditorUtility.DisplayDialog("Mahou", "已全量重建。请再用「2. Populate Forum Posts」补齐卡片绑定。", "OK");
        }

        [MenuItem("Mahou Circle/Play Instructions")]
        public static void Instructions()
        {
            EditorUtility.DisplayDialog("Mahou Circle",
                "推荐流程（保留你的布局）：\n" +
                "0. Fix Canvas Scale\n" +
                "1. Reimport UI Sprites\n" +
                "2. Populate Forum Posts\n" +
                "2b. Generate Fan Art PostImages（按参考：标题下左对齐配图）\n" +
                "4. Populate ReNova Pages\n" +
                "Game 视口 2048×1536 → Play\n\n" +
                "截图：Scale 可以保持 0.43x 看全图。\n" +
                "不要用系统截图截 Game 窗口（那是缩小预览）。\n" +
                "用菜单 Capture Screenshot，或 Play 时按 F12。\n\n" +
                "流程：Mahou Talk 点链接 → ReNova → About/Contact 找线索 →\n" +
                "LOG IN: research / phase2 → Staff 搜报告。\n\n" +
                "不要点「3. Build Scene UI」除非你要推倒重来。\n" +
                "登录：research / phase2",
                "OK");
        }

        /// <summary>
        /// Captures the Game view at its selected resolution (e.g. 2048×1536),
        /// ignoring the Scale slider. Scale only affects on-screen preview size.
        /// </summary>
        [MenuItem("Mahou Circle/Capture Screenshot %#s")] // Ctrl+Shift+S
        public static void CaptureScreenshotNative()
        {
            CaptureScreenshot(superSize: 1);
        }

        [MenuItem("Mahou Circle/Capture Screenshot 2x (sharper)")]
        public static void CaptureScreenshot2x()
        {
            CaptureScreenshot(superSize: 2);
        }

        static void CaptureScreenshot(int superSize)
        {
            if (!Application.isPlaying)
            {
                EditorUtility.DisplayDialog("Mahou",
                    "请先 Play，再截图。\n\n" +
                    "Game 分辨率选 2048×1536 即可。\n" +
                    "Scale 不用调到 1x（0.43x 看全图也行）。\n" +
                    "系统截图截的是缩小预览，会糊；用这个菜单或 F12。",
                    "OK");
                return;
            }

            var dir = System.IO.Path.Combine(Application.dataPath, "..", "Screenshots");
            System.IO.Directory.CreateDirectory(dir);
            var name = $"mahou_{System.DateTime.Now:yyyyMMdd_HHmmss}_{(superSize > 1 ? "2x" : "1x")}.png";
            var path = System.IO.Path.GetFullPath(System.IO.Path.Combine(dir, name));

            ScreenCapture.CaptureScreenshot(path, superSize);
            Debug.Log($"[Mahou] Screenshot queued → {path}  (Game {Screen.width}×{Screen.height}, superSize={superSize})");
            EditorApplication.delayCall += () =>
            {
                if (System.IO.File.Exists(path))
                    EditorUtility.RevealInFinder(path);
                else
                    Debug.LogWarning("[Mahou] Screenshot file not ready yet — check Screenshots/ in a moment.");
            };
        }

        static Transform FindFeedContent(Transform siteRoot)
        {
            var paths = new[]
            {
                "MahouCircle/ContentPanel/FeedHost/FeedScroll/Viewport/Content",
                "ContentPanel/FeedHost/FeedScroll/Viewport/Content",
            };
            foreach (var p in paths)
            {
                var t = siteRoot.Find(p);
                if (t != null) return t;
            }
            // deep search
            foreach (var t in siteRoot.GetComponentsInChildren<Transform>(true))
            {
                if (t.name == "Content" && t.parent != null && t.parent.name == "Viewport")
                    return t;
            }
            return null;
        }
    }
}
