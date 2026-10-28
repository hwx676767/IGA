using System.Collections.Generic;
using Mahou.Core;
using Mahou.Data;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

namespace Mahou.UI
{
    /// <summary>
    /// Scene-placed forum card. Layout is authored in the scene; Play mode only wires likes/comments.
    /// Does NOT rebuild or SetNativeSize at runtime (except dynamic comment rows inside CommentList).
    /// </summary>
    public class ForumPostCardView : MonoBehaviour, IPointerClickHandler
    {
        const int PreviewCommentCount = 2;
        const float ClosedCardHeight = 160f;
        const float ComposerReserve = 48f;
        const float CommentRowMin = 52f;
        const float HeaderHeight = 28f;

        [Header("Data")]
        public string PostId;
        public ForumSection Section = ForumSection.Home;

        [Header("Optional refs (auto-found by name if empty)")]
        public Button LikeButton;
        public Image LikeIcon;
        public Text LikeCountText;
        public Button CommentButton;
        public GameObject CommentPanel;
        public Transform CommentList;
        public InputField CommentInput;
        public Button SendButton;
        public Text AuthorText;
        public Text DateText;
        public Text TitleText;
        public Image AvatarImage;
        [Tooltip("Scene-authored art image. Layout is never overwritten at runtime — tweak RectTransform in the Inspector.")]
        public Image PostImage;

        ForumPost _post;
        bool _commentsOpen;
        bool _commentsExpanded;
        bool _wired;
        float _closedMinHeight = 140f;
        float _closedPreferredHeight = 160f;

        void Awake() => ResolveRefs();

        void Start()
        {
            ResolveRefs();
            Wire();
            BindData();
            RefreshLikeVisual();
        }

        public void Configure(ForumPost post)
        {
            _post = post;
            PostId = post.Id;
            Section = post.Section;
            BindData();
            RefreshLikeVisual();
        }

        void ResolveRefs()
        {
            if (LikeButton == null)
            {
                var t = transform.Find("LikeBtn");
                if (t != null) LikeButton = t.GetComponent<Button>();
            }
            if (LikeIcon == null && LikeButton != null)
            {
                var icon = LikeButton.transform.Find("Icon");
                if (icon != null) LikeIcon = icon.GetComponent<Image>();
            }
            if (LikeCountText == null)
            {
                var t = transform.Find("LikeCount");
                if (t != null) LikeCountText = t.GetComponent<Text>();
            }
            if (CommentButton == null)
            {
                var t = transform.Find("CommentBtn");
                if (t != null) CommentButton = t.GetComponent<Button>();
            }
            if (CommentPanel == null)
            {
                var t = transform.Find("CommentPanel");
                if (t != null) CommentPanel = t.gameObject;
            }
            if (CommentList == null && CommentPanel != null)
            {
                var t = CommentPanel.transform.Find("CommentList");
                if (t != null) CommentList = t;
            }
            if (CommentInput == null && CommentPanel != null)
            {
                var t = CommentPanel.transform.Find("CommentInput");
                if (t != null) CommentInput = t.GetComponent<InputField>();
            }
            if (SendButton == null && CommentPanel != null)
            {
                var t = CommentPanel.transform.Find("Send");
                if (t != null) SendButton = t.GetComponent<Button>();
            }
            if (AuthorText == null)
            {
                var t = transform.Find("Author");
                if (t != null) AuthorText = t.GetComponent<Text>();
            }
            if (DateText == null)
            {
                var t = transform.Find("Date");
                if (t != null) DateText = t.GetComponent<Text>();
            }
            if (TitleText == null)
            {
                var t = transform.Find("Title");
                if (t != null) TitleText = t.GetComponent<Text>();
            }
            if (AvatarImage == null)
            {
                var t = transform.Find("Avatar");
                if (t != null) AvatarImage = t.GetComponent<Image>();
            }
            if (PostImage == null)
            {
                var t = transform.Find("PostImage");
                if (t != null) PostImage = t.GetComponent<Image>();
            }
        }

