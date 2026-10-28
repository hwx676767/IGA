using SandSimulator.Core;
using UnityEngine;

namespace SandSimulator.Simulation
{
    public static class EnvironmentSystem
    {
        public static float GetTreeEfficiency(GameConfig config, GameState state)
        {
            float baseEfficiency = Mathf.Clamp01(
                (state.environment - config.treeEffectThreshold) / config.treeEffectRange);

            int industrialTotal = state.miningCount + state.factoryCount;
            if (state.greeningScale > 0 && industrialTotal > 0)
            {
                float ratio = (float)industrialTotal / state.greeningScale;
                if (ratio > config.industrialTreePenaltyRatio)
                {
                    baseEfficiency *= 0.5f;
                }
            }

            return baseEfficiency;
        }

        public static float GetPredictedTreeBenefit(GameConfig config, GameState state)
        {
            return config.treeEnvBenefit * GetTreeEfficiency(config, state);
        }

        public static void ApplyMining(GameConfig config, GameState state)
        {
            state.money += config.miningIncome - config.miningCost;
            state.environment = Mathf.Clamp(state.environment - config.miningEnvDamage, 0f, 100f);
            state.miningCount++;
        }

        public static void ApplyFactory(GameConfig config, GameState state)
        {
            state.money += config.factoryIncome - config.factoryCost;
            state.environment = Mathf.Clamp(state.environment - config.factoryEnvDamage, 0f, 100f);
            state.factoryCount++;
        }

        public static void ApplyTreePlanting(GameConfig config, GameState state)
        {
            state.money -= config.treeCost;
            float benefit = GetPredictedTreeBenefit(config, state);
            state.environment = Mathf.Clamp(state.environment + benefit, 0f, 100f);
            state.greeningScale++;
        }

        public static void ProcessEndOfTurn(GameConfig config, GameState state)
        {
            int passiveIncome = config.passiveIncomeBase
                                + state.miningCount * config.miningIncomePerTurn
                                + state.factoryCount * config.factoryIncomePerTurn;

            state.money += passiveIncome;

            float pollution = state.miningCount * config.miningPollutionPerTurn
                              + state.factoryCount * config.factoryPollutionPerTurn;
            float greening = state.greeningScale * config.treeBenefitPerTurn
                             * GetTreeEfficiency(config, state);

            state.environment = Mathf.Clamp(state.environment - pollution + greening, 0f, 100f);

            if (state.environment < config.naturalDegradationThreshold)
            {
                state.environment = Mathf.Clamp(
                    state.environment - config.naturalDegradationRate, 0f, 100f);
            }
        }
    }
}
