using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerHealth : MonoBehaviour
{
    public static PlayerHealth _instance;
    
    public float health = 100f;

    private void Awake()
    {
        _instance = this;
    }

    public void TakeDamage(float damage)
    {
        health -= damage;
        //更新ui
    }
}