        void BindData()
        {
            if (_post == null && !string.IsNullOrEmpty(PostId))
                _post = ContentDatabase.Posts.Find(p => p.Id == PostId);

            if (_post == null) return;

            Section = _post.Section;
            if (AuthorText != null) AuthorText.text = _post.AuthorName;
            if (DateText != null) DateText.text = _post.Date;
            if (TitleText != null) TitleText.text = string.IsNullOrEmpty(_post.Title) ? _post.Body : _post.Title;
            if (AvatarImage != null && AvatarImage.sprite == null)
                AvatarImage.sprite = Art.Avatar(_post.AvatarKey);

            EnsurePostImage();
            EnsureOutboundLinkChip();
        }

        /// <summary>
        /// Only binds the sprite onto a scene-authored PostImage.
        /// Never creates or moves layout — use menu "Generate Fan Art PostImages".
        /// </summary>
        void EnsurePostImage()
        {
            if (PostImage == null)
            {
                var t = transform.Find("PostImage");
                if (t != null) PostImage = t.GetComponent<Image>();
            }

            bool hasImage = _post != null && !string.IsNullOrEmpty(_post.ImageKey);
            if (PostImage == null)
            {
                if (hasImage)
                    Debug.LogWarning($"[Mahou] Post {_post.Id} has ImageKey but no scene PostImage. Run Mahou Circle → Generate Fan Art PostImages.");
                return;
            }

            if (!hasImage)
            {
                PostImage.gameObject.SetActive(false);
                return;
            }

            PostImage.gameObject.SetActive(true);
            var sprite = Art.Get(_post.ImageKey);
            if (sprite != null)
                PostImage.sprite = sprite;
            PostImage.preserveAspect = true;
            PostImage.color = Color.white;
            PostImage.raycastTarget = false;
            PostImage.enabled = true;
            // RectTransform / LayoutElement: leave as authored in the scene.
        }

        void EnsureOutboundLinkChip()
        {
            var existing = transform.Find("OutboundLink");
            bool hasLink = _post != null && !string.IsNullOrEmpty(_post.LinkLabel);

            if (!hasLink)
            {
                if (existing != null) existing.gameObject.SetActive(false);
                return;
            }

            GameObject go;
            if (existing == null)
            {
                go = new GameObject("OutboundLink", typeof(RectTransform));
                go.transform.SetParent(transform, false);
                var rt = go.GetComponent<RectTransform>();
                rt.anchorMin = new Vector2(0, 0);
                rt.anchorMax = new Vector2(1, 0);
                rt.pivot = new Vector2(0.5f, 0);
                rt.sizeDelta = new Vector2(-24, 28);
                rt.anchoredPosition = new Vector2(0, 44);

                var img = go.AddComponent<Image>();
                img.color = new Color(0.92f, 0.78f, 0.86f, 1f);
                img.raycastTarget = true;
                var btn = go.AddComponent<Button>();
                btn.targetGraphic = img;

                var labelGo = new GameObject("L", typeof(RectTransform));
                labelGo.transform.SetParent(go.transform, false);
                var lrt = labelGo.GetComponent<RectTransform>();
                lrt.anchorMin = Vector2.zero;
                lrt.anchorMax = Vector2.one;
                lrt.offsetMin = new Vector2(8, 0);
                lrt.offsetMax = new Vector2(-8, 0);
                var t = labelGo.AddComponent<Text>();
                t.font = UiFactory.DefaultFont;
                t.fontSize = 13;
                t.fontStyle = FontStyle.Bold;
                t.alignment = TextAnchor.MiddleLeft;
                t.color = new Color(0.45f, 0.12f, 0.28f);
                t.raycastTarget = false;
            }
            else
            {
                go = existing.gameObject;
                go.SetActive(true);
            }

            var text = go.transform.Find("L")?.GetComponent<Text>();
            if (text != null) text.text = _post.LinkLabel;

            var button = go.GetComponent<Button>();
            if (button != null)
            {
                button.onClick.RemoveAllListeners();
                button.onClick.AddListener(OpenOutboundLink);
            }
        }

