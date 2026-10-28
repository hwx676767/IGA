using UnityEngine;
using UnityEngine.UI;

/// <summary>
/// Example HUD binding for money / scandal / chapter display.
/// </summary>
public class StatsHUDController : MonoBehaviour
{
    [SerializeField] private Text moneyLabel;
    [SerializeField] private Text scandalLabel;
    [SerializeField] private Text detectabilityLabel;
    [SerializeField] private Text deceptionLabel;
    [SerializeField] private Text chapterLabel;

    private void OnEnable()
    {
        if (PlayerStats.Instance != null)
            PlayerStats.Instance.OnStatsChanged += Refresh;

        Refresh(PlayerStats.Instance != null ? PlayerStats.Instance.Data : null);
    }

    private void OnDisable()
    {
        if (PlayerStats.Instance != null)
            PlayerStats.Instance.OnStatsChanged -= Refresh;
    }

    private void Refresh(PlayerStatsData data)
    {
        if (data == null)
            return;

        if (moneyLabel != null) moneyLabel.text = $"Money: {data.money:0}";
        if (scandalLabel != null) scandalLabel.text = $"Scandal: {data.globalScandalLevel:0}";
        if (detectabilityLabel != null) detectabilityLabel.text = $"Detected Risk: {data.detectability:0}";
        if (deceptionLabel != null) deceptionLabel.text = $"Deception: {data.deceptionPower:0}";
        if (chapterLabel != null) chapterLabel.text = data.currentChapterId;
    }
}
