using System;
using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class Collectable : MonoBehaviour
{
    public CollectManager collectManager;
    public int count = 2;
    private void Start()
    {
        collectManager = FindObjectOfType<CollectManager>();
    }

    private void OnTriggerEnter2D(Collider2D other)
    {
        if (other.CompareTag("Player"))
        {
            Debug.Log("Collected");
            //记录收集数据
            //collectManager.count++;
            //更新ui
            //collectManager.UpdateUI();
            
            collectManager.Collect(count);
            //效果
            
            //消失
            Destroy(gameObject);
        }
    }
}
