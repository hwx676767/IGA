using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class move : MonoBehaviour
{
    [SerializeField] private float moveSpeed = 5f;       //全局变量
    [SerializeField]private Rigidbody rb;
    
    // Start is called before the first frame update
    void Start()
    {
        rb = GetComponent<Rigidbody>();
        
    }

    // Update is called once per frame
    void Update()
    {
        float horizontal = Input.GetAxis("Horizontal");    // -1，1
        float vertical = Input.GetAxis("Vertical");
        /*
        Vector3 movement = new Vector3(horizontal, 0, vertical);
        transform.position += movement * moveSpeed * Time.deltaTime;
        //transform.position = transform.position + movement * moveSpeed * Time.deltaTime;
        
        //transform.Translate(horizontal * moveSpeed * Time.deltaTime, 0, vertical * moveSpeed * Time.deltaTime);
        */

        
        /*
        if (rb != null)
        {
            Vector3 movement = new Vector3(horizontal, 0, vertical)* moveSpeed;
            rb.velocity = new Vector3(movement.x, rb.velocity.y , movement.z); 
        }
        else
        {
            Debug.LogWarning("No rigidbody attached");
        }*/
        
        Vector3 movement = new Vector3(horizontal, 0, vertical)* moveSpeed;
        rb.AddForce(movement, ForceMode.Impulse);
        
        Anim("jump",5f);
    }

    public void Anim(string name, float speed)
    {
        if (name == "sdasfas")
        {
            float movespeed = speed;
        }
    }
}
