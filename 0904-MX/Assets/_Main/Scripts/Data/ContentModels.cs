using System;
using System.Collections.Generic;

namespace Mahou.Data
{
    public enum SiteId
    {
        MahouCircle,
        ReNovaPublic,
        ReNovaStaff
    }

    public enum ForumSection
    {
        Home,
        Announcements,
        FanArt,
        Talk,
        Support,
        QnA
    }

    [Serializable]
    public class ForumComment
    {
        public string AuthorName;
        public string AvatarKey;
        public string Date;
        public string Body;
    }

    [Serializable]
    public class ForumPost
    {
        public string Id;
        public ForumSection Section;
        public string AuthorName;
        public string AvatarKey;
        public string Date;
        public string Title;
        public string Body;
        public int BaseLikes;
        public bool Pinned;
        public bool HiddenUntilSearch;
        public string[] SearchKeywords;
        public bool IsDeadLinkTarget;
        public string DeadLinkLabel;
        public List<ForumComment> Comments = new List<ForumComment>();
        public string UnlockHintSite; // optional: "renova" when post reveals ReNova URL
        /// <summary>Visible clickable link on the card (e.g. https://renova.institute/).</summary>
        public string LinkLabel;
        /// <summary>Site to open when LinkLabel is clicked: "renova".</summary>
        public string LinkTargetSite;
        /// <summary>Optional Resources sprite key under MahouUI/ (e.g. FanArt/1).</summary>
        public string ImageKey;
    }

    [Serializable]
    public class StaffReport
    {
        public string Keyword;
        public string Title;
        public string Body;
    }

    [Serializable]
    public class PageVisitRecord
    {
        public SiteId Site;
        public string PageId;
    }
}
