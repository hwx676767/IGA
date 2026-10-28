using UnityEngine;
using UnityEngine.UI;

/// <summary>
/// Binds upgrade list from local JSON to UI buttons.
/// </summary>
public class UpgradeUIController : MonoBehaviour
{
    [SerializeField] private Transform listRoot;
    [SerializeField] private GameObject upgradeItemPrefab;
    [SerializeField] private Text detailLabel;

    private void OnEnable()
    {
        RefreshList();
        if (PlayerStats.Instance != null)
            PlayerStats.Instance.OnStatsChanged += _ => RefreshList();
    }

    private void OnDisable()
    {
        if (PlayerStats.Instance != null)
            PlayerStats.Instance.OnStatsChanged -= _ => RefreshList();
    }

    public void RefreshList()
    {
        if (listRoot == null || upgradeItemPrefab == null || LocalTextDataLoader.Instance == null)
            return;

        foreach (Transform child in listRoot)
            Destroy(child.gameObject);

        var stats = PlayerStats.Instance?.Data;
        if (stats == null)
            return;

        foreach (var upgrade in LocalTextDataLoader.Instance.GetAvailableUpgrades(stats))
        {
            var item = Instantiate(upgradeItemPrefab, listRoot);
            var label = item.GetComponentInChildren<Text>();
            if (label != null)
                label.text = upgrade.displayName;

            var button = item.GetComponent<Button>();
            if (button != null)
            {
                var captured = upgrade;
                button.onClick.AddListener(() => SelectUpgrade(captured));
            }
        }
    }

    private void SelectUpgrade(UpgradeDefinition upgrade)
    {
        if (detailLabel != null)
            detailLabel.text = upgrade.description;

        UpgradeSystem.Instance?.TryApplyUpgrade(upgrade.upgradeId);
    }
}
