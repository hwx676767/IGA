using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

/// <summary>
/// Gives the foliage in the Zelda scene a low-cost, non-synchronised breeze.
/// Attach this once to a scene root; foliage is found by its existing names so
/// no authored vegetation needs to be replaced or duplicated.
/// </summary>
public sealed class ZeldaBreeze : MonoBehaviour
{
    [Header("Breeze")]
    [SerializeField, Range(0.1f, 3f)] private float speed = 0.65f;
    [SerializeField, Range(0f, 15f)] private float grassSway = 5f;
    [SerializeField, Range(0f, 15f)] private float flowerSway = 3.5f;
    [SerializeField, Range(0f, 15f)] private float shrubSway = 0.5f;
    [SerializeField, Range(0f, 15f)] private float canopySway = 2.25f;
    [SerializeField] private Vector3 worldDirection = new Vector3(0.8f, 0f, 0.45f);

    private readonly List<BreezeTarget> targets = new List<BreezeTarget>();
    private WindZone windZone;

    private void Awake()
    {
        ConfigureWindZone();
        CollectTargets();
    }

    private void OnEnable()
    {
        if (Application.isPlaying && targets.Count == 0)
            CollectTargets();
    }

    private void Update()
    {
        if (!Application.isPlaying)
            return;

        float time = Time.time * speed;
        Vector3 direction = worldDirection.sqrMagnitude > 0.001f
            ? worldDirection.normalized
            : Vector3.right;

        foreach (BreezeTarget target in targets)
        {
            if (target.transform == null)
                continue;

            float broadWave = Mathf.Sin(time * target.frequency + target.phase);
            float detailWave = Mathf.Sin(time * (target.frequency * 1.83f) + target.phase * 2.17f) * 0.28f;
            float gust = 0.58f + Mathf.PerlinNoise(
                target.worldPosition.x * 0.065f + time * 0.09f,
                target.worldPosition.z * 0.065f) * 0.72f;
            float bend = (broadWave + detailWave) * gust * target.amplitude;

            Vector3 localWind = target.parent == null
                ? direction
                : target.parent.InverseTransformDirection(direction);
            Vector3 side = Vector3.Cross(Vector3.up, localWind).normalized;
            Quaternion sway = Quaternion.AngleAxis(bend, side) *
                             Quaternion.AngleAxis(bend * 0.32f, Vector3.forward);
            target.transform.localRotation = target.initialRotation * sway;
        }
    }

    private void OnDisable()
    {
        foreach (BreezeTarget target in targets)
        {
            if (target.transform != null)
                target.transform.localRotation = target.initialRotation;
        }
    }

    private void ConfigureWindZone()
    {
        windZone = FindObjectOfType<WindZone>();
        if (windZone == null)
            windZone = gameObject.AddComponent<WindZone>();

        windZone.mode = WindZoneMode.Directional;
        windZone.windMain = 0.18f;
        windZone.windTurbulence = 0.32f;
        windZone.windPulseMagnitude = 0.18f;
        windZone.windPulseFrequency = 0.14f;
    }

    private void CollectTargets()
    {
        targets.Clear();
        foreach (Transform candidate in FindObjectsOfType<Transform>(true))
        {
            if (candidate == transform || candidate.gameObject.scene != SceneManager.GetActiveScene())
                continue;

            FoliageType foliageType = GetFoliageType(candidate.name);
            if (foliageType == FoliageType.None || !candidate.GetComponentInChildren<Renderer>(true))
                continue;

            // Do not rotate organisation-only roots such as "Grass" or "Flowers".
            // Some imported grass assets contain static scenery (the mountain),
            // so their parent must remain completely still as well.
            if (candidate.name == "Grass" || candidate.name == "Flowers" || HasStaticSceneryDescendant(candidate))
                continue;

            float amplitude = foliageType == FoliageType.Grass ? grassSway :
                foliageType == FoliageType.Flower ? flowerSway :
                foliageType == FoliageType.Shrub ? shrubSway : canopySway;
            float phase = Mathf.Repeat(candidate.position.x * 1.73f + candidate.position.z * 2.41f, Mathf.PI * 2f);
            targets.Add(new BreezeTarget(candidate, amplitude, phase, foliageType));
        }
    }

    private static FoliageType GetFoliageType(string objectName)
    {
        string name = objectName.ToLowerInvariant();
        if (name.Contains("grass")) return FoliageType.Grass;
        if (name.Contains("flower") || name.Contains("bud") || name.Contains("forsythia")) return FoliageType.Flower;
        if (name.Contains("shrub")) return FoliageType.Shrub;
        if (name.Contains("crown") || name.Contains("leaf")) return FoliageType.Canopy;
        return FoliageType.None;
    }

    private static bool HasStaticSceneryDescendant(Transform candidate)
    {
        foreach (Transform child in candidate.GetComponentsInChildren<Transform>(true))
        {
            if (child != candidate && child.name.ToLowerInvariant().Contains("mountain"))
                return true;
        }

        return false;
    }

    private enum FoliageType { None, Grass, Flower, Shrub, Canopy }

    private readonly struct BreezeTarget
    {
        public readonly Transform transform;
        public readonly Transform parent;
        public readonly Quaternion initialRotation;
        public readonly Vector3 worldPosition;
        public readonly float amplitude;
        public readonly float phase;
        public readonly float frequency;

        public BreezeTarget(Transform transform, float amplitude, float phase, FoliageType type)
        {
            this.transform = transform;
            parent = transform.parent;
            initialRotation = transform.localRotation;
            worldPosition = transform.position;
            this.amplitude = amplitude;
            this.phase = phase;
            frequency = type == FoliageType.Grass ? 1.25f :
                type == FoliageType.Flower ? 0.95f :
                type == FoliageType.Shrub ? 0.5f : 0.65f;
        }
    }
}
