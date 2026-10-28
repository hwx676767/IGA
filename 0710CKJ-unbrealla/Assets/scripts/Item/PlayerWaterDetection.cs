using UnityEngine;

public class PlayerWaterDetection : MonoBehaviour
{
    [Header("water layer settings")]
    [SerializeField] private LayerMask waterLayer;
    
    void OnTriggerEnter2D(Collider2D other)
    {
        if (IsInLayer(other.gameObject, waterLayer))
        {
            EnterWater();
        }
    }
    
    void OnTriggerExit2D(Collider2D other)
    {
        if (IsInLayer(other.gameObject, waterLayer))
        {
            ExitWater();
        }
    }
    
    bool IsInLayer(GameObject obj, LayerMask layerMask)
    {
        return (layerMask.value & (1 << obj.layer)) > 0;
    }
    
    void EnterWater()
    {
        Debug.Log("玩家进入水中！");
        GetComponent<Rigidbody2D>().gravityScale = 0.3f;
        GetComponentInChildren<Animator>().SetBool("inwater",true);
    }
    
    void ExitWater()
    {
        Debug.Log("玩家离开水中！");
        GetComponent<Rigidbody2D>().gravityScale = 1f;
    }
}