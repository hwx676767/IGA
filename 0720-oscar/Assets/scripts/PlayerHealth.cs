using System.Collections;
using System.Collections.Generic;
using TMPro;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.UI;
using static Unity.Burst.Intrinsics.X86.Avx;

public class PlayerHealth : MonoBehaviour
{
    public int health;
    public Text life;

    void Start()
    {
        UpdateHealthUI();
    }

    void Update()
    {
        if (health <= 0)
        {
            life.text = "你狗带了";
            Destroy(gameObject);
        }
    }

    // 公共方法，供敌人调用以造成伤害
    public void TakeDamage(int damage)
    {
        if (damage < 0) return; // 防止负数伤害
        health -= damage;
        UpdateHealthUI();
    }

    // 更新血量UI
    private void UpdateHealthUI()
    {
        life.text = "Health = " + health.ToString();
    }

    // 移除原来的碰撞掉血逻辑
    // private void OnCollisionEnter2D(Collision2D collision)
    // {
    //     if (collision.gameObject.CompareTag("Enemy"))
    //     {
    //         health--;
    //         life.text = "Health = " + health.ToString();
    //     }
    // }
}
