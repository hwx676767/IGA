using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class UIManager : MonoBehaviour
{
    [SerializeField] private PaintingController paintingController;
    [SerializeField] private Button mentalRecoveryButton; // 精神值恢复按钮
    [SerializeField] private Button skill3Button;        // 技能 3 按钮
    private TMP_Text skill3ButtonText;  // 技能 3 按钮的子物体 TMP_Text
    [SerializeField] private Button skill4Button;        // 技能 4 按钮
    private TMP_Text skill4ButtonText;  // 技能 4 按钮的子物体 TMP_Text
    [SerializeField] private int sceneIndex; // 场景索引，用于判断当前场景

    void Start()
    {
        // 自动查找子物体 TMP_Text
        if (skill3ButtonText == null)
        {
            skill3ButtonText = skill3Button.GetComponentInChildren<TMP_Text>();
            if (skill3ButtonText == null) Debug.LogError("Skill 3 Button 没有找到子物体 TMP_Text！");
        }
        if (skill4ButtonText == null)
        {
            skill4ButtonText = skill4Button.GetComponentInChildren<TMP_Text>();
            if (skill4ButtonText == null) Debug.LogError("Skill 4 Button 没有找到子物体 TMP_Text！");
        }
    }

    void Update()
    {
        mentalRecoveryButton.interactable = paintingController.CanIncreaseMentalValue();

        bool isSkill3Active = paintingController.IsSkill3Activated();
        skill3Button.interactable = isSkill3Active;
        if (isSkill3Active && skill3ButtonText != null)
        {
            switch (sceneIndex)
            {
                case 1:
                    skill3ButtonText.text = "Cloud Attack";
                    break;
                case 2:
                    skill3ButtonText.text = "Bubble Attack";
                    break;
                default:
                    skill3ButtonText.text = "Skill 3"; 
                    Debug.LogWarning("none: " + sceneIndex);
                    break;
            }
        }

        bool isSkill4Active = paintingController.IsSkill5Activated();
        skill4Button.interactable = isSkill4Active;
        if (isSkill4Active && skill4ButtonText != null)
        {
            skill4ButtonText.text = "Heavy Slam";
        }
    }
    
    
}