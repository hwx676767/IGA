using Mahou.Data;
using Mahou.Sites;
using Mahou.UI;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;
#if ENABLE_INPUT_SYSTEM
using UnityEngine.InputSystem.UI;
#endif

namespace Mahou.Core
{
    /// <summary>
    /// Browser shell lives in the scene. Play mode only wires clicks and SetActive — no hierarchy rebuild.
    /// </summary>
    public class BrowserApp : MonoBehaviour
    {
        [Header("Scene References (filled by Build Scene UI)")]
        [SerializeField] RectTransform canvasRt;
        [SerializeField] Transform siteHost;
        [SerializeField] Text addressLabel;
        [SerializeField] Text statusLabel;
        [SerializeField] GameObject mahouRoot;
        [SerializeField] GameObject renovaRoot;
        [SerializeField] GameObject staffRoot;
        [SerializeField] RectTransform chromeRt;

        SiteId _current = SiteId.MahouCircle;

        // Chrome layout snapshots (authored positions) — restored when Staff tab is hidden
        bool _chromeLayoutCached;
        Vector2 _mahouMin, _mahouMax, _renovaMin, _renovaMax, _addressMin, _addressMax;

        void Awake()
        {
            if (GetComponent<GameState>() == null)
            {
                var gs = gameObject.AddComponent<GameState>();
                gs.BindSingleton();
            }
            else
            {
                GetComponent<GameState>().BindSingleton();
            }

            EnsureEventSystem();
            EnsureRoots();
            SetupCanvasCamera();
            ApplyDefaultFontEverywhere();
        }

        /// <summary>Force Funnel Display on every legacy Text under this browser (scene + runtime).</summary>
        void ApplyDefaultFontEverywhere()
        {
            var font = UiFactory.DefaultFont;
            if (font == null) return;

            var root = canvasRt != null ? canvasRt : transform;
            foreach (var t in root.GetComponentsInChildren<Text>(true))
            {
                if (t != null) t.font = font;
            }
        }

        void Start()
        {
            EnsureRoots();
            if (mahouRoot == null || siteHost == null)
            {
                Debug.LogError("[Mahou] 场景引用丢失。请执行菜单：Mahou Circle → 2. Build Scene UI");
                return;
            }

            // Only activate — never rebuild UI at runtime.
            EnsureStaffTab(createIfMissing: true);
            RefreshChromeTabs();
            ShowSite(SiteId.MahouCircle);
            ApplyDefaultFontEverywhere();
        }

        void Update()
        {
            // F12: full-res screenshot (ignores Game view Scale preview)
            if (Input.GetKeyDown(KeyCode.F12))
                CapturePlayScreenshot(1);
            else if (Input.GetKeyDown(KeyCode.F11))
                CapturePlayScreenshot(2);
        }

        static void CapturePlayScreenshot(int superSize)
        {
            var dir = System.IO.Path.Combine(Application.dataPath, "..", "Screenshots");
            System.IO.Directory.CreateDirectory(dir);
            var name = $"mahou_{System.DateTime.Now:yyyyMMdd_HHmmss}_{(superSize > 1 ? "2x" : "1x")}.png";
            var path = System.IO.Path.GetFullPath(System.IO.Path.Combine(dir, name));
            ScreenCapture.CaptureScreenshot(path, superSize);
            Debug.Log($"[Mahou] Screenshot → {path} ({Screen.width}×{Screen.height} ×{superSize})");
        }

