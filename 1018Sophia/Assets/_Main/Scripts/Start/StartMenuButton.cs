using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement; // ✅ 场景加载所需

public class StartMenuButton : MonoBehaviour
{
    [Header("三个选择父物体 (每个带Button)")]
    public GameObject[] optionParents;   // 三个父物体（需带Button）

    [Header("背景图片")]
    public Image backgroundImage;        // 背景 Image
    public Sprite defaultBackground;     // 默认背景
    public Sprite[] optionBackgrounds;   // 三个选项的背景图

    [Header("按钮与提示UI")]
    public GameObject startButton;       // Start 按钮
    public GameObject tipImage;          // 提示图片

    [Header("动画参数")]
    public float normalScale = 1f;
    public float selectedScale = 1.2f;
    public float scaleSpeed = 10f;
    public float dimV = 0.5f;        // 明暗度

    private int selectedIndex = -1;      // 当前选中的选项索引
    private Vector3[] originalScales;    // 存储父物体原始缩放
    private Color[][] originalColors;    // 存储每个父物体子物体Image原始颜色

    // ✅ 对应的三个游戏场景名称（可在Inspector里指定）
    [Header("场景名称对应（顺序与选项一致）")]
    public string[] sceneNames; // 例如：["Game_Level1", "Game_Level2", "Game_Level3"]

    void Start()
    {
        int n = optionParents.Length;
        originalScales = new Vector3[n];
        originalColors = new Color[n][];

        for (int i = 0; i < n; i++)
        {
            originalScales[i] = optionParents[i].transform.localScale;

            // 初始化父物体 Image 关闭
            Image parentImg = optionParents[i].GetComponent<Image>();
            if (parentImg != null)
                parentImg.enabled = false;

            // 保存子物体Image原始颜色
            Image[] childImages = optionParents[i].GetComponentsInChildren<Image>();
            originalColors[i] = new Color[childImages.Length];
            for (int j = 0; j < childImages.Length; j++)
                originalColors[i][j] = childImages[j].color;

            // 添加点击事件
            int index = i;
            Button btn = optionParents[i].GetComponent<Button>();
            if (btn != null)
                btn.onClick.AddListener(() => OnOptionClick(index));
        }

        // ✅ 绑定 Start 按钮事件
        Button startBtn = startButton.GetComponent<Button>();
        if (startBtn != null)
            startBtn.onClick.AddListener(OnStartButtonClick);

        // 初始化UI状态
        backgroundImage.sprite = defaultBackground;
        startButton.SetActive(false);
        tipImage.SetActive(true);
    }

    void Update()
    {
        // 平滑缩放动画
        for (int i = 0; i < optionParents.Length; i++)
        {
            float targetScale = (i == selectedIndex) ? selectedScale : normalScale;
            optionParents[i].transform.localScale = Vector3.Lerp(
                optionParents[i].transform.localScale,
                originalScales[i] * targetScale,
                Time.deltaTime * scaleSpeed
            );
        }
    }

    void OnOptionClick(int index)
    {
        // 再次点击同一个按钮 → 恢复默认状态
        if (selectedIndex == index)
        {
            DeselectAll();
            return;
        }

        // 点击新选项
        selectedIndex = index;

        for (int i = 0; i < optionParents.Length; i++)
        {
            Image parentImg = optionParents[i].GetComponent<Image>();
            if (parentImg != null)
                parentImg.enabled = (i == selectedIndex);

            // 子物体 Image 明度控制
            Image[] childImages = optionParents[i].GetComponentsInChildren<Image>();
            for (int j = 0; j < childImages.Length; j++)
            {
                if (i == selectedIndex)
                {
                    // 当前选中，恢复原始颜色
                    childImages[j].color = originalColors[i][j];
                }
                else
                {
                    // 非选中，只调整明暗度(V)
                    childImages[j].color = SetValue(originalColors[i][j], dimV);
                }
            }
        }

        // 切换背景
        if (backgroundImage != null && index < optionBackgrounds.Length)
            backgroundImage.sprite = optionBackgrounds[index];

        // 显示 Start 按钮、隐藏提示
        startButton.SetActive(true);
        tipImage.SetActive(false);
    }

    // ✅ Start 按钮点击逻辑
    void OnStartButtonClick()
    {
        if (selectedIndex >= 0 && selectedIndex < sceneNames.Length)
        {
            string targetScene = sceneNames[selectedIndex];
            Debug.Log($"加载场景：{targetScene}");
            SceneManager.LoadScene(targetScene);
        }
        else
        {
            Debug.LogWarning("未选择有效选项或未设置对应场景名称！");
        }
    }

    // 工具方法：只修改明暗度(V)
    Color SetValue(Color color, float value)
    {
        float h, s, v;
        Color.RGBToHSV(color, out h, out s, out v);
        v = Mathf.Clamp01(value); // 明暗度 0~1
        Color newColor = Color.HSVToRGB(h, s, v);
        newColor.a = color.a; // 保持透明度
        return newColor;
    }

    void DeselectAll()
    {
        selectedIndex = -1;

        for (int i = 0; i < optionParents.Length; i++)
        {
            // 关闭父物体 Image
            Image parentImg = optionParents[i].GetComponent<Image>();
            if (parentImg != null)
                parentImg.enabled = false;

            // 恢复子物体 Image 原始颜色
            Image[] childImages = optionParents[i].GetComponentsInChildren<Image>();
            for (int j = 0; j < childImages.Length; j++)
                childImages[j].color = originalColors[i][j];
        }

        // 恢复背景
        if (backgroundImage != null)
            backgroundImage.sprite = defaultBackground;

        startButton.SetActive(false);
        tipImage.SetActive(true);
    }
}
