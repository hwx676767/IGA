using UnityEngine;
using TMPro;
using System.Collections;

public class TaskObjectivePoint : MonoBehaviour
{
    [Header("组件引用")]
    [SerializeField] private AudioSource audioSource;
    [SerializeField] private TMP_Text interactionText;
    [SerializeField] private Collider triggerCollider;

    [Header("交互设置")]
    [SerializeField] private KeyCode interactionKey = KeyCode.E;
    [SerializeField] private string interactionPrompt = "按 E 收集";

    [Header("声音设置")]
    [SerializeField] private float fadeOutDuration = 1f;
    [SerializeField] private float initialVolume = 0.8f;

    private bool isPlayerInRange = false;
    private bool isFading = false;

    private void Start()
    {
        if (audioSource != null)
        {
            audioSource.volume = initialVolume;
            audioSource.Play();
        }

        if (interactionText != null)
            interactionText.enabled = false;
    }

    private void Update()
    {
        if (isPlayerInRange && Input.GetKeyDown(interactionKey) && !isFading)
        {
            Interact();
        }
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            isPlayerInRange = true;
            if (interactionText != null)
            {
                interactionText.text = interactionPrompt;
                interactionText.enabled = true;
            }
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            isPlayerInRange = false;
            if (interactionText != null)
                interactionText.enabled = false;
        }
    }

    private void Interact()
    {
        if (audioSource != null && audioSource.isPlaying)
        {
            isFading = true;
            StartCoroutine(FadeOutAudio(fadeOutDuration));
        }
        else
        {
            CompleteObjective();
        }
    }

    IEnumerator FadeOutAudio(float duration)
    {
        float startVolume = audioSource.volume;
        float timer = 0f;

        while (timer < duration)
        {
            audioSource.volume = Mathf.Lerp(startVolume, 0f, timer / duration);
            timer += Time.deltaTime;
            yield return null;
        }

        audioSource.Stop();
        CompleteObjective();
    }

    private void CompleteObjective()
    {
        if (triggerCollider != null)
            triggerCollider.enabled = false;

        if (interactionText != null)
            interactionText.enabled = false;

        OnObjectiveCompleted();
        Destroy(gameObject);
    }

    protected virtual void OnObjectiveCompleted()
    {
        Debug.Log("任务目标已完成");
    }
}