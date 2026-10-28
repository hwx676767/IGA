using UnityEngine;

public class ItemDebug : MonoBehaviour
{
    public string itemType;
    private int layerNumber;

    public ItemDebug Init(int layer)
    {
        layerNumber = layer;
        return this;
    }

    void OnDrawGizmosSelected()
    {
        Gizmos.color = layerNumber == 0 ? Color.green : 
            layerNumber > 0 ? Color.blue : Color.red;
        Gizmos.DrawWireCube(transform.position, Vector3.one * 2f);
        GUIStyle style = new GUIStyle();
        style.normal.textColor = Color.white;
        //UnityEditor.Handles.Label(transform.position, $"Layer:{layerNumber}", style);
    }
    
    void OnDestroy() {
        // 物品被销毁时自动从管理器移除
        if (LevelDataManager.Instance != null) {
            LevelDataManager.Instance.RemoveItem(layerNumber, gameObject);
        }
    }
}