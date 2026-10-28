using UnityEngine;
using UnityEngine.EventSystems;

public class CardController : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler, IPointerClickHandler
{
    private Vector3 originalPosition;
    private RectTransform rectTransform;
    private float hoverOffset = 100f;
    private bool isHovering = false;
    private bool isSelected = false;
    private bool isActivated = false;
    private GameObject uiImageInstance;

    [SerializeField] private string cardId;
    [SerializeField] private GameObject spawnPrefab;
    [SerializeField] private GameObject uiPrefab; // Add reference to UI prefab

    public bool IsSelected => isSelected;
    public bool IsActivated => isActivated;
    public string CardId => cardId;
    public GameObject SpawnPrefab => spawnPrefab;

    void Start()
    {
        rectTransform = GetComponent<RectTransform>();
        originalPosition = rectTransform.anchoredPosition;
    }

    void Update()
    {
        if (isSelected || isHovering)
        {
            rectTransform.SetAsLastSibling();
            rectTransform.anchoredPosition = Vector3.Lerp(rectTransform.anchoredPosition,
                new Vector3(originalPosition.x, originalPosition.y + hoverOffset, originalPosition.z),
                Time.deltaTime * 10f);
        }
        else
        {
            rectTransform.anchoredPosition = Vector3.Lerp(rectTransform.anchoredPosition, originalPosition, Time.deltaTime * 10f);
        }
    }

    public void OnPointerEnter(PointerEventData eventData)
    {
        isHovering = true;
        isActivated = true;
    }

    public void OnPointerExit(PointerEventData eventData)
    {
        if (!isSelected)
        {
            isHovering = false;
            isActivated = false;
        }
    }

    public void OnPointerClick(PointerEventData eventData)
    {
        // Handle left click (original functionality)
        if (eventData.button == PointerEventData.InputButton.Left)
        {
            isSelected = !isSelected;
            isActivated = isSelected;
            isHovering = isSelected;
        }
        // Handle right click
        else if (eventData.button == PointerEventData.InputButton.Right)
        {
            if (uiImageInstance == null && uiPrefab != null)
            {
                // Instantiate UI prefab at canvas center
                uiImageInstance = Instantiate(uiPrefab, rectTransform.root);
                RectTransform uiRect = uiImageInstance.GetComponent<RectTransform>();
                if (uiRect != null)
                {
                    uiRect.anchoredPosition = Vector2.zero; // Center of canvas
                    uiImageInstance.SetActive(true);
                }
            }
            else
            {
                // Destroy UI image if it exists
                if (uiImageInstance != null)
                {
                    Destroy(uiImageInstance);
                    uiImageInstance = null;
                }
            }
        }
    }

    public void ResetCard()
    {
        isSelected = false;
        isHovering = false;
        isActivated = false;
        if (uiImageInstance != null)
        {
            Destroy(uiImageInstance);
            uiImageInstance = null;
        }
        gameObject.SetActive(false);
    }

    void OnDestroy()
    {
        // Clean up UI image when card is destroyed
        if (uiImageInstance != null)
        {
            Destroy(uiImageInstance);
            uiImageInstance = null;
        }
    }
}