using Mahou.Core;
using Mahou.Data;
using Mahou.UI;
using UnityEngine;
using UnityEngine.UI;

namespace Mahou.Sites
{
    /// <summary>
    /// ReNova public site. Pages live in the scene under PageRoot (Page_home / about / team / contact).
    /// Play mode only shows/hides + wires nav — never ClearChildren rebuild.
    /// </summary>
    public class ReNovaSite : MonoBehaviour
    {
        static readonly string[] PageIds = { "home", "about", "team", "contact" };

        Transform _pageRoot;
        GameObject _loginPanel;
        InputField _searchInput;
        InputField _userInput;
        InputField _passInput;
        Text _loginStatus;
        bool _wired;
        string _currentPage = "home";

        void Start()
        {
            CacheRefs();
            // Soft fallback: if pages not yet authored, create once so Play still works
            if (_pageRoot != null && _pageRoot.Find("Page_home") == null)
                EnsureStaticPages(_pageRoot, fillContent: true);
            WireInteractions();
            InjectNarrativeClues();
            ShowPage(_currentPage);
        }

        public void Build(Transform host)
        {
            // Destructive full rebuild kept for menu 3 only — prefer Populate ReNova Pages.
            UiFactory.ClearChildren(host);

            var root = UiFactory.Root("ReNovaPublic", host);
            UiFactory.Stretch(root);

            var bg = UiFactory.MakeImage(root.transform, "BG", Art.Get("rn_bg"), stretchFill: true);
            bg.color = Color.white;

            var logoBtn = UiFactory.MakeButton(root.transform, "Logo", null);
            UiFactory.SetButtonSpriteNative(logoBtn, Art.Get("rn_logo"));
            UiFactory.PlaceNative(logoBtn.GetComponent<Image>(), new Vector2(0, 1), new Vector2(0, 1), new Vector2(48, -16));

            var searchBox = UiFactory.MakeImage(root.transform, "SearchBox", Art.Get("rn_search_box"));
            searchBox.raycastTarget = true;
            UiFactory.PlaceNative(searchBox, new Vector2(1, 1), new Vector2(1, 1), new Vector2(-80, -28));
            _searchInput = UiFactory.MakeInput(searchBox.transform, "Input", "Search…");
            UiFactory.Stretch(_searchInput.gameObject, 8, 8, 2, 2);
            _searchInput.GetComponent<Image>().color = new Color(1, 1, 1, 0.2f);

            var sbtn = UiFactory.MakeButton(root.transform, "SBtn", null);
            UiFactory.SetButtonSpriteNative(sbtn, Art.Get("rn_search_btn"));
            UiFactory.PlaceNative(sbtn.GetComponent<Image>(), new Vector2(1, 1), new Vector2(1, 1), new Vector2(-28, -28));

            var nav = UiFactory.Root("Nav", root.transform);
            UiFactory.SetAnchors(nav.GetComponent<RectTransform>(), new Vector2(0, 1), new Vector2(1, 1),
                new Vector2(0, -130), new Vector2(0, -90));
            nav.AddComponent<Image>().color = new Color(0.82f, 0.82f, 0.84f, 1f);

            string[] pages = { "home", "about", "team", "contact", "login" };
            string[] labels = { "HOME", "ABOUT", "TEAM", "CONTACT", "LOG IN" };
            Sprite[] navSprites =
            {
                Art.Get("rn_nav_home"), Art.Get("rn_nav_about"), Art.Get("rn_nav_team"),
                Art.Get("rn_nav_contact"), Art.Get("rn_nav_login")
            };
            for (int i = 0; i < pages.Length; i++)
            {
                var b = UiFactory.MakeButton(nav.transform, "Nav_" + pages[i], null);
                if (navSprites[i] != null)
                    UiFactory.SetButtonSpriteNative(b, navSprites[i]);
                else
                {
                    b.GetComponent<Image>().color = new Color(1, 1, 1, 0.01f);
                    var t = UiFactory.Label(b.transform, "L", labels[i], 16, FontStyle.Bold, TextAnchor.MiddleCenter);
                    t.color = Color.black;
                    b.GetComponent<RectTransform>().sizeDelta = new Vector2(120, 36);
                }
                float x0 = 0.08f + i * 0.18f;
                var rt = b.GetComponent<RectTransform>();
                rt.anchorMin = rt.anchorMax = new Vector2(x0, 0.5f);
                rt.pivot = new Vector2(0.5f, 0.5f);
                rt.anchoredPosition = Vector2.zero;
            }

            var pageRootGo = UiFactory.Root("PageRoot", root.transform);
            _pageRoot = pageRootGo.transform;
            UiFactory.SetAnchors(pageRootGo.GetComponent<RectTransform>(), new Vector2(0, 0), new Vector2(1, 1),
                new Vector2(48, 28), new Vector2(-48, -140));

            BuildLoginPanel(root.transform);
            EnsureStaticPages(_pageRoot, fillContent: true);

            _wired = false;
            ShowPage("home");
        }

