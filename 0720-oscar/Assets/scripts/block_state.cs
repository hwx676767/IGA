using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Tilemaps;

public class block_state : MonoBehaviour
{

    public Tilemap tile;
    public TilemapCollider2D collider;

    // Start is called before the first frame update
    void Start()
    {
        tile = GetComponent<Tilemap>();
        collider = GetComponent<TilemapCollider2D>();
    }

    // Update is called once per frame
    void Update()
    {
        collider.isTrigger = true;
    }
}
