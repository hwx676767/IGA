using DG.Tweening;
using UnityEngine;
using System.Collections;

public class PaintingController : MonoBehaviour
{
    public float mentalValue = 1000;
    public float maxMentalValue = 1000;
    public int hp = 3;
    public int hpMax = 3;

    public ParticleSystem _sonicWave;              // 声波粒子系统，用于技能 2
    public ParticleSystem _fistParticle;           // 拳头粒子系统，用于技能 3
    public ParticleSystem _bubbleParticle;
    public Transform _paintingFrame;              // 画框 Transform，用于动画
    public Transform _rotateObject;               // 要旋转的物体，用于技能 6
    public TrailParticleController _trailParticleController; // 拖尾粒子控制器，用于技能 5
    [SerializeField] private int minEmitCalls = 2; // 技能 5 每次触发的最小 EmitParticle 调用次数
    [SerializeField] private int maxEmitCalls = 4; // 技能 5 每次触发的最大 EmitParticle 调用次数
    [SerializeField] private float minEmitInterval = 0.1f; // 技能 5 每次 EmitParticle 调用的最小时间间隔（秒）
    [SerializeField] private float maxEmitInterval = 0.3f; // 技能 5 每次 EmitParticle 调用的最大时间间隔（秒）

    private bool _isDefending;
    private AttackType _currentDefenseType;
    private float _mentalCooldown = 0f;
    private const float MentalCooldownTime = 8f;
    private bool _isSkill3Activated = false;
    private bool _isSkill5Activated = false;
    private bool _hasUsedMentalValue = false;

    private void Start()
    {
        _isDefending = false;
    }

    private void Update()
    {
        // 测试输入
        if (Input.GetKeyDown(KeyCode.Alpha1)) Skill_1();
        if (Input.GetKeyDown(KeyCode.Alpha2)) Skill_2();
        if (Input.GetKeyDown(KeyCode.Alpha3)) Skill_3();
        if (Input.GetKeyDown(KeyCode.Alpha4)) Skill_4();
        if (Input.GetKeyDown(KeyCode.Alpha5)) Skill_5();
        if (Input.GetKeyDown(KeyCode.Alpha6)) Skill_6();
        if (Input.GetKeyDown(KeyCode.Alpha7)) Skill_7();

        if (_mentalCooldown > 0)
            _mentalCooldown -= Time.deltaTime;
    }

    public void Skill_1()
    {
        if (!CanUseSkill(200f)) return;

        Debug.Log("释放了技能一 - 轻推");
        ReduceMentalValue(200f);

        Sequence attackSeq = DOTween.Sequence();
        attackSeq.Append(_paintingFrame.DOScale(1.3f, 0.3f));
        attackSeq.Join(_paintingFrame.DOMove(_paintingFrame.position + Vector3.forward * 0.5f, 0.3f));
        attackSeq.Append(_paintingFrame.DOScale(1f, 0.3f));
        attackSeq.Join(_paintingFrame.DOMove(_paintingFrame.position, 0.3f));

        attackSeq.AppendCallback(() => {
            foreach (var enemy in FindObjectsOfType<EnemyAI>())
                enemy.InterruptAttack(AttackType.Melee);
        });
    }

    public void Skill_2()
    {
        if (!CanUseSkill(300f)) return;

        _isDefending = true;
        _currentDefenseType = AttackType.Sonic;
        Debug.Log("释放了技能二 - 声波");
        ReduceMentalValue(300f);

        Sequence defenseSequence = DOTween.Sequence();
        defenseSequence.AppendCallback(() => {
            if (_sonicWave != null) _sonicWave.Play();
            foreach (var enemy in FindObjectsOfType<EnemyAI>())
                enemy.InterruptAttack(_currentDefenseType);
        });
        defenseSequence.AppendInterval(0.5f);
        defenseSequence.Append(_paintingFrame.DOScale(1f, 0.3f))
            .OnComplete(() => _isDefending = false);
    }

    public void Skill_3()
    {
        if (!_isSkill3Activated || !CanUseSkill(250f)) return;

        Debug.Log("释放了技能三 - 拳头");
        ReduceMentalValue(250f);

        Sequence skill3Seq = DOTween.Sequence();
        skill3Seq.Append(_paintingFrame.DOShakeScale(0.5f, 0.5f));
        skill3Seq.AppendCallback(() => {
            if (_fistParticle != null) _fistParticle.Play();
            foreach (var enemy in FindObjectsOfType<EnemyAI>())
                enemy.InterruptAttack(AttackType.Jump);
        });
    }