        void BuildLoginPanel(Transform root)
        {
            _loginPanel = UiFactory.Root("LoginPanel", root);
            UiFactory.SetAnchors(_loginPanel.GetComponent<RectTransform>(), new Vector2(0, 0), new Vector2(1, 1),
                new Vector2(0, 0), new Vector2(0, -118));
            var panelBg = _loginPanel.AddComponent<Image>();
            panelBg.color = Color.white;
            panelBg.raycastTarget = true;

            var loginBg = UiFactory.MakeImage(_loginPanel.transform, "LoginBg", Art.Get("rn_login_bg"));
            loginBg.raycastTarget = false;
            UiFactory.PlaceNative(loginBg, new Vector2(0.5f, 0.55f), new Vector2(0.5f, 0.5f), Vector2.zero);
            loginBg.color = new Color(1, 1, 1, 0.35f);

            var avatar = UiFactory.MakeImage(_loginPanel.transform, "Avatar", Art.Get("rn_avatar_circle"));
            avatar.raycastTarget = false;
            UiFactory.PlaceNative(avatar, new Vector2(0.5f, 0.72f), new Vector2(0.5f, 0.5f), Vector2.zero);

            var userLabel = UiFactory.Label(_loginPanel.transform, "UserLabel", "User Name", 18, FontStyle.Normal, TextAnchor.MiddleRight);
            UiFactory.SetAnchors(userLabel.rectTransform, new Vector2(0.5f, 0.5f), new Vector2(0.5f, 0.5f),
                new Vector2(-260, -18), new Vector2(-80, 18));
            userLabel.color = Color.black;

            var userBox = UiFactory.Root("UserBox", _loginPanel.transform);
            UiFactory.SetAnchors(userBox.GetComponent<RectTransform>(), new Vector2(0.5f, 0.5f), new Vector2(0.5f, 0.5f),
                new Vector2(-60, -20), new Vector2(220, 20));
            var userBoxImg = userBox.AddComponent<Image>();
            userBoxImg.sprite = Art.Get("rn_input");
            userBoxImg.type = Image.Type.Sliced;
            userBoxImg.color = Color.white;
            var outlineU = userBox.AddComponent<Outline>();
            outlineU.effectColor = Color.black;
            outlineU.effectDistance = new Vector2(1.5f, -1.5f);
            _userInput = UiFactory.MakeInput(userBox.transform, "Input", "");
            UiFactory.Stretch(_userInput.gameObject, 8, 8, 2, 2);
            _userInput.GetComponent<Image>().color = new Color(1, 1, 1, 0.01f);

            var passLabel = UiFactory.Label(_loginPanel.transform, "PassLabel", "Password", 18, FontStyle.Normal, TextAnchor.MiddleRight);
            UiFactory.SetAnchors(passLabel.rectTransform, new Vector2(0.5f, 0.5f), new Vector2(0.5f, 0.5f),
                new Vector2(-260, -70), new Vector2(-80, -34));
            passLabel.color = Color.black;

            var passBox = UiFactory.Root("PassBox", _loginPanel.transform);
            UiFactory.SetAnchors(passBox.GetComponent<RectTransform>(), new Vector2(0.5f, 0.5f), new Vector2(0.5f, 0.5f),
                new Vector2(-60, -72), new Vector2(220, -32));
            var passBoxImg = passBox.AddComponent<Image>();
            passBoxImg.sprite = Art.Get("rn_input");
            passBoxImg.type = Image.Type.Sliced;
            passBoxImg.color = Color.white;
            var outlineP = passBox.AddComponent<Outline>();
            outlineP.effectColor = Color.black;
            outlineP.effectDistance = new Vector2(1.5f, -1.5f);
            _passInput = UiFactory.MakeInput(passBox.transform, "Input", "");
            UiFactory.Stretch(_passInput.gameObject, 8, 8, 2, 2);
            _passInput.GetComponent<Image>().color = new Color(1, 1, 1, 0.01f);
            _passInput.contentType = InputField.ContentType.Password;

            var loginBtn = UiFactory.MakeButton(_loginPanel.transform, "LoginBtn", null);
            var btnSprite = Art.Get("rn_login_btn");
            if (btnSprite != null)
                UiFactory.SetButtonSpriteNative(loginBtn, btnSprite);
            else
            {
                loginBtn.GetComponent<Image>().color = Color.black;
                loginBtn.GetComponent<RectTransform>().sizeDelta = new Vector2(200, 44);
            }
            UiFactory.PlaceNative(loginBtn.GetComponent<Image>(), new Vector2(0.5f, 0.5f), new Vector2(0.5f, 0.5f), new Vector2(0, -118));
            var loginLabel = UiFactory.Label(loginBtn.transform, "L", "Log In", 20, FontStyle.Normal, TextAnchor.MiddleCenter);
            loginLabel.color = Color.white;
            loginLabel.raycastTarget = false;

            var statusGo = UiFactory.Root("LoginStatus", _loginPanel.transform);
            UiFactory.SetAnchors(statusGo.GetComponent<RectTransform>(), new Vector2(0.5f, 0.5f), new Vector2(0.5f, 0.5f),
                new Vector2(-200, -180), new Vector2(200, -150));
            _loginStatus = UiFactory.Label(statusGo.transform, "S", "", 14, FontStyle.Normal, TextAnchor.MiddleCenter);
            _loginStatus.color = new Color(0.5f, 0.2f, 0.2f);

            var hint = UiFactory.Label(_loginPanel.transform, "Hint", "Research Division credentials only", 12, FontStyle.Italic, TextAnchor.MiddleCenter);
            UiFactory.SetAnchors(hint.rectTransform, new Vector2(0.5f, 0), new Vector2(0.5f, 0),
                new Vector2(-200, 16), new Vector2(200, 40));
            hint.color = new Color(0.55f, 0.55f, 0.58f);

            _loginPanel.SetActive(false);
        }

