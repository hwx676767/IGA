using UnityEngine;
using TMPro; // 引入TextMeshPro命名空间

public class TaskTrigger : MonoBehaviour
{
   
    [SerializeField] private TMP_Text infoText;

    private void Start()
    {
        if (infoText != null)
            infoText.enabled = false;
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player") && infoText != null)
        {
            infoText.enabled = true; // 只启用已设置好文本的UI组件
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("Player") && infoText != null)
        {
            infoText.enabled = false;
        }
    }
}