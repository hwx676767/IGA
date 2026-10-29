using UnityEngine;

public class LampTriggert : MonoBehaviour
{
    public Light backLight; // 后台灯光组件
   

    private void OnTriggerEnter(Collider other)
    {
        // 检测主角是否触碰触发器（通过标签判断）
        if (other.CompareTag("Player"))
        {
            // 激活后台灯光
            if (backLight != null)
            {
                backLight.enabled = true;
               
            }

            
        }
    }
}