        void SetupCanvasCamera()
        {
            if (canvasRt == null) return;
            var canvas = canvasRt.GetComponent<Canvas>();
            if (canvas == null) return;

            var cam = Camera.main;
            if (cam == null) cam = FindFirstObjectByType<Camera>();

            if (cam != null)
            {
                canvas.renderMode = RenderMode.ScreenSpaceCamera;
                canvas.worldCamera = cam;
                canvas.planeDistance = 1f;
            }
            else
            {
                canvas.renderMode = RenderMode.ScreenSpaceOverlay;
            }

            canvas.sortingOrder = 50;
            canvasRt.localScale = Vector3.one;

            // Always enforce project scale — this was wrong in the scene (1920/PPU100)
            var scaler = canvasRt.GetComponent<CanvasScaler>();
            if (scaler == null) scaler = canvasRt.gameObject.AddComponent<CanvasScaler>();
            scaler.uiScaleMode = CanvasScaler.ScaleMode.ScaleWithScreenSize;
            scaler.referenceResolution = UiFactory.ReferenceResolution; // 2048x1536
            scaler.screenMatchMode = CanvasScaler.ScreenMatchMode.MatchWidthOrHeight;
            scaler.matchWidthOrHeight = 0.5f;
            scaler.referencePixelsPerUnit = UiFactory.ReferencePpu; // 200
            canvas.referencePixelsPerUnit = UiFactory.ReferencePpu;
        }

        void EnsureRoots()
        {
            if (canvasRt == null)
            {
                var t = transform.Find("Canvas");
                if (t != null) canvasRt = t as RectTransform;
            }

            if (siteHost == null && canvasRt != null)
                siteHost = canvasRt.Find("SiteHost");

            if (chromeRt == null && canvasRt != null)
                chromeRt = canvasRt.Find("Chrome") as RectTransform;

            if (mahouRoot == null && siteHost != null)
            {
                var t = siteHost.Find("MC");
                if (t != null) mahouRoot = t.gameObject;
            }

            if (renovaRoot == null && siteHost != null)
            {
                var t = siteHost.Find("RN");
                if (t != null) renovaRoot = t.gameObject;
            }

            if (staffRoot == null && siteHost != null)
            {
                var t = siteHost.Find("Staff");
                if (t != null) staffRoot = t.gameObject;
            }

            if (addressLabel == null && chromeRt != null)
            {
                var t = chromeRt.Find("Address");
                if (t != null) addressLabel = t.GetComponent<Text>();
            }

            if (statusLabel == null && canvasRt != null)
            {
                var t = canvasRt.Find("Status");
                if (t != null) statusLabel = t.GetComponent<Text>();
            }

            if (chromeRt != null)
                chromeRt.SetAsLastSibling();
        }

