using System;
using System.Collections.Generic;
using System.Linq;

namespace Mahou.Data
{
    public static class ContentDatabase
    {
        public static readonly List<ForumPost> Posts = BuildPosts();
        public static readonly List<StaffReport> StaffReports = BuildStaffReports();

        public static IEnumerable<ForumPost> GetSection(ForumSection section, Func<ForumPost, bool> unlocked)
        {
            return Posts
                .Where(p => p.Section == section)
                .Where(p => !p.HiddenUntilSearch || unlocked(p))
                .OrderByDescending(p => p.Pinned)
                .ThenByDescending(p => p.Date);
        }

        public static IEnumerable<ForumPost> SearchForum(string query, Func<ForumPost, bool> unlocked)
        {
            if (string.IsNullOrWhiteSpace(query))
                return Array.Empty<ForumPost>();

            var q = query.Trim().ToLowerInvariant();
            return Posts.Where(p =>
            {
                var visible = !p.HiddenUntilSearch || unlocked(p) || MatchesUnlock(p, q);
                if (!visible) return false;
                return Contains(p.Title, q) || Contains(p.Body, q) || Contains(p.AuthorName, q) ||
                       (p.SearchKeywords != null && p.SearchKeywords.Any(k => k.ToLowerInvariant().Contains(q) || q.Contains(k.ToLowerInvariant())));
            });
        }

        public static bool MatchesUnlock(ForumPost post, string query)
        {
            if (post.SearchKeywords == null) return false;
            var q = query.Trim().ToLowerInvariant();
            return post.SearchKeywords.Any(k =>
            {
                var key = k.ToLowerInvariant();
                return q == key || q.Contains(key) || key.Contains(q);
            });
        }

        public static StaffReport FindStaffReport(string query)
        {
            return SearchStaffReports(query).FirstOrDefault();
        }

        public static IReadOnlyList<StaffReport> SearchStaffReports(string query)
        {
            if (string.IsNullOrWhiteSpace(query))
                return Array.Empty<StaffReport>();

            var q = query.Trim().ToLowerInvariant();
            return StaffReports.Where(r =>
            {
                var k = r.Keyword != null ? r.Keyword.ToLowerInvariant() : "";
                var title = r.Title != null ? r.Title.ToLowerInvariant() : "";
                return q == k || q.Contains(k) || k.Contains(q) || title.Contains(q);
            }).ToList();
        }

        static bool Contains(string text, string q)
        {
            return !string.IsNullOrEmpty(text) && text.ToLowerInvariant().Contains(q);
        }

        static ForumPost P(
            string id, ForumSection section, string author, string avatar, string date,
            string title, string body, int likes = 3, bool pinned = false,
            bool hidden = false, string[] keywords = null, params ForumComment[] comments)
        {
            return new ForumPost
            {
                Id = id,
                Section = section,
                AuthorName = author,
                AvatarKey = avatar,
                Date = date,
                Title = title,
                Body = body,
                BaseLikes = likes,
                Pinned = pinned,
                HiddenUntilSearch = hidden,
                SearchKeywords = keywords,
                Comments = comments?.ToList() ?? new List<ForumComment>()
            };
        }

        static ForumComment C(string author, string avatar, string date, string body) =>
            new ForumComment { AuthorName = author, AvatarKey = avatar, Date = date, Body = body };

        static ForumPost WithImage(ForumPost post, string imageKey)
        {
            post.ImageKey = imageKey;
            return post;
        }

