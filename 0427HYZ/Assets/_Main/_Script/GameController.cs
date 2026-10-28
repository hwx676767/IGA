using DG.Tweening;
using UnityEngine;
using UnityEngine.UI;

public class GameController : MonoBehaviour
{
    
    [SerializeField]private PaintingController _paintingController;
    [SerializeField]private Image _paintingImage;       // UI 画框
    [SerializeField]private Transform _paintingModel;   // 场景中的模型
    [SerializeField]private Image _mentalBar;
    [SerializeField]private Image _hpBar;
    [SerializeField]private GameObject _winPanel;       // 胜利面板
    [SerializeField]private GameObject _losePanel;      // 失败面板

    [SerializeField] private int requiredBouncedEnemies = 10; // 胜利所需的弹开敌人数量
    private int bouncedEnemyCount = 0; // 当前弹开的敌人数量


    public void IncrementBouncedEnemyCount()
    {
        bouncedEnemyCount++;

        // 检查胜利条件
        if (bouncedEnemyCount >= requiredBouncedEnemies)
        {
            FindObjectOfType<GameController>().EndGame(true);
        }
    }
    
    private void Awake()
    {
        // 动态加载引用
        _paintingController = FindObjectOfType<PaintingController>();
        if (_paintingController == null)
            Debug.LogError("PaintingController not found in scene!");

        _paintingImage = GameObject.Find("PaintingImage")?.GetComponent<Image>();
        if (_paintingImage == null)
            Debug.LogError("PaintingImage (UI Image) not found! Ensure GameObject 'PaintingImage' exists with Image component.");

        _paintingModel = GameObject.Find("PaintingModel")?.transform;
        if (_paintingModel == null)
            Debug.LogError("PaintingModel not found! Ensure GameObject 'PaintingModel' exists.");

        _mentalBar = GameObject.Find("MentalBar")?.GetComponent<Image>();
        if (_mentalBar == null)
            Debug.LogError("MentalBar (UI Image) not found! Ensure GameObject 'MentalBar' exists with Image component.");

        _hpBar = GameObject.Find("HPBar")?.GetComponent<Image>();
        if (_hpBar == null)
            Debug.LogError("HPBar (UI Image) not found! Ensure GameObject 'HPBar' exists with Image component.");

        _winPanel = GameObject.Find("WinPanel");
        if (_winPanel == null)
            Debug.LogError("WinPanel not found! Ensure GameObject 'WinPanel' exists.");

        _losePanel = GameObject.Find("FalsePanel");
        if (_losePanel == null)
            Debug.LogError("LosePanel not found! Ensure GameObject 'LosePanel' exists.");
    }

    private void Start()
    {
        // 确保胜利和失败面板在游戏开始时是隐藏的
        if (_winPanel != null)
            _winPanel.SetActive(false);
        else
            Debug.LogError("WinPanel is null, cannot set active state!");

        if (_losePanel != null)
            _losePanel.SetActive(false);
        else
            Debug.LogError("LosePanel is null, cannot set active state!");
    }

    private void Update()
    {
        if (_mentalBar != null && _paintingController != null)
            _mentalBar.fillAmount = _paintingController.GetMentalValuePercent();
        else
            Debug.LogWarning("MentalBar or PaintingController is null, cannot update fill amount!");

        if (_hpBar != null && _paintingController != null)
            _hpBar.fillAmount = _paintingController.GetHPPercent();
        else
            Debug.LogWarning("HPBar or PaintingController is null, cannot update fill amount!");
    }

    public void ShakePainting()
    {
        // UI 画框抖动
        if (_paintingImage != null)
        {
            _paintingImage.transform.DOShakePosition(0.7f, 15f);
            _paintingImage.transform.DOShakeScale(0.7f, 0.7f);
        }
        else
            Debug.LogWarning("PaintingImage is null, cannot shake UI!");

        // 场景模型抖动
        if (_paintingModel != null)
        {
            _paintingModel.DOShakePosition(0.7f, 0.15f); // 调整幅度，适合 3D 模型
            _paintingModel.DOShakeScale(0.7f, 0.15f);
        }
        else
            Debug.LogWarning("PaintingModel is null, cannot shake model!");
    }

    public void ReduceHP()
    {
        if (_paintingController != null)
            _paintingController.ReduceHP();
        else
            Debug.LogWarning("PaintingController is null, cannot reduce HP!");
    }

    public bool IsDefending(AttackType attackType)
    {
        if (_paintingController != null)
            return _paintingController.IsDefending(attackType);
        Debug.LogWarning("PaintingController is null, assuming not defending!");
        return false;
    }

    // 使用场景模型的位置计算目标点
    public Vector3 GetPositionApartFromPaintingToZombiePos
    {
        get
        {
            if (_paintingModel != null)
                return _paintingModel.position - 6f * Vector3.left;
            Debug.LogWarning("PaintingModel is null, returning default position!");
            return Vector3.zero;
        }
    }

    // 假设初始僵尸位置需要从外部提供或在 Start 中设置
    private Vector3 _initialZombieBodyPos;

    public void SetInitialZombieBodyPos(Vector3 pos)
    {
        _initialZombieBodyPos = pos;
    }

    // 结束游戏：根据结果显示胜利或失败面板
    public void EndGame(bool isWin)
    {
        // 暂停游戏
        Time.timeScale = 0;

        if (isWin)
        {
            // 游戏胜利
            Debug.Log("游戏胜利！");
            if (_winPanel != null)
                _winPanel.SetActive(true);
            else
                Debug.LogError("WinPanel is null, cannot display victory panel!");
        }
        else
        {
            // 游戏失败
            Debug.Log("游戏失败！");
            if (_losePanel != null)
                _losePanel.SetActive(true);
            else
                Debug.LogError("LosePanel is null, cannot display lose panel!");
        }
    }
}