        void OpenOutboundLink()
        {
            if (_post == null) BindData();
            if (_post == null) return;

            if (_post.LinkTargetSite == "renova" || _post.UnlockHintSite == "renova")
            {
                var app = Object.FindFirstObjectByType<BrowserApp>();
                if (app != null) app.OpenRenovaFromLink();
                else
                {
                    GameState.I?.UnlockRenova();
                }
            }
        }

        void Wire()
        {
            if (_wired) return;
            _wired = true;

            var le = GetComponent<LayoutElement>();
            if (le != null)
            {
                _closedMinHeight = le.minHeight > 0 ? le.minHeight : 140f;
                _closedPreferredHeight = le.preferredHeight > 0 ? le.preferredHeight : ClosedCardHeight;
            }

            // Root card must NOT steal clicks from Like/Comment — disable root Button if present.
            var rootBtn = GetComponent<Button>();
            if (rootBtn != null)
            {
                rootBtn.onClick.RemoveAllListeners();
                rootBtn.enabled = false;
            }

            if (LikeButton != null)
            {
                LikeButton.onClick.RemoveAllListeners();
                LikeButton.onClick.AddListener(ToggleLike);
                // Hide emoji fallback so black ♥/♡ never shows over white sprite
                var emoji = LikeButton.transform.Find("Emoji");
                if (emoji != null) emoji.gameObject.SetActive(false);
            }

            if (CommentButton != null)
            {
                CommentButton.onClick.RemoveAllListeners();
                CommentButton.onClick.AddListener(ToggleComments);
            }

            if (SendButton != null)
            {
                SendButton.onClick.RemoveAllListeners();
                SendButton.onClick.AddListener(SubmitComment);
                var sendLabel = SendButton.transform.Find("Label");
                if (sendLabel != null)
                {
                    var st = sendLabel.GetComponent<Text>();
                    if (st != null) st.text = "Send";
                }
            }

            if (CommentInput != null)
            {
                if (CommentInput.placeholder is Text ph)
                    ph.text = "Write a comment…";
            }

            if (CommentPanel != null)
                CommentPanel.SetActive(false);

            EnsureCommentPanelSlots();
        }

        /// <summary>
        /// Keep authored Input/Send; only ensure CommentList sits above the composer.
        /// Does not move Input/Send positions the user tuned.
        /// </summary>
        void EnsureCommentPanelSlots()
        {
            if (CommentPanel == null) return;

            if (CommentList == null)
            {
                var listGo = new GameObject("CommentList", typeof(RectTransform));
                listGo.transform.SetParent(CommentPanel.transform, false);
                CommentList = listGo.transform;
                listGo.transform.SetAsFirstSibling();
                var vlg = listGo.AddComponent<VerticalLayoutGroup>();
                vlg.spacing = 8;
                vlg.padding = new RectOffset(8, 8, 6, 6);
                vlg.childForceExpandHeight = false;
                vlg.childForceExpandWidth = true;
                vlg.childControlHeight = true;
                vlg.childControlWidth = true;
            }

            var listRt = CommentList as RectTransform;
            if (listRt != null)
            {
                listRt.anchorMin = new Vector2(0, 0);
                listRt.anchorMax = new Vector2(1, 1);
                listRt.pivot = new Vector2(0.5f, 0.5f);
                // Leave bottom strip for composer (user's input row)
                listRt.offsetMin = new Vector2(8, ComposerReserve);
                listRt.offsetMax = new Vector2(-8, -6);
            }

            var v = CommentList.GetComponent<VerticalLayoutGroup>();
            if (v != null)
            {
                v.childForceExpandHeight = false;
                v.childControlHeight = true;
                v.childControlWidth = true;
                v.spacing = Mathf.Max(v.spacing, 6f);
            }
        }