        static List<ForumPost> BuildPosts()
        {
            var list = new List<ForumPost>
            {
                // HOME
                P("home_welcome", ForumSection.Home, "Mahou Circle", "owner", "2013/03/01",
                    "Welcome to Mahou Circle",
                    "A place for those who still believe in miracles.\nShare your creations. Share your light.\n\nNew announcement available in Announcements.",
                    128, true,
                    comments: new[]
                    {
                        C("★pixie_bloom☆", "A", "2013/03/01", "I'm here!! Finally a place to talk OwO"),
                        C("♡sparkle_cry♡", "B", "2013/03/02", "Thanks for running this — I'll keep showing up."),
                        C("✧moon_doodle", "C", "2013/03/05", "Believers in miracles, assemble!"),
                        C("hw_sos", "R", "2013/03/08", "Bookmarked. See you around.")
                    }),

                // ANNOUNCEMENTS
                P("ann_pinned", ForumSection.Announcements, "★Luna★", "owner", "2014/05/16",
                    "Keep it civil, be kind (pinned)",
                    "If you see flaming or weird behavior, report it.\nPick the right board before you post.\nAnonymous Support is for venting and helping each other — don't use anon to attack people.\nQuestions about the site? Drop them in QnA and I'll reply when I can OwO\n\nEdit: We don't give medical or professional advice. If you see ads or shady links, don't trust them — watch your info and money.",
                    56, true,
                    comments: new[]
                    {
                        C("★pixie_bloom☆", "A", "2014/05/16", "Got it."),
                        C("soft_hug✿", "M", "2014/05/17", "Support board was really needed — thanks."),
                        C("stay_here☆", "Q", "2014/05/18", "Pinned. Keep it chill!")
                    }),

                P("ann_20150628", ForumSection.Announcements, "◆ModTeam◆", "admin", "2015/06/28",
                    "About old links being cleaned up",
                    "We're rearranging stuff on the site, so some older links don't open right now.\nCleanup is still in progress.",
                    12),

                P("ann_20150401", ForumSection.Announcements, "◆ModTeam◆", "admin", "2015/04/01",
                    "Offline meetups are done for good",
                    "After talking it over, the mods decided we're pausing offline hangouts and won't run them again.\nNo more meetup schedules will go out, and anything already planned is canceled.\nFrom now on it's online only.",
                    88),

                P("ann_20140923", ForumSection.Announcements, "◆ModTeam◆", "admin", "2014/09/23",
                    "Monthly offline hangouts — how it works",
                    "To keep everyone connected and a bit more stable, offline hangouts will now run once a month.\n\nWhen: third Sunday of each month\nWhere: mods will tell you\nHow: we'll message you with details after you're confirmed\n\nWho gets in depends on activity and how you've been lately. If you're on the list you'll get a site DM ahead of time — check your inbox.\nDidn't get a message? No stress. You can still hang out online.",
                    41),

                P("ann_20140915", ForumSection.Announcements, "★Luna★", "owner", "2014/09/15",
                    "Heads-up about mods for a bit",
                    "Hey everyone — I've got a lot going on IRL and can't keep up with day-to-day forum stuff like before.\nSo a few people I trust will help run things for now.\nThey'll handle reviews, meetups, the usual.\nIf you need something, hit up the new mod team first.\nThanks for sticking with us.",
                    67),

                P("ann_20140701", ForumSection.Announcements, "★Luna★", "owner", "2014/07/01",
                    "July hangout notice (edited)",
                    "Sorry — given some of the stuff floating around the site lately, the July hangout is canceled for now...\nI'm sorting through what's been posted and trying to figure out what's going on.\nUntil things are clearer, please don't go to any offline thing that isn't confirmed here.\nStay sharp, keep your personal info safe, and don't trust random DMs or invites.\nIf there's news, we'll post it in Announcements first OwO",
                    102),

                P("ann_20140310", ForumSection.Announcements, "★Luna★", "owner", "2014/03/10",
                    "March hangout is on!",
                    "Sorry for the wait! After three months we're doing another hangout~\nWhen: next Saturday 14:00\nWhere: downtown · Central Exchange Hall, 1F free space\nWho: anyone who wants to come\nWe'll have: OC sharing / art talk / free chat / games / freebie swaps (optional)",
                    74),

                P("ann_20131214", ForumSection.Announcements, "★Luna★", "owner", "2013/12/14",
                    "December hangout notice",
                    "Break's coming up, so we're doing another hangout!\nWhen: next Saturday 14:00\nWhere: downtown · Central Exchange Hall, 1F free space\nWho: open to everyone",
                    63),

                P("ann_20130930", ForumSection.Announcements, "★Luna★", "owner", "2013/09/30",
                    "This month's hangout",
                    "You asked for it — we're putting together a small meetup.\nWhen: next Saturday 14:00\nWhere: downtown · Central Exchange Hall, 1F free space\nWho: open to everyone\nCan't wait to see you OwO",
                    91),

                // FAN ART (ImageKey = ArtWork 1–4)
                WithImage(P("fa_a", ForumSection.FanArt, "★pixie_bloom☆", "A", "2014/02/02", "My little magic fairy design", "First post here — be nice~", 22,
                    comments: new[] { C("♡sparkle_cry♡", "B", "2014/02/02", "SO CUTE!!") }), "FanArt/1"),
                WithImage(P("fa_b", ForumSection.FanArt, "♡sparkle_cry♡", "B", "2014/01/18", "My OC magical girl", "Still stuck on the transformation line… anyone wanna brainstorm?", 35), "FanArt/2"),
                WithImage(P("fa_c", ForumSection.FanArt, "✧moon_doodle", "C", "2013/11/03", "Theme illustration", "Tried my new color swatches — hope you like it.", 48), "FanArt/3"),
                WithImage(P("fa_d", ForumSection.FanArt, "ribbon_cloud~", "D", "2013/08/20", "If magical girls were real — 4-panel comic", "What if miracles actually happened…", 61), "FanArt/4"),

                // TALK - open
                P("talk_cancel", ForumSection.Talk, "ribbon_cloud~", "D", "2015/04/01", "Can't believe offline stuff is gone forever",
                    "Saw the announcement… so it's online only from now on?", 19,
                    comments: new[] { C("stay_here☆", "Q", "2015/04/01", "Site already feels emptier.") }),

                P("talk_method", ForumSection.Talk, "✦100%chosen✦", "E", "2014/12/13", "How to get picked for hangouts 100%",
                    "Wrote down some tips on getting \"chosen\"… not everyone gets in. DM if you want it.", 7),

                P("talk_recent", ForumSection.Talk, "harbor_fairy?", "F", "2014/10/29", "Anyone go to the latest meetup?",
                    "Heard they moved it to xx Road, Harbor District. Anything different this time?\n\nSomeone in the comments dropped a site — looks like that aesthetic place near Central Exchange.",
                    15,
                    comments: new[]
                    {
                        C("freq_girl♪", "G", "2014/10/29", "Nothing special. Same as before."),
                        C("link_hunter☆", "H", "2014/10/29", "Wait isn't that the old address of that aesthetic lab?\nTheir site is still up. I pasted the link below — tap it.")
                    }),

                P("talk_awaken", ForumSection.Talk, "freq_girl♪", "G", "2014/06/18", "Awakening stage notes",
                    "Once your frequency steadies it gets a lot easier. Hang in there.", 11),

                P("talk_admin_warn", ForumSection.Talk, "★Luna★", "owner", "2014/05/14", "Stop spreading unverified stuff!",
                    "Don't forward sketchy \"guides\" or random DMs. Look after yourselves.", 44),

                P("talk_chosen", ForumSection.Talk, "fairy_pls♡", "J", "2014/04/25", "How do you get chosen by a fairy?",
                    "Is there like… a checklist? I want to do this right.", 9),

                P("talk_news", ForumSection.Talk, "news_witch~", "K", "2014/04/12", "Did anyone see that \"magical girl arrives\" news?",
                    "Is that even real?", 28,
                    comments: new[]
                    {
                        C("link_hunter☆", "H", "2014/04/12", "Fake as hell"),
                        C("fairy_pls♡", "J", "2014/04/12", "No it's real — a friend's cousin already awakened")
                    }),

                P("talk_rumor", ForumSection.Talk, "rumor_lace", "L", "2014/04/11", "Rumors that a magical girl already showed up",
                    "It's everywhere… do you buy it?", 33),

                P("talk_help_list", ForumSection.Talk, "soft_hug✿", "M", "2014/02/28", "Support FAQ dump", "Collected common questions from Support lately.", 17),
                P("talk_mood", ForumSection.Talk, "low_battery…", "N", "2014/01/24", "How do you deal with feeling low?", "Can't get myself to do anything lately.", 21),
                P("talk_family", ForumSection.Talk, "no_gohome", "O", "2013/11/08", "Fighting with family again", "Don't even want to go home.", 26),
                P("talk_emoji", ForumSection.Talk, "emoji_prism♡", "P", "2013/10/15", "Magical girl emoji pack", "Personal pack, drop it here~", 40),
                P("talk_meetup_req", ForumSection.Talk, "♡sparkle_cry♡", "B", "2013/08/27", "PLEASE host an IRL hangout already!!", "★Luna★ please I'm begging!!", 55),
                P("talk_newshow", ForumSection.Talk, "✧moon_doodle", "C", "2013/08/01", "Thoughts on the new magical girl show", "The lore is huge…", 18),
                P("talk_nohome", ForumSection.Talk, "stay_here☆", "Q", "2013/07/14", "Don't want to go home...", "Feels safer hanging out here.", 24),
                P("talk_transform", ForumSection.Talk, "♡sparkle_cry♡", "B", "2013/06/20", "Anyone else imagine transforming when they're upset?", "Like for a second you can actually hold it together.", 37),
                P("talk_homework", ForumSection.Talk, "hw_sos", "R", "2013/06/07", "So much homework", "Send help.", 14),
                P("talk_night", ForumSection.Talk, "3am_quiet", "S", "2013/05/15", "Anyone else like how quiet it is at 3am?", "The world feels smaller.", 29),
                P("talk_water", ForumSection.Talk, "★pixie_bloom☆", "A", "2013/04/28", "Off-topic bump thread~", "Just checking in.", 8),
                P("talk_silent", ForumSection.Talk, "quiet_magic", "T", "2013/04/09", "Quiet magical girl recs?", "Hit me with them.", 16),
                P("talk_fav", ForumSection.Talk, "series_dump♡", "U", "2013/03/16", "Favorite magical girl series?", "Drop your picks!", 52),

                // TALK - hidden (search unlock)
                P("talk_stabilize", ForumSection.Talk, "★stable_star★", "I", "2014/07/07", "Notes on stabilizing your frequency",
                    "Only for people who are actually ready.\n· Keep a regular sleep schedule\n· Cut back on draining relationships\n· Use aids if you need them to steady how you feel\nLow dose you can get on your own. For higher-level guidance, DM me.",
                    4, false, true, new[] { "稳定频率", "辅助方法", "stable frequency", "stabilize frequency", "stabilization", "aids", "药物" },
                    C("freq_girl♪", "G", "2014/07/08", "This helped. Did what it said.")),

                P("talk_dead_early", ForumSection.Talk, "link_hunter☆", "H", "2014/08/02", "(dead link) Old meetup follow-up",
                    "This used to have meetup logs and address notes.\nLinks got cut during cleanup, but the title stuck around.\nKeywords: Central Exchange Hall / ReNova",
                    2, false, true, new[] { "神隐", "kamiyomi", "offline", "线下", "central exchange", "renova" }),

                // SUPPORT
                P("sup_intro", ForumSection.Support, "★Luna★", "owner", "2013/11/01", "About the Support board",
                    "Help posts have been piling up, so we added Support.\nVent, talk, or lend a hand — all welcome here.", 30, true),
                P("sup_1", ForumSection.Support, "※anon※", "anon", "2014/09/02", "I'm so tired", "Don't know how much longer I can do this.", 12,
                    comments: new[] { C("※anon※", "anon", "2014/09/02", "Hug. Get some sleep first.") }),
                P("sup_2", ForumSection.Support, "※anon※", "anon", "2014/06/21", "Feels like nobody gets me", "Saying it out loud just sounds dramatic.", 9),
                P("sup_3", ForumSection.Support, "※anon※", "anon", "2014/03/05", "Sometimes I don't feel like I belong anywhere", "Not at home. Not at school.", 15),

                // QnA
                P("qna_owner", ForumSection.QnA, "stay_here☆", "Q", "2015/01/10", "★Luna★, come back once in a while", "Haven't seen you reply in forever.", 22),
                P("qna_invite", ForumSection.QnA, "♡sparkle_cry♡", "B", "2014/09/25", "Why aren't hangouts open to everyone anymore?", "The invite-only thing came out of nowhere…", 18),
                P("qna_awaken", ForumSection.QnA, "newbie_wand?", "V", "2014/05/02", "What does \"awakening\" mean?", "People keep saying it in posts.", 27),
                P("qna_kami", ForumSection.QnA, "fairy_pls♡", "J", "2014/11/08", "What does Kamiyomi mean?", "Can someone explain?", 31),
                P("qna_mod", ForumSection.QnA, "clean_board!!", "W", "2014/04/30", "Please crack down on throwaway accounts", "It's a mess.", 20),
                P("qna_gift", ForumSection.QnA, "ribbon_cloud~", "D", "2013/09/28", "Any rules on freebies?", "First time going IRL.", 11),
            };

            // Mark dead-link presentation for hidden posts
            foreach (var p in list)
            {
                if (p.HiddenUntilSearch)
                {
                    p.IsDeadLinkTarget = true;
                    p.DeadLinkLabel = "[dead link] " + p.Title;
                }
            }

            var reveal = list.Find(x => x.Id == "talk_recent");
            if (reveal != null)
            {
                reveal.UnlockHintSite = "renova";
                reveal.LinkLabel = "↗  https://renova.institute/";
                reveal.LinkTargetSite = "renova";
            }

            return list;
        }

