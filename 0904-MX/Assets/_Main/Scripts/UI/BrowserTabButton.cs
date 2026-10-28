using Mahou.Core;
using Mahou.Data;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

namespace Mahou.UI
{
    /// <summary>
    /// Persistent Chrome tab. Only changes Image color for active/inactive — never moves layout.
    /// </summary>
    [RequireComponent(typeof(Button))]
    public class BrowserTabButton : MonoBehaviour, IPointerClickHandler
    {
        public SiteId TargetSite;

        [Tooltip("Inactive (authored) tab color — captured from Image on first run if left default")]
        public Color InactiveColor = new Color(0.82f, 0.58f, 0.68f, 1f);

        [Tooltip("Active tab color — lighter / brighter")]
        public Color ActiveColor = new Color(1f, 0.88f, 0.93f, 1f);

        Button _button;
        Image _image;
        bool _capturedColors;
        bool _selected;

        void Awake() => Setup();

        void OnEnable()
        {
            Setup();
            ApplyVisual();
        }

        void Setup()
        {
            _button = GetComponent<Button>();
            _image = GetComponent<Image>();

            if (!_capturedColors && _image != null)
            {
                // Authored scene color = active look; inactive is darker (layout unchanged)
                ActiveColor = _image.color;
                InactiveColor = Color.Lerp(_image.color, new Color(0.55f, 0.42f, 0.48f, 1f), 0.5f);
                InactiveColor.a = 1f;
                _capturedColors = true;
            }

            if (_button != null)
            {
                // Avoid ColorTint fighting our Image.color active state
                _button.transition = Selectable.Transition.None;
                _button.onClick.RemoveListener(OnClicked);
                _button.onClick.AddListener(OnClicked);
            }
        }

        public void SetSelected(bool selected)
        {
            _selected = selected;
            ApplyVisual();
        }

        void ApplyVisual()
        {
            if (_image == null) _image = GetComponent<Image>();
            if (_image == null) return;
            _image.color = _selected ? ActiveColor : InactiveColor;
        }

        public void OnPointerClick(PointerEventData eventData) => OnClicked();

        void OnClicked()
        {
            var app = FindFirstObjectByType<BrowserApp>();
            if (app == null)
            {
                Debug.LogWarning("[Mahou] BrowserApp not found.");
                return;
            }
            app.OnTabClicked(TargetSite);
        }
    }
}
