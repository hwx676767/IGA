using System.Collections.Generic;
using SandSimulator.Core;
using UnityEngine;
using UnityEngine.UI;

namespace SandSimulator.UI
{
    public class GameHUD : MonoBehaviour
    {
        [Header("Status")]
        [SerializeField] private Text turnText;
        [SerializeField] private Text moneyText;
        [SerializeField] private Text environmentText;
        [SerializeField] private Text visibilityText;
        [SerializeField] private Text scaleText;
        [SerializeField] private Text actionsText;
        [SerializeField] private Text statusText;

        [Header("Actions")]
        [SerializeField] private Button miningButton;
        [SerializeField] private Button factoryButton;
        [SerializeField] private Button treeButton;
        [SerializeField] private Button passButton;
        [SerializeField] private Button endTurnButton;

        [SerializeField] private Text miningPreview;
        [SerializeField] private Text factoryPreview;
        [SerializeField] private Text treePreview;

        [Header("Log")]
        [SerializeField] private Text logText;
        [SerializeField] private int maxLogLines = 12;

        [Header("Game Over")]
        [SerializeField] private GameObject gameOverPanel;
        [SerializeField] private Text gameOverText;
        [SerializeField] private Button restartButton;

        private readonly List<string> _logLines = new List<string>();

        private void Start()
        {
            miningButton.onClick.AddListener(() => PerformAction(ActionType.Mining));
            factoryButton.onClick.AddListener(() => PerformAction(ActionType.Factory));
            treeButton.onClick.AddListener(() => PerformAction(ActionType.TreePlanting));
            passButton.onClick.AddListener(() => PerformAction(ActionType.Pass));
            endTurnButton.onClick.AddListener(() => GameManager.Instance.EndTurn());
            restartButton.onClick.AddListener(() =>
            {
                gameOverPanel.SetActive(false);
                GameManager.Instance.StartNewGame();
            });

            GameManager.Instance.OnStateChanged += RefreshUI;
            GameManager.Instance.OnLogAdded += AddLogLine;
            GameManager.Instance.OnGameEnded += OnGameEnded;

            gameOverPanel.SetActive(false);
            RefreshUI(GameManager.Instance.State);
        }

        private void OnDestroy()
        {
            if (GameManager.Instance == null)
            {
                return;
            }

            GameManager.Instance.OnStateChanged -= RefreshUI;
            GameManager.Instance.OnLogAdded -= AddLogLine;
            GameManager.Instance.OnGameEnded -= OnGameEnded;
        }

        private void PerformAction(ActionType action)
        {
            GameManager.Instance.PerformAction(action);
        }

        private void RefreshUI(GameState state)
        {
            var config = GameManager.Instance.Config;
            bool playing = state.phase == GamePhase.Playing;

            turnText.text = $"回合 {state.currentTurn} / {config.totalTurns}";
            moneyText.text = $"资金: ¥{state.money:N0}";
            environmentText.text = $"环境: {state.environment:F0}";
            visibilityText.text = $"能见度: {state.Visibility:F0}%";
            scaleText.text = $"开采 {state.miningCount} | 工厂 {state.factoryCount} | 绿化 {state.greeningScale}";
            actionsText.text = $"本回合剩余行动: {state.actionsRemaining}";

            RefreshActionButton(miningButton, miningPreview, ActionType.Mining, playing);
            RefreshActionButton(factoryButton, factoryPreview, ActionType.Factory, playing);
            RefreshActionButton(treeButton, treePreview, ActionType.TreePlanting, playing);

            passButton.interactable = playing && state.actionsRemaining > 0;
            endTurnButton.interactable = playing;

            if (state.phase == GamePhase.Playing)
            {
                float treeEff = Simulation.EnvironmentSystem.GetTreeEfficiency(config, state);
                if (treeEff < 0.1f)
                {
                    statusText.text = "环境恶劣，种树效果极差，需先改善生态基数";
                }
                else if (state.environment < config.naturalDegradationThreshold)
                {
                    statusText.text = "环境持续退化中，每回合自然损耗";
                }
                else
                {
                    statusText.text = "在开采、建厂与绿化之间做出抉择";
                }
            }
        }

        private void RefreshActionButton(Button button, Text preview, ActionType action, bool playing)
        {
            bool canAct = playing && GameManager.Instance.CanPerformAction(action);
            button.interactable = canAct;

            var p = GameManager.Instance.GetActionPreview(action);
            if (preview != null)
            {
                preview.text = p.description;
            }
        }

        private void AddLogLine(string line)
        {
            _logLines.Add(line);
            while (_logLines.Count > maxLogLines)
            {
                _logLines.RemoveAt(0);
            }

            logText.text = string.Join("\n", _logLines);
        }

        private void OnGameEnded(GamePhase phase)
        {
            gameOverPanel.SetActive(true);
            gameOverText.text = phase == GamePhase.Won
                ? "治理成功！\n你在发展与保护之间找到了平衡。"
                : "治理失败。\n黄沙仍在肆虐，家园亟待拯救。";
        }
    }
}