        public void OnPointerClick(PointerEventData eventData)
        {
            if (eventData.pointerPress != null)
            {
                var t = eventData.pointerPress.transform;
                if (LikeButton != null && (t == LikeButton.transform || t.IsChildOf(LikeButton.transform))) return;
                if (CommentButton != null && (t == CommentButton.transform || t.IsChildOf(CommentButton.transform))) return;
                if (CommentPanel != null && CommentPanel.activeSelf && t.IsChildOf(CommentPanel.transform)) return;
                var link = transform.Find("OutboundLink");
                if (link != null && (t == link || t.IsChildOf(link))) return;
            }

            if (_post == null) BindData();
            if (_post == null) return;

            GameState.I?.Visit(SiteId.MahouCircle, "post:" + _post.Id);
            Debug.Log($"[Mahou] Open post {_post.Id}: {_post.Title}");
        }

        void ToggleLike()
        {
            if (_post == null) BindData();
            if (_post == null || GameState.I == null) return;
            GameState.I.ToggleLike(_post.Id);
            RefreshLikeVisual();
        }

        void RefreshLikeVisual()
        {
            if (_post == null) BindData();
            if (_post == null) return;

            var liked = GameState.I != null && GameState.I.IsLiked(_post.Id);
            if (LikeIcon != null)
            {
                var on = Art.IconLikeOn;
                var off = Art.IconLikeOff;
                if (liked && on != null) LikeIcon.sprite = on;
                else if (!liked && off != null) LikeIcon.sprite = off;
                // Always white tint — never darken into a "black heart"
                LikeIcon.color = Color.white;
                LikeIcon.enabled = true;
            }

            if (LikeCountText != null)
            {
                LikeCountText.text = GameState.I != null
                    ? GameState.I.GetLikeCount(_post).ToString()
                    : _post.BaseLikes.ToString();
            }
        }

        void ToggleComments()
        {
            _commentsOpen = !_commentsOpen;
            if (!_commentsOpen)
                _commentsExpanded = false;

            if (CommentPanel != null)
                CommentPanel.SetActive(_commentsOpen);

            if (_commentsOpen)
            {
                EnsureCommentPanelSlots();
                RebuildComments();
            }

            ApplyCardHeightForComments();
        }

        void ApplyCardHeightForComments()
        {
            var le = GetComponent<LayoutElement>();
            if (le == null) return;

            if (!_commentsOpen)
            {
                le.minHeight = _closedMinHeight;
                le.preferredHeight = _closedPreferredHeight;
            }
            else
            {
                var all = CollectComments();
                int visible = _commentsExpanded
                    ? all.Count
                    : Mathf.Min(PreviewCommentCount, all.Count);
                float listH = HeaderHeight + 8f + 30f; // header + bottom hide-comments button
                if (all.Count == 0) listH += 36f;
                else listH += visible * CommentRowMin;
                if (!_commentsExpanded && all.Count > PreviewCommentCount)
                    listH += 28f;
                else if (_commentsExpanded && all.Count > PreviewCommentCount)
                    listH += 28f;

                float panelH = Mathf.Max(120f, listH + ComposerReserve + 16f);
                float openH = _closedPreferredHeight + panelH - 40f;
                le.minHeight = openH;
                le.preferredHeight = openH;

                var panelRt = CommentPanel != null ? CommentPanel.GetComponent<RectTransform>() : null;
                if (panelRt != null)
                {
                    // Grow panel with content; keep bottom-anchored composer strip
                    panelRt.anchorMin = new Vector2(0, 0);
                    panelRt.anchorMax = new Vector2(1, 0);
                    panelRt.pivot = new Vector2(0.5f, 0f);
                    panelRt.sizeDelta = new Vector2(panelRt.sizeDelta.x, panelH);
                    panelRt.anchoredPosition = new Vector2(panelRt.anchoredPosition.x, 8f);
                }
            }

            if (transform.parent is RectTransform parentRt)
                LayoutRebuilder.ForceRebuildLayoutImmediate(parentRt);
        }

