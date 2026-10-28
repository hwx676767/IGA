using UnityEngine;
using UnityEngine.UI;

public class CharacterUIManager : MonoBehaviour
{
    public static CharacterUIManager Instance;

    [Header("UI")]
    public Image avatarImage;
    public Text nameText;
    public Text stressText;
    public Text loyaltyText;
    public Text performanceText;

    [Header("等级")]
    public GameObject levelParent;

    [Header("按钮")]
    public Button button1;
    public Button button2;

    private GameObject[] levelObjects;
    private CharacterData currentData;

    private void Awake()
    {
        Instance = this;

        // 初始化等级
        levelObjects = new GameObject[levelParent.transform.childCount];
        for (int i = 0; i < levelParent.transform.childCount; i++)
        {
            levelObjects[i] = levelParent.transform.GetChild(i).gameObject;
        }

        // 按钮
        if (button1 != null)
            button1.onClick.AddListener(OnButton1Click);

        if (button2 != null)
            button2.onClick.AddListener(OnButton2Click);
    }

    public void UpdateUI(CharacterData data)
    {
        if (data == null) return;

        currentData = data;

        avatarImage.sprite = data.avatar;
        nameText.text = data.characterName;
        stressText.text = data.stressValue + "/100";
        loyaltyText.text = data.loyaltyValue + "/100";
        performanceText.text = data.performance + "%";

        UpdateLevelDisplay(data.level);

        UpdateStressColor(data);
    }

    private void UpdateStressColor(CharacterData data)
    {
        if (data.characterMaterial == null)
        {
            Debug.LogWarning("? 没有材质");
            return;
        }

        int stress = data.stressValue;

        float t = (stress <= 40) ? 0f : Mathf.InverseLerp(40, 100, stress);

        Color color = Color.Lerp(Color.white, Color.red, t);

        // ? URP Lit
        data.characterMaterial.SetColor("_BaseColor", color);
    }

    private void OnButton1Click()
    {
        if (currentData == null) return;

        int s = Random.Range(2, 7);
        int l = Random.Range(2, 7);

        currentData.stressValue = Mathf.Clamp(currentData.stressValue + s, 0, 100);
        currentData.loyaltyValue = Mathf.Clamp(currentData.loyaltyValue + l, 0, 100);

        UpdateUI(currentData);
    }

    private void OnButton2Click()
    {
        if (currentData == null) return;

        int s = Random.Range(2, 7);
        int l = Random.Range(2, 7);

        currentData.stressValue = Mathf.Clamp(currentData.stressValue - s, 0, 100);

        if (Random.value > 0.5f)
            currentData.loyaltyValue = Mathf.Clamp(currentData.loyaltyValue + l, 0, 100);
        else
            currentData.loyaltyValue = Mathf.Clamp(currentData.loyaltyValue - l, 0, 100);

        UpdateUI(currentData);
    }

    private void UpdateLevelDisplay(int level)
    {
        for (int i = 0; i < levelObjects.Length; i++)
        {
            levelObjects[i].SetActive(false);
        }

        int index = level - 1;
        if (index >= 0 && index < levelObjects.Length)
        {
            levelObjects[index].SetActive(true);
        }
    }
}