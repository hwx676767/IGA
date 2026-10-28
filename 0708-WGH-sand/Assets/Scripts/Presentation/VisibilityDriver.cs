using SandSimulator.Core;
using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;

namespace SandSimulator.Presentation
{
    public class VisibilityDriver : MonoBehaviour
    {
        [Header("References")]
        [SerializeField] private DustParticleController dustController;
        [SerializeField] private Light sunLight;

        [Header("Fog")]
        [SerializeField] private float minFogDensity = 0.002f;
        [SerializeField] private float maxFogDensity = 0.06f;
        [SerializeField] private Color clearFogColor = new Color(0.75f, 0.82f, 0.9f);
        [SerializeField] private Color dustyFogColor = new Color(0.85f, 0.65f, 0.35f);

        [Header("Particles")]
        [SerializeField] private float minEmissionRate = 5f;
        [SerializeField] private float maxEmissionRate = 120f;

        [Header("Lighting")]
        [SerializeField] private Color clearSunColor = new Color(1f, 0.95f, 0.85f);
        [SerializeField] private Color dustySunColor = new Color(0.9f, 0.7f, 0.45f);
        [SerializeField] private float clearSunIntensity = 1.4f;
        [SerializeField] private float dustySunIntensity = 0.8f;

        private Volume _volume;

        private void Awake()
        {
            _volume = FindObjectOfType<Volume>();

            if (sunLight == null)
            {
                var lightGo = GameObject.Find("Directional Light");
                if (lightGo != null)
                {
                    sunLight = lightGo.GetComponent<Light>();
                }
            }

            if (dustController == null)
            {
                dustController = FindObjectOfType<DustParticleController>();
            }
        }

        private void Start()
        {
            if (GameManager.Instance != null)
            {
                GameManager.Instance.OnStateChanged += OnStateChanged;
                GameManager.Instance.OnGameRestarted += OnGameRestarted;
                OnStateChanged(GameManager.Instance.State);
            }
        }

        private void OnDestroy()
        {
            if (GameManager.Instance != null)
            {
                GameManager.Instance.OnStateChanged -= OnStateChanged;
                GameManager.Instance.OnGameRestarted -= OnGameRestarted;
            }
        }

        private void OnGameRestarted()
        {
            if (dustController != null)
            {
                dustController.ClearParticles();
            }

            if (GameManager.Instance != null)
            {
                ApplyEnvironment(GameManager.Instance.State.environment);
            }
        }

        private void OnStateChanged(GameState state)
        {
            ApplyEnvironment(state.environment);
        }

        public void ApplyEnvironment(float environment)
        {
            float t = 1f - Mathf.Clamp01(environment / 100f);

            RenderSettings.fog = true;
            RenderSettings.fogMode = FogMode.ExponentialSquared;
            RenderSettings.fogDensity = Mathf.Lerp(minFogDensity, maxFogDensity, t);
            RenderSettings.fogColor = Color.Lerp(clearFogColor, dustyFogColor, t);

            if (dustController != null)
            {
                float emission = Mathf.Lerp(minEmissionRate, maxEmissionRate, t);
                dustController.SetEmissionRate(emission);
                dustController.SetWindStrength(Mathf.Lerp(0.3f, 1.5f, t));
            }

            if (sunLight != null)
            {
                sunLight.color = Color.Lerp(clearSunColor, dustySunColor, t);
                sunLight.intensity = Mathf.Lerp(clearSunIntensity, dustySunIntensity, t);
            }

            ApplyPostProcessing(t);

            RenderSettings.ambientSkyColor = Color.Lerp(
                new Color(0.6f, 0.7f, 0.85f),
                new Color(0.75f, 0.55f, 0.35f), t);
            RenderSettings.ambientEquatorColor = Color.Lerp(
                new Color(0.45f, 0.5f, 0.55f),
                new Color(0.55f, 0.4f, 0.28f), t);
            RenderSettings.ambientGroundColor = Color.Lerp(
                new Color(0.3f, 0.35f, 0.25f),
                new Color(0.45f, 0.32f, 0.2f), t);
        }

        private void ApplyPostProcessing(float t)
        {
            if (_volume == null || _volume.sharedProfile == null)
            {
                return;
            }

            VolumeProfile profile;
            try
            {
                profile = _volume.profile;
            }
            catch (MissingReferenceException)
            {
                return;
            }

            if (profile == null)
            {
                return;
            }

            if (profile.TryGet(out ColorAdjustments colorAdjustments))
            {
                colorAdjustments.active = true;
                colorAdjustments.saturation.Override(Mathf.Lerp(10f, -40f, t));
                colorAdjustments.contrast.Override(Mathf.Lerp(5f, 20f, t));
                colorAdjustments.colorFilter.Override(
                    Color.Lerp(Color.white, new Color(1f, 0.82f, 0.6f), t * 0.6f));
            }

            if (profile.TryGet(out Vignette vignette))
            {
                vignette.intensity.Override(Mathf.Lerp(0.1f, 0.45f, t));
            }
        }
    }
}
