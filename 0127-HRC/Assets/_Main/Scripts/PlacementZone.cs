using UnityEngine;

public class PlacementZone : MonoBehaviour
{
    [Header("对应物品ID")]
    public string targetItemID;

    [Header("荧光提示")]
    public GameObject hintObject;

    [Header("吸附点")]
    public Transform snapPoint;

    [HideInInspector]
    public bool isOccupied = false;

    private void Start()
    {
        HideHint();
    }

    public void ShowHint()
    {
        if (hintObject != null)
            hintObject.SetActive(true);
    }

    public void HideHint()
    {
        if (hintObject != null)
            hintObject.SetActive(false);
    }
}