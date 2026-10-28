using System;

namespace SandSimulator.Core
{
    [Serializable]
    public class GameState
    {
        public int money;
        public float environment;
        public int miningCount;
        public int factoryCount;
        public int greeningScale;
        public int currentTurn;
        public int actionsRemaining;
        public GamePhase phase;

        public float Visibility => environment;

        public GameState Clone()
        {
            return new GameState
            {
                money = money,
                environment = environment,
                miningCount = miningCount,
                factoryCount = factoryCount,
                greeningScale = greeningScale,
                currentTurn = currentTurn,
                actionsRemaining = actionsRemaining,
                phase = phase
            };
        }
    }
}
