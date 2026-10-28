using UnityEngine;
using UnityEngine.AI;
using UnityEngine.EventSystems;

public class PlayerController2D : MonoBehaviour
{
    private NavMeshAgent agent;
    private SpriteRenderer spriteRenderer;

    // 设置一个可寻路区域的层级
    public LayerMask groundLayer; // 在Inspector中设置该层级

    private void Start()
    {
        // 获取NavMeshAgent组件和SpriteRenderer组件
        agent = GetComponent<NavMeshAgent>();
        spriteRenderer = GetComponentInChildren<SpriteRenderer>();

        // 禁用NavMeshAgent的旋转以适应2D环境
        agent.updateRotation = false;
        agent.updateUpAxis = false;
    }

    private void Update()
    {
        // 检测鼠标左键点击
        if (Input.GetMouseButtonDown(0))
        {

            // 检查是否点击在UI上
            if (EventSystem.current.IsPointerOverGameObject())
            {
                return; // 点击UI时返回，不触发寻路
            }

            // 将鼠标点击位置转换为世界坐标
            Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
            RaycastHit hit;

            // 进行射线检测
            if (Physics.Raycast(ray, out hit, Mathf.Infinity))
            {
                // 输出点击到的物体名称
                Debug.Log("Clicked on: " + hit.collider.gameObject.name);

                // 判断是否点击了地面
                if (hit.collider.gameObject.layer == LayerMask.NameToLayer("Ground"))
                {
                    agent.SetDestination(hit.point);

                    // 判断点击位置在玩家的左侧还是右侧，并更新flipX
                    if (hit.point.x < transform.position.x)
                    {
                        spriteRenderer.flipX = true; // 翻转朝向左侧
                    }
                    else
                    {
                        spriteRenderer.flipX = false; // 朝向右侧
                    }
                }
            }

        }

        // 锁定Y轴旋转
        transform.rotation = Quaternion.Euler(0, 0, 0);
    }
}
