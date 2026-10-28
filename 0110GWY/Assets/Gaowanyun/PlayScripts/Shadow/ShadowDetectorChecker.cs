using TMPro;
using UnityEngine;

public class ShadowDetectorChecker : MonoBehaviour
{
    public TextMeshProUGUI sensorBr;

    private Animator playerAnimator;
    private ShadowDetector sd;
    private DamageEffectManager damageEffectManager;
    private bool previousHiddenState = false;        // ����֮ǰ�Ĺ�������״̬������״̬�仯���

    void Start()
    {
        sd = GetComponent<ShadowDetector>();
        damageEffectManager = FindObjectOfType<DamageEffectManager>();
        playerAnimator = GameObject.Find("Player").GetComponent<Animator>();
    }

    void Update()
    {
        if (sd.hidden != previousHiddenState)
        {
            // ��ұ��ڱ�ʱ
            if (sd.hidden)
            {
                //Debug.Log("Stop");
                damageEffectManager.StopBreathingEffect();  // ֹͣ����Ч��
                //��һָ�����,ֱ����
                //playerAnimator.SetBool("IsCrouching", false);
            }
            // ��Ҵ��ڹ�����ʱ
            else
            {
                //Debug.Log("Start");
                damageEffectManager.ActivateBreathingEffect();  // ��ʼ����Ч��
                //��Ҷ��¶���
                playerAnimator.SetBool("IsCrouching", true);
            }

            // ����֮ǰ������״̬
            previousHiddenState = sd.hidden;
        }


        sensorBr.text = "Sensor Bright: " + System.Math.Round(sd.bright, 2);
    }
}
