using UnityEngine;

public class RenderToObject : MonoBehaviour
{
    public GameObject wall;
    public GameObject sphere;
    public GameObject floor;

    private RenderTexture renderTexture;

    void Start()
    {
        // 创建RenderTexture
        renderTexture = new RenderTexture(1024, 1024, 24);
        Camera.main.targetTexture = renderTexture;

        // 创建材质并设置RenderTexture为材质的主纹理
        Material material = new Material(Shader.Find("Unlit/Texture"));
        material.mainTexture = renderTexture;

        // 应用材质到物体
        wall.GetComponent<Renderer>().material = material;
        sphere.GetComponent<Renderer>().material = material;
        floor.GetComponent<Renderer>().material = material;

        // 可选：调整摄像机视角（确保渲染物体内容）
        Camera.main.transform.position = new Vector3(0, 10, 0);
        Camera.main.transform.LookAt(Vector3.zero);
    }

    void Update()
    {
        // 可选：手动触发渲染
        Camera.main.Render();
    }
}
