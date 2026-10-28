using UnityEngine;

namespace SandSystem
{
    /// <summary>
    /// Screenshot scenario presets. Select and apply from the Inspector (Play mode).
    /// </summary>
    [DisallowMultipleComponent]
    [AddComponentMenu("Sand/Desert Scenario Panel")]
    public class DesertScenarioPanel : MonoBehaviour
    {
        public enum ScenarioId
        {
            SandstormEmpty = 0,
            FewTreesAndFactories = 1,
            FactoryHeavyLowTrees = 2,
            BalancedHalf = 3,
            TreeHeavyFewFactories = 4,
            ClearSkyManyTrees = 5
        }

        [System.Serializable]
        public class ScenarioPreset
        {
            public ScenarioId id;
            public string label = "Scenario";
            [Tooltip("Short note for Inspector")]
            public string note;
            public int trees;
            public int factories;
            public int mining;
            public int money = 8000;
        }

        [Header("Refs (auto-find if empty)")]
        [SerializeField] private DesertEnvironmentSystem environment;
        [SerializeField] private DesertEconomySystem economy;
        [SerializeField] private TreePlacementSystem trees;
        [SerializeField] private FactoryPlacementSystem factories;
        [SerializeField] private DesertEnvironmentUI decisionUi;

        [Header("Apply Options")]
        [SerializeField] private bool pausePollutionWhileApplying = true;

        [Header("Presets (edit counts for your shots)")]
        [SerializeField] private ScenarioPreset[] presets =
        {
            new ScenarioPreset
            {
                id = ScenarioId.SandstormEmpty,
                label = "1. Initial sandstorm",
                note = "Empty desert · yellow sky · heavy sand",
                trees = 0, factories = 0, mining = 0
            },
            new ScenarioPreset
            {
                id = ScenarioId.FewTreesAndFactories,
                label = "2. Few trees + factories",
                note = "Sparse planting · early industry",
                trees = 600, factories = 3, mining = 2
            },
            new ScenarioPreset
            {
                id = ScenarioId.FactoryHeavyLowTrees,
                label = "3. Factory heavy / low trees",
                note = "Dense industry · hard to see · bad E",
                trees = 180, factories = 16, mining = 12
            },
            new ScenarioPreset
            {
                id = ScenarioId.BalancedHalf,
                label = "4. Half trees / half factories",
                note = "Mid conflict · mixed sky",
                trees = 6500, factories = 10, mining = 6
            },
            new ScenarioPreset
            {
                id = ScenarioId.TreeHeavyFewFactories,
                label = "5. Many trees / few factories",
                note = "Recovery underway · factories still present",
                trees = 11000, factories = 2, mining = 3
            },
            new ScenarioPreset
            {
                id = ScenarioId.ClearSkyManyTrees,
                label = "6. Clear sky · many trees",
                note = "Blue sky · sand/heat down · no factories",
                trees = 15000, factories = 0, mining = 0
            }
        };

        string _lastStatus = "Use Inspector buttons while Playing.";
        bool _busy;

        public ScenarioPreset[] Presets => presets;
        public string LastStatus => _lastStatus;
        public bool IsBusy => _busy;

        void Awake() => ResolveRefs();

        public void ResolveRefs()
        {
            if (environment == null)
                environment = DesertEnvironmentSystem.Instance ?? FindFirstObjectByType<DesertEnvironmentSystem>();
            if (economy == null)
                economy = DesertEconomySystem.Instance ?? FindFirstObjectByType<DesertEconomySystem>();
            if (trees == null)
                trees = TreePlacementSystem.Instance ?? FindFirstObjectByType<TreePlacementSystem>();
            if (factories == null)
                factories = FactoryPlacementSystem.Instance ?? FindFirstObjectByType<FactoryPlacementSystem>();
            if (decisionUi == null)
                decisionUi = FindFirstObjectByType<DesertEnvironmentUI>();
        }

        public void ApplyScenario(ScenarioId id)
        {
            if (presets == null) return;
            for (int i = 0; i < presets.Length; i++)
            {
                if (presets[i] != null && presets[i].id == id)
                {
                    ApplyScenario(presets[i]);
                    return;
                }
            }
        }

        public void ApplyScenarioAtIndex(int index)
        {
            if (presets == null || index < 0 || index >= presets.Length) return;
            ApplyScenario(presets[index]);
        }

        public void ApplyScenario(ScenarioPreset preset)
        {
            if (_busy || preset == null) return;

            if (!Application.isPlaying)
            {
                _lastStatus = "Enter Play Mode, then apply a scenario.";
                Debug.LogWarning($"[DesertScenarioPanel] {_lastStatus}");
                return;
            }

            ResolveRefs();
            if (environment == null || trees == null || factories == null)
            {
                _lastStatus = "Missing Environment / Tree / Factory systems.";
                Debug.LogWarning($"[DesertScenarioPanel] {_lastStatus}");
                return;
            }

            _busy = true;
            bool wasEco = economy != null && economy.EnableEconomy;
            bool wasPause = economy != null && economy.PausePollution;

            try
            {
                if (economy != null)
                {
                    economy.EnableEconomy = false;
                    if (pausePollutionWhileApplying)
                        economy.PausePollution = true;
                }

                factories.ClearAllFactories();
                trees.ClearAllTrees();

                int wantTrees = Mathf.Max(0, preset.trees);
                int planted = trees.PlantTreesInstant(wantTrees);

                int wantFac = Mathf.Clamp(preset.factories, 0, Mathf.Max(1, environment.Config.factoryMax));
                int built = 0;
                for (int i = 0; i < wantFac; i++)
                {
                    if (!factories.BuildFactory(out _))
                        break;
                    built++;
                }

                environment.SetTreeCount(trees.AliveCount);
                environment.SetFactoryCount(built);
                environment.SetMiningCount(Mathf.Clamp(preset.mining, 0, Mathf.Max(1, environment.Config.miningMax)));
                environment.RefreshFx(immediate: true);

                if (economy != null)
                {
                    economy.SetMoney(Mathf.Max(0, preset.money));
                    economy.EnableEconomy = wasEco;
                    economy.PausePollution = wasPause;
                }

                if (decisionUi != null)
                    decisionUi.RefreshLabels();

                _lastStatus = $"Applied: {preset.label}  (trees {planted}/{wantTrees}, factories {built}/{wantFac})";
                Debug.Log($"[DesertScenarioPanel] {_lastStatus}");
            }
            finally
            {
                if (economy != null)
                {
                    economy.EnableEconomy = wasEco;
                    economy.PausePollution = wasPause;
                }
                _busy = false;
            }
        }
    }
}