        static List<StaffReport> BuildStaffReports()
        {
            return new List<StaffReport>
            {
                new StaffReport
                {
                    Keyword = "regenerative protocol",
                    Title = "Regenerative Protocol Overview – Phase II",
                    Body = "The Phase II regenerative protocol focuses on optimizing tissue recovery and enhancing long-term cellular performance.\nThrough controlled cycles and monitored conditions, subjects demonstrate improved stability and adaptability over time.\nCurrent results indicate a high consistency rate across selected candidates."
                },
                new StaffReport
                {
                    Keyword = "cellular stability",
                    Title = "Cellular Stability Index – Internal Report",
                    Body = "The Cellular Stability Index (CSI) is used to evaluate the consistency of subject responses under controlled conditions.\nSubjects with higher CSI scores are prioritized for advanced procedures.\nVariations are expected during early-stage adaptation."
                },
                new StaffReport
                {
                    Keyword = "behavioral optimization",
                    Title = "Behavioral Optimization Guidelines",
                    Body = "Behavioral Optimization ensures subjects maintain a consistent psychological state throughout the process.\nEnvironmental adjustments and guided interaction are applied to reduce resistance and improve compliance.\nStable behavior is essential for successful outcomes."
                },
                new StaffReport
                {
                    Keyword = "subject selection",
                    Title = "Subject Selection Criteria – Internal Use Only",
                    Body = "Preferred candidates demonstrate:\n– limited external dependency\n– reduced social interference\n– high adaptability under isolated conditions\n\nEarly-stage screening may utilize publicly accessible behavioral data sources."
                },
                new StaffReport
                {
                    Keyword = "offline session",
                    Title = "Offline Session Arrangement Notice",
                    Body = "Selected subjects will be invited to attend offline sessions at designated locations.\nParticipants are required to complete preliminary assessments upon arrival.\nAll sessions are conducted under controlled environments."
                },
                new StaffReport
                {
                    Keyword = "compliance",
                    Title = "Compliance Monitoring Protocol",
                    Body = "Subject compliance is evaluated continuously throughout the process.\nNon-compliant responses may be corrected through guided behavioral adjustment.\nConsistent compliance significantly improves procedural efficiency."
                },
                new StaffReport
                {
                    Keyword = "phase transition",
                    Title = "Phase Transition Log – Selected Subjects",
                    Body = "Subject reports indicate a shift in perception during Phase Transition.\nCommon descriptions include:\n– heightened awareness\n– altered self-identification\n– detachment from prior state\n\nThese effects are considered normal within acceptable thresholds."
                },
                new StaffReport
                {
                    Keyword = "return protocol",
                    Title = "Return Protocol Summary",
                    Body = "Upon completion of the procedure cycle, subjects are returned to their original environments.\nBehavioral stabilization is maintained through post-process conditioning.\nLong-term observation indicates improved compliance and reduced deviation."
                },
                new StaffReport
                {
                    Keyword = "data source",
                    Title = "Data Acquisition Channels",
                    Body = "Behavioral data is collected from multiple publicly accessible platforms.\nHigh-frequency emotional expression environments provide optimal candidate pools.\nData is processed and filtered for selection relevance."
                },
                new StaffReport
                {
                    Keyword = "deviation",
                    Title = "Deviation Report – Case Review",
                    Body = "Certain subjects display irregular responses during late-stage processing.\nThese cases are classified as deviations and require additional handling.\nDeviation frequency remains within acceptable limits."
                },
                new StaffReport
                {
                    Keyword = "archive clearance",
                    Title = "Archive Clearance Notice",
                    Body = "Following completion of the current cycle, selected data sources will be discontinued.\nResidual access points may remain temporarily.\nFull clearance will proceed in phases."
                },
                new StaffReport
                {
                    Keyword = "anomaly",
                    Title = "Anomaly Flag – Monitoring Required",
                    Body = "Irregular user behavior detected within data channels.\nFurther observation required.\nStatus: Pending"
                },
            };
        }
    }
}