        /// <summary>Editor-only: build full static hierarchy into the open scene.</summary>
        public void BuildHierarchyInScene()
        {
            EnsureEventSystem();
            UiFactory.ClearChildren(transform);

            var canvasGo = UiFactory.Root("Canvas", transform);
            canvasRt = canvasGo.GetComponent<RectTransform>();
            UiFactory.Stretch(canvasGo);
            canvasRt.localScale = Vector3.one;
            canvasRt.anchoredPosition = Vector2.zero;
            canvasRt.sizeDelta = Vector2.zero;

            var canvas = canvasGo.AddComponent<Canvas>();
            var cam = Camera.main != null ? Camera.main : FindFirstObjectByType<Camera>();
            if (cam != null)
            {
                canvas.renderMode = RenderMode.ScreenSpaceCamera;
                canvas.worldCamera = cam;
                canvas.planeDistance = 1f;
            }
            else
            {
                canvas.renderMode = RenderMode.ScreenSpaceOverlay;
            }
            canvas.sortingOrder = 50;

            var scaler = canvasGo.AddComponent<CanvasScaler>();
            scaler.uiScaleMode = CanvasScaler.ScaleMode.ScaleWithScreenSize;
            scaler.referenceResolution = UiFactory.ReferenceResolution; // 2048 x 1536
            scaler.screenMatchMode = CanvasScaler.ScreenMatchMode.MatchWidthOrHeight;
            scaler.matchWidthOrHeight = 0.5f;
            scaler.referencePixelsPerUnit = UiFactory.ReferencePpu; // 200 — must match sprite PPU for SetNativeSize
            canvas.referencePixelsPerUnit = UiFactory.ReferencePpu;
            canvasGo.AddComponent<GraphicRaycaster>();

            // --- Sites (all exist in scene; inactive ones are toggled by tabs) ---
            var hostGo = UiFactory.Root("SiteHost", canvasGo.transform);
            siteHost = hostGo.transform;
            UiFactory.SetAnchors(hostGo.GetComponent<RectTransform>(), new Vector2(0, 0), new Vector2(1, 1),
                new Vector2(0, 28), new Vector2(0, -48));

            mahouRoot = UiFactory.Root("MC", siteHost);
            UiFactory.Stretch(mahouRoot);
            mahouRoot.AddComponent<MahouCircleSite>();
            // Chrome for MC must already exist in saved scenes; wipe rebuild leaves empty MC on purpose.
            // Use Populate after wipe, or keep using your hand-tuned scene.

            renovaRoot = UiFactory.Root("RN", siteHost);
            UiFactory.Stretch(renovaRoot);
            var rn = renovaRoot.AddComponent<ReNovaSite>();
            rn.Build(renovaRoot.transform);

            staffRoot = UiFactory.Root("Staff", siteHost);
            UiFactory.Stretch(staffRoot);
            var st = staffRoot.AddComponent<StaffSite>();
            st.Build(staffRoot.transform);

            // Start with only Mahou visible — ReNova tab unlocks from forum link
            mahouRoot.SetActive(true);
            renovaRoot.SetActive(false);
            staffRoot.SetActive(false);

            statusLabel = UiFactory.Label(canvasGo.transform, "Status",
                "Browse Mahou Circle · find leftover links in Talk", 14, FontStyle.Normal, TextAnchor.MiddleLeft);
            UiFactory.SetAnchors(statusLabel.rectTransform, new Vector2(0, 0), new Vector2(1, 0),
                new Vector2(12, 2), new Vector2(-12, 26));
            statusLabel.color = new Color(0.25f, 0.25f, 0.3f);
            statusLabel.raycastTarget = false;

            // Chrome last (topmost clicks) — no nested Canvas
            var chrome = UiFactory.Root("Chrome", canvasGo.transform);
            chromeRt = chrome.GetComponent<RectTransform>();
            UiFactory.SetAnchors(chromeRt, new Vector2(0, 1), new Vector2(1, 1), new Vector2(0, -48), new Vector2(0, 0));
            var chromeBg = chrome.AddComponent<UnityEngine.UI.Image>();
            chromeBg.color = new Color(0.93f, 0.9f, 0.92f, 1f);
            chromeBg.raycastTarget = true;

            MakeTab(chrome.transform, "Tab_Mahou", "Mahou Circle", SiteId.MahouCircle, 0.02f, 0.22f);
            MakeTab(chrome.transform, "Tab_ReNova", "ReNova", SiteId.ReNovaPublic, 0.23f, 0.40f);
            // Staff tab exists in hierarchy but stays hidden until login
            MakeTab(chrome.transform, "Tab_Staff", "Staff", SiteId.ReNovaStaff, 0.41f, 0.56f);
            var staffTab = chrome.transform.Find("Tab_Staff");
            if (staffTab != null) staffTab.gameObject.SetActive(false);

            addressLabel = UiFactory.Label(chrome.transform, "Address", "https://mahou.circle/", 14, FontStyle.Normal, TextAnchor.MiddleLeft);
            UiFactory.SetAnchors(addressLabel.rectTransform, new Vector2(0.45f, 0.15f), new Vector2(0.98f, 0.85f), Vector2.zero, Vector2.zero);
            addressLabel.color = new Color(0.25f, 0.25f, 0.3f);
            addressLabel.raycastTarget = false;

            chromeRt.SetAsLastSibling();
        }