        public void OpenLoginPage()
        {
            gameObject.SetActive(true);
            ShowPage("login");
        }

        void CacheRefs()
        {
            if (_pageRoot == null)
            {
                var t = transform.Find("ReNovaPublic/PageRoot");
                if (t == null) t = transform.Find("PageRoot");
                if (t != null) _pageRoot = t;
            }
            if (_loginPanel == null)
            {
                var t = transform.Find("ReNovaPublic/LoginPanel");
                if (t == null) t = transform.Find("LoginPanel");
                if (t != null) _loginPanel = t.gameObject;
            }
            if (_searchInput == null)
            {
                var t = transform.Find("ReNovaPublic/SearchBox/Input") ?? transform.Find("SearchBox/Input");
                if (t != null) _searchInput = t.GetComponent<InputField>();
            }
            if (_userInput == null)
            {
                var t = transform.Find("ReNovaPublic/LoginPanel/UserBox/Input")
                        ?? transform.Find("LoginPanel/UserBox/Input");
                if (t != null) _userInput = t.GetComponent<InputField>();
            }
            if (_passInput == null)
            {
                var t = transform.Find("ReNovaPublic/LoginPanel/PassBox/Input")
                        ?? transform.Find("LoginPanel/PassBox/Input");
                if (t != null) _passInput = t.GetComponent<InputField>();
            }
            if (_loginStatus == null)
            {
                var t = transform.Find("ReNovaPublic/LoginPanel/LoginStatus/S")
                        ?? transform.Find("LoginPanel/LoginStatus/S");
                if (t != null) _loginStatus = t.GetComponent<Text>();
            }
        }

