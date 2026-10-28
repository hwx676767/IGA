using UnityEngine;
using UnityEngine.UI;
using System.Linq;

public class CardGenerator : MonoBehaviour
{
    public GameObject[] cardPrefabList; // List of card prefabs
    public RectTransform areaRectTransform; // RectTransform of the white area
    public int maxCards = 15; // Maximum number of cards
    public int minCards = 5; // Minimum number of cards

    private GameObject[] instantiatedCards; // Stores instantiated cards
    private float cardWidth = 100f; // Assumed card width, adjust based on actual card size

    void Start()
    {
        GenerateCards();
    }

    void GenerateCards()
    {
        if (cardPrefabList == null || cardPrefabList.Length == 0 || areaRectTransform == null)
        {
            Debug.LogWarning("CardGenerator: Card prefab list or area RectTransform is not set!");
            return;
        }

        // Find Buff prefab
        GameObject buffPrefab = cardPrefabList.FirstOrDefault(prefab => prefab.name == "Buff");
        if (buffPrefab == null)
        {
            Debug.LogWarning("CardGenerator: No prefab named 'Buff' found!");
        }

        // Randomly generate card count, ensuring at least minCards
        int cardCount = Mathf.Min(Random.Range(minCards, maxCards + 1), cardPrefabList.Length * 10);

        // Randomly decide to generate 1 or 2 Buff cards (if Buff prefab exists)
        int buffCount = (buffPrefab != null && cardCount >= 1) ? Random.Range(1, Mathf.Min(3, cardCount + 1)) : 0;

        // Create card instance list
        GameObject[] selectedCards = new GameObject[cardCount];
        int index = 0;

        // Add Buff cards
        for (int i = 0; i < buffCount; i++)
        {
            selectedCards[index] = buffPrefab;
            index++;
        }

        // Fill remaining cards
        for (int i = index; i < cardCount; i++)
        {
            selectedCards[i] = cardPrefabList[Random.Range(0, cardPrefabList.Length)];
        }

        // Sort by prefab type to group same prefabs together
        selectedCards = selectedCards.OrderBy(card => card != null ? card.GetInstanceID() : int.MaxValue).ToArray();

        // Calculate dynamic spacing
        float totalTargetLength = 330f * 5f; // Total length
        float totalCardWidth = cardCount * cardWidth; // Total width of all cards
        float dynamicSpacing = (cardCount > 1) ? (totalTargetLength - totalCardWidth) / (cardCount - 1) : 0f;
        if (totalCardWidth > totalTargetLength && cardCount > 1)
        {
            dynamicSpacing = (totalTargetLength - totalCardWidth) / (cardCount - 1); // Negative spacing
        }

        // Calculate total width including card width and spacing
        float totalWidth = (cardCount * cardWidth) + ((cardCount - 1) * dynamicSpacing);
        float areaWidth = areaRectTransform.rect.width;
        float startX = (areaWidth - totalWidth) / 2f; // Start from the left edge of the area, offset to center

        // Instantiate cards and align them to the center
        instantiatedCards = new GameObject[cardCount];
        for (int i = 0; i < cardCount; i++)
        {
            if (selectedCards[i] == null) continue; // Prevent null reference
            GameObject card = Instantiate(selectedCards[i], areaRectTransform.transform);
            RectTransform rect = card.GetComponent<RectTransform>();
            if (rect != null)
            {
                rect.anchoredPosition = new Vector2(startX + i * (cardWidth + dynamicSpacing), 0f); // Center offset
                rect.SetParent(areaRectTransform, false); // Set card parent to the specified area
                card.AddComponent<CardHover>(); // Add hover script
                instantiatedCards[i] = card; // Store instantiated card
            }
        }
    }

    public void ReorderCards()
    {
        if (instantiatedCards == null || areaRectTransform == null) return;

        // Remove destroyed cards
        instantiatedCards = instantiatedCards.Where(card => card != null).ToArray();
        int remainingCardCount = instantiatedCards.Length;

        if (remainingCardCount == 0) return;

        // Calculate dynamic spacing
        float totalTargetLength = 330f * 5f; // Total length
        float totalCardWidth = remainingCardCount * cardWidth; // Total width of all cards
        float dynamicSpacing = (remainingCardCount > 1) ? (totalTargetLength - totalCardWidth) / (remainingCardCount - 1) : 0f;
        if (totalCardWidth > totalTargetLength && remainingCardCount > 1)
        {
            dynamicSpacing = (totalTargetLength - totalCardWidth) / (remainingCardCount - 1); // Negative spacing
        }

        // Calculate total width including card width and spacing
        float totalWidth = (remainingCardCount * cardWidth) + ((remainingCardCount - 1) * dynamicSpacing);
        float areaWidth = areaRectTransform.rect.width;
        float startX = (areaWidth - totalWidth) / 2f; // Start from the left edge of the area, offset to center

        // Update all card positions and reset sibling index
        for (int i = 0; i < remainingCardCount; i++)
        {
            RectTransform rect = instantiatedCards[i].GetComponent<RectTransform>();
            if (rect != null)
            {
                rect.anchoredPosition = new Vector2(startX + i * (cardWidth + dynamicSpacing), 0f);
                rect.SetSiblingIndex(i); // Reset sibling index to arrange in order
            }
        }
    }
}