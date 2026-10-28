using UnityEngine;

namespace SandSimulator.Core
{
    [CreateAssetMenu(fileName = "GameConfig", menuName = "Sand Simulator/Game Config")]
    public class GameConfig : ScriptableObject
    {
        [Header("初始状态")]
        public int initialMoney = 5000;
        [Range(0, 100)] public float initialEnvironment = 25f;
        public int totalTurns = 12;
        public int maxActionsPerTurn = 2;

        [Header("开采")]
        public int miningCost = 800;
        public int miningIncome = 2000;
        public float miningEnvDamage = 15f;
        public int miningIncomePerTurn = 300;
        public float miningPollutionPerTurn = 2f;

        [Header("建工厂")]
        public int factoryCost = 1500;
        public int factoryIncome = 1200;
        public float factoryEnvDamage = 10f;
        public int factoryIncomePerTurn = 500;
        public float factoryPollutionPerTurn = 3f;

        [Header("种树")]
        public int treeCost = 600;
        public float treeEnvBenefit = 8f;
        public float treeBenefitPerTurn = 1.5f;
        public float treeEffectThreshold = 35f;
        public float treeEffectRange = 40f;
        public float industrialTreePenaltyRatio = 2f;

        [Header("回合结算")]
        public float naturalDegradationThreshold = 30f;
        public float naturalDegradationRate = 1f;
        public int passiveIncomeBase = 0;

        [Header("胜负条件")]
        public float winEnvironment = 50f;
        public float loseEnvironment = 10f;
        public int winMoneyMinimum = 1;
    }
}
