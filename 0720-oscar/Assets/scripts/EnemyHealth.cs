using System.Collections;
using System.Collections.Generic;
using TexDrawLib;
using UnityEngine;

public class EnemyHealth : MonoBehaviour
{
    public float health;
    public TEXDraw healthtext;
    public ParticleSystem death_particle;
    // Start is called before the first frame update
    void Start()
    {
        healthtext = GetComponentInChildren<TEXDraw>(true).gameObject.GetComponent<TEXDraw>();
        death_particle = GetComponentInChildren<ParticleSystem>(true).gameObject.GetComponent<ParticleSystem>();
        healthtext.text = @"\xitm" + health.ToString();
    }

    // Update is called once per frame
    void Update()
    {
        //healthtext.text = @"\xitm" + health.ToString();

    }


    public void Hurt(int hurtNum)
    {
        health -= hurtNum;
        healthtext.text = @"\xitm" + health.ToString();

    }

    public void Die()
    {
        death_particle.Play();

    }
}
