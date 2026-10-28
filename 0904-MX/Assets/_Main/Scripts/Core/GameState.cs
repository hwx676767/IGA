using System.Collections.Generic;
using Mahou.Data;
using UnityEngine;

namespace Mahou.Core
{
    public class GameState : MonoBehaviour
    {
        public static GameState I { get; private set; }

        readonly HashSet<string> _unlockedPosts = new HashSet<string>();
        readonly HashSet<string> _likedPosts = new HashSet<string>();
        readonly HashSet<string> _visitedPages = new HashSet<string>();
        readonly HashSet<string> _foundStaffReports = new HashSet<string>();
        readonly Dictionary<string, List<ForumComment>> _playerComments = new Dictionary<string, List<ForumComment>>();

        public bool RenovaUnlocked { get; private set; }
        public bool StaffUnlocked { get; private set; }
        public bool StaffLoggedIn { get; private set; }

        public const string StaffUser = "research";
        public const string StaffPass = "phase2";

        void Awake()
        {
            if (I != null && I != this)
            {
                Destroy(gameObject);
                return;
            }
            I = this;
        }

        /// <summary>Editor build helper — Awake may not run in edit mode.</summary>
        public void BindSingleton()
        {
            I = this;
        }

        public bool IsPostUnlocked(ForumPost post)
        {
            if (post == null) return false;
            if (!post.HiddenUntilSearch) return true;
            return _unlockedPosts.Contains(post.Id);
        }

        public void UnlockPost(ForumPost post)
        {
            if (post == null) return;
            _unlockedPosts.Add(post.Id);
            if (!string.IsNullOrEmpty(post.UnlockHintSite) && post.UnlockHintSite == "renova")
                UnlockRenova();
        }

        public void TryUnlockFromSearch(string query)
        {
            foreach (var post in ContentDatabase.Posts)
            {
                if (post.HiddenUntilSearch && ContentDatabase.MatchesUnlock(post, query))
                    UnlockPost(post);
            }

            var q = query.Trim().ToLowerInvariant();
            if (q.Contains("renova") || q.Contains("美容") || q.Contains("aesthetic") || q.Contains("beauty") || q.Contains("central exchange"))
                UnlockRenova();
        }

        public void UnlockRenova()
        {
            if (RenovaUnlocked) return;
            RenovaUnlocked = true;
            Object.FindFirstObjectByType<BrowserApp>()?.NotifyUnlockChanged();
        }

        public void UnlockStaff()
        {
            StaffUnlocked = true;
            Object.FindFirstObjectByType<BrowserApp>()?.NotifyUnlockChanged();
        }

        public bool TryStaffLogin(string user, string pass)
        {
            if (user == StaffUser && pass == StaffPass)
            {
                StaffLoggedIn = true;
                UnlockStaff();
                return true;
            }
            return false;
        }

        public bool IsLiked(string postId) => _likedPosts.Contains(postId);

        public void ToggleLike(string postId)
        {
            if (!_likedPosts.Add(postId))
                _likedPosts.Remove(postId);
        }

        public int GetLikeCount(ForumPost post)
        {
            var extra = IsLiked(post.Id) ? 1 : 0;
            return post.BaseLikes + extra;
        }

        public void Visit(SiteId site, string pageId)
        {
            _visitedPages.Add($"{site}:{pageId}");
        }

        public void MarkStaffReport(string keyword) => _foundStaffReports.Add(keyword.ToLowerInvariant());

        public IReadOnlyCollection<string> FoundStaffReports => _foundStaffReports;

        public List<ForumComment> GetPlayerComments(string postId)
        {
            if (!_playerComments.TryGetValue(postId, out var list))
            {
                list = new List<ForumComment>();
                _playerComments[postId] = list;
            }
            return list;
        }

        public void AddPlayerComment(string postId, string body)
        {
            if (string.IsNullOrWhiteSpace(body)) return;
            GetPlayerComments(postId).Add(new ForumComment
            {
                AuthorName = "You",
                AvatarKey = "anon",
                Date = "Just now",
                Body = body.Trim()
            });
        }

        public int VisitedCount => _visitedPages.Count;
        public int UnlockablePostTotal => ContentDatabase.Posts.FindAll(p => p.HiddenUntilSearch).Count;
        public int UnlockedHiddenCount => _unlockedPosts.Count;
    }
}
