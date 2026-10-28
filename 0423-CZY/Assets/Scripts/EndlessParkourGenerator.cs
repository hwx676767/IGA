using UnityEngine;
using System.Collections.Generic;
using UnityEngine.Rendering;
using Unity.VisualScripting;

public class EndlessParkourGenerator : MonoBehaviour
{
    public enum Season { Spring, Summer, Autumn, Winter }
    public enum SummerLane { Left, Center, Right }

    [System.Serializable]
    public class SeasonConfig
    {
        public Season season;
        public Material trackMaterial;
        public GameObject[] buildingPrefabs;
        public GameObject seasonTrackSegmentPrefab;
        public GameObject[] obstaclePrefabs;
        public GameObject portalPrefab;
    }

    [Header("季节配置")]
    public SeasonConfig[] seasonConfigs;
    public SeasonConfigListItem[] seasonEnv; // 数组顺序：0春, 1夏, 2秋, 3冬
    public VolumeProfile[] seasonVoluems;    // 数组顺序：0春, 1夏, 2秋, 3冬
    public Volume GlobalVolume;
    public Season currentSeason = Season.Spring;
    public float seasonDuration = 30f;
    public GameObject currentSeansonEf;
    public GameObject springEf;
    public GameObject summerEf;
    public GameObject autumnEf;
    public GameObject winterEf;

    public GameObject springChangeEf;
    public GameObject autumnChangeEf;
    public GameObject winterChangeEf;

    [Header("引用")]
    public Transform player;
    public GameObject trackSegmentPrefab;
    public GameObject waterPrefab;

    [Header("生成基础配置")]
    public float trackSegmentLength = 20f;
    public int visibleTracksAhead = 8;
    [Header("夏季专项配置")]
    public float summerPrefabLength = 5f;
    public float summerLaneOffset = 3.5f;
    [Header("建筑")]
    [Tooltip("建筑离道路中心的最小距离")]
    public float buildingXOffset = 10f;
    [Tooltip("建筑生成的区域宽度 (从minOffset向外扩多少)")]
    public float buildingSpread = 15f;
    [Tooltip("每段路单侧生成的建筑数量")]
    public int buildingsPerSidePerSegment = 5;
    [Header("障碍")]
    [Range(0, 6)]
    public int obstaclesPerSegment = 2;
    [Header("水体配置")]
    public float waterY = -2f;
    public Vector3 waterScale = new Vector3(50f, 1f, 20f);
    private readonly List<GameObject> activeSegments = new();
    private float lastTrackEndZ;
    private float seasonTimer;
    private bool portalSpawnedThisSeason = false;
    private float currentSummerLaneX = 0f;
    private static readonly float[] normalLanes = { -3f, 0f, 3f };
    void Start()
    {
        if (!player)
        {
            Debug.LogError("❌ Player 未指定");
            enabled = false;
            return;
        }

        lastTrackEndZ = Mathf.Floor(player.position.z / trackSegmentLength) * trackSegmentLength;

        for (int i = 0; i < visibleTracksAhead; i++)
            GenerateSegment();

        // 初始应用环境设置
        UpdateEnvironmentSettings(currentSeason);
        currentSeansonEf = springEf;
    }

    void Update()
    {
        seasonTimer += Time.deltaTime;
        float targetZ = player.position.z + visibleTracksAhead * trackSegmentLength;

        if (lastTrackEndZ < targetZ)
            GenerateSegment();

        CleanupSegments();
    }

    // --- 更新环境设置的方法 ---
    private void UpdateEnvironmentSettings(Season season)
    {
        int index = (int)season;

        // 1. 切换后处理配置文件
        if (GlobalVolume != null && seasonVoluems != null && index < seasonVoluems.Length)
        {
            GlobalVolume.profile = seasonVoluems[index];
        }

        // 2. 切换 Lighting Environment 设置
        if (seasonEnv != null && index < seasonEnv.Length)
        {
            SeasonConfigListItem env = seasonEnv[index];
            if (env.skyBoxMat != null) RenderSettings.skybox = env.skyBoxMat;

            RenderSettings.subtractiveShadowColor = env.realtimeShadowColor;
            RenderSettings.ambientLight = env.ambientColor;
            RenderSettings.fogColor = env.fogColor;
            RenderSettings.fog = true; // 确保开启雾效
            // 更新环境光照明
            DynamicGI.UpdateEnvironment();
        }
    }

