using UnityEngine;
using UnityEngine.UI;
using TMPro;
using System.Collections;

public class ButtonTextSpawner : MonoBehaviour
{
    public GameObject textPrefab;
    public Transform textParent;

    private TextMeshProUGUI buttonText;
    private Button button;
    private bool hasSpawned = false;

    void Awake()
    {
        buttonText = GetComponentInChildren<TextMeshProUGUI>();
        button = GetComponent<Button>();
        if (button != null) button.onClick.AddListener(OnButtonClick);
    }

    void OnButtonClick()
    {
        if (hasSpawned) return; //防重复选择
        if (textPrefab == null || textParent == null) return;
        if (buttonText == null) return;

        hasSpawned = true;

        button.interactable = false;

        string buttonTextContent = buttonText.text;

        GameObject textObject = Instantiate(textPrefab, textParent);

        textObject.name = buttonTextContent;

        TextMeshProUGUI textComponent = textObject.GetComponent<TextMeshProUGUI>();
        if (textComponent != null)
        {
            textComponent.text = buttonTextContent;
        }

        //StartCoroutine(DestroyButtonAfterDelay(2f));
    }

    //是否删除？
    private IEnumerator DestroyButtonAfterDelay(float delay)
    {
        yield return new WaitForSeconds(delay);

        Debug.Log($"Destroying button: {gameObject.name}");
        Destroy(gameObject);
    }
}