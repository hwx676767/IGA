using UnityEngine;
using UnityEngine.UI;

namespace Mahou.UI
{
    /// <summary>
    /// Horizontal marquee: text scrolls left → right and loops.
    /// </summary>
    [ExecuteAlways]
    public class MarqueeTicker : MonoBehaviour
    {
        [SerializeField] RectTransform viewport;
        [SerializeField] RectTransform textRect;
        [SerializeField] Text label;
        [SerializeField] float speed = 80f;
        [SerializeField] float gap = 48f;

        public void Setup(RectTransform viewportRt, Text text, float pixelsPerSecond = 80f)
        {
            viewport = viewportRt;
            label = text;
            textRect = text.rectTransform;
            speed = pixelsPerSecond;
            ResetToStart();
        }

        public void SetMessage(string message)
        {
            if (label == null) return;
            label.text = message;
            label.horizontalOverflow = HorizontalWrapMode.Overflow;
            label.verticalOverflow = VerticalWrapMode.Truncate;
            Canvas.ForceUpdateCanvases();
            ResetToStart();
        }

        void OnEnable() => ResetToStart();

        void ResetToStart()
        {
            if (viewport == null || textRect == null) return;
            // Start just left of the viewport so text enters from the left and moves right.
            float textW = Mathf.Max(label != null ? label.preferredWidth : textRect.rect.width, 10f);
            textRect.anchorMin = new Vector2(0, 0.5f);
            textRect.anchorMax = new Vector2(0, 0.5f);
            textRect.pivot = new Vector2(0, 0.5f);
            textRect.sizeDelta = new Vector2(textW + 8f, viewport.rect.height);
            textRect.anchoredPosition = new Vector2(-textW - gap, 0f);
        }

        void Update()
        {
            if (!Application.isPlaying) return;
            if (viewport == null || textRect == null) return;

            var pos = textRect.anchoredPosition;
            pos.x += speed * Time.deltaTime;
            textRect.anchoredPosition = pos;

            float textW = textRect.rect.width;
            float viewW = viewport.rect.width;
            // Fully past the right edge → loop back to the left.
            if (pos.x > viewW + gap)
                textRect.anchoredPosition = new Vector2(-textW - gap, 0f);
        }
    }
}
