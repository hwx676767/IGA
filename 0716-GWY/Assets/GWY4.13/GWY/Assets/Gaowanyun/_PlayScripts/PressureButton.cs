using UnityEngine;
using UnityEngine.Events;

public class PressureButton : MonoBehaviour
{
    [Header("Button Settings")]
    public Transform buttonVisual; // 按钮的视觉模型
    public Vector3 pressedPositionOffset = new Vector3(0, -0.2f, 0); // 按钮被按下的位移
    public float pressSpeed = 5f; // 按钮下陷速度

    [Header("Interaction Settings")]
    public UnityEvent onButtonPressed; // 按钮按下的事件
    public UnityEvent onButtonReleased; // 按钮释放的事件

    private Vector3 initialButtonPosition; // 按钮的初始位置
    private bool isPressed = false; // 按钮是否被按下

    void Start()
    {
        if (buttonVisual != null)
            initialButtonPosition = buttonVisual.localPosition;
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            Debug.Log("Button Pressed!");
            isPressed = true;

            // 触发按下事件
            onButtonPressed?.Invoke();
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            Debug.Log("Button Released!");
            isPressed = false;

            // 触发释放事件
            onButtonReleased?.Invoke();
        }
    }

    void Update()
    {
        // 动态调整按钮的视觉位置
        if (buttonVisual != null)
        {
            Vector3 targetPosition = isPressed
                ? initialButtonPosition + pressedPositionOffset
                : initialButtonPosition;

            buttonVisual.localPosition = Vector3.Lerp(
                buttonVisual.localPosition,
                targetPosition,
                Time.deltaTime * pressSpeed
            );
        }
    }
}
