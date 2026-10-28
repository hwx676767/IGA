using UnityEngine;
using UnityEngine.EventSystems; // 需要引用这个命名空间

public class FirstPersonLook : MonoBehaviour
{
    [SerializeField]
    Transform character;
    public float sensitivity = 2;
    public float smoothing = 1.5f;

    Vector2 velocity;
    Vector2 frameVelocity;

    // 新增：控制是否可以旋转相机
    private bool canLook = true;

    void Reset()
    {
        // Get the character from the FirstPersonMovement in parents.
        character = GetComponentInParent<FirstPersonMovement>().transform;
    }

    void Start()
    {
        // Lock the mouse cursor to the game screen.
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
    }

    void Update()
    {
        // 新增：检测鼠标是否在UI上
        if (IsPointerOverUIObject())
        {
            // 如果鼠标在UI上，禁止相机旋转
            canLook = false;
            
            // 可选：当鼠标悬停在UI上时，显示并解锁鼠标
            // 但要注意，这可能不是你想要的效果，所以先注释掉
            // Cursor.lockState = CursorLockMode.None;
            // Cursor.visible = true;
            
            return; // 直接返回，不执行旋转逻辑
        }
        else
        {
            // 鼠标不在UI上，允许旋转
            canLook = true;
            
            // 可选：如果你想在离开UI后重新锁定鼠标
            // Cursor.lockState = CursorLockMode.Locked;
            // Cursor.visible = false;
        }

        // 只有允许旋转时才执行相机旋转逻辑
        if (canLook)
        {
            // Get smooth velocity.
            Vector2 mouseDelta = new Vector2(Input.GetAxisRaw("Mouse X"), Input.GetAxisRaw("Mouse Y"));
            Vector2 rawFrameVelocity = Vector2.Scale(mouseDelta, Vector2.one * sensitivity);
            frameVelocity = Vector2.Lerp(frameVelocity, rawFrameVelocity, 1 / smoothing);
            velocity += frameVelocity;
            velocity.y = Mathf.Clamp(velocity.y, -90, 90);

            // Rotate camera up-down and controller left-right from velocity.
            transform.localRotation = Quaternion.AngleAxis(-velocity.y, Vector3.right);
            character.localRotation = Quaternion.AngleAxis(velocity.x, Vector3.up);
        }
    }

    // 新增：检测鼠标是否悬停在UI元素上
    private bool IsPointerOverUIObject()
    {
        // 确保EventSystem存在
        if (EventSystem.current == null)
            return false;
            
        PointerEventData eventData = new PointerEventData(EventSystem.current);
        eventData.position = Input.mousePosition;
        var results = new System.Collections.Generic.List<RaycastResult>();
        EventSystem.current.RaycastAll(eventData, results);
        return results.Count > 0; // 如果射线打到了UI，返回true
    }

    // 新增：公共方法，供UI按钮调用，用于手动控制鼠标状态
    public void SetLookEnabled(bool enabled)
    {
        canLook = enabled;
        
        if (enabled)
        {
            // 恢复相机控制时，锁定鼠标
            Cursor.lockState = CursorLockMode.Locked;
            Cursor.visible = false;
        }
        else
        {
            // 禁用相机控制时，显示并解锁鼠标
            Cursor.lockState = CursorLockMode.None;
            Cursor.visible = true;
        }
    }
}