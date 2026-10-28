using UnityEngine;
using UnityEngine.UI;

/// <summary>
/// Testimony button: show text + unlock mind-map clue.
/// </summary>
public class TestimonyButton : MonoBehaviour
{
    public TestimonyData testimonyData;

    private Button button;
    private UIDisplayManager displayManager;
    private bool wired;

    void Start()
    {
        EnsureWired();
    }

    public void Setup(TestimonyData data)
    {
        testimonyData = data;
        wired = false;
        EnsureWired();
    }

    private void EnsureWired()
    {
        if (wired) return;

        if (button == null)
            button = GetComponent<Button>();
        if (displayManager == null)
            displayManager = FindObjectOfType<UIDisplayManager>();

        if (displayManager == null)
        {
            Debug.LogError("场景中找不到UIDisplayManager组件！");
            return;
        }

        if (button != null && testimonyData != null)
        {
            button.onClick.RemoveAllListeners();
            button.onClick.AddListener(OnClicked);
            wired = true;
        }
        else if (testimonyData == null && enabled)
        {
            Debug.LogWarning($"按钮 {gameObject.name} 尚未绑定 TestimonyData。");
        }
    }

    private void OnClicked()
    {
        displayManager.DisplayTestimony(testimonyData);
        if (testimonyData != null && !string.IsNullOrEmpty(testimonyData.clueId))
            ClueProgress.Ensure().UnlockClue(testimonyData.clueId);
    }
}
