using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Tilemaps;

public class End_enemy : MonoBehaviour
{

    public script_of_0 tilemap1;
    public script_of_0 tilemap2;
    public bool isHit = false;
    private bool hasSwitched = false;
    // Start is called before the first frame update
    void Start()
    {
        tilemap1 = GameObject.Find("Grid/0s").GetComponent<script_of_0>();
        tilemap2 = GameObject.Find("Grid/0 but is transparent").GetComponent<script_of_0>();
        if (tilemap1 == null || tilemap2 == null)
        {
            Debug.LogError("未能找到指定的脚本组件！");
        }
    }

    // Update is called once per frame
    void Update()
    {
        if (isHit && !hasSwitched)
        {
            tilemap1.toggleSwitch();
            tilemap2.toggleSwitch();
            hasSwitched = true;

        }
    }
    
}
