using UnityEngine;

public class CarriageBridgeTrigger : MonoBehaviour
{
    // 这个脚本挂在马车上或宝石桥上
    // 马车：type=0，宝石桥：type=1

    public int type; // 0=马车，1=宝石桥
    private DogMovement dog;

    private void Start()
    {
        dog = FindObjectOfType<DogMovement>();
    }

    private void OnMouseDown()
    {
        if (dog == null) return;

        if (type == 0)
        {
            dog.MoveToCarriage();
        }
        else if (type == 1)
        {
            dog.MoveToBridge();
        }
    }
}