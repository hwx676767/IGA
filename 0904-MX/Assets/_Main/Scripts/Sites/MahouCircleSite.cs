using System.Linq;
using Mahou.Core;
using Mahou.Data;
using Mahou.UI;
using UnityEngine;
using UnityEngine.UI;

namespace Mahou.Sites
{
    /// <summary>
    /// Runtime: wire nav/search only. Never rebuilds scene layout or clears feed content.
    /// Section switch = show/hide existing scene children.
    /// </summary>
    public class MahouCircleSite : MonoBehaviour
    {
        static readonly string[] TickerMessages =
        {
            "New announcement available in Announcements.",
            "Some older links are down while we clean things up. Hang tight.",
            "Keep it civil. Report flaming or weird behavior.",
            "Welcome to Mahou Circle — a place for those who still believe in miracles."
        };

        [SerializeField] Transform contentRoot;
        [SerializeField] GameObject detailOverlay;
        [SerializeField] InputField searchInput;
        [SerializeField] MarqueeTicker ticker;

        ForumSection _section = ForumSection.Home;
        string _searchQuery;
        int _tickerIndex;
        bool _wired;

        void Start()
        {
            CacheRefsIfNeeded();
            WireInteractions();
            // Ensure cards have view components bound
            EnsureCardViews();
            ShowSection(ForumSection.Home, rebuild: false);
            if (Application.isPlaying)
                InvokeRepeating(nameof(RotateTickerMessage), 8f, 8f);
        }

        /// <summary>Editor-only full build. Do NOT call at runtime — destroys manual layout.</summary>
        public void Build(Transform host)
        {
            Debug.LogWarning("[Mahou] Build() will clear MahouCircle children (destructive).");
            // Full chrome rebuild is only for wipe menu; runtime never calls this.
            // Minimal stub: sites already exist in user's scene.
        }

        void RotateTickerMessage()
        {
            if (ticker == null) CacheRefsIfNeeded();
            if (ticker == null) return;
            _tickerIndex = (_tickerIndex + 1) % TickerMessages.Length;
            ticker.SetMessage(TickerMessages[_tickerIndex]);
        }

        void CacheRefsIfNeeded()
        {
            if (contentRoot == null)
            {
                var scroll = transform.Find("MahouCircle/ContentPanel/FeedHost/FeedScroll/Viewport/Content");
                if (scroll != null) contentRoot = scroll;
            }
            if (detailOverlay == null)
            {
                var overlay = transform.Find("MahouCircle/DetailOverlay");
                if (overlay != null) detailOverlay = overlay.gameObject;
            }
            if (searchInput == null)
            {
                var input = transform.Find("MahouCircle/SearchBox/Input");
                if (input == null) input = transform.Find("SearchBox/Input");
                if (input != null) searchInput = input.GetComponent<InputField>();
            }
            if (ticker == null)
            {
                var bar = transform.Find("MahouCircle/ContentPanel/AnnounceBar");
                if (bar == null) bar = transform.Find("ContentPanel/AnnounceBar");
                if (bar != null) ticker = bar.GetComponent<MarqueeTicker>();
            }
        }

        void EnsureCardViews()
        {
            if (contentRoot == null) return;
            foreach (Transform child in contentRoot)
            {
                if (!child.name.StartsWith("PostCard_")) continue;
                var view = child.GetComponent<ForumPostCardView>();
                if (view == null) view = child.gameObject.AddComponent<ForumPostCardView>();
                if (string.IsNullOrEmpty(view.PostId))
                {
                    // PostCard_home_welcome -> home_welcome
                    view.PostId = child.name.Replace("PostCard_", "");
                }
            }

            // Tag Cover / Intro as Home blocks if missing
            foreach (Transform child in contentRoot)
            {
                if (child.name == "Cover" || child.name == "Intro")
                {
                    var block = child.GetComponent<SectionBlock>() ?? child.gameObject.AddComponent<SectionBlock>();
                    block.Section = ForumSection.Home;
                }
            }
        }

