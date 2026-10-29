using UnityEngine;

public class PlayerController : MonoBehaviour
{
    public float moveSpeed = 5f; // 移动速度，可在Inspector中调整
    private Rigidbody Rigidbody;

    private void Start()
    {
        Rigidbody = GetComponent<Rigidbody>();
    }
    void Update()
    {
        // 检测是否按下D键
            // 向右移动玩家
            Debug.Log("D");
        // this.transform.Translate(Vector3.right * moveSpeed * Time.deltaTime);
        Rigidbody.AddForce(Vector3.right * moveSpeed, ForceMode.Impulse);

    }
}