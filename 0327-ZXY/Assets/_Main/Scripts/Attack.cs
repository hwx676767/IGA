using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Attack : MonoBehaviour
{
    public GameObject fxPrefab;
    public AudioSource audioSource;
    
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    private void OnTriggerEnter2D(Collider2D other)
    {
        if (other.CompareTag("Enemy"))
        {
            Debug.Log(other.name);
            
            //2.播放特效 - 生成特效 ，再删除特效 
            GameObject fx =  Instantiate(fxPrefab, other.transform.position, Quaternion.identity);
            Destroy(fx,0.5f);
            //1.destory
            Destroy(other.gameObject);
            
              
            //加音效...
            audioSource.Play();
        }
    }
}
