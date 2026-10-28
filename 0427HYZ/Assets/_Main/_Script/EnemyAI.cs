using DG.Tweening;
using UnityEngine;

public enum AttackType { Melee, Sonic, Jump, Throw }

public class EnemyAI : MonoBehaviour
{
    private Animator _zombieAnimator;
    private Transform _zombieBodies;
    private GameController _gameController;
    private Vector3 _initialPos;

    [SerializeField] private Vector3 targetPosition;       // 生成后走到的位置
    [SerializeField] private float standDuration = 2f;     // 站定时间
    [SerializeField] private AttackType attackType = AttackType.Melee;
    [SerializeField] private Vector3 postAttackOffset = new Vector3(0, 0, -5f); // 攻击后退场位置的偏移
    [SerializeField] private float attackAnimationLength = 1f; // attack 动画长度，需根据实际动画调整

    private bool _isAttackInterrupted;
    private bool _isAttackEffective; // 标记攻击是否生效（到达抖动点）
    private bool _hasReducedHP;       // 标记是否已扣血

    public AttackType GetAttackType() => attackType;

    public void SetAttackType(AttackType type)
    {
        attackType = type;
    }

    public void Initialize(GameController controller, Animator animator, Transform bodies)
    {
        _gameController = controller;
        _zombieAnimator = animator;
        _zombieBodies = bodies;
        _initialPos = _zombieBodies.position;
        _gameController.SetInitialZombieBodyPos(_initialPos);
        StartInitialBehavior();
    }

    private void StartInitialBehavior()
    {
        Sequence initialSequence = DOTween.Sequence();
        initialSequence.AppendCallback(() => _zombieAnimator.Play("walk"));
        initialSequence.Append(_zombieBodies.DOMove(targetPosition, 2f));
        initialSequence.AppendCallback(() => {
            DOTween.Kill(_zombieBodies);
            _zombieAnimator.Play("idle", -1, 0f);
        });
        initialSequence.AppendInterval(standDuration);
        initialSequence.OnComplete(() => PerformAttack());
    }

    public void PerformAttack()
    {
        _isAttackInterrupted = false;
        _isAttackEffective = false;
        _hasReducedHP = false;
        const string animName = "attack";

        Sequence attackSequence = DOTween.Sequence();
        Vector3 attackPos = _gameController.GetPositionApartFromPaintingToZombiePos;
        Debug.Log($"[{Time.time}] Enemy performing attack, type: {attackType}, target pos: {attackPos}");

        // 转向攻击位置并开始移动
        attackSequence.AppendCallback(() => {
            Vector3 direction = (attackPos - _zombieBodies.position).normalized;
            Quaternion targetRotation = Quaternion.LookRotation(direction);
            _zombieBodies.DORotateQuaternion(targetRotation, 0.5f);
            _zombieAnimator.Play("walk");
        });
        attackSequence.Join(_zombieBodies.DOMove(
            new Vector3(attackPos.x, _zombieBodies.position.y, attackPos.z), 2f
        ));

        // 播放攻击动画
        attackSequence.AppendCallback(() => _zombieAnimator.Play(animName));
        // 等待 60% 动画长度后抖动
        float shakeDelay = attackAnimationLength * 0.6f;
        attackSequence.AppendInterval(shakeDelay);
        attackSequence.AppendCallback(() => {
            _isAttackEffective = true; // 标记攻击生效
            _gameController.ShakePainting();
            Debug.Log($"[{Time.time}] Enemy attack effective, shaking painting");
        });
        // 等待剩余动画长度，确保动画完整播放
        float remainingTime = attackAnimationLength - shakeDelay;
        attackSequence.AppendInterval(remainingTime);

        // 退场并处理扣血
        attackSequence.AppendCallback(() => {
            if (!_isAttackInterrupted)
            {
                // 只有在攻击完成且未防御时扣血
                if (_isAttackEffective && !_gameController.IsDefending(attackType) && !_hasReducedHP)
                {
                    _gameController.ReduceHP();
                    _hasReducedHP = true;
                    Debug.Log($"[{Time.time}] Enemy attack completed, HP reduced (no defense)");
                }
                else
                {
                    Debug.Log($"[{Time.time}] Enemy attack completed, but defended or already reduced HP");
                }

                Vector3 postAttackPos = attackPos + postAttackOffset;
                Debug.Log($"[{Time.time}] Enemy retreating to: {postAttackPos}");

                Vector3 retreatDirection = (postAttackPos - _zombieBodies.position).normalized;
                Quaternion retreatRotation = Quaternion.LookRotation(retreatDirection);
                _zombieBodies.DORotateQuaternion(retreatRotation, 0.5f);
                _zombieAnimator.Play("walk");
                _zombieBodies.DOMove(postAttackPos, 2f)
                    .OnComplete(() => {
                        FindObjectOfType<EnemySpawner>().OnEnemyDestroyed();
                        Destroy(gameObject);
                    });
            }
        });
    }

    public void InterruptAttack(AttackType defenseType)
    {
        if (_isAttackInterrupted) return; // 防止重复打断

        _isAttackInterrupted = true;
        DOTween.Kill(_zombieBodies);
        _zombieAnimator.Play("walk");

        // 通知 GameVictoryManager 增加弹开计数
        if (_gameController != null)
        {
            _gameController.IncrementBouncedEnemyCount();
        }
        else
        {
            Debug.LogWarning("GameVictoryManager instance not found!");
        }

        Vector3 awayFromPainting = _initialPos + (_initialPos - _gameController.GetPositionApartFromPaintingToZombiePos).normalized * 2f;
        _zombieBodies.DOJump(awayFromPainting, 1f, 1, 0.5f)
            .OnComplete(() => {
                FindObjectOfType<EnemySpawner>().OnEnemyDestroyed();
                Destroy(gameObject);
            });
    }
}