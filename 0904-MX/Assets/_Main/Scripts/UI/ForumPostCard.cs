using System.Collections.Generic;
using Mahou.Core;
using Mahou.Data;
using UnityEngine;
using UnityEngine.UI;

namespace Mahou.UI
{
    public class ForumPostCard : MonoBehaviour
    {
        ForumPost _post;
        Text _likeCount;
        Image _likeIcon;
        Text _likeLabel;
        GameObject _commentPanel;
        Transform _commentList;
        InputField _commentInput;
        bool _commentsOpen;

        public static ForumPostCard Create(Transform parent, ForumPost post, System.Action<ForumPost> onOpenDetail)
        {
            var go = UiFactory.Root("PostCard_" + post.Id, parent);
            var le = go.AddComponent<LayoutElement>();
            le.minHeight = 140;
            le.preferredHeight = 160;

            var bg = go.AddComponent<Image>();
            bg.color = new Color(0.94f, 0.94f, 0.95f, 1f);
            bg.raycastTarget = true;

            var outline = go.AddComponent<Outline>();
            outline.effectColor = new Color(0.75f, 0.75f, 0.78f, 1f);
            outline.effectDistance = new Vector2(1, -1);

            var card = go.AddComponent<ForumPostCard>();
            card._post = post;
            card.Build(onOpenDetail);
            return card;
        }

        void Build(System.Action<ForumPost> onOpenDetail)
        {
            // Click body opens detail
            var openBtn = gameObject.GetComponent<Button>();
            if (openBtn == null) openBtn = gameObject.AddComponent<Button>();
            openBtn.transition = Selectable.Transition.None;
            openBtn.onClick.AddListener(() => onOpenDetail?.Invoke(_post));

            // Avatar
            var avatarGo = UiFactory.Root("Avatar", transform);
            var avatarRt = avatarGo.GetComponent<RectTransform>();
            UiFactory.SetAnchors(avatarRt, new Vector2(0, 1), new Vector2(0, 1), new Vector2(14, -62), new Vector2(62, -14));
            var avatarImg = avatarGo.AddComponent<Image>();
            avatarImg.sprite = Art.Avatar(_post.AvatarKey);
            avatarImg.preserveAspect = true;
            avatarImg.raycastTarget = false;

            // Author
            var author = UiFactory.Label(transform, "Author", _post.AuthorName, 18, FontStyle.Bold);
            UiFactory.SetAnchors(author.rectTransform, new Vector2(0, 1), new Vector2(1, 1), new Vector2(72, -40), new Vector2(-16, -12));

            // Date
            var date = UiFactory.Label(transform, "Date", _post.Date, 14, FontStyle.Normal);
            date.color = new Color(0.45f, 0.45f, 0.48f);
            UiFactory.SetAnchors(date.rectTransform, new Vector2(0, 1), new Vector2(1, 1), new Vector2(72, -62), new Vector2(-16, -40));

            // Title / preview
            var titleText = string.IsNullOrEmpty(_post.Title) ? _post.Body : _post.Title;
            if (_post.IsDeadLinkTarget && GameState.I != null && !GameState.I.IsPostUnlocked(_post))
                titleText = _post.DeadLinkLabel;
            var title = UiFactory.Label(transform, "Title", titleText, 17, FontStyle.Bold);
            if (!string.IsNullOrEmpty(_post.ImageKey))
            {
                var trt = title.rectTransform;
                trt.anchorMin = new Vector2(0f, 1f);
                trt.anchorMax = new Vector2(1f, 1f);
                trt.pivot = new Vector2(0.5f, 1f);
                trt.anchoredPosition = new Vector2(0f, -78f);
                trt.sizeDelta = new Vector2(-32f, 26f);
            }
            else
            {
                UiFactory.SetAnchors(title.rectTransform, new Vector2(0, 0), new Vector2(1, 1), new Vector2(16, 44), new Vector2(-120, -70));
            }

            if (!string.IsNullOrEmpty(_post.ImageKey))
            {
                var artGo = UiFactory.Root("PostImage", transform);
                var artRt = artGo.GetComponent<RectTransform>();
                artRt.anchorMin = new Vector2(0f, 1f);
                artRt.anchorMax = new Vector2(0f, 1f);
                artRt.pivot = new Vector2(0f, 1f);
                artRt.anchoredPosition = new Vector2(16f, -110f);
                artRt.sizeDelta = new Vector2(300f, 300f);
                var artImg = artGo.AddComponent<Image>();
                artImg.sprite = Art.Get(_post.ImageKey);
                artImg.preserveAspect = true;
                artImg.raycastTarget = false;
                var le = GetComponent<LayoutElement>();
                if (le != null)
                {
                    le.minHeight = 420;
                    le.preferredHeight = 460;
                }
            }

            // Comment button
            var commentBtn = MakeIconButton("CommentBtn", Art.IconComment, "◎", () => ToggleComments());
            UiFactory.SetAnchors(commentBtn.GetComponent<RectTransform>(), new Vector2(1, 0), new Vector2(1, 0), new Vector2(-96, 10), new Vector2(-56, 50));

            // Like button
            var likeBtn = MakeIconButton("LikeBtn", Art.IconLikeOff, "♡", () => ToggleLike());
            UiFactory.SetAnchors(likeBtn.GetComponent<RectTransform>(), new Vector2(1, 0), new Vector2(1, 0), new Vector2(-48, 10), new Vector2(-8, 50));
            _likeIcon = likeBtn.transform.Find("Icon")?.GetComponent<Image>();
            _likeLabel = likeBtn.transform.Find("Emoji")?.GetComponent<Text>();
            if (_likeIcon != null) _likeLabel?.gameObject.SetActive(false);

            _likeCount = UiFactory.Label(transform, "LikeCount", "0", 12, FontStyle.Normal, TextAnchor.MiddleRight);
            UiFactory.SetAnchors(_likeCount.rectTransform, new Vector2(1, 0), new Vector2(1, 0), new Vector2(-150, 14), new Vector2(-100, 46));
            RefreshLike();

            // Comment panel (hidden)
            _commentPanel = UiFactory.Root("CommentPanel", transform);
            var cpRt = _commentPanel.GetComponent<RectTransform>();
            UiFactory.SetAnchors(cpRt, new Vector2(0, 0), new Vector2(1, 0), new Vector2(8, 8), new Vector2(-8, 200));
            var cpBg = _commentPanel.AddComponent<Image>();
            cpBg.color = new Color(1f, 1f, 1f, 0.98f);
            _commentPanel.SetActive(false);

            var listGo = UiFactory.Root("CommentList", _commentPanel.transform);
            _commentList = listGo.transform;
            var listRt = listGo.GetComponent<RectTransform>();
            UiFactory.SetAnchors(listRt, new Vector2(0, 0), new Vector2(1, 1), new Vector2(8, 48), new Vector2(-8, -8));
            var vlg = listGo.AddComponent<VerticalLayoutGroup>();
            vlg.spacing = 6;
            vlg.childForceExpandHeight = false;
            vlg.childControlHeight = true;
            vlg.childControlWidth = true;

            _commentInput = UiFactory.MakeInput(_commentPanel.transform, "CommentInput", "Write a comment…");
            UiFactory.SetAnchors(_commentInput.GetComponent<RectTransform>(), new Vector2(0, 0), new Vector2(1, 0), new Vector2(8, 8), new Vector2(-88, 40));

            var send = UiFactory.MakeButton(_commentPanel.transform, "Send", SubmitComment);
            UiFactory.SetAnchors(send.GetComponent<RectTransform>(), new Vector2(1, 0), new Vector2(1, 0), new Vector2(-80, 8), new Vector2(-8, 40));
            send.GetComponent<Image>().color = new Color(0.85f, 0.35f, 0.55f, 1f);
            var sendLabel = UiFactory.Label(send.transform, "Label", "Send", 14, FontStyle.Bold, TextAnchor.MiddleCenter);
            sendLabel.color = Color.white;
            UiFactory.Stretch(sendLabel.gameObject);
        }

