using UnityEngine;
using System.Collections;

public class PrefabSpawner : MonoBehaviour
{
    public static PrefabSpawner Instance; // 单例

    [Header("Prefab 设置")]
    public GameObject normalPrefab;
    public GameObject specialPrefab;
    [Range(0f, 1f)] public float specialSpawnChance = 0.1f;

    [Header("生成设置")]
    public Transform spawnPoint;
    public Vector2 randomInterval = new Vector2(2f, 5f);
    public bool autoSpawn = true;

    [Header("紧急生成设置")]
    public int emergencySpawnCount = 5;
    public float emergencyInterval = 0.2f;

    [Header("普通球材质设置")]
    public Material[] normalMaterials;
    public string meshName = "polySurface11";

    [Header("生成位置偏移")]
    public Vector2 randomOffsetX = new Vector2(-1f, 1f);
    public Vector2 randomOffsetZ = new Vector2(-1f, 1f);

    [Header("特殊小球限制")]
    public int maxSpecialBalls = 3; 
    [HideInInspector] public int currentSpecialBalls = 0;

    [Header("场景外小球计数")]
    [HideInInspector] public int ballsOutsideScene = 0;

    [Header("粒子特效")]
    public GameObject particleEffect1;
    public GameObject particleEffect2;

    private void Awake()
    {
        Instance = this;
    }

    private void Start()
    {
        if (autoSpawn)
            StartCoroutine(RandomSpawnLoop());
    }

    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.Alpha1))
            SpawnPrefab("special");

        if (Input.GetKeyDown(KeyCode.Alpha2))
            EmergencySpawn();
    }

    IEnumerator RandomSpawnLoop()
    {
        while (true)
        {
            SpawnPrefab();
            yield return new WaitForSeconds(Random.Range(randomInterval.x, randomInterval.y));
        }
    }

    public void SpawnPrefab(string type = null)
    {
        GameObject prefabToSpawn = normalPrefab;

        if (type == "special")
        {
            if (currentSpecialBalls >= maxSpecialBalls) return;
            prefabToSpawn = specialPrefab;
            currentSpecialBalls++;
        }
        else if (type == "normal")
        {
            prefabToSpawn = normalPrefab;
        }
        else // 随机
        {
            if (Random.value < specialSpawnChance)
            {
                if (currentSpecialBalls < maxSpecialBalls)
                {
                    prefabToSpawn = specialPrefab;
                    currentSpecialBalls++;
                }
            }
        }

        if (prefabToSpawn == null || spawnPoint == null) return;

        Vector3 offset = new Vector3(
            Random.Range(randomOffsetX.x, randomOffsetX.y),
            0f,
            Random.Range(randomOffsetZ.x, randomOffsetZ.y)
        );

        GameObject obj = Instantiate(prefabToSpawn, spawnPoint.position + offset, Quaternion.identity);

        EmotionBall ball = obj.GetComponent<EmotionBall>();
        if (ball != null)
        {
            if (!ball.isSpecialBall)
                ApplyRandomMaterial(obj);

            ball.onDestroyed += () =>
            {
                if (ball.isSpecialBall) currentSpecialBalls--;
                ballsOutsideScene++;
            };
        }

        StartCoroutine(MoveUpwards(obj));
    }

    void ApplyRandomMaterial(GameObject obj)
    {
        if (normalMaterials == null || normalMaterials.Length == 0) return;

        Material mat = normalMaterials[Random.Range(0, normalMaterials.Length)];
        Transform mesh = FindChildRecursive(obj.transform, meshName);
        if (mesh != null)
        {
            Renderer rend = mesh.GetComponent<Renderer>();
            if (rend != null)
                rend.material = mat;
        }
    }

    Transform FindChildRecursive(Transform parent, string name)
    {
        foreach (Transform child in parent)
        {
            if (child.name == name) return child;

            Transform found = FindChildRecursive(child, name);
            if (found != null) return found;
        }
        return null;
    }

    IEnumerator MoveUpwards(GameObject obj)
    {
        if (obj == null) yield break;
        Vector3 startPos = obj.transform.position;
        float randomMoveDistanceY = Random.Range(0.5f, 1f);
        Vector3 targetPos = startPos + Vector3.up * randomMoveDistanceY;
        float duration = 1f;
        float elapsed = 0f;

        while (elapsed < duration)
        {
            if (obj == null) yield break;
            obj.transform.position = Vector3.Lerp(startPos, targetPos, elapsed / duration);
            elapsed += Time.deltaTime;
            yield return null;
        }

        if (obj != null)
        {
            obj.transform.position = targetPos;
            EmotionBall ball = obj.GetComponent<EmotionBall>();
            if (ball != null)
                ball.ActivateFloating();
        }
    }

    public void EmergencySpawn()
    {
        StartCoroutine(EmergencySpawnRoutine());
    }

    IEnumerator EmergencySpawnRoutine()
    {
        for (int i = 0; i < emergencySpawnCount; i++)
        {
            SpawnPrefab();
            yield return new WaitForSeconds(emergencyInterval);
        }
    }
}
