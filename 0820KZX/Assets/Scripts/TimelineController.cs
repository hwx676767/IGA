using UnityEngine;
using UnityEngine.Playables;

public class TimelineController : MonoBehaviour
{
    public PlayableDirector[] directors; 

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Alpha1)) 
        {
            StopAll();
            directors[0].Play();
        }
        if (Input.GetKeyDown(KeyCode.Alpha2)) 
        {
            StopAll();
            directors[1].Play();
        }
        if (Input.GetKeyDown(KeyCode.Alpha3)) 
        {
            StopAll();
            directors[2].Play();
        }
        if (Input.GetKeyDown(KeyCode.Alpha4)) 
        {
            StopAll();
            directors[3].Play();
        }
        if (Input.GetKeyDown(KeyCode.Alpha5)) 
        {
            StopAll();
            directors[4].Play();
        }
        if (Input.GetKeyDown(KeyCode.Alpha6)) 
        {
            StopAll();
            directors[5].Play();
        }
    }

    void StopAll()
    {
        foreach (var dir in directors)
        {
            dir.Stop(); 
        }
    }
}