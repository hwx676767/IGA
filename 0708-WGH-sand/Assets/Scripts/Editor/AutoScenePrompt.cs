using UnityEditor;
using UnityEngine;

namespace SandSimulator.Editor
{
    [InitializeOnLoad]
    public static class AutoScenePrompt
    {
        static AutoScenePrompt()
        {
            EditorApplication.delayCall += CheckScene;
        }

        private static void CheckScene()
        {
            if (Application.isPlaying || SessionState.GetBool("SandSim_Prompted", false))
            {
                return;
            }

            if (Object.FindObjectOfType<SandSimulator.Core.GameManager>() != null)
            {
                return;
            }

            SessionState.SetBool("SandSim_Prompted", true);

            if (EditorUtility.DisplayDialog(
                    "治沙模拟器",
                    "检测到场景尚未搭建。\n是否现在自动搭建游戏场景？",
                    "搭建场景",
                    "稍后"))
            {
                SceneSetup.SetupScene();
            }
        }
    }
}