    public void Skill_4()
    {
        if (!CanIncreaseMentalValue() || mentalValue >= maxMentalValue)
        {
            return;
        }

        Debug.Log("释放了技能四 - 恢复-微笑/瞪眼");
        IncreaseMentalValue();

        Sequence skill4Seq = DOTween.Sequence();
        if (_paintingFrame != null)
        {
            skill4Seq.Append(_paintingFrame.DOScale(1.5f, 0.5f));
            skill4Seq.Append(_paintingFrame.DOScale(1f, 0.5f));
        }
        else
        {
            Debug.LogError("PaintingFrame is null, cannot execute Skill_4 animation!");
        }
    }

    public void Skill_5()
    {
        if (!CanUseSkill(200f)) return;

        Debug.Log("释放了技能五 - 云朵攻击");
        ReduceMentalValue(200f);

        Sequence skill5Seq = DOTween.Sequence();
        skill5Seq.Append(_paintingFrame.DOScale(1.2f, 0.3f));
        skill5Seq.AppendCallback(() => {
            Sequence particleSeq = DOTween.Sequence();
            int emitCount = Random.Range(minEmitCalls, maxEmitCalls + 1);
            for (int i = 0; i < emitCount; i++)
            {
                if (i < emitCount - 1)
                    particleSeq.AppendInterval(Random.Range(minEmitInterval, maxEmitInterval));
                particleSeq.AppendCallback(() => {
                    if (_trailParticleController != null) _trailParticleController.EmitParticle();
                });
            }
            foreach (var enemy in FindObjectsOfType<EnemyAI>())
                enemy.InterruptAttack(AttackType.Throw);
        });
        skill5Seq.Append(_paintingFrame.DOScale(1f, 0.3f));
    }
    
    public void Skill_7()
    {
        if (!CanUseSkill(200f)) return;

        Debug.Log("释放了技能五 - 泡泡攻击");
        ReduceMentalValue(200f);

        Sequence skill3Seq = DOTween.Sequence();
        skill3Seq.Append(_paintingFrame.DOShakeScale(0.5f, 0.5f));
        skill3Seq.AppendCallback(() => {
            if (_bubbleParticle != null) _bubbleParticle.Play();
            foreach (var enemy in FindObjectsOfType<EnemyAI>())
                enemy.InterruptAttack(AttackType.Jump);
        });
    }
    

    public void Skill_6()
    {
        if (!CanUseSkill(200f)) return;

        Debug.Log("释放了技能六 - 重拍");
        ReduceMentalValue(200f);

        Sequence skill6Seq = DOTween.Sequence();
        skill6Seq.Append(_paintingFrame.DOScale(1.2f, 0.3f));
        skill6Seq.AppendCallback(() => {
            if (_rotateObject != null)
            {
                Sequence rotateSeq = DOTween.Sequence();
                rotateSeq.Append(_rotateObject.DORotate(new Vector3(-90f, 0, 0), 0.5f));
                rotateSeq.Append(_rotateObject.DORotate(Vector3.zero, 0.5f));
            }
            foreach (var enemy in FindObjectsOfType<EnemyAI>())
                enemy.InterruptAttack(AttackType.Throw);
        });
        skill6Seq.Append(_paintingFrame.DOScale(1f, 0.3f));
    }

    public void IncreaseMentalValue()
    {
        if (_mentalCooldown > 0)
        {
            return;
        }

        mentalValue = Mathf.Clamp(mentalValue + 200f, 0, maxMentalValue);
        _mentalCooldown = MentalCooldownTime;

        // active skill5
        if (mentalValue >= 800f && !_isSkill5Activated)
        {
            _isSkill5Activated = true;
        }
    }

    public bool CanIncreaseMentalValue() => _mentalCooldown <= 0;

    private bool CanUseSkill(float requiredMentalValue)
    {
        if (mentalValue >= requiredMentalValue)
        {
            _hasUsedMentalValue = true;
            return true;
        }
        return false;
    }

    public void ReduceMentalValue(float amount)
    {
        mentalValue = Mathf.Clamp(mentalValue - amount, 0, maxMentalValue);
        _hasUsedMentalValue = true;
    }

    public void ReduceHP()
    {
        hp = Mathf.Max(hp - 1, 0);
        if (hp < hpMax && !_isSkill3Activated)
        {
            _isSkill3Activated = true;
        }
        if (hp <= 0) FindObjectOfType<GameController>().EndGame(false);
    }

    public float GetMentalValuePercent() => mentalValue / maxMentalValue;
    public float GetHPPercent() => (float)hp / hpMax;
    public bool IsDefending(AttackType attackType) => _isDefending && _currentDefenseType == attackType;
    public bool IsSkill3Activated() => _isSkill3Activated;
    public bool IsSkill5Activated() => _isSkill5Activated;
}