using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TriggerTest : MonoBehaviour
{


    private ClothesDryTimer clothesDryTimer;


    // Start is called before the first frame update
    void Start()
    {
        clothesDryTimer = GameObject.Find("ClothesDryTriggerArea").GetComponent<ClothesDryTimer>();
    }

    // Update is called once per frame
    void Update()
    {

        if (Input.GetMouseButtonDown(0))
        {
            // 调用收衣服方法
            clothesDryTimer.CollectClothes();
        }
        
    }
}