        void MakeTab(Transform parent, string name, string label, SiteId site, float a, float b)
        {
            var btn = UiFactory.MakeButton(parent, name, null);
            var img = btn.GetComponent<UnityEngine.UI.Image>();
            img.color = new Color(1f, 0.75f, 0.85f, 1f);
            img.raycastTarget = true;
            UiFactory.SetAnchors(btn.GetComponent<RectTransform>(), new Vector2(a, 0.12f), new Vector2(b, 0.88f), Vector2.zero, Vector2.zero);

            var t = UiFactory.Label(btn.transform, "L", label, 13, FontStyle.Bold, TextAnchor.MiddleCenter);
            t.color = new Color(0.25f, 0.15f, 0.2f);
            t.raycastTarget = false;

            var tab = btn.gameObject.GetComponent<BrowserTabButton>() ?? btn.gameObject.AddComponent<BrowserTabButton>();
            tab.TargetSite = site;
            // Use a distinct default inactive paint for newly created tabs
            img.color = new Color(1f, 0.75f, 0.85f, 1f);
        }

        public void OnTabClicked(SiteId site)
        {
            EnsureRoots();

            if (site == SiteId.ReNovaStaff)
            {
                if (GameState.I == null || !GameState.I.StaffLoggedIn)
                {
                    SetStatus("Staff portal locked — log in on ReNova first");
                    if (GameState.I != null && GameState.I.RenovaUnlocked)
                    {
                        ShowSite(SiteId.ReNovaPublic);
                        renovaRoot?.GetComponent<ReNovaSite>()?.OpenLoginPage();
                    }
                    else
                    {
                        SetStatus("Find the institute link on Mahou Circle first");
                        ShowSite(SiteId.MahouCircle);
                    }
                    return;
                }
                ShowSite(SiteId.ReNovaStaff);
                return;
            }

            if (site == SiteId.ReNovaPublic)
            {
                if (GameState.I == null || !GameState.I.RenovaUnlocked)
                {
                    SetStatus("ReNova is locked — find the link in Mahou Circle Talk");
                    ShowSite(SiteId.MahouCircle);
                    return;
                }
            }

            ShowSite(site);
        }

        /// <summary>Unlock ReNova from a forum link and open the public site.</summary>
        public void OpenRenovaFromLink()
        {
            GameState.I?.UnlockRenova();
            EnsureRoots();
            ShowSite(SiteId.ReNovaPublic);
            SetStatus("Opened from Mahou Circle link");
        }

        public void ShowSite(SiteId site)
        {
            EnsureRoots();
            _current = site;

            if (siteHost != null)
                siteHost.gameObject.SetActive(true);

            // Staff only when explicitly shown after login
            if (mahouRoot != null) mahouRoot.SetActive(site == SiteId.MahouCircle);
            if (renovaRoot != null) renovaRoot.SetActive(site == SiteId.ReNovaPublic);
            if (staffRoot != null) staffRoot.SetActive(site == SiteId.ReNovaStaff);

            if (canvasRt != null)
                Canvas.ForceUpdateCanvases();

            switch (site)
            {
                case SiteId.MahouCircle:
                    SetAddress("https://mahou.circle/");
                    SetStatus(GameState.I != null && GameState.I.RenovaUnlocked
                        ? "Site: Mahou Circle"
                        : "Site: Mahou Circle · look for leftover links in Talk");
                    break;
                case SiteId.ReNovaPublic:
                    SetAddress("https://renova.institute/");
                    SetStatus("Site: ReNova · check About / Contact for staff access");
                    break;
                case SiteId.ReNovaStaff:
                    SetAddress("https://renova.institute/internal/");
                    SetStatus("Staff portal active · search report keywords");
                    break;
            }

            RefreshChromeTabs();
        }

        /// <summary>Called after successful employee login — activates staff page + Staff tab.</summary>
        public void ShowStaff()
        {
            GameState.I?.UnlockStaff();
            EnsureRoots();
            if (staffRoot == null)
            {
                SetStatus("Staff portal missing — rebuild Scene UI");
                return;
            }

            EnsureStaffTab(createIfMissing: true);
            ShowSite(SiteId.ReNovaStaff);
        }

