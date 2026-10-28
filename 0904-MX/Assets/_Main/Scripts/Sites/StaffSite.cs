using System.Collections.Generic;
using Mahou.Core;
using Mahou.Data;
using Mahou.UI;
using UnityEngine;
using UnityEngine.UI;

namespace Mahou.Sites
{
    /// <summary>
    /// Staff portal: chrome/layout stays in scene. Content area starts empty;
    /// search returns clickable entries; open an entry for the full report.
    /// </summary>
    public class StaffSite : MonoBehaviour
    {
        Transform _content;
        InputField _searchInput;
        bool _wired;
        string _lastQuery = "";
        List<StaffReport> _lastHits = new List<StaffReport>();

        void Start()
        {
            CacheRefs();
            WireInteractions();
            ShowEmpty();
        }

        public void Build(Transform host)
        {
            UiFactory.ClearChildren(host);

            var root = UiFactory.Root("ReNovaStaff", host);
            UiFactory.Stretch(root);

            var bg = UiFactory.MakeImage(root.transform, "BG", Art.Get("staff_bg"), stretchFill: true);
            bg.color = new Color(0.35f, 0.35f, 0.37f, 1f);

            var header = UiFactory.Root("Header", root.transform);
            UiFactory.SetAnchors(header.GetComponent<RectTransform>(), new Vector2(0, 1), new Vector2(1, 1), new Vector2(0, -80), new Vector2(0, 0));
            header.AddComponent<Image>().color = new Color(0.82f, 0.82f, 0.84f, 1f);

            var logo = UiFactory.MakeImage(header.transform, "Logo", Art.Get("rn_logo"));
            UiFactory.PlaceNative(logo, new Vector2(0, 0.5f), new Vector2(0, 0.5f), new Vector2(24, 0));

            var searchBox = UiFactory.MakeImage(header.transform, "Search", Art.Get("rn_search_box"));
            searchBox.raycastTarget = true;
            UiFactory.PlaceNative(searchBox, new Vector2(1, 0.5f), new Vector2(1, 0.5f), new Vector2(-64, 0));
            _searchInput = UiFactory.MakeInput(searchBox.transform, "Input", "enter report keyword…");
            UiFactory.Stretch(_searchInput.gameObject, 6, 6, 2, 2);
            _searchInput.GetComponent<Image>().color = new Color(1, 1, 1, 0.25f);

            var sbtn = UiFactory.MakeButton(header.transform, "SBtn", null);
            UiFactory.SetButtonSpriteNative(sbtn, Art.Get("rn_search_btn"));
            UiFactory.PlaceNative(sbtn.GetComponent<Image>(), new Vector2(1, 0.5f), new Vector2(1, 0.5f), new Vector2(-16, 0));

            var track = UiFactory.MakeImage(root.transform, "ScrollTrack", Art.Get("staff_scroll_track"));
            UiFactory.PlaceNative(track, new Vector2(1, 0.5f), new Vector2(1, 0.5f), new Vector2(-12, 0));

            var page = UiFactory.Root("Page", root.transform);
            UiFactory.SetAnchors(page.GetComponent<RectTransform>(), new Vector2(0, 0), new Vector2(1, 1), new Vector2(28, 20), new Vector2(-40, -90));
            UiFactory.Scroll(page.transform, "Scroll", out var content);
            _content = content;

            _wired = false;
            ShowEmpty();
        }

        void CacheRefs()
        {
            if (_content == null)
            {
                var t = transform.Find("ReNovaStaff/Page/Scroll/Viewport/Content");
                if (t == null) t = transform.Find("Page/Scroll/Viewport/Content");
                if (t != null) _content = t;
                else
                {
                    foreach (var tr in GetComponentsInChildren<Transform>(true))
                    {
                        if (tr.name == "Content" && tr.parent != null && tr.parent.name == "Viewport")
                        {
                            _content = tr;
                            break;
                        }
                    }
                }
            }
            if (_searchInput == null)
            {
                var t = transform.Find("ReNovaStaff/Header/Search/Input")
                        ?? transform.Find("Header/Search/Input");
                if (t != null) _searchInput = t.GetComponent<InputField>();
            }
        }

        void WireInteractions()
        {
            if (_wired) return;
            _wired = true;
            CacheRefs();

            var t = transform.Find("ReNovaStaff/Header/SBtn") ?? transform.Find("Header/SBtn");
            if (t != null)
            {
                var btn = t.GetComponent<Button>();
                if (btn != null)
                {
                    btn.onClick.RemoveAllListeners();
                    btn.onClick.AddListener(() => RunSearch(_searchInput != null ? _searchInput.text : ""));
                }
            }

            if (_searchInput != null)
            {
                _searchInput.onEndEdit.RemoveAllListeners();
                _searchInput.onEndEdit.AddListener(text =>
                {
                    RunSearch(text);
                });
            }
        }

        void ShowEmpty()
        {
            CacheRefs();
            Clear();
            _lastQuery = "";
            _lastHits.Clear();
            GameState.I?.Visit(SiteId.ReNovaStaff, "dashboard");
        }