        bool _commentsExpanded;

        void ToggleComments()
        {
            _commentsOpen = !_commentsOpen;
            if (!_commentsOpen) _commentsExpanded = false;
            _commentPanel.SetActive(_commentsOpen);
            var le = GetComponent<LayoutElement>();
            le.minHeight = _commentsOpen ? 340 : 140;
            le.preferredHeight = _commentsOpen ? 360 : 160;
            if (_commentsOpen) RebuildComments();
            if (transform.parent is RectTransform parentRt)
                LayoutRebuilder.ForceRebuildLayoutImmediate(parentRt);
        }

        Button MakeIconButton(string name, Sprite icon, string emoji, UnityEngine.Events.UnityAction action)
        {
            var go = UiFactory.Root(name, transform);
            var rt = go.GetComponent<RectTransform>();
            rt.sizeDelta = new Vector2(40, 40);
            var img = go.AddComponent<Image>();
            img.color = new Color(1, 1, 1, 0.01f);
            img.raycastTarget = true;
            var btn = go.AddComponent<Button>();
            btn.targetGraphic = img;
            btn.onClick.AddListener(action);

            if (icon != null)
            {
                var iconGo = UiFactory.Root("Icon", go.transform);
                var irt = iconGo.GetComponent<RectTransform>();
                irt.anchorMin = irt.anchorMax = new Vector2(0.5f, 0.5f);
                irt.sizeDelta = new Vector2(28, 28);
                irt.anchoredPosition = Vector2.zero;
                var iconImg = iconGo.AddComponent<Image>();
                iconImg.sprite = icon;
                iconImg.preserveAspect = true;
                iconImg.raycastTarget = false;
                // Do NOT SetNativeSize here — it breaks authored like-button layout
            }

            var emojiGo = UiFactory.Root("Emoji", go.transform);
            UiFactory.Stretch(emojiGo);
            var emojiText = emojiGo.AddComponent<Text>();
            emojiText.font = UiFactory.DefaultFont;
            emojiText.text = emoji;
            emojiText.fontSize = 20;
            emojiText.alignment = TextAnchor.MiddleCenter;
            emojiText.color = new Color(0.15f, 0.15f, 0.15f);
            emojiText.raycastTarget = false;
            if (icon != null)
                emojiText.gameObject.SetActive(false);
            return btn;
        }

