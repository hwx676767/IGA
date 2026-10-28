using UnityEngine;
using TMPro;

public class RotateModle : MonoBehaviour
{
    public TextMeshProUGUI debugText;
    private Transform _hitTransform;
    public float rotationSpeed = 100f; // 可调旋转速度

    void Update()
    {
        // 检测右键点击以选择物体
        if (Input.GetMouseButtonDown(1))
        {
            Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
            RaycastHit hit;

            if (Physics.Raycast(ray, out hit))
            {
                _hitTransform = hit.transform;
                Debug.Log("Selected: " + _hitTransform.name + " | Position: " + _hitTransform.position);

                if (_hitTransform != null && debugText != null)
                {
                    debugText.text = "Selected: " + _hitTransform.name;
                }
            }
        }

        // 每帧调用 Rotate 以实现持续旋转
        Rotate();
    }

    private void Rotate()
    {
        if (_hitTransform == null) return;

        float rotateX = 0f;
        float rotateY = 0f;
        float rotateZ = 0f;

        // 设置旋转（分配到正确的轴）
        if (Input.GetKey(KeyCode.Q)) rotateX = 1f;  // 绕 X 轴正向旋转
        if (Input.GetKey(KeyCode.A)) rotateX = -1f; // 绕 X 轴反向旋转

        if (Input.GetKey(KeyCode.W)) rotateY = 1f;  // 绕 Y 轴正向旋转
        if (Input.GetKey(KeyCode.S)) rotateY = -1f; // 绕 Y 轴反向旋转

        if (Input.GetKey(KeyCode.E)) rotateZ = 1f;  // 绕 Z 轴正向旋转
        if (Input.GetKey(KeyCode.D)) rotateZ = -1f; // 绕 Z 轴反向旋转

        // 应用旋转
        Vector3 rotateVector = new Vector3(rotateX, rotateY, rotateZ) * rotationSpeed * Time.deltaTime;
        _hitTransform.Rotate(rotateVector, Space.Self);

        // 更新调试文本
        if (debugText != null)
        {
            debugText.text = "Rotation: " + rotateVector.ToString("F2") + "\nEuler: " + _hitTransform.rotation.eulerAngles.ToString("F2");
        }

        // 调试当前旋转
        Debug.Log("Applied Rotation: " + _hitTransform.rotation.eulerAngles);
    }
}