    public void SwitchSeason(Season newSeason)
    {
        if (currentSeason == newSeason) return;
        currentSeason = newSeason;
        seasonTimer = 0f;
        portalSpawnedThisSeason = false;
        if (currentSeansonEf!= null)
        {
            currentSeansonEf.gameObject.SetActive(false);
            currentSeansonEf = null;
        }  // 核心功能：应用对应季节的环境和后处理
        UpdateEnvironmentSettings(newSeason);
        switch (currentSeason)
        {
            case Season.Spring:
                summerEf.SetActive(false);
                trackSegmentPrefab = seasonConfigs[0].seasonTrackSegmentPrefab;
                currentSeansonEf = springEf;
                Instantiate(springChangeEf, player.transform.position + (transform.forward * 20), Quaternion.identity);
                break;
            case Season.Summer:
                summerEf.SetActive(true);
                trackSegmentPrefab = seasonConfigs[1].seasonTrackSegmentPrefab;
                // 注意：夏天通常不调用 SpawnBuildings，直接跳出逻辑
                break;
            case Season.Autumn:
                summerEf.SetActive(false);
                trackSegmentPrefab = seasonConfigs[2].seasonTrackSegmentPrefab;
                currentSeansonEf = autumnEf;
                Instantiate(autumnChangeEf, player.transform.position + (transform.forward * 2), Quaternion.identity);
                break;
            case Season.Winter:
                summerEf.SetActive(false);
                trackSegmentPrefab = seasonConfigs[3].seasonTrackSegmentPrefab;
                currentSeansonEf = winterEf;
                Instantiate(winterChangeEf, player.transform.position + (transform.forward * 2), Quaternion.identity);
                break;
        }
        if (currentSeansonEf) currentSeansonEf.SetActive(true);
        Debug.Log($"🌍 季节切换 → {newSeason}");
    }

    void GenerateSegment()
    {
        SeasonConfig config = GetCurrentConfig();
        if (config == null || !trackSegmentPrefab) return;
        float zStart = lastTrackEndZ;
        GameObject root = new GameObject($"Segment_{zStart}");
        root.transform.SetParent(transform);
        root.transform.position = new Vector3(0, 0, zStart);
        if (currentSeason == Season.Summer)
        {
            SummerLane lane = (SummerLane)Random.Range(0, 3);
            currentSummerLaneX = (lane == SummerLane.Left) ? -summerLaneOffset :
                                 (lane == SummerLane.Right) ? summerLaneOffset : 0f;
            float currentLocalZ = 0;
            while (currentLocalZ < trackSegmentLength)
            {
                GameObject piece = Instantiate(trackSegmentPrefab, root.transform);
                piece.transform.localPosition = new Vector3(currentSummerLaneX, 0, currentLocalZ);
                currentLocalZ += summerPrefabLength;
            }
            SpawnWaterOptimized(root);
        }
        else
        {
            currentSummerLaneX = 0f;
            GameObject track = Instantiate(trackSegmentPrefab, root.transform);
            track.transform.localPosition = Vector3.zero;
            Vector3 scale = track.transform.localScale;
            scale.z = trackSegmentLength;
            scale.x = 50f;
            track.transform.localScale = scale;
            // 非夏季，生成茂密的建筑群
            SpawnBuildings(root, config);
        }
        SpawnObstacles(root, config);
        TrySpawnSeasonPortal(root, config);
        activeSegments.Add(root);
        lastTrackEndZ += trackSegmentLength;
    }

