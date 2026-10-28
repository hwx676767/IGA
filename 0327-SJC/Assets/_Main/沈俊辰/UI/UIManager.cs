using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

/// <summary>
/// Central UI hub. Routes panel open/close through UITransitionController
/// and binds to locally loaded character / chat data.
/// </summary>
public class UIManager : MonoBehaviour
{
    public static UIManager Instance { get; private set; }

    [Header("Panels")]
    [SerializeField] private GameObject mainMenuPanel;
    [SerializeField] private GameObject chatPanel;
    [SerializeField] private GameObject characterListPanel;
    [SerializeField] private GameObject upgradePanel;
    [SerializeField] private GameObject voiceTestPanel;
    [SerializeField] private GameObject coursePanel;

    [Header("References")]
    [SerializeField] private UITransitionController transitionController;
    [SerializeField] private ChatUIController chatUIController;

    private readonly Stack<GameObject> panelHistory = new Stack<GameObject>();
    private GameObject currentPanel;

    public event Action<GameObject> OnPanelChanged;

    private void Awake()
    {
        if (Instance != null && Instance != this)
        {
            Destroy(gameObject);
            return;
        }

        Instance = this;
    }

    private void Start()
    {
        if (transitionController == null)
            transitionController = GetComponent<UITransitionController>();

        ShowPanelInstant(mainMenuPanel);
    }

    public void OpenMainMenu() => NavigateTo(mainMenuPanel);
    public void OpenChatPanel() => NavigateTo(chatPanel);
    public void OpenCharacterList() => NavigateTo(characterListPanel);
    public void OpenUpgradePanel() => NavigateTo(upgradePanel);
    public void OpenVoiceTestPanel() => NavigateTo(voiceTestPanel);
    public void OpenCoursePanel() => NavigateTo(coursePanel);

    public void NavigateTo(GameObject targetPanel, bool recordHistory = true)
    {
        if (targetPanel == null || targetPanel == currentPanel)
            return;

        StartCoroutine(NavigateRoutine(targetPanel, recordHistory));
    }

    public void GoBack()
    {
        if (panelHistory.Count == 0)
            return;

        var previous = panelHistory.Pop();
        StartCoroutine(NavigateRoutine(previous, recordHistory: false));
    }

    public void OpenChatWithTarget(string targetId, string chatFileId)
    {
        NavigateTo(chatPanel);
        chatUIController?.StartConversation(targetId, chatFileId);
    }

    public void PopulateCharacterList(Transform listRoot, GameObject itemPrefab, Action<string> onSelected)
    {
        if (LocalTextDataLoader.Instance == null || listRoot == null || itemPrefab == null)
            return;

        foreach (Transform child in listRoot)
            Destroy(child.gameObject);

        foreach (var character in LocalTextDataLoader.Instance.Characters.characters)
        {
            var item = Instantiate(itemPrefab, listRoot);
            var label = item.GetComponentInChildren<Text>();
            if (label != null)
                label.text = character.displayName;

            var button = item.GetComponent<Button>();
            if (button != null)
            {
                var capturedId = character.id;
                button.onClick.AddListener(() => onSelected?.Invoke(capturedId));
            }
        }
    }

    private IEnumerator NavigateRoutine(GameObject targetPanel, bool recordHistory)
    {
        if (currentPanel != null)
        {
            if (recordHistory)
                panelHistory.Push(currentPanel);

            yield return transitionController.HidePanel(currentPanel);
        }

        currentPanel = targetPanel;
        yield return transitionController.ShowPanel(targetPanel);
        OnPanelChanged?.Invoke(currentPanel);
    }

    private void ShowPanelInstant(GameObject panel)
    {
        if (currentPanel != null && currentPanel != panel)
            currentPanel.SetActive(false);

        currentPanel = panel;
        if (currentPanel != null)
            currentPanel.SetActive(true);
    }
}
