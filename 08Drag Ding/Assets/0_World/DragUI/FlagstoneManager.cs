using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FlagstoneManager : MonoBehaviour
{
    public Canvas canvas;

    public RectTransform UpperListParent; // ���б�����
    public RectTransform UpperListArea; // ���б�����
    public RectTransform LowerListParent; // ���б�ĸ�����
    public RectTransform LowerListArea; // ���б�����
    public RectTransform MoveLimitRt; //�ƶ���Χ

    public int maxCardsInUpperList = 5; // �����б�����������

    public GameObject flagstonePrefab;

    private List<int> upperList;
    private List<int> lowerList;

    private void Start()
    {
        for (int i = 0; i < 7; i++)
        {
            GameObject prefab = Instantiate(flagstonePrefab, LowerListParent);
            prefab.GetComponent<CardDrag>().SetUp(this);
            prefab.GetComponent<Card>().index = i;
            prefab.name = i.ToString();
        }

        UpdateInventory();
    }


    public void UpdateInventory()
    {
        upperList = new List<int>();
        lowerList = new List<int>();

        for (int i = 0; i < UpperListParent.childCount; i++)
        {
            Transform child = UpperListParent.GetChild(i);
            Card card = child.GetComponent<Card>(); // ��ȡ Card ���
            if (card != null)
            {
                upperList.Add(child.childCount);
            }
        }

        for (int i = 0; i < LowerListParent.childCount; i++)
        {
            Transform child = LowerListParent.GetChild(i);
            Card card = child.GetComponent<Card>(); // ��ȡ Card ���
            if (card != null)
            {
                lowerList.Add(child.childCount);
            }
        }
    }
}
