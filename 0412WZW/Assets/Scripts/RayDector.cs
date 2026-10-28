using TMPro;
using UnityEngine;

public class RayDector : MonoBehaviour
{
    
    public TextMeshProUGUI debugText;
    public GameObject textPrefab;
    public Transform textParent;
    void Update()
    {
        if (Input.GetMouseButtonDown(1))
        {
            Debug.Log("mouse down");
            Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
            RaycastHit hit;

            if (Physics.Raycast(ray, out hit))
            {
                Transform hitTransform = hit.transform;
                Debug.Log(hitTransform.position);
                if (hitTransform != null)
                {
                    Debug.Log(hitTransform.gameObject.name);
                    debugText.text = hitTransform.gameObject.name;
                    
                    //生成一个字体prefab，并且是在指定父物体下面
                    GameObject textObject =  Instantiate(textPrefab, textParent);
                    //字体的text = 点击到的名字
                    textObject.GetComponent<TextMeshProUGUI>().text = hitTransform.gameObject.name;
                }
            }
        }
    }

}
