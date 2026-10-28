using UnityEngine;
using UnityEngine.UI;

namespace Mahou.UI
{
    public static class UiFactory
    {
        public const float ReferencePpu = 200f;
        public static readonly Vector2 ReferenceResolution = new Vector2(2048, 1536);

        public static Font DefaultFont
        {
            get
            {
                if (_font != null) return _font;

                // Prefer Funnel Display (Resources copy of ART/FunnelDisplay-VariableFont_wght)
                _font = Resources.Load<Font>("MahouUI/FunnelDisplay");
#if UNITY_EDITOR
                if (_font == null)
                {
                    _font = UnityEditor.AssetDatabase.LoadAssetAtPath<Font>(
                        "Assets/_Main/ART/FunnelDisplay-VariableFont_wght.ttf");
                }
#endif
                if (_font == null)
                    _font = Resources.GetBuiltinResource<Font>("LegacyRuntime.ttf");
                if (_font == null)
                    _font = Resources.GetBuiltinResource<Font>("Arial.ttf");
                return _font;
            }
        }
        static Font _font;

        public static void ClearChildren(Transform parent)
        {
            if (parent == null) return;
            for (int i = parent.childCount - 1; i >= 0; i--)
            {
                var child = parent.GetChild(i).gameObject;
                if (Application.isPlaying)
                    Object.Destroy(child);
                else
                    Object.DestroyImmediate(child);
            }
        }

        public static GameObject Root(string name, Transform parent)
        {
            var go = new GameObject(name, typeof(RectTransform));
            go.transform.SetParent(parent, false);
            return go;
        }

        public static RectTransform Stretch(GameObject go, float l = 0, float r = 0, float t = 0, float b = 0)
        {
            var rt = go.GetComponent<RectTransform>();
            rt.anchorMin = Vector2.zero;
            rt.anchorMax = Vector2.one;
            rt.offsetMin = new Vector2(l, b);
            rt.offsetMax = new Vector2(-r, -t);
            return rt;
        }

        /// <summary>
        /// Apply SetNativeSize so sprite keeps authored pixel proportions (requires Canvas referencePixelsPerUnit == sprite PPU).
        /// </summary>
        public static void ApplyNativeSize(UnityEngine.UI.Image img)
        {
            if (img == null || img.sprite == null) return;
            img.type = UnityEngine.UI.Image.Type.Simple;
            img.preserveAspect = true;
            img.useSpriteMesh = false;
            img.SetNativeSize();
        }

        /// <param name="stretchFill">true = fill parent (page BG only). false = SetNativeSize, no stretch.</param>
        public static UnityEngine.UI.Image MakeImage(Transform parent, string name, Sprite sprite = null, Color? color = null, bool stretchFill = false)
        {
            var go = Root(name, parent);
            var img = go.AddComponent<UnityEngine.UI.Image>();
            img.sprite = sprite;
            img.color = color ?? Color.white;
            img.raycastTarget = false;
            img.type = UnityEngine.UI.Image.Type.Simple;
            img.preserveAspect = true;

            if (stretchFill)
            {
                Stretch(go);
            }
            else if (sprite != null)
            {
                var rt = go.GetComponent<RectTransform>();
                rt.anchorMin = rt.anchorMax = new Vector2(0.5f, 0.5f);
                rt.pivot = new Vector2(0.5f, 0.5f);
                ApplyNativeSize(img);
            }

            return img;
        }

        /// <summary>Point-anchor + native size + position (top-left style use pivot 0,1).</summary>
        public static void PlaceNative(UnityEngine.UI.Image img, Vector2 anchor, Vector2 pivot, Vector2 anchoredPosition)
        {
            if (img == null) return;
            ApplyNativeSize(img);
            var rt = img.rectTransform;
            rt.anchorMin = rt.anchorMax = anchor;
            rt.pivot = pivot;
            rt.anchoredPosition = anchoredPosition;
        }

        public static Text Label(Transform parent, string name, string text, int size = 18, FontStyle style = FontStyle.Normal, TextAnchor align = TextAnchor.UpperLeft)
        {
            var go = Root(name, parent);
            var t = go.AddComponent<Text>();
            t.font = DefaultFont;
            t.text = text;
            t.fontSize = size;
            t.fontStyle = style;
            t.alignment = align;
            t.color = new Color(0.15f, 0.15f, 0.18f, 1f);
            t.horizontalOverflow = HorizontalWrapMode.Wrap;
            t.verticalOverflow = VerticalWrapMode.Overflow;
            t.raycastTarget = false;
            Stretch(go);
            return t;
        }

