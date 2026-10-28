using UnityEngine;

public class DrawOnPlane : MonoBehaviour
{
    private LineRenderer currentLine;
    private bool isDrawing = false;
    private bool drawMode = false;

    [Header("绘画设置")]
    public GameObject targetPlane; // 绘画目标平面
    public float minPointDistance = 0.05f;
    
    [Header("线条设置")]
    public Material lineMaterial;
    public Color lineColor = Color.red;
    public float lineWidth = 0.1f;
    
    /*
    [Header("跟随物体")]
    public GameObject followObject; // 跟随鼠标的物体（你的手模型）
    public Vector3 positionOffset = new Vector3(0, 0.02f, 0); // 三维位置偏移量
    */
    
    [Header("交互设置")]
    public KeyCode toggleDrawModeKey = KeyCode.Alpha3; // 按3切换绘画模式
    public KeyCode clearDrawingKey = KeyCode.Alpha0; // 清空绘制
    public KeyCode undoKey = KeyCode.Z; // 撤销

    void Start()
    {
        drawMode = false;
        
    }

    void Update()
    {
        // 检测按下3键，切换绘画模式
        if (Input.GetKeyDown(toggleDrawModeKey))
        {
            ToggleDrawMode();
        }
        
        // 只有在绘画模式下才能绘制
        if (drawMode)
        {
            HandleDrawing();
            //UpdateFollowObject(); // 更新跟随物体位置
        }
        
        // 清空绘制（任何时候都可用）
        if (Input.GetKeyDown(clearDrawingKey))
        {
            ClearAllDrawings();
        }
        
        // 撤销（Ctrl+Z）
        if (Input.GetKeyDown(undoKey) && (Input.GetKey(KeyCode.LeftControl) || Input.GetKey(KeyCode.RightControl)))
        {
            UndoLastLine();
        }
    }

    // 切换绘画模式
    private void ToggleDrawMode()
    {
        drawMode = !drawMode;
        
        if (drawMode)
        {
            EnterDrawMode();
        }
        else
        {
            ExitDrawMode();
        }
    }

    // 进入绘画模式
    private void EnterDrawMode()
    {
        Debug.Log("进入绘画模式");
        
        // 停止当前绘画
        isDrawing = false;
        currentLine = null;
        
        /*
        // 显示跟随物体
        if (followObject != null)
        {
            followObject.SetActive(true);
        }*/
        
        // 显示鼠标，解锁鼠标
        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;
    }

    // 退出绘画模式
    private void ExitDrawMode()
    {
        Debug.Log("退出绘画模式");
        
        // 停止当前绘画
        isDrawing = false;
        currentLine = null;
        
        // 隐藏鼠标，锁定鼠标
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
        
        // 注意：不隐藏跟随物体，让它停留在最后的位置
    }

    /*
    // 更新跟随物体位置
    private void UpdateFollowObject()
    {
        if (followObject == null || targetPlane == null) return;
        
        if (GetPointOnPlane(out Vector3 hitPoint))
        {
            // 计算物体位置：击中点 + 平面法线方向 + 自定义偏移
            Vector3 targetPos = hitPoint 
                               + targetPlane.transform.up * positionOffset.y  // Y轴偏移（垂直平面）
                               + targetPlane.transform.right * positionOffset.x   // X轴偏移（沿平面左右）
                               + targetPlane.transform.forward * positionOffset.z; // Z轴偏移（沿平面前后）
            
            // 设置物体位置
            followObject.transform.position = targetPos;
            
            // 可选：让物体面向摄像机或保持固定朝向
            // followObject.transform.LookAt(Camera.main.transform);
        }
    }*/

    // 处理绘画输入
    private void HandleDrawing()
    {
        // 左键按下开始绘制
        if (Input.GetMouseButtonDown(0))
        {
            if (GetPointOnPlane(out Vector3 hitPoint))
            {
                StartNewLine(hitPoint);
            }
        }
        // 左键按住持续绘制
        else if (Input.GetMouseButton(0) && isDrawing && currentLine != null)
        {
            if (GetPointOnPlane(out Vector3 hitPoint))
            {
                ContinueDrawing(hitPoint);
            }
        }
        // 左键松开结束绘制
        else if (Input.GetMouseButtonUp(0) && isDrawing)
        {
            StopDrawing();
        }
    }

    // 获取平面上的点
    private bool GetPointOnPlane(out Vector3 point)
    {
        point = Vector3.zero;
        
        if (targetPlane == null) return false;

        Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
        RaycastHit hit;
        
        if (Physics.Raycast(ray, out hit))
        {
            if (hit.collider.gameObject == targetPlane)
            {
                point = hit.point;
                return true;
            }
        }
        return false;
    }

    // 开始新线条
    private void StartNewLine(Vector3 startPoint)
    {
        isDrawing = true;

        // 创建线条物体，作为平面的子物体
        GameObject lineObj = new GameObject($"Line_{System.DateTime.Now.Ticks}");
        lineObj.transform.SetParent(targetPlane.transform);
        
        // 计算相对于平面的位置，将物体放在起点
        Vector3 localPos = targetPlane.transform.InverseTransformPoint(startPoint);
        lineObj.transform.localPosition = localPos;
        
        // 添加LineRenderer
        currentLine = lineObj.AddComponent<LineRenderer>();
        
        // 配置LineRenderer
        ConfigureLineRenderer(currentLine);
        
        // 第一个点
        currentLine.positionCount = 1;
        currentLine.SetPosition(0, Vector3.zero);
    }

    // 配置LineRenderer
    private void ConfigureLineRenderer(LineRenderer line)
    {
        if (lineMaterial != null)
        {
            line.material = lineMaterial;
        }
        else
        {
            line.material = new Material(Shader.Find("Sprites/Default"));
        }
        
        line.startWidth = lineWidth;
        line.endWidth = lineWidth;
        line.startColor = lineColor;
        line.endColor = lineColor;
        line.useWorldSpace = false;
        line.numCapVertices = 5;
        line.numCornerVertices = 5;
        line.alignment = LineAlignment.View;
    }

    // 继续绘制
    private void ContinueDrawing(Vector3 newPoint)
    {
        if (currentLine == null) return;

        Vector3 localPoint = currentLine.transform.InverseTransformPoint(newPoint);
        Vector3 lastPoint = currentLine.GetPosition(currentLine.positionCount - 1);
        
        if (Vector3.Distance(lastPoint, localPoint) > minPointDistance)
        {
            currentLine.positionCount++;
            currentLine.SetPosition(currentLine.positionCount - 1, localPoint);
        }
    }

    // 停止绘制
    private void StopDrawing()
    {
        isDrawing = false;
        currentLine = null;
    }

    // 清空所有绘制
    private void ClearAllDrawings()
    {
        for (int i = targetPlane.transform.childCount - 1; i >= 0; i--)
        {
            Transform child = targetPlane.transform.GetChild(i);
            if (child.name.StartsWith("Line_"))
            {
                Destroy(child.gameObject);
            }
        }
        
        isDrawing = false;
        currentLine = null;
        Debug.Log("清空所有绘制");
    }

    // 撤销上一条线
    private void UndoLastLine()
    {
        for (int i = targetPlane.transform.childCount - 1; i >= 0; i--)
        {
            Transform child = targetPlane.transform.GetChild(i);
            if (child.name.StartsWith("Line_"))
            {
                Destroy(child.gameObject);
                break;
            }
        }
        
        Debug.Log("撤销上一条线");
    }
}