        void SubmitComment()
        {
            if (_post == null || GameState.I == null || CommentInput == null) return;
            var text = CommentInput.text;
            if (string.IsNullOrWhiteSpace(text)) return;
            GameState.I.AddPlayerComment(_post.Id, text);
            CommentInput.text = "";
            _commentsExpanded = true;
            RebuildComments();
            ApplyCardHeightForComments();
        }

        List<ForumComment> CollectComments()
        {
            var all = new List<ForumComment>();
            if (_post == null) return all;
            if (_post.Comments != null) all.AddRange(_post.Comments);
            if (GameState.I != null) all.AddRange(GameState.I.GetPlayerComments(_post.Id));
            return all;
        }

        void RebuildComments()
        {
            if (CommentList == null || _post == null) return;

            for (int i = CommentList.childCount - 1; i >= 0; i--)
            {
                var c = CommentList.GetChild(i).gameObject;
                if (Application.isPlaying) Destroy(c);
                else DestroyImmediate(c);
            }

            var all = CollectComments();

            // Header: "N comments" + collapse whole comment panel
            AddHeader(all.Count);

            if (all.Count == 0)
            {
                AddPlainRow("Empty", "No comments yet — say something.", 14,
                    new Color(0.55f, 0.55f, 0.58f), 32f);
            }
            else
            {
                int show = _commentsExpanded ? all.Count : Mathf.Min(PreviewCommentCount, all.Count);
                for (int i = 0; i < show; i++)
                    AddCommentRow(all[i]);

                int hidden = all.Count - show;
                if (hidden > 0 && !_commentsExpanded)
                    AddListToggleButton($"Show all {all.Count} comments", expandAll: true);
                else if (_commentsExpanded && all.Count > PreviewCommentCount)
                    AddListToggleButton("Show less", expandAll: false);
            }

            if (!string.IsNullOrEmpty(_post.LinkLabel))
                AddOutboundLinkRow();

            // Always offer closing the whole comment panel when open
            AddClosePanelButton();
        }

        void AddOutboundLinkRow()
        {
            var go = new GameObject("LinkRow", typeof(RectTransform));
            go.transform.SetParent(CommentList, false);
            var le = go.AddComponent<LayoutElement>();
            le.minHeight = 34f;
            le.preferredHeight = 34f;

            var img = go.AddComponent<Image>();
            img.color = new Color(0.92f, 0.78f, 0.86f, 1f);
            img.raycastTarget = true;
            var btn = go.AddComponent<Button>();
            btn.targetGraphic = img;
            btn.onClick.AddListener(OpenOutboundLink);

            var tGo = new GameObject("L", typeof(RectTransform));
            tGo.transform.SetParent(go.transform, false);
            var tRt = tGo.GetComponent<RectTransform>();
            tRt.anchorMin = Vector2.zero;
            tRt.anchorMax = Vector2.one;
            tRt.offsetMin = new Vector2(10, 0);
            tRt.offsetMax = new Vector2(-10, 0);
            var t = tGo.AddComponent<Text>();
            t.font = UiFactory.DefaultFont;
            t.fontSize = 13;
            t.fontStyle = FontStyle.Bold;
            t.alignment = TextAnchor.MiddleLeft;
            t.color = new Color(0.45f, 0.12f, 0.28f);
            t.text = _post.LinkLabel;
            t.raycastTarget = false;
        }

        void CloseCommentPanel()
        {
            _commentsOpen = false;
            _commentsExpanded = false;
            if (CommentPanel != null)
                CommentPanel.SetActive(false);
            ApplyCardHeightForComments();
        }

