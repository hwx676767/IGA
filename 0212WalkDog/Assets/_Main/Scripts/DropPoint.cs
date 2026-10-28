using UnityEngine;

public class DropPoint : MonoBehaviour
{
    private bool inArea = false;
    
    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            UIManager.Instance.ShowDropPrompt(true);
            inArea = true;
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            UIManager.Instance.ShowDropPrompt(false); 
            inArea = false;
        }
    }

    private void Update()
    {
        //写放下判断？
        
    }
}