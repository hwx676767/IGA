using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ControlAnim : MonoBehaviour
{
    public Animator anim;


    public void PlayAnimation()
    {
        anim.Play("run");
        anim.speed = 1;
    }
    
    public void StopAnimation()
    {
        anim.speed = 0;
    }
}