        void RunSearch(string query)
        {
            CacheRefs();
            if (_content == null) return;

            var q = query != null ? query.Trim() : "";
            _lastQuery = q;
            GameState.I?.Visit(SiteId.ReNovaStaff, "search:" + q);

            if (string.IsNullOrEmpty(q))
            {
                ShowEmpty();
                return;
            }

            _lastHits = new List<StaffReport>(ContentDatabase.SearchStaffReports(q));
            ShowResultsList();
        }

        void ShowResultsList()
        {
            CacheRefs();
            if (_content == null) return;
            Clear();

            if (_lastHits == null || _lastHits.Count == 0)
                return;

            Block($"Search results · {_lastHits.Count} entr{(_lastHits.Count == 1 ? "y" : "ies")}", 15, FontStyle.Italic);

            for (int i = 0; i < _lastHits.Count; i++)
            {
                var report = _lastHits[i];
                AddEntryRow(report);
            }

            var found = GameState.I != null ? GameState.I.FoundStaffReports.Count : 0;
            Block($"Progress: {found}/12 internal reports recovered.", 14, FontStyle.Italic);
        }

        void AddEntryRow(StaffReport report)
        {
            var go = UiFactory.Root("Entry", _content);
            var le = go.AddComponent<LayoutElement>();
            le.minHeight = 72;
            le.preferredHeight = 78;
            le.flexibleWidth = 1;

            var img = go.AddComponent<Image>();
            img.color = new Color(0.18f, 0.18f, 0.2f, 0.92f);
            img.raycastTarget = true;

            var btn = go.AddComponent<Button>();
            btn.targetGraphic = img;
            var colors = btn.colors;
            colors.highlightedColor = new Color(0.28f, 0.28f, 0.32f, 1f);
            colors.pressedColor = new Color(0.35f, 0.22f, 0.28f, 1f);
            btn.colors = colors;

            var captured = report;
            btn.onClick.AddListener(() => OpenReport(captured));

            var title = UiFactory.Label(go.transform, "Title", report.Title, 17, FontStyle.Bold, TextAnchor.UpperLeft);
            title.color = new Color(0.94f, 0.94f, 0.96f);
            title.raycastTarget = false;
            var titleRt = title.rectTransform;
            titleRt.anchorMin = new Vector2(0, 0.45f);
            titleRt.anchorMax = new Vector2(1, 1);
            titleRt.offsetMin = new Vector2(14, 0);
            titleRt.offsetMax = new Vector2(-14, -10);

            var meta = UiFactory.Label(go.transform, "Meta", $"Keyword · {report.Keyword}    › open", 13, FontStyle.Normal, TextAnchor.UpperLeft);
            meta.color = new Color(0.72f, 0.72f, 0.78f);
            meta.raycastTarget = false;
            var metaRt = meta.rectTransform;
            metaRt.anchorMin = new Vector2(0, 0);
            metaRt.anchorMax = new Vector2(1, 0.45f);
            metaRt.offsetMin = new Vector2(14, 8);
            metaRt.offsetMax = new Vector2(-14, 0);
        }

        void OpenReport(StaffReport report)
        {
            if (report == null) return;
            CacheRefs();
            if (_content == null) return;

            Clear();
            GameState.I?.MarkStaffReport(report.Keyword);
            GameState.I?.Visit(SiteId.ReNovaStaff, "report:" + report.Keyword);

            AddBackButton();
            Block(report.Title, 22, FontStyle.Bold);
            Block($"Keyword: {report.Keyword}", 14);
            Block(report.Body, 16);

            var count = GameState.I != null ? GameState.I.FoundStaffReports.Count : 0;
            Block($"\nProgress: {count}/12 internal reports recovered.", 15, FontStyle.Italic);
        }

        void AddBackButton()
        {
            var go = UiFactory.Root("Back", _content);
            var le = go.AddComponent<LayoutElement>();
            le.minHeight = 36;
            le.preferredHeight = 36;

            var img = go.AddComponent<Image>();
            img.color = new Color(0.22f, 0.22f, 0.26f, 1f);
            img.raycastTarget = true;

            var btn = go.AddComponent<Button>();
            btn.targetGraphic = img;
            btn.onClick.AddListener(ShowResultsList);

            var label = UiFactory.Label(go.transform, "L", "‹ Back to results", 15, FontStyle.Bold, TextAnchor.MiddleLeft);
            label.color = new Color(0.95f, 0.75f, 0.85f);
            label.raycastTarget = false;
            UiFactory.Stretch(label.gameObject, 12, 12, 4, 4);
        }

        void Block(string text, int size, FontStyle style = FontStyle.Normal)
        {
            if (_content == null) return;
            var go = UiFactory.Root("Block", _content);
            var lines = Mathf.Max(1, text.Split('\n').Length);
            go.AddComponent<LayoutElement>().minHeight = Mathf.Max(36, size * 1.4f * lines + 20f);
            go.AddComponent<Image>().color = new Color(0.18f, 0.18f, 0.2f, 0.85f);
            var t = UiFactory.Label(go.transform, "T", text, size, style);
            t.color = new Color(0.92f, 0.92f, 0.94f);
            UiFactory.Stretch(t.gameObject, 12, 12, 10, 10);
        }

        void Clear()
        {
            if (_content == null) return;
            UiFactory.ClearChildren(_content);
        }
    }
}
