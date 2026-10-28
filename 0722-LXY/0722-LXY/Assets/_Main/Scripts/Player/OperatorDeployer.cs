using UnityEngine;
using UnityEngine.UI;
using System.Collections.Generic;

public class OperatorDeployer : MonoBehaviour
{
    public List<OperatorCardData> availableCards; // 可用的卡牌
    public GameObject cardButtonPrefab; // 卡牌按钮Prefab
    public Transform cardPanel; // UI面板，放置卡牌按钮
    public Text costText; // 显示当前费用
    public GameObject highlightSpritePrefab; // 高亮Sprite预制体
    public float highlightBlinkSpeed = 2f; // 闪烁速度
    public Color placeableColor = new Color(0, 1, 0, 0.5f); // 可放置颜色（绿色，半透明）
    public Color blockedColor = new Color(1, 0, 0, 0.5f); // 不可放置颜色（红色，半透明）

    private MapGenerator mapGenerator;
    private OperatorCardData selectedCard; // 当前选中的卡牌
    private List<Vector2Int> placeableTiles = new List<Vector2Int>(); // 可放置格子
    private List<Vector2Int> blockedTiles = new List<Vector2Int>(); // 不可放置格子
    private List<GameObject> highlightSprites = new List<GameObject>(); // 高亮Sprite对象池
    private bool isPlacing = false; // 是否在放置模式

    private void Start()
    {
        mapGenerator = FindObjectOfType<MapGenerator>();
        if (mapGenerator == null)
        {
            Debug.LogError("MapGenerator not found!");
            return;
        }

        // 初始化卡牌UI
        foreach (var card in availableCards)
        {
            GameObject button = Instantiate(cardButtonPrefab, cardPanel);
            button.GetComponent<Image>().sprite = card.cardSprite;
            button.GetComponent<Button>().onClick.AddListener(() => SelectCard(card));
            Text buttonText = button.GetComponentInChildren<Text>();
            if (buttonText != null)
            {
                buttonText.text = $"{card.cost}";
            }
        }
    }

    private void Update()
    {
        // 更新费用显示
        if (costText != null)
        {
            costText.text = $"Cost: {GameManager.Instance.playerCost}";
        }

        if (isPlacing && selectedCard != null)
        {
            // 更新高亮格子
            UpdateHighlightTiles();

            // 闪烁效果
            float alpha = 0.5f + Mathf.Sin(Time.time * highlightBlinkSpeed) * 0.2f;
            foreach (var sprite in highlightSprites)
            {
                SpriteRenderer sr = sprite.GetComponent<SpriteRenderer>();
                Color color = sr.color;
                color.a = alpha;
                sr.color = color;
            }

            // 点击放置
            if (Input.GetMouseButtonDown(0))
            {
                Vector3 mousePos = Camera.main.ScreenToWorldPoint(Input.mousePosition);
                Vector2Int gridPos = mapGenerator.WorldToGrid(mousePos);
                if (CanPlaceOperator(gridPos, selectedCard.placeableTileType) 
                    && GameManager.Instance.CanAfford(selectedCard.cost))
                {
                    PlaceOperator(gridPos);
                }
                else
                {
                    Debug.LogWarning($"Cannot place operator at {gridPos}: " +
                                     $"Invalid tile type or insufficient cost!");
                }
            }

            // 取消放置（右键）
            if (Input.GetMouseButtonDown(1))
            {
                CancelPlacement();
            }
        }
    }

    private void SelectCard(OperatorCardData card)
    {
        if (GameManager.Instance.CanAfford(card.cost))
        {
            selectedCard = card;
            isPlacing = true;
            Debug.Log($"Selected card: {card.cardId}, " +
                      $"Placeable on: {card.placeableTileType}");
        }
    }

    private bool CanPlaceOperator(Vector2Int gridPos, TileType tileType)
    {
        int state = mapGenerator.GetNodeState(gridPos.x, gridPos.y);
        // Check if the position is valid and matches the required tile type
        bool isValidTile = (tileType == TileType.HighGround && state == 2) || // HighGround
                          (tileType == TileType.Walkable && state == 0);     // Walkable
        return isValidTile;
    }

    private void UpdateHighlightTiles()
    {
        // 清除之前的高亮
        ClearHighlights();
        placeableTiles.Clear();
        blockedTiles.Clear();

        // 扫描所有格子
        for (int y = 0; y < 6; y++)
        {
            for (int x = 0; x < 10; x++)
            {
                Vector2Int gridPos = new Vector2Int(x, y);
                int state = mapGenerator.GetNodeState(x, y);
                
                if (state == 1) // Blocked
                {
                    blockedTiles.Add(gridPos);
                }
                else if ((selectedCard.placeableTileType == TileType.HighGround && state == 2) ||
                         (selectedCard.placeableTileType == TileType.Walkable && state == 0))
                {
                    placeableTiles.Add(gridPos);
                }
                else
                {
                    blockedTiles.Add(gridPos);
                }
            }
        }

        // 生成高亮Sprite
        foreach (var pos in placeableTiles)
        {
            GameObject sprite = GetHighlightSprite();
            sprite.transform.position = mapGenerator.GetNodePosition(pos.x, pos.y);
            sprite.GetComponent<SpriteRenderer>().color = placeableColor;
            highlightSprites.Add(sprite);
        }
        foreach (var pos in blockedTiles)
        {
            GameObject sprite = GetHighlightSprite();
            sprite.transform.position = mapGenerator.GetNodePosition(pos.x, pos.y);
            sprite.GetComponent<SpriteRenderer>().color = blockedColor;
            highlightSprites.Add(sprite);
        }
    }

    private GameObject GetHighlightSprite()
    {
        foreach (var sprite in highlightSprites)
        {
            if (!sprite.activeInHierarchy)
            {
                sprite.SetActive(true);
                return sprite;
            }
        }
        GameObject newSprite = Instantiate(highlightSpritePrefab);
        return newSprite;
    }

    private void ClearHighlights()
    {
        foreach (var sprite in highlightSprites)
        {
            sprite.SetActive(false);
        }
    }

    private void PlaceOperator(Vector2Int gridPos)
    {
        Vector3 worldPos = mapGenerator.GetNodePosition(gridPos.x, gridPos.y);
        worldPos.y += 0.5f; // 增加Y轴0.5f
        GameObject operatorInstance = Instantiate(selectedCard.operatorPrefab, worldPos, Quaternion.identity);
        Operator op = operatorInstance.GetComponent<Operator>();
        op.Initialize(selectedCard, gridPos, selectedCard.placeableTileType);
        // Set sorting layer based on row
        int sortingOrder = 5 - gridPos.y; // 从第0行开始，sorting layer从5递减
        operatorInstance.GetComponent<SpriteRenderer>().sortingOrder = sortingOrder;
        
        GameManager.Instance.SpendCost(selectedCard.cost);
        CancelPlacement();
        Debug.Log($"Placed operator {selectedCard.cardId} at {worldPos} ({selectedCard.placeableTileType})");
    }

    private void CancelPlacement()
    {
        selectedCard = null;
        isPlacing = false;
        ClearHighlights();
    }
}