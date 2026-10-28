using UnityEngine;

/// <summary>
/// 2D悬停缩放效果：当鼠标悬停在物体上时放大，移出时恢复原始大小
/// </summary>
public class HoverZoom2D : MonoBehaviour
{
    [Tooltip("缩放倍数（建议1.1-1.5之间）")]
    public float zoomFactor = 1.2f;  // 缩放系数
    
    private Vector3 _originalScale;  // 物体原始尺寸
    private bool _isHovered;         // 鼠标悬停状态标记

    void Start()
    {
        // 初始化记录原始尺寸
        _originalScale = transform.localScale;
    }

    void Update()
    {
        // 根据悬停状态实时更新缩放
        transform.localScale = _isHovered ? 
            _originalScale * zoomFactor : 
            _originalScale;
    }

    // Unity鼠标进入碰撞体事件
    void OnMouseEnter()
    {
        _isHovered = true;
    }

    // Unity鼠标离开碰撞体事件
    void OnMouseExit()
    {
        _isHovered = false;
    }
}