        void WireInteractions()
        {
            if (_wired) return;
            _wired = true;
            CacheRefs();

            Bind("ReNovaPublic/Logo", () => ShowPage("home"));
            Bind("Logo", () => ShowPage("home"));
            Bind("ReNovaPublic/SBtn", OnSearch);
            Bind("SBtn", OnSearch);
            Bind("ReNovaPublic/Nav/Nav_home", () => ShowPage("home"));
            Bind("ReNovaPublic/Nav/Nav_about", () => ShowPage("about"));
            Bind("ReNovaPublic/Nav/Nav_team", () => ShowPage("team"));
            Bind("ReNovaPublic/Nav/Nav_contact", () => ShowPage("contact"));
            Bind("ReNovaPublic/Nav/Nav_login", () => ShowPage("login"));
            Bind("Nav/Nav_home", () => ShowPage("home"));
            Bind("Nav/Nav_about", () => ShowPage("about"));
            Bind("Nav/Nav_team", () => ShowPage("team"));
            Bind("Nav/Nav_contact", () => ShowPage("contact"));
            Bind("Nav/Nav_login", () => ShowPage("login"));
            Bind("ReNovaPublic/LoginPanel/LoginBtn", TryLogin);
            Bind("LoginPanel/LoginBtn", TryLogin);

            // Update hint text only (no layout change)
            var hint =
                transform.Find("ReNovaPublic/LoginPanel/Hint") ??
                transform.Find("LoginPanel/Hint");
            if (hint != null)
            {
                var ht = hint.GetComponent<Text>();
                if (ht != null) ht.text = "Research Division credentials only";
            }
        }

        void OnSearch()
        {
            var q = _searchInput != null ? _searchInput.text : "";
            GameState.I?.TryUnlockFromSearch(q);
        }

        void TryLogin()
        {
            CacheRefs();
            var user = _userInput != null ? _userInput.text.Trim() : "";
            var pass = _passInput != null ? _passInput.text.Trim() : "";

            if (GameState.I != null && GameState.I.TryStaffLogin(user, pass))
            {
                if (_loginStatus != null)
                {
                    _loginStatus.text = "Logged in. Opening staff portal…";
                    _loginStatus.color = new Color(0.1f, 0.55f, 0.25f);
                }
                Object.FindFirstObjectByType<BrowserApp>()?.ShowStaff();
            }
            else if (_loginStatus != null)
            {
                _loginStatus.text = "Wrong username or password";
                _loginStatus.color = new Color(0.7f, 0.15f, 0.15f);
            }
        }

        void Bind(string path, UnityEngine.Events.UnityAction action)
        {
            var t = transform.Find(path);
            if (t == null) return;
            var btn = t.GetComponent<Button>();
            if (btn == null) return;
            btn.onClick.RemoveAllListeners();
            btn.onClick.AddListener(action);
        }

        void ShowPage(string page)
        {
            CacheRefs();
            _currentPage = page;
            GameState.I?.Visit(SiteId.ReNovaPublic, page);

            bool isLogin = page == "login";
            if (_loginPanel != null) _loginPanel.SetActive(isLogin);
            if (_pageRoot != null) _pageRoot.gameObject.SetActive(!isLogin);

            if (isLogin || _pageRoot == null) return;

            // Show/hide authored pages — never rebuild
            for (int i = 0; i < _pageRoot.childCount; i++)
            {
                var child = _pageRoot.GetChild(i);
                if (!child.name.StartsWith("Page_")) continue;
                var id = child.name.Substring("Page_".Length);
                child.gameObject.SetActive(id == page);
            }
        }

