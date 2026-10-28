using UnityEngine;

public class SnowmanDisplay : MonoBehaviour
{
    public Transform snowmanContainer;
    
    void Start()
    {
        if (SnowmanAssembler.assembledParts != null && SnowmanAssembler.assembledParts.Length > 0)
        {
            for (int i = 0; i < SnowmanAssembler.assembledParts.Length; i++)
            {
                GameObject part = SnowmanAssembler.assembledParts[i];
                
                // 设置父物体
                part.transform.SetParent(snowmanContainer);
                
                // 恢复到原来的世界位置
                part.transform.position = SnowmanAssembler.assembledPositions[i];
                
                // 移除拖拽功能
                Destroy(part.GetComponent<DraggableItem>());
                Destroy(part.GetComponent<CanvasGroup>());
            }
            Debug.Log("雪人显示成功！共 " + SnowmanAssembler.assembledParts.Length + " 个部件");
        }
    }
}