using UnityEngine;
using UnityEngine.UI;
using TMPro;

/// <summary>
/// Legacy binder — disabled when MindMapBoard is present.
/// Kept so old scene references do not break.
/// </summary>
public class MindMapContentBinder : MonoBehaviour
{
    [System.Serializable]
    public class LabeledClue
    {
        public string clueId;
        public string label;
        public ConnectableUI node;
        public TMP_Text labelText;
        public Sprite nodeSprite;
    }

    public LabeledClue[] clues;
    public InferenceManager inferenceManager;
    public InferenceRule[] inferenceRules;
    public TextMeshProUGUI resultText;
    public GameObject resultPanel;

    void Awake()
    {
        // MindMapBoard owns rules + unlock flow now
        if (GetComponent<MindMapBoard>() != null)
        {
            enabled = false;
            return;
        }

        if (clues != null)
        {
            foreach (var c in clues)
            {
                if (c == null) continue;
                if (c.node != null)
                    c.node.clueId = c.clueId;
                if (c.labelText != null && !string.IsNullOrEmpty(c.label))
                    c.labelText.text = c.label;
                if (c.node != null && c.nodeSprite != null)
                {
                    Image img = c.node.GetComponent<Image>();
                    if (img != null)
                        img.sprite = c.nodeSprite;
                }
            }
        }

        if (inferenceManager == null)
            inferenceManager = GetComponent<InferenceManager>();

        if (inferenceManager != null)
        {
            if (inferenceRules != null && inferenceRules.Length > 0)
                inferenceManager.rules = inferenceRules;
            if (resultText != null)
                inferenceManager.resultText = resultText;
            if (resultPanel != null)
                inferenceManager.resultPanel = resultPanel;
        }
    }
}