        void AddHeader(int count)
        {
            var go = new GameObject("Header", typeof(RectTransform));
            go.transform.SetParent(CommentList, false);
            var le = go.AddComponent<LayoutElement>();
            le.minHeight = HeaderHeight;
            le.preferredHeight = HeaderHeight;

            var titleGo = new GameObject("Title", typeof(RectTransform));
            titleGo.transform.SetParent(go.transform, false);
            var titleRt = titleGo.GetComponent<RectTransform>();
            titleRt.anchorMin = new Vector2(0, 0);
            titleRt.anchorMax = new Vector2(1, 1);
            titleRt.offsetMin = Vector2.zero;
            titleRt.offsetMax = new Vector2(-72, 0);
            var t = titleGo.AddComponent<Text>();
            t.font = UiFactory.DefaultFont;
            t.fontSize = 13;
            t.fontStyle = FontStyle.Bold;
            t.color = new Color(0.35f, 0.35f, 0.4f);
            t.alignment = TextAnchor.MiddleLeft;
            t.text = count > 0 ? $"{count} comments" : "Comments";
            t.raycastTarget = false;

            var closeGo = new GameObject("CloseBtn", typeof(RectTransform));
            closeGo.transform.SetParent(go.transform, false);
            var closeRt = closeGo.GetComponent<RectTransform>();
            closeRt.anchorMin = new Vector2(1, 0);
            closeRt.anchorMax = new Vector2(1, 1);
            closeRt.pivot = new Vector2(1, 0.5f);
            closeRt.sizeDelta = new Vector2(64, 0);
            closeRt.anchoredPosition = Vector2.zero;

            var closeImg = closeGo.AddComponent<Image>();
            closeImg.color = new Color(1f, 1f, 1f, 0.01f);
            closeImg.raycastTarget = true;
            var closeBtn = closeGo.AddComponent<Button>();
            closeBtn.targetGraphic = closeImg;
            closeBtn.onClick.AddListener(CloseCommentPanel);

            var closeLabel = new GameObject("Label", typeof(RectTransform));
            closeLabel.transform.SetParent(closeGo.transform, false);
            var clRt = closeLabel.GetComponent<RectTransform>();
            clRt.anchorMin = Vector2.zero;
            clRt.anchorMax = Vector2.one;
            clRt.offsetMin = Vector2.zero;
            clRt.offsetMax = Vector2.zero;
            var cl = closeLabel.AddComponent<Text>();
            cl.font = UiFactory.DefaultFont;
            cl.fontSize = 13;
            cl.color = new Color(0.85f, 0.35f, 0.55f);
            cl.alignment = TextAnchor.MiddleRight;
            cl.text = "Close";
            cl.raycastTarget = false;
        }

        void AddClosePanelButton()
        {
            var go = new GameObject("ClosePanel", typeof(RectTransform));
            go.transform.SetParent(CommentList, false);
            var le = go.AddComponent<LayoutElement>();
            le.minHeight = 30f;
            le.preferredHeight = 30f;

            var img = go.AddComponent<Image>();
            img.color = new Color(0.96f, 0.92f, 0.94f, 1f);
            img.raycastTarget = true;

            var btn = go.AddComponent<Button>();
            btn.targetGraphic = img;
            btn.onClick.AddListener(CloseCommentPanel);

            var tGo = new GameObject("Label", typeof(RectTransform));
            tGo.transform.SetParent(go.transform, false);
            var tRt = tGo.GetComponent<RectTransform>();
            tRt.anchorMin = Vector2.zero;
            tRt.anchorMax = Vector2.one;
            tRt.offsetMin = Vector2.zero;
            tRt.offsetMax = Vector2.zero;
            var t = tGo.AddComponent<Text>();
            t.font = UiFactory.DefaultFont;
            t.fontSize = 13;
            t.fontStyle = FontStyle.Bold;
            t.color = new Color(0.85f, 0.35f, 0.55f);
            t.alignment = TextAnchor.MiddleCenter;
            t.text = "Hide comments";
            t.raycastTarget = false;
        }