        public static UnityEngine.UI.Button MakeButton(Transform parent, string name, UnityEngine.Events.UnityAction onClick)
        {
            var go = Root(name, parent);
            var img = go.AddComponent<UnityEngine.UI.Image>();
            img.color = Color.white;
            img.preserveAspect = true;
            var btn = go.AddComponent<UnityEngine.UI.Button>();
            btn.targetGraphic = img;
            if (onClick != null) btn.onClick.AddListener(onClick);
            var rt = go.GetComponent<RectTransform>();
            rt.anchorMin = rt.anchorMax = new Vector2(0.5f, 0.5f);
            return btn;
        }

        public static void SetButtonSpriteNative(UnityEngine.UI.Button btn, Sprite sprite)
        {
            if (btn == null) return;
            var img = btn.GetComponent<UnityEngine.UI.Image>();
            if (img == null) return;
            img.sprite = sprite;
            img.color = Color.white;
            img.raycastTarget = true;
            ApplyNativeSize(img);
        }

        public static InputField MakeInput(Transform parent, string name, string placeholder)
        {
            var go = Root(name, parent);
            var bg = go.AddComponent<UnityEngine.UI.Image>();
            bg.color = Color.white;

            var textGo = Root("Text", go.transform);
            var text = textGo.AddComponent<Text>();
            text.font = DefaultFont;
            text.fontSize = 16;
            text.color = Color.black;
            text.supportRichText = false;
            Stretch(textGo, 8, 8, 4, 4);

            var phGo = Root("Placeholder", go.transform);
            var ph = phGo.AddComponent<Text>();
            ph.font = DefaultFont;
            ph.fontSize = 16;
            ph.fontStyle = FontStyle.Italic;
            ph.color = new Color(0.5f, 0.5f, 0.5f, 0.75f);
            ph.text = placeholder;
            Stretch(phGo, 8, 8, 4, 4);

            var input = go.AddComponent<InputField>();
            input.textComponent = text;
            input.placeholder = ph;
            Stretch(go);
            return input;
        }

        public static ScrollRect Scroll(Transform parent, string name, out RectTransform content)
        {
            var go = Root(name, parent);
            Stretch(go);
            var scroll = go.AddComponent<ScrollRect>();
            scroll.horizontal = false;
            scroll.vertical = true;
            scroll.movementType = ScrollRect.MovementType.Clamped;

            var viewport = Root("Viewport", go.transform);
            Stretch(viewport);
            var mask = viewport.AddComponent<Mask>();
            mask.showMaskGraphic = false;
            var vpImg = viewport.AddComponent<UnityEngine.UI.Image>();
            vpImg.color = new Color(1, 1, 1, 0.01f);

            var contentGo = Root("Content", viewport.transform);
            content = contentGo.GetComponent<RectTransform>();
            content.anchorMin = new Vector2(0, 1);
            content.anchorMax = new Vector2(1, 1);
            content.pivot = new Vector2(0.5f, 1);
            content.anchoredPosition = Vector2.zero;
            content.sizeDelta = new Vector2(0, 0);

            var layout = contentGo.AddComponent<VerticalLayoutGroup>();
            layout.padding = new RectOffset(12, 12, 12, 12);
            layout.spacing = 12;
            layout.childControlHeight = true;
            layout.childControlWidth = true;
            layout.childForceExpandHeight = false;
            layout.childForceExpandWidth = true;

            var fitter = contentGo.AddComponent<ContentSizeFitter>();
            fitter.verticalFit = ContentSizeFitter.FitMode.PreferredSize;

            scroll.viewport = viewport.GetComponent<RectTransform>();
            scroll.content = content;
            return scroll;
        }

        public static void SetAnchors(RectTransform rt, Vector2 min, Vector2 max, Vector2 offsetMin, Vector2 offsetMax)
        {
            rt.anchorMin = min;
            rt.anchorMax = max;
            rt.offsetMin = offsetMin;
            rt.offsetMax = offsetMax;
        }
    }
}
