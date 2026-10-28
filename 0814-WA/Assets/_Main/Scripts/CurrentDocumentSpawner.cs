using System.Collections;
using UnityEngine;
using UnityEngine.InputSystem;

/// <summary>
/// Creates the document prefab at the named world-space document position.
/// </summary>
public sealed class CurrentDocumentSpawner : MonoBehaviour
{
    [SerializeField] private CurrentDocumentView documentPrefab;
    [SerializeField] private Transform currentDocumentPosition;
    [SerializeField] private Transform checkDocumentPosition;
    [SerializeField] private Transform zhangPosition;
    [SerializeField] private Vector3 documentRotationOffset = new(90f, 90f, 0f);
    [SerializeField, Min(0f)] private float moveDuration = 0.7f;
    [Header("Stamp Animation")]
    [SerializeField, Min(0f)] private float stampTravelDuration = 0.7f;
    [SerializeField, Min(0f)] private float stampPressDuration = 0.25f;
    [SerializeField, Min(0f)] private float stampRevealDuration = 0.3f;
    [SerializeField, Min(0f)] private float stampApproachDistance = 0.09f;
    [SerializeField] private bool spawnOnStart;

    public CurrentDocumentView CurrentDocument { get; private set; }
    private Coroutine moveRoutine;
    private Coroutine stampRoutine;

    private void Start()
    {
        if (spawnOnStart)
        {
            SpawnDocument();
        }
    }

    private void Update()
    {
        if (Keyboard.current == null)
        {
            return;
        }

        if (Keyboard.current.digit1Key.wasPressedThisFrame)
        {
            SpawnDocument();
        }

        if (Keyboard.current.cKey.wasPressedThisFrame)
        {
            MoveCurrentDocumentToCheckPosition();
        }
    }

    public CurrentDocumentView SpawnDocument()
    {
        if (documentPrefab == null || currentDocumentPosition == null)
        {
            Debug.LogWarning("Document prefab or CurrentDocumentPosition is not assigned.", this);
            return null;
        }

        if (CurrentDocument != null)
        {
            Destroy(CurrentDocument.gameObject);
        }

        CurrentDocument = Instantiate(
            documentPrefab,
            currentDocumentPosition.position,
            GetDocumentRotation(currentDocumentPosition));
        return CurrentDocument;
    }

    public void MoveCurrentDocumentToCheckPosition()
    {
        if (CurrentDocument == null || checkDocumentPosition == null)
        {
            return;
        }

        if (moveRoutine != null)
        {
            StopCoroutine(moveRoutine);
        }

        moveRoutine = StartCoroutine(MoveDocument());
    }

    public void StampWith(int stampIndex, Transform stampTransform)
    {
        if (CurrentDocument == null || zhangPosition == null || stampTransform == null || stampRoutine != null)
        {
            return;
        }

        stampRoutine = StartCoroutine(StampRoutine(stampIndex, stampTransform));
    }

    private IEnumerator MoveDocument()
    {
        if (moveDuration <= 0f)
        {
            CurrentDocument.transform.SetPositionAndRotation(
                checkDocumentPosition.position,
                GetDocumentRotation(checkDocumentPosition));
            yield break;
        }

        var documentTransform = CurrentDocument.transform;
        var startPosition = documentTransform.position;
        var startRotation = documentTransform.rotation;
        var elapsed = 0f;

        while (elapsed < moveDuration)
        {
            elapsed += Time.unscaledDeltaTime;
            var progress = Mathf.SmoothStep(0f, 1f, elapsed / moveDuration);
            documentTransform.SetPositionAndRotation(
                Vector3.Lerp(startPosition, checkDocumentPosition.position, progress),
                Quaternion.Slerp(startRotation, GetDocumentRotation(checkDocumentPosition), progress));
            yield return null;
        }

        documentTransform.SetPositionAndRotation(
            checkDocumentPosition.position,
            GetDocumentRotation(checkDocumentPosition));
        moveRoutine = null;
    }

    private Quaternion GetDocumentRotation(Transform position)
    {
        return position.rotation * Quaternion.Euler(documentRotationOffset);
    }

    private IEnumerator StampRoutine(int stampIndex, Transform stampTransform)
    {
        var homePosition = stampTransform.position;
        var homeRotation = stampTransform.rotation;
        var surfaceNormal = CurrentDocument.DocumentImage.transform.forward;
        var approachPosition = zhangPosition.position + surfaceNormal * stampApproachDistance;

        yield return MoveTransform(stampTransform, approachPosition, homeRotation, stampTravelDuration);
        yield return MoveTransform(stampTransform, zhangPosition.position, homeRotation, stampPressDuration);
        yield return CurrentDocument.RevealStamp(stampIndex, stampRevealDuration);
        yield return MoveTransform(stampTransform, approachPosition, homeRotation, stampPressDuration);
        yield return MoveTransform(stampTransform, homePosition, homeRotation, stampTravelDuration);
        stampRoutine = null;
    }
    private static IEnumerator MoveTransform(Transform target, Vector3 destination, Quaternion rotation, float duration)
    {
        if (duration <= 0f)
        {
            target.SetPositionAndRotation(destination, rotation);
            yield break;
        }

        var startPosition = target.position;
        var startRotation = target.rotation;
        var elapsed = 0f;
        while (elapsed < duration)
        {
            elapsed += Time.unscaledDeltaTime;
            var progress = Mathf.SmoothStep(0f, 1f, elapsed / duration);
            target.SetPositionAndRotation(
                Vector3.Lerp(startPosition, destination, progress),
                Quaternion.Slerp(startRotation, rotation, progress));
            yield return null;
        }

        target.SetPositionAndRotation(destination, rotation);
    }
}