    // 建筑生成逻辑：在 buildingXOffset 到 buildingXOffset + buildingSpread 范围内随机
    void SpawnBuildings(GameObject parent, SeasonConfig c)
    {
        if (c.buildingPrefabs == null || c.buildingPrefabs.Length == 0) return;

        for (int side = 0; side < 2; side++)
        {
            float sideSign = (side == 0) ? -1f : 1f;

            for (int i = 0; i < buildingsPerSidePerSegment; i++)
            {
                GameObject prefab = c.buildingPrefabs[Random.Range(0, c.buildingPrefabs.Length)];

                // 在 [buildingXOffset, buildingXOffset + buildingSpread] 区间内生成
                float randomX = Random.Range(buildingXOffset, buildingXOffset + buildingSpread) * sideSign;
                // Z 轴在当前路段长度内随机分布
                float randomZ = Random.Range(0f, trackSegmentLength);

                GameObject b = Instantiate(prefab, parent.transform.position + new Vector3(randomX, 0, randomZ), Quaternion.identity, parent.transform);

                // --- 增加高低错落感 ---
                float randomHeightScale = Random.Range(0.7f, 2.5f); // 随机高度：0.7倍到2.5倍
                Vector3 newScale = b.transform.localScale;
                newScale.y *= randomHeightScale;
                // 宽度也给一点微小的随机，避免重复感
                newScale.x *= Random.Range(1f, 1.2f);
                newScale.z *= Random.Range(1f, 1.2f);
                b.transform.localScale = newScale;

                // --- 随机旋转 ---
                b.transform.Rotate(0, Random.Range(0, 360f), 0);
            }
        }
    }

    void SpawnWaterOptimized(GameObject parent)
    {
        if (!waterPrefab) return;
        GameObject w = Instantiate(waterPrefab, parent.transform);
        w.transform.localPosition = new Vector3(0, waterY, trackSegmentLength / 2f);
        Vector3 newWaterScale = waterScale;
        newWaterScale.z = trackSegmentLength / 10f;
        w.transform.localScale = newWaterScale;
    }

    void SpawnObstacles(GameObject parent, SeasonConfig c)
    {
        if (c.obstaclePrefabs == null || c.obstaclePrefabs.Length == 0) return;

        for (int i = 0; i < obstaclesPerSegment; i++)
        {
            GameObject prefab = c.obstaclePrefabs[Random.Range(0, c.obstaclePrefabs.Length)];
            if (!prefab) continue;

            float x = (currentSeason == Season.Summer)
                ? currentSummerLaneX
                : normalLanes[Random.Range(0, normalLanes.Length)];

            float z = Random.Range(2f, trackSegmentLength - 2f);

            Instantiate(
                prefab,
                parent.transform.position + new Vector3(x, 0f, z),
                prefab.transform.rotation,
                parent.transform
            );
        }
    }

    SeasonConfig GetCurrentConfig()
    {
        foreach (var c in seasonConfigs) if (c.season == currentSeason) return c;
        return null;
    }

    void TrySpawnSeasonPortal(GameObject parent, SeasonConfig c)
    {
        if (portalSpawnedThisSeason || !c.portalPrefab || seasonTimer < seasonDuration) return;
        float x = currentSeason == Season.Summer ? currentSummerLaneX : 0f;
        Vector3 pos = Vector3.zero;
        if(currentSeason == Season.Autumn)
        {
             pos = parent.transform.position + new Vector3(x, -6f, trackSegmentLength * 0.5f);
        }
        else
        {
            pos = parent.transform.position + new Vector3(x, 0f, trackSegmentLength * 0.5f);
        }

        GameObject portal = Instantiate(c.portalPrefab, pos, Quaternion.identity, parent.transform);
        SeasonPortal sp = portal.GetComponent<SeasonPortal>() ?? portal.AddComponent<SeasonPortal>();
        //sp.targetSeason = (Season)(((int)currentSeason + 1) % 4);
        
        sp.targetSeason = GetNextSeason(currentSeason);
        portalSpawnedThisSeason = true;
    }
    
    Season GetNextSeason(Season s)
    {
        switch (s)
        {
            case Season.Winter: return Season.Autumn;
            case Season.Autumn: return Season.Summer;
            case Season.Summer: return Season.Spring;
            case Season.Spring: return Season.Winter;
            default: return Season.Spring;
        }
    }

    void CleanupSegments()
    {
        float removeZ = player.position.z - 30f;
        while (activeSegments.Count > 0 && activeSegments[0].transform.position.z < removeZ)
        {
            Destroy(activeSegments[0]);
            activeSegments.RemoveAt(0);
        }
    }

    [System.Serializable]
    public class SeasonConfigListItem
    {
        public Material skyBoxMat;
        public Color realtimeShadowColor;
        [ColorUsage(showAlpha: true, hdr: true)]
        public Color ambientColor;
        public Color fogColor;
    }
}