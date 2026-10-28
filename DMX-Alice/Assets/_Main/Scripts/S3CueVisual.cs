using UnityEngine;
using UnityEngine.UI;

/// <summary>Pulse-and-outline feedback for the current stage cue.</summary>
[RequireComponent(typeof(Image))]
public class S3CueVisual : MonoBehaviour
{
    private const string HighlightShaderName = "UI/Backstage Pulse Outline";

    private Image _image;
    private Outline _outline;
    private Material _originalMaterial;
    private Material _highlightMaterial;
    private Vector3 _baseScale;
    private bool _highlighted;
    private float _errorOutlineUntil;

    private void Awake()
    {
        _image = GetComponent<Image>();
        _originalMaterial = _image.material;
        _baseScale = transform.localScale;
        _outline = GetComponent<Outline>();
        if (_outline == null) _outline = gameObject.AddComponent<Outline>();
        _outline.enabled = false;
    }

    public void SetHighlighted(bool highlighted)
    {
        if (_image == null) Awake();
        if (Time.unscaledTime < _errorOutlineUntil) return;
        _highlighted = highlighted;
        if (!highlighted)
        {
            _outline.enabled = false;
            _image.material = _originalMaterial;
            transform.localScale = _baseScale;
            return;
        }

        Shader shader = Shader.Find(HighlightShaderName);
        if (shader != null)
        {
            if (_highlightMaterial == null) _highlightMaterial = new Material(shader);
            _image.material = _highlightMaterial;
        }
        _outline.enabled = true;
    }

    /// <summary>
    /// The same UI object changes parent between the tray and the stage. Keep the
    /// visual effect's resting scale in sync so ending a highlight never restores
    /// an old tray scale over the authored Hint scale.
    /// </summary>
    public void SetBaseScale(Vector3 scale)
    {
        if (_image == null) Awake();
        _baseScale = scale;
        if (!_highlighted && Time.unscaledTime >= _errorOutlineUntil)
            transform.localScale = _baseScale;
    }

    /// <summary>Shows a static red outline for failed placement feedback.</summary>
    public void ShowErrorOutline(float duration = 2f)
    {
        if (_image == null) Awake();
        _highlighted = false;
        _errorOutlineUntil = Time.unscaledTime + duration;
        _image.material = _originalMaterial;
        transform.localScale = _baseScale;
        _outline.enabled = true;
        _outline.effectColor = new Color(1f, .2f, .18f, 1f);
        _outline.effectDistance = Vector2.one * 4f;
    }

    private void Update()
    {
        if (Time.unscaledTime < _errorOutlineUntil) return;

        if (_errorOutlineUntil > 0f)
        {
            _errorOutlineUntil = 0f;
            _outline.enabled = false;
            _image.material = _originalMaterial;
            transform.localScale = _baseScale;
        }

        if (!_highlighted) return;
        float wave = (Mathf.Sin(Time.unscaledTime * 6f) + 1f) * .5f;
        transform.localScale = _baseScale * Mathf.Lerp(1f, 1.07f, wave);
        _outline.effectColor = Color.Lerp(new Color(1f, .68f, .12f, .5f), new Color(1f, .96f, .55f, 1f), wave);
        _outline.effectDistance = Vector2.one * Mathf.Lerp(1.5f, 4f, wave);
    }

    private void OnDestroy()
    {
        if (_highlightMaterial != null) Destroy(_highlightMaterial);
    }
}