        /// <summary>
        /// Editor / wipe-build helper: create Page_* under pageRoot without touching chrome/login.
        /// </summary>
        public static int EnsureStaticPages(Transform pageRoot, bool fillContent)
        {
            if (pageRoot == null) return 0;

            // Remove legacy single Scroll under PageRoot (from old runtime rebuild)
            for (int i = pageRoot.childCount - 1; i >= 0; i--)
            {
                var c = pageRoot.GetChild(i);
                if (c.name == "Scroll")
                {
                    if (Application.isPlaying) Object.Destroy(c.gameObject);
                    else Object.DestroyImmediate(c.gameObject);
                }
            }

            int created = 0;
            foreach (var id in PageIds)
            {
                var page = pageRoot.Find("Page_" + id);
                if (page == null)
                {
                    var go = UiFactory.Root("Page_" + id, pageRoot);
                    UiFactory.Stretch(go);
                    page = go.transform;
                    created++;
                }

                var content = FindOrCreatePageContent(page);
                if (fillContent && content != null && content.childCount == 0)
                    FillPageContent(content, id);
            }

            // Default visibility: home on, others off
            foreach (var id in PageIds)
            {
                var page = pageRoot.Find("Page_" + id);
                if (page != null)
                    page.gameObject.SetActive(id == "home");
            }

            return created;
        }

        static Transform FindOrCreatePageContent(Transform page)
        {
            var existing = page.Find("Scroll/Viewport/Content");
            if (existing != null) return existing;

            UiFactory.Scroll(page, "Scroll", out var content);
            return content;
        }

        public static void FillPageContent(Transform content, string pageId)
        {
            switch (pageId)
            {
                case "home":
                    AddImage(content, Art.Get("rn_facility"));
                    AddText(content, "ReNova Aesthetic Institute\nAdvancing regenerative science for a brighter future.", 28, FontStyle.Bold);
                    AddText(content, "Youth Optimization / Cellular Renewal / Precision Enhancement", 18);
                    AddText(content,
                        "Welcome to ReNova. Our institute combines regenerative research with personalized aesthetic care.\nExplore our facilities, meet the clinical team, or contact us regarding participation eligibility.",
                        16);
                    AddText(content,
                        "Now accepting Phase II regenerative candidates under private screening.",
                        15);
                    break;
                case "about":
                    AddImage(content, Art.Get("rn_promo1"));
                    AddText(content,
                        "At ReNova Aesthetic Institute, every journey begins with a calm and private consultation.\nOur reception space is designed to provide a quiet, welcoming environment where clients can feel at ease while discussing their individual needs.",
                        16);
                    AddImage(content, Art.Get("rn_promo2"));
                    AddText(content,
                        "Our treatment rooms are thoughtfully designed to support advanced aesthetic procedures in a controlled and comfortable setting.",
                        16);
                    AddImage(content, Art.Get("rn_promo3"));
                    AddText(content,
                        "Behind every treatment lies a foundation of continuous research and innovation.\nOur in-house laboratory is dedicated to exploring next-generation regenerative techniques, focusing on cellular optimization and long-term stability.",
                        16);
                    AddText(content,
                        "Internal note (do not publish): Phase II staff systems use clearance tag  phase2  for portal authentication.",
                        14);
                    break;
                case "team":
                    AddText(content, "Our Clinical & Research Team", 24, FontStyle.Bold);
                    AddImage(content, Art.Get("rn_resume_a"));
                    AddText(content, "Dr. A. Morita – Regenerative Specialist", 16);
                    AddImage(content, Art.Get("rn_resume_b"));
                    AddText(content, "Dr. L. Chen – Cellular Stability Research", 16);
                    AddImage(content, Art.Get("rn_resume_c"));
                    AddText(content, "Dr. R. Ito – Behavioral Optimization", 16);
                    AddText(content,
                        "Research Division handles subject intake and compliance review.",
                        14);
                    break;
                case "contact":
                    AddText(content, "Contact", 24, FontStyle.Bold);
                    AddText(content,
                        "For inquiries regarding participation eligibility, please submit your request via secure channel.",
                        18);
                    AddText(content,
                        "Employee access: use LOG IN on this site.\nResearch Division portal ID matches the division name:  research",
                        15);
                    AddText(content,
                        "Facility reference: Central Exchange Hall\nPartner community platforms may echo screening keywords.",
                        14);
                    break;
            }
        }

