using UnityEngine;

namespace SandSimulator.Presentation
{
    [RequireComponent(typeof(ParticleSystem))]
    public class DustParticleController : MonoBehaviour
    {
        private ParticleSystem _particleSystem;
        private ParticleSystem.EmissionModule _emission;
        private ParticleSystem.MainModule _main;
        private ParticleSystem.VelocityOverLifetimeModule _velocity;

        private void Awake()
        {
            _particleSystem = GetComponent<ParticleSystem>();
            _emission = _particleSystem.emission;
            _main = _particleSystem.main;
            _velocity = _particleSystem.velocityOverLifetime;
        }

        public void SetEmissionRate(float rate)
        {
            _emission.rateOverTime = rate;
        }

        public void SetWindStrength(float strength)
        {
            _velocity.enabled = true;
            _velocity.space = ParticleSystemSimulationSpace.World;
            _velocity.x = strength * 2f;
            _velocity.y = strength * 0.3f;
            _velocity.z = strength * 0.5f;
        }

        public void ClearParticles()
        {
            _particleSystem.Clear(true);
            _particleSystem.Play(true);
        }

        public static DustParticleController Create(Transform parent)
        {
            var go = new GameObject("DustParticles");
            go.transform.SetParent(parent);
            go.transform.localPosition = new Vector3(0f, 2f, 0f);

            var ps = go.AddComponent<ParticleSystem>();
            var renderer = go.GetComponent<ParticleSystemRenderer>();

            var main = ps.main;
            main.duration = 5f;
            main.loop = true;
            main.startLifetime = new ParticleSystem.MinMaxCurve(3f, 8f);
            main.startSpeed = new ParticleSystem.MinMaxCurve(0.5f, 2.5f);
            main.startSize = new ParticleSystem.MinMaxCurve(0.05f, 0.25f);
            main.startColor = new ParticleSystem.MinMaxGradient(
                new Color(0.85f, 0.7f, 0.45f, 0.6f),
                new Color(0.75f, 0.55f, 0.35f, 0.3f));
            main.maxParticles = 2000;
            main.simulationSpace = ParticleSystemSimulationSpace.World;
            main.gravityModifier = -0.05f;

            var emission = ps.emission;
            emission.rateOverTime = 80f;

            var shape = ps.shape;
            shape.shapeType = ParticleSystemShapeType.Box;
            shape.scale = new Vector3(40f, 8f, 40f);

            var velocity = ps.velocityOverLifetime;
            velocity.enabled = true;
            velocity.space = ParticleSystemSimulationSpace.World;
            velocity.x = 1.5f;
            velocity.y = 0.3f;
            velocity.z = 0.8f;

            var noise = ps.noise;
            noise.enabled = true;
            noise.strength = 0.5f;
            noise.frequency = 0.3f;
            noise.scrollSpeed = 0.5f;

            var colorOverLifetime = ps.colorOverLifetime;
            colorOverLifetime.enabled = true;
            var gradient = new Gradient();
            gradient.SetKeys(
                new[]
                {
                    new GradientColorKey(new Color(0.85f, 0.7f, 0.45f), 0f),
                    new GradientColorKey(new Color(0.75f, 0.55f, 0.35f), 1f)
                },
                new[]
                {
                    new GradientAlphaKey(0f, 0f),
                    new GradientAlphaKey(0.5f, 0.2f),
                    new GradientAlphaKey(0.3f, 0.8f),
                    new GradientAlphaKey(0f, 1f)
                });
            colorOverLifetime.color = gradient;

            var sizeOverLifetime = ps.sizeOverLifetime;
            sizeOverLifetime.enabled = true;
            sizeOverLifetime.size = new ParticleSystem.MinMaxCurve(1f,
                AnimationCurve.EaseInOut(0f, 0.5f, 1f, 1.5f));

            renderer.renderMode = ParticleSystemRenderMode.Billboard;
            renderer.material = CreateDefaultParticleMaterial();

            return go.AddComponent<DustParticleController>();
        }

        private static Material CreateDefaultParticleMaterial()
        {
            var shader = Shader.Find("Universal Render Pipeline/Particles/Unlit");
            if (shader == null)
            {
                shader = Shader.Find("Particles/Standard Unlit");
            }

            var mat = new Material(shader);
            mat.SetColor("_BaseColor", new Color(0.85f, 0.7f, 0.45f, 0.5f));
            return mat;
        }
    }
}
