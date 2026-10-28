using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Tilemaps;

public class script_of_0 : MonoBehaviour
{
    public Tilemap tilemap;
    public CompositeCollider2D collider;
    // Start is called before the first frame update
    void Start()
    {
        tilemap = GetComponent<Tilemap>();
        collider = GetComponent<CompositeCollider2D>();
    }

    // Update is called once per frame
    void Update()
    {

    }
    public void On()
    {
        Color color = tilemap.color;
        color.a = 1f;
        tilemap.color = color;
        if (collider != null)
        {
            collider.isTrigger = false;
        }
    }
    public void Off()
    {
        Color color = tilemap.color;
        color.a = 61f / 255f;
        tilemap.color = color;
        if(collider != null)
        {
            collider.isTrigger = true;
        }
    }
    public void toggleSwitch()
    {
        if (tilemap.color.a > 0.5f)
        {
            Off();
        }
        else
        {
            On();
        }
    }
}