        /// <summary>
        /// Ensures Tab_Staff exists. Equal-size tabs + Address shifts right when Staff is visible.
        /// Does not change other site UI; only Chrome tab/address X anchors.
        /// </summary>
        void EnsureStaffTab(bool createIfMissing)
        {
            if (chromeRt == null) return;
            CacheChromeLayoutOnce();

            var existing = chromeRt.Find("Tab_Staff");
            if (existing == null && createIfMissing)
            {
                var renova = chromeRt.Find("Tab_ReNova") as RectTransform;
                float minY = renova != null ? renova.anchorMin.y : 0.12f;
                float maxY = renova != null ? renova.anchorMax.y : 0.88f;
                MakeTab(chromeRt, "Tab_Staff", "Staff", SiteId.ReNovaStaff, 0.41f, 0.58f);
                var staffRt = chromeRt.Find("Tab_Staff") as RectTransform;
                if (staffRt != null)
                {
                    staffRt.anchorMin = new Vector2(0.41f, minY);
                    staffRt.anchorMax = new Vector2(0.58f, maxY);
                    if (renova != null)
                        staffRt.SetSiblingIndex(renova.GetSiblingIndex() + 1);
                    var rnImg = renova != null ? renova.GetComponent<Image>() : null;
                    var staffImg = staffRt.GetComponent<Image>();
                    if (rnImg != null && staffImg != null)
                        staffImg.color = rnImg.color;
                }
            }
            else if (existing != null)
            {
                var tab = existing.GetComponent<BrowserTabButton>() ?? existing.gameObject.AddComponent<BrowserTabButton>();
                tab.TargetSite = SiteId.ReNovaStaff;
            }

            bool unlocked = GameState.I != null && GameState.I.StaffLoggedIn;
            var staff = chromeRt.Find("Tab_Staff");
            if (staff != null)
                staff.gameObject.SetActive(unlocked);

            LayoutChromeTabs(unlocked);
        }

        void CacheChromeLayoutOnce()
        {
            if (_chromeLayoutCached || chromeRt == null) return;
            var mahou = chromeRt.Find("Tab_Mahou") as RectTransform;
            var renova = chromeRt.Find("Tab_ReNova") as RectTransform;
            var address = chromeRt.Find("Address") as RectTransform;
            if (mahou == null || renova == null) return;

            _mahouMin = mahou.anchorMin;
            _mahouMax = mahou.anchorMax;
            _renovaMin = renova.anchorMin;
            _renovaMax = renova.anchorMax;
            if (address != null)
            {
                _addressMin = address.anchorMin;
                _addressMax = address.anchorMax;
            }
            else if (addressLabel != null)
            {
                _addressMin = addressLabel.rectTransform.anchorMin;
                _addressMax = addressLabel.rectTransform.anchorMax;
            }
            _chromeLayoutCached = true;
        }

        /// <summary>
        /// 2 tabs: restore authored layout.
        /// 3 tabs: equal width buttons (based on Mahou), Address starts after the last tab.
        /// </summary>
        void LayoutChromeTabs(bool staffVisible)
        {
            if (chromeRt == null) return;
            CacheChromeLayoutOnce();
            if (!_chromeLayoutCached) return;

            var mahou = chromeRt.Find("Tab_Mahou") as RectTransform;
            var renova = chromeRt.Find("Tab_ReNova") as RectTransform;
            var staff = chromeRt.Find("Tab_Staff") as RectTransform;
            var address = chromeRt.Find("Address") as RectTransform;
            if (address == null && addressLabel != null)
                address = addressLabel.rectTransform;

            if (mahou == null || renova == null) return;

            if (!staffVisible || staff == null)
            {
                mahou.anchorMin = _mahouMin;
                mahou.anchorMax = _mahouMax;
                renova.anchorMin = _renovaMin;
                renova.anchorMax = _renovaMax;
                if (address != null)
                {
                    address.anchorMin = _addressMin;
                    address.anchorMax = _addressMax;
                }
                return;
            }

            // Equal tab width from authored Mahou size; gap from authored Mahou→ReNova spacing
            float tabW = _mahouMax.x - _mahouMin.x;
            float gap = Mathf.Max(0.005f, _renovaMin.x - _mahouMax.x);
            float start = _mahouMin.x;
            float yMin = _mahouMin.y;
            float yMax = _mahouMax.y;

            void Place(RectTransform rt, int index)
            {
                float x0 = start + index * (tabW + gap);
                float x1 = x0 + tabW;
                rt.anchorMin = new Vector2(x0, yMin);
                rt.anchorMax = new Vector2(x1, yMax);
                rt.anchoredPosition = Vector2.zero;
                rt.sizeDelta = Vector2.zero;
            }

            Place(mahou, 0);
            Place(renova, 1);
            Place(staff, 2);

            if (address != null)
            {
                float afterTabs = start + 3f * (tabW + gap) + 0.01f;
                afterTabs = Mathf.Min(afterTabs, 0.72f);
                address.anchorMin = new Vector2(afterTabs, _addressMin.y);
                address.anchorMax = new Vector2(_addressMax.x, _addressMax.y);
                address.anchoredPosition = Vector2.zero;
                address.sizeDelta = Vector2.zero;
            }
        }

