using UnityEngine;
using UnityEngine.EventSystems;

public class DraggablePiece : MonoBehaviour, IDragHandler, IEndDragHandler, IBeginDragHandler
{
    private RectTransform rectTransform;
    private Canvas canvas;
    private CanvasGroup canvasGroup;
    private Vector2 originalPosition;
    private bool isPlaced = false;
    private Transform targetSlot;
    
    [Header("吸附设置")]
    public float snapDistance = 60f;  // 吸附距离阈值（像素）
    
    [Header("（可选）放置后效果")]
    public bool disableAfterPlace = true;  // 放置后禁用拖拽
    public AudioClip placeSound;            // 放置音效
    
    private int pieceNumber;

    void Awake()
    {
        rectTransform = GetComponent<RectTransform>();
        canvas = GetComponentInParent<Canvas>();
        canvasGroup = GetComponent<CanvasGroup>();
        if (canvasGroup == null)
            canvasGroup = gameObject.AddComponent<CanvasGroup>();
    }

    void Start()
    {
        originalPosition = rectTransform.anchoredPosition;
        AutoMatchSlot();
    }

    /// <summary>
    /// 根据名字自动匹配槽位（Piece1 → Slot1）
    /// </summary>
    void AutoMatchSlot()
    {
        string name = gameObject.name;
        
        // 提取数字（支持 Piece1, Piece01, Piece_1, PuzzlePiece7 等格式）
        string numberStr = System.Text.RegularExpressions.Regex.Match(name, @"\d+").Value;
        
        if (int.TryParse(numberStr, out pieceNumber))
        {
            GameObject slot = GameObject.Find("Slot" + pieceNumber);
            if (slot != null)
            {
                targetSlot = slot.transform;
                Debug.Log($"[{name}] 已自动匹配到 {slot.name}，位置：{targetSlot.position}");
            }
            else
            {
                Debug.LogError($"[{name}] 找不到 Slot{pieceNumber}！请确保场景中存在该物体");
            }
        }
        else
        {
            Debug.LogError($"[{name}] 无法提取数字，请按规则命名如 Piece1, Piece2...");
        }
    }

    public void OnBeginDrag(PointerEventData eventData)
    {
        if (isPlaced) return;
        canvasGroup.alpha = 0.8f;  // 拖拽时半透明
        canvasGroup.blocksRaycasts = false;  // 让射线穿过，方便检测下方物体
    }

    public void OnDrag(PointerEventData eventData)
    {
        if (isPlaced) return;
        rectTransform.anchoredPosition += eventData.delta / canvas.scaleFactor;
    }

    public void OnEndDrag(PointerEventData eventData)
    {
        canvasGroup.alpha = 1f;
        canvasGroup.blocksRaycasts = true;
        
        if (isPlaced) return;
        if (targetSlot == null) return;
        
        float distance = Vector2.Distance(rectTransform.anchoredPosition, 
            (targetSlot as RectTransform).anchoredPosition);
        
        if (distance < snapDistance)
        {
            // Perfect Snapping
            rectTransform.anchoredPosition = (targetSlot as RectTransform).anchoredPosition;
            isPlaced = true;
            canvasGroup.blocksRaycasts = false;  // No Longer Responds to Dragging After Placement
            
            // play sound
            if (placeSound != null)
                AudioSource.PlayClipAtPoint(placeSound, Camera.main.transform.position);
            
            // call manager
            PuzzleManager manager = FindObjectOfType<PuzzleManager>();
            if (manager != null)
                manager.PiecePlaced();
        }
        else
        {
            // reset
            rectTransform.anchoredPosition = originalPosition;
        }
    }
    
    /// <summary>
    /// 重置拼图块（用于重置按钮）
    /// </summary>
    public void ResetPiece()
    {
        if (!isPlaced) return;
        
        isPlaced = false;
        canvasGroup.blocksRaycasts = true;
        rectTransform.anchoredPosition = originalPosition;
    }
}