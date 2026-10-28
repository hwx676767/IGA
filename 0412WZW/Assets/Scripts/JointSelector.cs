using UnityEngine;
using TMPro;

public class JointSelector : MonoBehaviour
{
    private Transform selectedJoint = null;  // 当前选中的关节
    public TextMeshProUGUI debugText;

    [Header("旋转速度")]
    public float rotationSpeed = 50f;
    public float rotate = 1f;

    void Update()
    {
        HandleSelection();
        HandleRotation();
    }

    void HandleSelection()
    {
        if (Input.GetMouseButtonDown(1))
        {
            Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
            RaycastHit hit;

            if (Physics.Raycast(ray, out hit))
            {
                Transform hitTransform = hit.transform;
                if (hitTransform != null)
                {
                    selectedJoint = hitTransform;
                    debugText.text = "Selected:" + selectedJoint.name;
                    Debug.Log("Selected:" + selectedJoint.name);
                }
            }
        }
    }

    void HandleRotation()
    {
        if (selectedJoint == null)
            return;

        float rotateX = 0f;
        float rotateY = 0f;
        float rotateZ = 0f;

        // use keyboard
        if (Input.GetKey(KeyCode.Q)) rotateX = rotate;
        if (Input.GetKey(KeyCode.A)) rotateX = -rotate;

        if (Input.GetKey(KeyCode.W)) rotateY = rotate;
        if (Input.GetKey(KeyCode.S)) rotateY = -rotate;

        if (Input.GetKey(KeyCode.E)) rotateZ = rotate;
        if (Input.GetKey(KeyCode.D)) rotateZ = -rotate;

        Vector3 rotation = new Vector3(rotateX, rotateY, rotateZ) * rotationSpeed * Time.deltaTime;
        selectedJoint.Rotate(rotation, Space.Self); // local rotate

        Debug.Log(rotation);
    }
}
