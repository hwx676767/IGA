using UnityEngine;

public class ClickActivator : MonoBehaviour
{
    public GameObject targetObject;        // 要激活/关闭的目标物体
    public bool toggleMode = true;          // true=点击切换激活状态，false=只激活不关闭

    void Update()
    {
        if (Input.GetMouseButtonDown(0))
        {
            Vector2 mousePos = Camera.main.ScreenToWorldPoint(Input.mousePosition);
            RaycastHit2D hit = Physics2D.Raycast(mousePos, Vector2.zero);
            
            if (hit.collider != null && hit.collider.gameObject == gameObject)
            {
                if (toggleMode)
                {
                    // 切换激活状态
                    targetObject.SetActive(!targetObject.activeSelf);
                }
                else
                {
                    // 只激活（如果已经激活就不做任何事）
                    if (!targetObject.activeSelf)
                    {
                        targetObject.SetActive(true);
                    }
                }
            }
        }
    }
}