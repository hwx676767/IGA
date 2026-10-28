using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using System.Collections.Generic;

public class CharacterAttributeGenerator : MonoBehaviour
{
    public static CharacterAttributeGenerator Instance { get; private set; }

    // 玩家属性
    public PlayerController.Personality personality; // 性格
    public PlayerController.AcademicLevel academicLevel; // 学业水平
    public PlayerController.IQ iq; // 智商
    public PlayerController.FamilyBackground familyBackground; // 家庭背景
    public PlayerController.Hobby hobby; // 兴趣爱好

    [Header("UI Components")]
    public Text attributeDisplayText; // Text
    public LineRenderer radarLineRenderer; // for Radar - Line Renderer
    public GameObject hobbyObject; // Parent GameObject for hobby (contains Image and Text)
    public List<Sprite> hobbySprites; // List to store sprites for hobbies (Game, Music, Sport)

    [Header("Radar Chart Settings")]
    public Vector3 radarCenter = new Vector3(0f, 0f, 0f); // Custom center point for radar chart

    [Header("Hobby Image Animation")]
    public float floatAmplitude = 10f; // Amplitude of floating effect (pixels)
    public float floatSpeed = 2f; // Speed of floating effect (cycles per second)

    private float[] attributeValues = new float[5];
    private Vector2 hobbyImageInitialPosition; // Store initial position of child hobbyImage
    private bool isHobbyImagePositionSet = false; // Flag to track if initial position is set
    private Image hobbyImage; // Child Image component under hobbyObject
    private Image hobbyParentImage; // Parent Image component on hobbyObject
    private Text hobbyText; // Text component under hobbyObject

    private void Awake()
    {
        if (Instance == null)
        {
            Instance = this;
            DontDestroyOnLoad(gameObject);
        }
        else
        {
            Destroy(gameObject);
        }

        // Find Image and Text components under hobbyObject and parent Image
        if (hobbyObject != null)
        {
            hobbyParentImage = hobbyObject.GetComponent<Image>();
            //hobbyImage = hobbyObject.GetComponentInChildren<Image>(true); 
            hobbyImage = hobbyObject.transform.GetChild(0).GetComponent<Image>();
            hobbyText = hobbyObject.GetComponentInChildren<Text>(true); 
            if (hobbyParentImage != null)
            {
                hobbyParentImage.enabled = false; // Initially disable the parent hobby image
            }
            if (hobbyImage != null)
            {
                hobbyImage.enabled = false; // Initially disable the child hobby image
            }
            if (hobbyText != null)
            {
                hobbyText.enabled = false; // Initially disable the hobby text
            }
        }
    }

    private void Update()
    {
        // Apply floating effect to child hobbyImage if enabled
        if (hobbyImage != null && hobbyImage.enabled && isHobbyImagePositionSet)
        {
            float yOffset = Mathf.Sin(Time.time * floatSpeed) * floatAmplitude;
            hobbyImage.rectTransform.anchoredPosition = hobbyImageInitialPosition + new Vector2(0f, yOffset);
        }
    }

    public void GenerateAndDisplayAttributes()
    {
        GenerateAttributes();
        ConvertToValues();
        DisplayAttributes();
        DisplayRadarChart();
    }

    public void StartGame()
    {
        SceneManager.LoadScene("GameScene");
        SceneManager.sceneLoaded += OnSceneLoaded;
    }

    private void GenerateAttributes()
    {
        float personalityValue = Random.value;
        float academicValue = Random.value;
        float iqValue = Random.value;
        float familyValue = Random.value;
        float hobbyValue = Random.value;

        personality = personalityValue < 0.5f ? 
            PlayerController.Personality.Introvert : PlayerController.Personality.Extrovert;
        academicLevel = academicValue switch
        {
            < 0.33f => PlayerController.AcademicLevel.Poor,
            < 0.66f => PlayerController.AcademicLevel.Medium,
            _ => PlayerController.AcademicLevel.Good
        };
        iq = iqValue switch
        {
            < 0.33f => PlayerController.IQ.Poor,
            < 0.66f => PlayerController.IQ.Medium,
            _ => PlayerController.IQ.Good
        };
        familyBackground = familyValue < 0.5f ? 
            PlayerController.FamilyBackground.Bad : PlayerController.FamilyBackground.Good;
        hobby = hobbyValue switch
        {
            < 0.33f => PlayerController.Hobby.Game,
            < 0.66f => PlayerController.Hobby.Music,
            _ => PlayerController.Hobby.Sport
        };
    }

