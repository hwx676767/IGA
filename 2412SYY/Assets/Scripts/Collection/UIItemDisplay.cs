using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class UIItemDisplay : MonoBehaviour
{
    public List<Transform> uiPositions; // ÿ����Ʒ��Ӧ��UIλ��
    public List<TextMeshProUGUI> uiCounters; // ÿ����Ʒ��Ӧ��������ʾ
    public GameObject objectToActivate; // 下一个任务提示面板
    
    [SerializeField] private List<int> itemCounts; // �洢ÿ����Ʒ�������������� Inspector �и�ֵ

    private void Start()
    {
        // ȷ�� itemCounts �Ĵ�С�� uiPositions ƥ��
        if (itemCounts.Count != uiPositions.Count)
        {
            Debug.LogError("itemCounts �б��Ĵ�С������ uiPositions �б���ͬ��");
            return;
        }

        // ��ʼ��UI��ʾ
        for (int i = 0; i < uiPositions.Count; i++)
        {
            uiCounters[i].text = itemCounts[i].ToString();
        }
    }

    // ��ȡ��Ʒ��UIλ��
    public Vector3 GetPosition(int itemID)
    {
        return uiPositions[itemID].position;
    }

    // ������Ʒ����
    public void IncreaseItemCount(int itemID)
    {
        itemCounts[itemID]++; // ��������
        uiCounters[itemID].text = itemCounts[itemID].ToString(); // ����UI��ʾ
    }

    // ������Ʒ����
    public void DecreaseItemCount(int itemID)
    {
        if (itemCounts[itemID] > 0)
        {
            itemCounts[itemID]--;
            uiCounters[itemID].text = itemCounts[itemID].ToString();
        }

        CheckAllItemsCollected();
    }

    // ����Ƿ�������Ʒ������Ϊ0
    private void CheckAllItemsCollected()
    {
        foreach (int count in itemCounts)
        {
            if (count > 0)
            {
                return; // �������Ʒ�������� 0��ֱ�ӷ���
            }
        }

        //拾取完成
        gameObject.SetActive(false);
        //激活下一个任务
        ActiveAnother();
    }
    
    void ActiveAnother()
        {
            // 激活
            if (objectToActivate != null)
            {
                objectToActivate.SetActive(true);
            }
        }
}
