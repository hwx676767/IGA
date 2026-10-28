using System;
using SandSimulator.Core;
using SandSimulator.Simulation;
using UnityEngine;

namespace SandSimulator.Core
{
    public class GameManager : MonoBehaviour
    {
        public static GameManager Instance { get; private set; }

        [SerializeField] private GameConfig config;

        public GameConfig Config => config;
        public GameState State { get; private set; }

        public event Action<GameState> OnStateChanged;
        public event Action<string> OnLogAdded;
        public event Action<GamePhase> OnGameEnded;
        public event Action OnGameRestarted;

        private void Awake()
        {
            if (Instance != null && Instance != this)
            {
                Destroy(gameObject);
                return;
            }

            Instance = this;

            if (config == null)
            {
                config = Resources.Load<GameConfig>("GameConfig");
            }

            if (config == null)
            {
                config = ScriptableObject.CreateInstance<GameConfig>();
                Debug.LogWarning("[Sand Simulator] 未找到 GameConfig，使用默认配置。请执行菜单 Sand Simulator > Setup Scene。");
            }

            StartNewGame();
        }

        public void StartNewGame()
        {
            State = new GameState
            {
                money = config.initialMoney,
                environment = config.initialEnvironment,
                miningCount = 0,
                factoryCount = 0,
                greeningScale = 0,
                currentTurn = 1,
                actionsRemaining = config.maxActionsPerTurn,
                phase = GamePhase.Playing
            };

            OnGameRestarted?.Invoke();
            NotifyStateChanged();
            AddLog("治沙抉择模拟开始。环境恶劣，沙尘笼罩，请谨慎决策。");
        }

        public bool CanPerformAction(ActionType action)
        {
            if (State.phase != GamePhase.Playing || State.actionsRemaining <= 0)
            {
                return false;
            }

            return action switch
            {
                ActionType.Mining => State.money >= config.miningCost,
                ActionType.Factory => State.money >= config.factoryCost,
                ActionType.TreePlanting => State.money >= config.treeCost,
                ActionType.Pass => true,
                _ => false
            };
        }

        public ActionPreview GetActionPreview(ActionType action)
        {
            var preview = new ActionPreview { actionType = action };

            switch (action)
            {
                case ActionType.Mining:
                    preview.cost = config.miningCost;
                    preview.income = config.miningIncome;
                    preview.netMoney = config.miningIncome - config.miningCost;
                    preview.environmentDelta = -config.miningEnvDamage;
                    preview.description = $"开采矿产，收入+{config.miningIncome}，成本-{config.miningCost}";
                    break;

                case ActionType.Factory:
                    preview.cost = config.factoryCost;
                    preview.income = config.factoryIncome;
                    preview.netMoney = config.factoryIncome - config.factoryCost;
                    preview.environmentDelta = -config.factoryEnvDamage;
                    preview.description = $"建设工厂，收入+{config.factoryIncome}，成本-{config.factoryCost}";
                    break;

                case ActionType.TreePlanting:
                    float efficiency = EnvironmentSystem.GetTreeEfficiency(config, State);
                    float benefit = EnvironmentSystem.GetPredictedTreeBenefit(config, State);
                    preview.cost = config.treeCost;
                    preview.income = 0;
                    preview.netMoney = -config.treeCost;
                    preview.environmentDelta = benefit;
                    preview.treeEfficiency = efficiency;
                    preview.description = efficiency < 0.1f
                        ? $"种树成本-{config.treeCost}，苗木存活率极低（{efficiency * 100f:F0}%）"
                        : $"种树成本-{config.treeCost}，环境+{benefit:F1}（有效率 {efficiency * 100f:F0}%）";
                    break;

                case ActionType.Pass:
                    preview.description = "本回合观望，不采取行动";
                    break;
            }

            return preview;
        }

        public void PerformAction(ActionType action)
        {
            if (!CanPerformAction(action))
            {
                return;
            }

            switch (action)
            {
                case ActionType.Mining:
                    EnvironmentSystem.ApplyMining(config, State);
                    AddLog($"第{State.currentTurn}回合：开采矿产。收入入账，粉尘加剧。");
                    break;

                case ActionType.Factory:
                    EnvironmentSystem.ApplyFactory(config, State);
                    AddLog($"第{State.currentTurn}回合：建设工厂。烟尘上升，经济受益。");
                    break;

                case ActionType.TreePlanting:
                    float efficiency = EnvironmentSystem.GetTreeEfficiency(config, State);
                    float before = State.environment;
                    EnvironmentSystem.ApplyTreePlanting(config, State);
                    float gained = State.environment - before;
                    if (efficiency < 0.1f)
                    {
                        AddLog($"第{State.currentTurn}回合：尝试种树，但沙化过重，苗木难以存活（+{gained:F1}）。");
                    }
                    else
                    {
                        AddLog($"第{State.currentTurn}回合：种植防风林，环境改善 +{gained:F1}（有效率 {efficiency * 100f:F0}%）。");
                    }
                    break;

                case ActionType.Pass:
                    AddLog($"第{State.currentTurn}回合：选择观望。");
                    break;
            }

            State.actionsRemaining--;
            NotifyStateChanged();

            if (State.actionsRemaining <= 0)
            {
                EndTurn();
            }
        }

        public void EndTurn()
        {
            if (State.phase != GamePhase.Playing)
            {
                return;
            }

            EnvironmentSystem.ProcessEndOfTurn(config, State);
            AddLog($"第{State.currentTurn}回合结束。被动结算完成，环境 {State.environment:F0}，资金 {State.money}。");

            if (CheckLose())
            {
                return;
            }

            if (State.currentTurn >= config.totalTurns)
            {
                CheckWin();
                return;
            }

            State.currentTurn++;
            State.actionsRemaining = config.maxActionsPerTurn;
            NotifyStateChanged();
            AddLog($"—— 第 {State.currentTurn} 回合开始（本回合可行动 {config.maxActionsPerTurn} 次）——");
        }

        private bool CheckLose()
        {
            if (State.money < 0)
            {
                State.phase = GamePhase.Lost;
                AddLog("资金耗尽，项目被迫中止。治理失败。");
                OnGameEnded?.Invoke(State.phase);
                NotifyStateChanged();
                return true;
            }

            if (State.environment <= config.loseEnvironment)
            {
                State.phase = GamePhase.Lost;
                AddLog("土地彻底沙化，家园失守。治理失败。");
                OnGameEnded?.Invoke(State.phase);
                NotifyStateChanged();
                return true;
            }

            return false;
        }

        private void CheckWin()
        {
            if (State.environment >= config.winEnvironment && State.money >= config.winMoneyMinimum)
            {
                State.phase = GamePhase.Won;
                AddLog("坚持到了最后，环境有所改善。治理成功！");
            }
            else
            {
                State.phase = GamePhase.Lost;
                AddLog($"回合结束，但环境（{State.environment:F0}）未达目标（{config.winEnvironment}）。治理未达预期。");
            }

            OnGameEnded?.Invoke(State.phase);
            NotifyStateChanged();
        }

        private void NotifyStateChanged()
        {
            OnStateChanged?.Invoke(State);
        }

        private void AddLog(string message)
        {
            OnLogAdded?.Invoke(message);
        }
    }

    [Serializable]
    public struct ActionPreview
    {
        public ActionType actionType;
        public int cost;
        public int income;
        public int netMoney;
        public float environmentDelta;
        public float treeEfficiency;
        public string description;
    }
}