        void RefreshChromeTabs()
        {
            if (chromeRt == null) return;

            bool renovaUnlocked = GameState.I != null && GameState.I.RenovaUnlocked;
            bool staffUnlocked = GameState.I != null && GameState.I.StaffLoggedIn;

            var renovaTab = chromeRt.Find("Tab_ReNova");
            if (renovaTab != null)
                renovaTab.gameObject.SetActive(renovaUnlocked);

            var staff = chromeRt.Find("Tab_Staff");
            if (staff != null)
                staff.gameObject.SetActive(staffUnlocked);

            LayoutChromeTabs(staffUnlocked);

            // When ReNova is still locked, stretch Mahou tab a bit and keep address readable
            if (!renovaUnlocked)
            {
                var mahou = chromeRt.Find("Tab_Mahou") as RectTransform;
                var address = chromeRt.Find("Address") as RectTransform;
                if (mahou != null)
                {
                    mahou.anchorMin = new Vector2(0.02f, mahou.anchorMin.y);
                    mahou.anchorMax = new Vector2(0.28f, mahou.anchorMax.y);
                    mahou.anchoredPosition = Vector2.zero;
                    mahou.sizeDelta = Vector2.zero;
                }
                if (address != null)
                {
                    address.anchorMin = new Vector2(0.30f, address.anchorMin.y);
                    address.anchorMax = new Vector2(0.98f, address.anchorMax.y);
                    address.anchoredPosition = Vector2.zero;
                    address.sizeDelta = Vector2.zero;
                }
            }

            var tabs = chromeRt.GetComponentsInChildren<BrowserTabButton>(true);
            foreach (var tab in tabs)
            {
                tab.SetSelected(tab.TargetSite == _current && tab.gameObject.activeInHierarchy);
            }
        }

        public void NotifyUnlockChanged()
        {
            RefreshChromeTabs();
        }

        void SetAddress(string msg)
        {
            if (addressLabel != null) addressLabel.text = msg;
        }

        void SetStatus(string msg)
        {
            if (statusLabel != null) statusLabel.text = msg;
        }

        public static void EnsureEventSystem()
        {
            var es = FindFirstObjectByType<EventSystem>();
            if (es == null)
            {
                var go = new GameObject("EventSystem");
                es = go.AddComponent<EventSystem>();
            }

#if ENABLE_INPUT_SYSTEM
            if (es.GetComponent<InputSystemUIInputModule>() == null)
            {
                var old = es.GetComponent<StandaloneInputModule>();
                if (old != null)
                {
                    if (Application.isPlaying) Object.Destroy(old);
                    else Object.DestroyImmediate(old);
                }
                es.gameObject.AddComponent<InputSystemUIInputModule>();
            }
#else
            if (es.GetComponent<StandaloneInputModule>() == null)
                es.gameObject.AddComponent<StandaloneInputModule>();
#endif
        }
    }
}