        /// <summary>
        /// Scene pages are authored statically — inject clue lines at runtime if missing.
        /// </summary>
        void InjectNarrativeClues()
        {
            CacheRefs();
            if (_pageRoot == null) return;

            TryInjectClue(_pageRoot.Find("Page_home"), "Clue_Phase",
                "Now accepting Phase II regenerative candidates under private screening.");
            TryInjectClue(_pageRoot.Find("Page_about"), "Clue_Pass",
                "Internal note (do not publish): Phase II staff systems use clearance tag  phase2  for portal authentication.");
            TryInjectClue(_pageRoot.Find("Page_team"), "Clue_Research",
                "Research Division handles subject intake and compliance review.");
            TryInjectClue(_pageRoot.Find("Page_contact"), "Clue_User",
                "Employee access: use LOG IN on this site.\nResearch Division portal ID matches the division name:  research");
        }

        static void TryInjectClue(Transform page, string markerName, string text)
        {
            if (page == null) return;
            var content = page.Find("Scroll/Viewport/Content") ?? page.Find("Content");
            if (content == null) return;
            if (content.Find(markerName) != null) return;

            var go = UiFactory.Root(markerName, content);
            var lines = Mathf.Max(1, text.Split('\n').Length);
            var le = go.AddComponent<LayoutElement>();
            le.minHeight = 28 + lines * 22;
            le.preferredHeight = le.minHeight;
            go.AddComponent<Image>().color = new Color(0.96f, 0.94f, 0.9f, 0.95f);
            var label = UiFactory.Label(go.transform, "T", text, 14, FontStyle.Italic);
            label.color = new Color(0.25f, 0.18f, 0.16f);
            UiFactory.Stretch(label.gameObject, 8, 8, 6, 6);
        }

        static void AddText(Transform parent, string text, int size, FontStyle style = FontStyle.Normal)
        {
            var go = UiFactory.Root("TextBlock", parent);
            var le = go.AddComponent<LayoutElement>();
            le.minHeight = 36;
            le.preferredHeight = Mathf.Max(36, size * 2.2f * (1 + text.Split('\n').Length));
            var label = UiFactory.Label(go.transform, "T", text, size, style);
            label.color = new Color(0.12f, 0.12f, 0.14f);
            // Don't Stretch — VLH controls height via LayoutElement
            var rt = label.rectTransform;
            rt.anchorMin = Vector2.zero;
            rt.anchorMax = Vector2.one;
            rt.offsetMin = new Vector2(4, 4);
            rt.offsetMax = new Vector2(-4, -4);
        }

        static void AddImage(Transform parent, Sprite sprite)
        {
            var go = UiFactory.Root("Img", parent);
            var img = go.AddComponent<Image>();
            img.sprite = sprite;
            img.preserveAspect = true;
            img.raycastTarget = false;
            if (sprite != null)
                UiFactory.ApplyNativeSize(img);
            var le = go.AddComponent<LayoutElement>();
            if (sprite != null)
            {
                le.preferredHeight = img.rectTransform.sizeDelta.y;
                le.preferredWidth = img.rectTransform.sizeDelta.x;
            }
            else
            {
                le.minHeight = 120;
                le.preferredHeight = 120;
            }
        }
    }
}
