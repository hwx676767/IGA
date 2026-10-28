using UnityEngine;

public class RadiationDetectorSystem : MonoBehaviour
{
    public const string RADIATION_DETECTOR_ID = "2"; // �˷���̽����ƷID
    public const string BATTERY_TAG = "Battery"; // ����������������ǩ
    public const string BATTERY_PREFAB_NAME = "BatteryPrefab(Clone)"; // ���Ԥ��������

    private Collider playerCollider;
    private Vector3 originalColliderSize;
    private bool hasRadiationDetector = false;
    
    private float currentSizeMultiplier = 1f; // 初始为1（原始大小）

    private void Awake()
    {
        // ��ȡ��ҵ���ײ�����
        playerCollider = GetComponent<Collider>();
        if (playerCollider != null)
        {
            // ����ԭʼ��ײ���С
            if (playerCollider is BoxCollider boxCollider)
            {
                originalColliderSize = boxCollider.size;
            }
            else if (playerCollider is CapsuleCollider capsuleCollider)
            {
                originalColliderSize = new Vector3(capsuleCollider.radius, capsuleCollider.height, capsuleCollider.radius);
            }
            else if (playerCollider is SphereCollider sphereCollider)
            {
                originalColliderSize = Vector3.one * sphereCollider.radius;
            }
        }
    }

    private void Update()
    {
        // ��鱳�����Ƿ��к˷���̽����Ʒ
        CheckForRadiationDetector();

        // �����̽��������ʾ���е��
        if (hasRadiationDetector)
        {
            ShowAllBatteries();
        }
    }

    public void SetColliderSize(float multiplier)
    {
        if (playerCollider == null) return;

        // 计算新的累计倍数
        currentSizeMultiplier *= multiplier;

        // 基于原始大小应用累计倍数
        Vector3 targetSize = originalColliderSize * currentSizeMultiplier;

        // 更新主碰撞体
        if (playerCollider is BoxCollider boxCollider)
        {
            boxCollider.size = targetSize;
        }
        else if (playerCollider is CapsuleCollider capsuleCollider)
        {
            capsuleCollider.radius = targetSize.x;
            capsuleCollider.height = targetSize.y;
        }
        else if (playerCollider is SphereCollider sphereCollider)
        {
            sphereCollider.radius = targetSize.x;
        }

        // 更新子物体缩放（同样基于累计倍数）
        foreach (Transform child in playerCollider.transform)
        {
            child.localScale = Vector3.one * currentSizeMultiplier;
        }

        Debug.Log($"当前缩放倍数: {currentSizeMultiplier}x");
    }

    // ����������������ײ�嵽ԭʼ��С
    public void ResetColliderSize()
    {
        if (playerCollider == null) return;

        if (playerCollider is BoxCollider boxCollider)
        {
            boxCollider.size = originalColliderSize;
        }
        else if (playerCollider is CapsuleCollider capsuleCollider)
        {
            capsuleCollider.radius = originalColliderSize.x;
            capsuleCollider.height = originalColliderSize.y;
        }
        else if (playerCollider is SphereCollider sphereCollider)
        {
            sphereCollider.radius = originalColliderSize.x;
        }
    }


    private void CheckForRadiationDetector()
    {
        var items = InventorySystem.Instance.GetAllItems();
        bool detectorFound = items.Exists(item => item.itemID == RADIATION_DETECTOR_ID);

        if (detectorFound != hasRadiationDetector)
        {
            hasRadiationDetector = detectorFound;
            Debug.Log(hasRadiationDetector ? "�˷���̽������װ��" : "�˷���̽�������Ƴ�");
        }
    }

    private void ShowAllBatteries()
    {
        // ����1��ͨ����ǩ���ң��Ƽ���
        GameObject[] taggedBatteries = GameObject.FindGameObjectsWithTag(BATTERY_TAG);
        foreach (GameObject battery in taggedBatteries)
        {
            SetBatteryVisible(battery);
        }

        // ����2��ͨ�����Ʋ��ң����ã�
        GameObject[] allObjects = GameObject.FindObjectsOfType<GameObject>();
        foreach (GameObject obj in allObjects)
        {
            if (obj.name.Contains(BATTERY_PREFAB_NAME))
            {
                SetBatteryVisible(obj);
            }
        }
    }

    private void SetBatteryVisible(GameObject battery)
    {
        Renderer[] renderers = battery.GetComponentsInChildren<Renderer>(true);
        foreach (Renderer renderer in renderers)
        {
            renderer.enabled = true;
        }

        Collider collider = battery.GetComponent<Collider>();
        if (collider != null)
        {
            collider.enabled = true;
        }
    }

    private void OnDisable()
    {
        ResetColliderSize();
    }
}