    private void ConvertToValues()
    {
        // 将枚举转换为0-100的数值
        attributeValues[0] = (personality == PlayerController.Personality.Introvert) ? 40f : 60f; 
        attributeValues[1] = academicLevel switch
        {
            PlayerController.AcademicLevel.Poor => 30f,
            PlayerController.AcademicLevel.Medium => 50f,
            PlayerController.AcademicLevel.Good => 70f,
            _ => 50f
        };
        attributeValues[2] = iq switch
        {
            PlayerController.IQ.Poor => 30f,
            PlayerController.IQ.Medium => 50f,
            PlayerController.IQ.Good => 70f,
            _ => 50f
        };
        attributeValues[3] = (familyBackground == PlayerController.FamilyBackground.Good) ? 60f : 40f; 
        attributeValues[4] = hobby switch
        {
            PlayerController.Hobby.Game => 50f,
            PlayerController.Hobby.Music => 60f,
            PlayerController.Hobby.Sport => 70f,
            _ => 50f
        };
    }

    private void DisplayRadarChart()
    {
        if (radarLineRenderer == null)
        {
            Debug.LogWarning("未分配Line Renderer组件！");
            return;
        }

        radarLineRenderer.positionCount = 6;
        float angleStep = 2 * Mathf.PI / 5;
        Vector3[] points = new Vector3[6];

        for (int i = 0; i < 5; i++)
        {
            float angle = i * angleStep;
            float radius = attributeValues[i] / 100f * 2f; // radar max radius
            points[i] = radarCenter + new Vector3(Mathf.Cos(angle) * radius, Mathf.Sin(angle) * radius, 0f);
        }
        points[5] = points[0]; 

        radarLineRenderer.SetPositions(points);
    }
    
    private void DisplayAttributes()
    {
        if (attributeDisplayText != null)
        {
            attributeDisplayText.text = $"角色属性：\n" +
                                        $"性格：{(personality == PlayerController.Personality.Introvert ? "内向" : "外向")}\n" +
                                        $"学业水平：{(academicLevel == PlayerController.AcademicLevel.Good ? "优秀" : academicLevel == PlayerController.AcademicLevel.Medium ? "中等" : "较差")}\n" +
                                        $"智商：{(iq == PlayerController.IQ.Good ? "高" : iq == PlayerController.IQ.Medium ? "中等" : "低")}\n" +
                                        $"家庭背景：{(familyBackground == PlayerController.FamilyBackground.Good ? "良好" : "较差")}\n" +
                                        $"兴趣爱好：{(hobby == PlayerController.Hobby.Game ? "游戏" : hobby == PlayerController.Hobby.Music ? "音乐" : "运动")}";
        }
        else
        {
            Debug.LogWarning("未分配属性显示的Text组件！");
        }

        // Display hobby parent image, child sprite, and text
        if (hobbyObject != null && hobbyParentImage != null && hobbyImage != null && hobbyText != null && hobbySprites != null && hobbySprites.Count >= 3)
        {
            hobbyParentImage.enabled = true; // Directly enable the parent image
            hobbyImage.enabled = true; // Enable the child image
            hobbyText.enabled = true; // Enable the text
            hobbyImage.sprite = hobby switch
            {
                PlayerController.Hobby.Game => hobbySprites[0],
                PlayerController.Hobby.Music => hobbySprites[1],
                PlayerController.Hobby.Sport => hobbySprites[2],
                _ => null
            };
            hobbyText.text = hobby switch
            {
                PlayerController.Hobby.Game => "Game",
                PlayerController.Hobby.Music => "Music",
                PlayerController.Hobby.Sport => "Sport",
                _ => "Null"
            };
            if (hobbyImage.sprite != null)
            {
                hobbyImage.SetNativeSize(); // Set the child image to its native size
                if (!isHobbyImagePositionSet)
                {
                    hobbyImageInitialPosition = hobbyImage.rectTransform.anchoredPosition; // Store initial position of child image
                    isHobbyImagePositionSet = true;
                }
            }
        }
        else
        {
            Debug.LogWarning("have no Hobby Object、Parent Image、Child Image、Text组件或Hobby Sprites列表不足！");
        }
    }

    private void OnSceneLoaded(Scene scene, LoadSceneMode mode)
    {
        PlayerController playerController = FindObjectOfType<PlayerController>();
        if (playerController != null)
        {
            playerController.personality = personality;
            playerController.academicLevel = academicLevel;
            playerController.iq = iq;
            playerController.familyBackground = familyBackground;
            playerController.hobby = hobby;
        }
        else
        {
            Debug.LogWarning("PlayerController not found！");
        }
        SceneManager.sceneLoaded -= OnSceneLoaded;
    }

}