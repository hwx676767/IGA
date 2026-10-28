using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Enemy : MonoBehaviour
{
    public bool playerAttacked = false;   //检测是不是被攻击了
     
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    private void OnCollisionEnter2D(Collision2D other)
    {
        if (other.gameObject.CompareTag("Player") && !playerAttacked)
        {
            Debug.Log(other.gameObject.name);
            //扣玩家的血
            PlayerHealth._instance.TakeDamage(10);
        }
    }
}