        void WireInteractions()
        {
            if (_wired) return;
            _wired = true;
            CacheRefsIfNeeded();

            BindButton("MahouCircle/SearchBtn", OnSearch);
            BindButton("SearchBtn", OnSearch);

            BindNav("Nav_Home", ForumSection.Home);
            BindNav("Nav_Announcements", ForumSection.Announcements);
            BindNav("Nav_FanArt", ForumSection.FanArt);
            BindNav("Nav_Talk", ForumSection.Talk);
            BindNav("Nav_Support", ForumSection.Support);
            BindNav("Nav_QnA", ForumSection.QnA);
        }

        void OnSearch()
        {
            _searchQuery = searchInput != null ? searchInput.text : "";
            GameState.I?.TryUnlockFromSearch(_searchQuery);
            ApplySearchFilter(_searchQuery);
        }

        void BindNav(string name, ForumSection section)
        {
            BindButton("MahouCircle/" + name, () => ShowSection(section, rebuild: false));
            BindButton(name, () => ShowSection(section, rebuild: false));
        }

        void BindButton(string path, UnityEngine.Events.UnityAction action)
        {
            var t = transform.Find(path);
            if (t == null) return;
            var btn = t.GetComponent<Button>();
            if (btn == null) return;
            btn.onClick.RemoveAllListeners();
            btn.onClick.AddListener(action);
        }

        void ShowSection(ForumSection section, bool rebuild)
        {
            _section = section;
            _searchQuery = null;
            GameState.I?.Visit(SiteId.MahouCircle, section.ToString());
            CacheRefsIfNeeded();
            if (contentRoot == null) return;

            EnsureCardViews();

            foreach (Transform child in contentRoot)
            {
                var view = child.GetComponent<ForumPostCardView>();
                if (view != null)
                {
                    bool unlocked = true;
                    var post = ContentDatabase.Posts.Find(p => p.Id == view.PostId);
                    if (post != null && post.HiddenUntilSearch && GameState.I != null)
                        unlocked = GameState.I.IsPostUnlocked(post);
                    child.gameObject.SetActive(view.MatchesSection(section) && unlocked);
                    continue;
                }

                var block = child.GetComponent<SectionBlock>();
                if (block != null)
                {
                    child.gameObject.SetActive(block.Section == section);
                    continue;
                }

                // Fallback: Cover/Intro only on Home
                if (child.name == "Cover" || child.name == "Intro")
                {
                    child.gameObject.SetActive(section == ForumSection.Home);
                    continue;
                }

                // Dead link teasers named Dead_*
                if (child.name.StartsWith("Dead_"))
                {
                    child.gameObject.SetActive(section == ForumSection.Announcements || section == ForumSection.Talk);
                    continue;
                }

                // Leave unknown objects as-is (don't hide user's custom objects)
            }
        }

        void ApplySearchFilter(string query)
        {
            CacheRefsIfNeeded();
            if (contentRoot == null) return;
            EnsureCardViews();

            if (string.IsNullOrWhiteSpace(query))
            {
                ShowSection(_section, false);
                return;
            }

            GameState.I?.TryUnlockFromSearch(query);
            var q = query.Trim().ToLowerInvariant();

            foreach (Transform child in contentRoot)
            {
                var view = child.GetComponent<ForumPostCardView>();
                if (view == null)
                {
                    child.gameObject.SetActive(false);
                    continue;
                }

                var post = ContentDatabase.Posts.Find(p => p.Id == view.PostId);
                if (post == null)
                {
                    child.gameObject.SetActive(false);
                    continue;
                }

                if (post.HiddenUntilSearch)
                    GameState.I?.UnlockPost(post);

                bool match =
                    (!string.IsNullOrEmpty(post.Title) && post.Title.ToLowerInvariant().Contains(q)) ||
                    (!string.IsNullOrEmpty(post.Body) && post.Body.ToLowerInvariant().Contains(q)) ||
                    (!string.IsNullOrEmpty(post.AuthorName) && post.AuthorName.ToLowerInvariant().Contains(q)) ||
                    ContentDatabase.MatchesUnlock(post, query);

                child.gameObject.SetActive(match);
            }
        }
    }

    /// <summary>Used only by full rebuild menu — not at runtime.</summary>
    public class MahouCircleLegacyBuilder : MonoBehaviour
    {
        public void BuildInto(Transform host) { }
    }
}
