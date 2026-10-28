using System.Collections.Generic;
using UnityEngine;

public class UIListParser : MonoBehaviour
{
    // 遍历 UI 列表，获取子物体名称并存储到 List<string>
    public List<string> GetUIChildNames(GameObject uiListParent)
    {
        List<string> childNames = new List<string>();

        // 遍历 uiListParent 下的所有直接子物体
        foreach (Transform child in uiListParent.transform)
        {
            // 获取子物体名称并添加到列表
            string childName = child.gameObject.name;
            childNames.Add(childName);
            Debug.Log($"Added UI child name: {childName}");
        }

        return childNames;
    }
}