        void AddCommentRow(ForumComment c)
        {
            var row = new GameObject("Comment", typeof(RectTransform));
            row.transform.SetParent(CommentList, false);
            var le = row.AddComponent<LayoutElement>();
            le.minHeight = CommentRowMin;
            le.preferredHeight = CommentRowMin;
            le.flexibleWidth = 1;

            var bg = row.AddComponent<Image>();
            bg.color = new Color(0.96f, 0.96f, 0.97f, 1f);
            bg.raycastTarget = false;

            var meta = new GameObject("Meta", typeof(RectTransform));
            meta.transform.SetParent(row.transform, false);
            var metaRt = meta.GetComponent<RectTransform>();
            metaRt.anchorMin = new Vector2(0, 1);
            metaRt.anchorMax = new Vector2(1, 1);
            metaRt.pivot = new Vector2(0.5f, 1);
            metaRt.sizeDelta = new Vector2(-16, 20);
            metaRt.anchoredPosition = new Vector2(0, -4);
            var metaT = meta.AddComponent<Text>();
            metaT.font = UiFactory.DefaultFont;
            metaT.fontSize = 12;
            metaT.fontStyle = FontStyle.Bold;
            metaT.color = new Color(0.75f, 0.35f, 0.55f);
            metaT.text = $"{c.AuthorName}  ·  {c.Date}";
            metaT.raycastTarget = false;

            var body = new GameObject("Body", typeof(RectTransform));
            body.transform.SetParent(row.transform, false);
            var bodyRt = body.GetComponent<RectTransform>();
            bodyRt.anchorMin = new Vector2(0, 0);
            bodyRt.anchorMax = new Vector2(1, 1);
            bodyRt.offsetMin = new Vector2(8, 4);
            bodyRt.offsetMax = new Vector2(-8, -22);
            var bodyT = body.AddComponent<Text>();
            bodyT.font = UiFactory.DefaultFont;
            bodyT.fontSize = 13;
            bodyT.color = new Color(0.22f, 0.22f, 0.26f);
            bodyT.alignment = TextAnchor.UpperLeft;
            bodyT.horizontalOverflow = HorizontalWrapMode.Wrap;
            bodyT.verticalOverflow = VerticalWrapMode.Truncate;
            bodyT.text = c.Body;
            bodyT.raycastTarget = false;
        }

        void AddPlainRow(string name, string text, int size, Color color, float height)
        {
            var go = new GameObject(name, typeof(RectTransform));
            go.transform.SetParent(CommentList, false);
            var le = go.AddComponent<LayoutElement>();
            le.minHeight = height;
            le.preferredHeight = height;
            var t = go.AddComponent<Text>();
            t.font = UiFactory.DefaultFont;
            t.fontSize = size;
            t.color = color;
            t.alignment = TextAnchor.MiddleLeft;
            t.text = text;
            t.raycastTarget = false;
        }

        void AddListToggleButton(string label, bool expandAll)
        {
            var go = new GameObject(expandAll ? "ExpandComments" : "CollapseList", typeof(RectTransform));
            go.transform.SetParent(CommentList, false);
            var le = go.AddComponent<LayoutElement>();
            le.minHeight = 28f;
            le.preferredHeight = 28f;

            var img = go.AddComponent<Image>();
            img.color = new Color(1f, 1f, 1f, 0.01f);
            img.raycastTarget = true;

            var btn = go.AddComponent<Button>();
            btn.targetGraphic = img;
            btn.onClick.AddListener(() =>
            {
                _commentsExpanded = expandAll;
                RebuildComments();
                ApplyCardHeightForComments();
            });

            var tGo = new GameObject("Label", typeof(RectTransform));
            tGo.transform.SetParent(go.transform, false);
            var tRt = tGo.GetComponent<RectTransform>();
            tRt.anchorMin = Vector2.zero;
            tRt.anchorMax = Vector2.one;
            tRt.offsetMin = Vector2.zero;
            tRt.offsetMax = Vector2.zero;
            var t = tGo.AddComponent<Text>();
            t.font = UiFactory.DefaultFont;
            t.fontSize = 13;
            t.color = new Color(0.85f, 0.35f, 0.55f);
            t.alignment = TextAnchor.MiddleLeft;
            t.text = label;
            t.raycastTarget = false;
        }

        public bool MatchesSection(ForumSection section) => Section == section;
    }

    /// <summary>Marks Cover/Intro blocks that belong to a section (usually Home).</summary>
    public class SectionBlock : MonoBehaviour
    {
        public ForumSection Section = ForumSection.Home;
    }
}
