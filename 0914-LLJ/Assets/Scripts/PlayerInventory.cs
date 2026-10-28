using UnityEngine;

public class PlayerInventory : MonoBehaviour
{
    [Header("Hand Anchor")]
    public Transform handAnchor;         // ָ�� Player �µĿ�����
    public bool flipWithPlayer = true;   // ���泯��ת

    [Header("Current")]
    public ItemData currentItem;         // ��ǰ���е�����
    public GameObject currentHandheld;   // ��ǰ�ֳ�Сģ��ʵ��

    [Header("Throwable Defaults")]
    public bool defaultUpgraded = false;  // ��ѡ�����ᶪ�����ֳ�һ��Ĭ������״̬

    // ʰȡ��ڣ����֣�
    public bool Pick(ItemData item)
    {
        if (item == null) return false;

        Unequip();
        currentItem = item;
        Equip(item);
        return true;
    }

    public void Equip(ItemData item)
    {
        if (item.handheldPrefab != null && handAnchor != null)
        {
            currentHandheld = Instantiate(item.handheldPrefab, handAnchor);
            currentHandheld.transform.localPosition = Vector3.zero;
            currentHandheld.transform.localRotation = Quaternion.identity;
            
            var throwable = currentHandheld.GetComponent<ThrowableHandheld>();
            if (throwable != null)
            {
                throwable.Setup(playerTransform: transform, handAnchor: handAnchor, upgraded: false);
            }
        }
        
        item.OnEquip(this);
    }

    public void Unequip()
    {
        if (currentHandheld != null)
        {
            Destroy(currentHandheld);
            currentHandheld = null;
        }

        if (currentItem != null)
        {
            currentItem.OnUnequip(this);
            currentItem = null;
        }
    }

    // �����ɫ����ת�ֳֵ��ߣ������Ҫ��
    public void SyncFlip(bool facingRight)
    {
        if (!flipWithPlayer || currentHandheld == null) return;
        var s = currentHandheld.transform.localScale;
        s.x = Mathf.Abs(s.x) * (facingRight ? 1 : -1);
        currentHandheld.transform.localScale = s;
    }
}
