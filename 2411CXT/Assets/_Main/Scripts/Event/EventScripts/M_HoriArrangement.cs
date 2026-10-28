using DG.Tweening;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class M_HoriArrangement : Singleton<M_HoriArrangement>
{
    public GameObject pre_Pivot;
    public GameObject pre_Node;
    public int count_Pivot;

    private Transform parent_Pivot;
    private Transform parent_Node;

    private Transform[] trans_Pivots;
    private List<Transform> trans_Nodes = new List<Transform>();

    [HideInInspector] public RectTransform rect_Panel;

    void Start()
    {
        rect_Panel = GetComponent<RectTransform>();
        parent_Pivot = transform.Find("Pivots");
        parent_Node = transform.Find("Nodes");
        trans_Pivots = new Transform[count_Pivot];

        for (int i = 0; i < count_Pivot; i++)
        {
            trans_Pivots[i] = Instantiate(pre_Pivot, parent_Pivot).transform;
        }
    }

    public void InsertNewNode_Prepare(Transform targetTrans)
    {
        int toInsertIndex = 0;

        if (parent_Node.childCount == 0)
        {
            if (!trans_Nodes.Contains(targetTrans)) trans_Nodes.Add(targetTrans);
            toInsertIndex = 0;
        }
        else
        {
            float nearestDistance = 99999;
            for (int i = 0; i < trans_Pivots.Length; i++)
            {
                float tempDistance = Mathf.Abs(trans_Pivots[i].position.y - targetTrans.position.y);
                //Debug.Log(
                //    i + "  : " + trans_Pivots[i].position + 
                //    "        Current: " + targetTrans.position +
                //    "        Temp: " +tempDistance + 
                //    "        Near: "+ nearestDistance);
                if (tempDistance < nearestDistance)
                {
                    toInsertIndex = i;
                    nearestDistance = tempDistance;
                }
            }
            //Debug.Log("Nearest Index: " + toInsertIndex);
            if (toInsertIndex < trans_Nodes.Count)
            {
                if (!trans_Nodes.Contains(targetTrans)) trans_Nodes.Insert(toInsertIndex, targetTrans);
            }
            else
            {
                if (!trans_Nodes.Contains(targetTrans)) trans_Nodes.Add(targetTrans);
                toInsertIndex = trans_Nodes.Count - 1;
            }
        }

        //Debug.Log("Final Index: " + toInsertIndex);

        if (targetTrans != trans_Nodes[toInsertIndex])
        {
            trans_Nodes.Remove(targetTrans);
            trans_Nodes.Insert(toInsertIndex, targetTrans);
        }

        for (int i = 0; i < trans_Nodes.Count; i++)
        {
            if (trans_Nodes[i]!=targetTrans)
            {
                trans_Nodes[i].DOMove(trans_Pivots[i].position, 0.2f);
            }
        }
    }

    public void InsertNewNode_Finish(Transform targetTrans)
    {
        targetTrans.SetParent(parent_Node);

        for (int i = 0; i < trans_Nodes.Count; i++)
        {
            trans_Nodes[i].DOMove(trans_Pivots[i].position, 0.2f);
        }
    }
}