        void RefreshLike()
        {
            var liked = GameState.I != null && GameState.I.IsLiked(_post.Id);
            if (_likeIcon != null && Art.IconLikeOn != null)
            {
                _likeIcon.sprite = liked ? Art.IconLikeOn : Art.IconLikeOff;
                _likeIcon.color = Color.white;
                if (_likeLabel != null) _likeLabel.gameObject.SetActive(false);
            }
            else if (_likeLabel != null)
            {
                _likeLabel.gameObject.SetActive(true);
                _likeLabel.text = liked ? "♥" : "♡";
                _likeLabel.color = liked ? new Color(0.86f, 0.18f, 0.25f) : new Color(0.15f, 0.15f, 0.15f);
            }
            if (_likeCount != null)
                _likeCount.text = GameState.I != null ? GameState.I.GetLikeCount(_post).ToString() : _post.BaseLikes.ToString();
        }

        void ToggleLike()
        {
            if (GameState.I == null) return;
            GameState.I.ToggleLike(_post.Id);
            RefreshLike();
        }

        void SubmitComment()
        {
            if (GameState.I == null) return;
            if (string.IsNullOrWhiteSpace(_commentInput.text)) return;
            GameState.I.AddPlayerComment(_post.Id, _commentInput.text);
            _commentInput.text = "";
            _commentsExpanded = true;
            RebuildComments();
        }

        void RebuildComments()
        {
            UiFactory.ClearChildren(_commentList);

            var all = new List<ForumComment>();
            if (_post.Comments != null) all.AddRange(_post.Comments);
            if (GameState.I != null) all.AddRange(GameState.I.GetPlayerComments(_post.Id));

            var header = UiFactory.Label(_commentList, "Header",
                all.Count > 0 ? $"{all.Count} comments" : "Comments", 13, FontStyle.Bold);
            header.color = new Color(0.35f, 0.35f, 0.4f);
            header.gameObject.AddComponent<LayoutElement>().minHeight = 24;

            const int preview = 2;
            if (all.Count == 0)
            {
                var empty = UiFactory.Label(_commentList, "Empty", "No comments yet — say something.", 14);
                empty.color = new Color(0.5f, 0.5f, 0.5f);
                empty.gameObject.AddComponent<LayoutElement>().minHeight = 28;
                return;
            }

            int show = _commentsExpanded ? all.Count : Mathf.Min(preview, all.Count);
            for (int i = 0; i < show; i++)
            {
                var c = all[i];
                var row = UiFactory.Root("C", _commentList);
                row.AddComponent<LayoutElement>().minHeight = 48;
                var t = UiFactory.Label(row.transform, "T", $"{c.AuthorName} · {c.Date}\n{c.Body}", 13);
                t.color = new Color(0.22f, 0.22f, 0.26f);
            }

            if (!_commentsExpanded && all.Count > preview)
            {
                var more = UiFactory.MakeButton(_commentList, "Expand", () =>
                {
                    _commentsExpanded = true;
                    RebuildComments();
                });
                more.gameObject.AddComponent<LayoutElement>().minHeight = 28;
                var lbl = UiFactory.Label(more.transform, "Label", $"Show all {all.Count} comments", 13);
                lbl.color = new Color(0.85f, 0.35f, 0.55f);
                UiFactory.Stretch(lbl.gameObject);
            }
            else if (_commentsExpanded && all.Count > preview)
            {
                var less = UiFactory.MakeButton(_commentList, "Collapse", () =>
                {
                    _commentsExpanded = false;
                    RebuildComments();
                });
                less.gameObject.AddComponent<LayoutElement>().minHeight = 28;
                var lbl = UiFactory.Label(less.transform, "Label", "Show less", 13);
                lbl.color = new Color(0.85f, 0.35f, 0.55f);
                UiFactory.Stretch(lbl.gameObject);
            }

            var close = UiFactory.MakeButton(_commentList, "ClosePanel", () =>
            {
                _commentsOpen = false;
                _commentsExpanded = false;
                _commentPanel.SetActive(false);
                var cardLe = GetComponent<LayoutElement>();
                cardLe.minHeight = 140;
                cardLe.preferredHeight = 160;
                if (transform.parent is RectTransform parentRt)
                    LayoutRebuilder.ForceRebuildLayoutImmediate(parentRt);
            });
            close.gameObject.AddComponent<LayoutElement>().minHeight = 30;
            close.GetComponent<Image>().color = new Color(0.96f, 0.92f, 0.94f, 1f);
            var closeLbl = UiFactory.Label(close.transform, "Label", "Hide comments", 13, FontStyle.Bold, TextAnchor.MiddleCenter);
            closeLbl.color = new Color(0.85f, 0.35f, 0.55f);
            UiFactory.Stretch(closeLbl.gameObject);
        }
    }
}
