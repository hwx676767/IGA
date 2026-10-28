using System.Collections;
using UnityEngine;

public class NoteMove : MonoBehaviour
{
    [Header("移动点")]
    public RectTransform pointA;
    public RectTransform pointB;
    public RectTransform pointC;

    [Header("移动参数")]
    public float travelTime = 1.0f;   // A → B 移动时间
    public float hitRange = 30f;      // 判定 C 点范围

    [Header("效果参数")]
    public float hitScale = 1.5f;     // 击中放大倍数
    public float effectSpeed = 6f;    // 放大缩小速度

    [Header("Note 数据")]
    public NoteData noteData;         // 存储 NoteDirection

    private RectTransform rect;
    private float timer = 0f;
    private bool isHit = false;       // 是否已被击中

    // Miss 回调（Manager 监听）
    public System.Action OnMiss;

    private void Awake()
    {
        rect = GetComponent<RectTransform>();
        if (noteData == null)
            noteData = GetComponent<NoteData>();
    }

    private void Start()
    {
        if (pointA != null)
            rect.position = pointA.position;
    }

    private void Update()
    {
        // 如果已击中，不再移动
        if (isHit) return;

        timer += Time.deltaTime;
        float t = timer / travelTime;

        // 移动 A → B
        if (pointA != null && pointB != null)
            rect.position = Vector3.Lerp(pointA.position, pointB.position, t);

        // 检测 C 点范围按键
        if (pointC != null && Vector3.Distance(rect.position, pointC.position) <= hitRange)
        {
            CheckInput();
        }

        // 超过终点且未击中 → Miss
        if (t >= 1.0f && !isHit)
        {
            OnMiss?.Invoke();
            Destroy(gameObject);
        }
    }

    private void CheckInput()
    {
        bool pressed = false;

        if (noteData == null) return;

        switch (noteData.direction)
        {
            case NoteDirection.Up:    pressed = Input.GetKeyDown(KeyCode.UpArrow); break;
            case NoteDirection.Down:  pressed = Input.GetKeyDown(KeyCode.DownArrow); break;
            case NoteDirection.Left:  pressed = Input.GetKeyDown(KeyCode.LeftArrow); break;
            case NoteDirection.Right: pressed = Input.GetKeyDown(KeyCode.RightArrow); break;
            case NoteDirection.Circle: pressed = Input.GetKeyDown(KeyCode.Space); break;
        }

        if (pressed)
        {
            OnHitSuccess();
        }
    }

    private void OnHitSuccess()
    {
        isHit = true;  // 停止移动
        StartCoroutine(HitEffect());
    }

    private IEnumerator HitEffect()
    {
        Vector3 originalScale = rect.localScale;
        Vector3 targetScale = originalScale * hitScale;

        float t = 0f;

        // 放大效果
        while (t < 1f)
        {
            t += Time.deltaTime * effectSpeed;
            rect.localScale = Vector3.Lerp(originalScale, targetScale, t);
            yield return null;
        }

        // 缩小消失
        t = 0f;
        while (t < 1f)
        {
            t += Time.deltaTime * effectSpeed;
            rect.localScale = Vector3.Lerp(targetScale, Vector3.zero, t);
            yield return null;
        }

        Destroy(gameObject);
    }
}
