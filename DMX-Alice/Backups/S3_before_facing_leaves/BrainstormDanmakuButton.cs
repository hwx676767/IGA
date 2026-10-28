using System;
using UnityEngine;
using UnityEngine.UI;

/// <summary>Moves one clickable UI.Text danmaku horizontally.</summary>
[RequireComponent(typeof(RectTransform), typeof(Button))]
public class BrainstormDanmakuButton : MonoBehaviour
{
    private RectTransform _rect;
    private BrainstormThought _thought;
    private float _speed;
    private float _despawnX;
    private bool _movesRight;
    private bool _alive;
    private bool _paused;
    private Action<BrainstormDanmakuButton> _onClicked;
    private Action<BrainstormDanmakuButton> _onDespawned;

    public BrainstormThought Thought => _thought;
    public RectTransform RectTransform => _rect != null ? _rect : (_rect = GetComponent<RectTransform>());

    private void Awake()
    {
        _rect = GetComponent<RectTransform>();
        GetComponent<Button>().onClick.AddListener(HandleClick);
    }

    public void Setup(BrainstormThought thought, float speed, float startX, float y, float despawnX,
        Action<BrainstormDanmakuButton> onClicked, Action<BrainstormDanmakuButton> onDespawned)
    {
        _thought = thought;
        BeginMove(speed, startX, y, despawnX, onClicked, onDespawned);
    }

    public void Prepare(BrainstormThought thought)
    {
        _thought = thought;
    }

    public void BeginMove(float speed, float startX, float y, float despawnX,
        Action<BrainstormDanmakuButton> onClicked, Action<BrainstormDanmakuButton> onDespawned)
    {
        _speed = speed;
        _despawnX = despawnX;
        _movesRight = speed >= 0f;
        _onClicked = onClicked;
        _onDespawned = onDespawned;
        _alive = true;
        _paused = false;
        RectTransform.anchoredPosition = new Vector2(startX, y);
    }

    private void Update()
    {
        if (!_alive || _paused) return;
        Vector2 position = RectTransform.anchoredPosition;
        position.x += _speed * Time.deltaTime;
        RectTransform.anchoredPosition = position;
        if ((_movesRight && position.x >= _despawnX) || (!_movesRight && position.x <= _despawnX))
            Despawn();
    }

    public void SetPaused(bool paused) { _paused = paused; }

    private void HandleClick()
    {
        if (_alive && !_paused) _onClicked?.Invoke(this);
    }

    public void Despawn()
    {
        if (!_alive) return;
        _alive = false;
        _onDespawned?.Invoke(this);
        Destroy(gameObject);
    }
}
