using UnityEngine;
using UnityEngine.UI;

public class VoltageBoosterUI : MonoBehaviour
{
    public Image cooldownImage;
    public Text boostStatusText;
    public Color activeColor = Color.green;
    public Color cooldownColor = Color.gray;
    public Color readyColor = Color.blue;

    private BatterySystem batterySystem;

    void Start()
    {
        batterySystem = FindObjectOfType<BatterySystem>();
        if (batterySystem == null)
        {
            Debug.LogError("�Ҳ���BatterySystem�����");
            enabled = false;
        }
    }

    void Update()
    {
        if (batterySystem == null) return;

        // ������ȴ����
        cooldownImage.fillAmount = batterySystem.VoltageBoostCooldownProgress;

        // ����״̬�ı�����ɫ
        if (batterySystem.IsVoltageBoostActive)
        {
            boostStatusText.text = "BOOST ACTIVE!";
            boostStatusText.color = activeColor;
        }
        else if (batterySystem.VoltageBoostCooldownProgress >= 1f)
        {
            boostStatusText.text = "READY";
            boostStatusText.color = readyColor;
        }
        else
        {
            boostStatusText.text = "COOLDOWN";
            boostStatusText.color = cooldownColor;
        }
    }
}