using System.Collections;
using UnityEngine;
using UnityEngine.InputSystem;

/// <summary>
/// Switches the render camera between fixed shot anchors with the Tab key.
/// </summary>
[DisallowMultipleComponent]
public sealed class TabCameraSwitcher : MonoBehaviour
{
    [SerializeField] private Transform[] cameraShots;
    [SerializeField] private float[] fieldOfViews = { 60f, 35f };
    [SerializeField, Min(0f)] private float transitionDuration = 0.6f;

    private Camera outputCamera;
    private Coroutine transition;
    private int currentShotIndex;

    private void Awake()
    {
        outputCamera = GetComponent<Camera>();
    }

    private void Start()
    {
        if (cameraShots.Length > 0 && cameraShots[0] != null)
        {
            ApplyImmediately(cameraShots[0]);
        }
    }

    private void Update()
    {
        if (Keyboard.current != null && Keyboard.current.tabKey.wasPressedThisFrame && cameraShots.Length > 1)
        {
            SwitchTo((currentShotIndex + 1) % cameraShots.Length);
        }
    }

    public void SwitchTo(int shotIndex)
    {
        if (shotIndex < 0 || shotIndex >= cameraShots.Length || cameraShots[shotIndex] == null)
        {
            return;
        }

        currentShotIndex = shotIndex;
        if (transition != null)
        {
            StopCoroutine(transition);
        }

        transition = StartCoroutine(TransitionTo(cameraShots[shotIndex]));
    }

    private void ApplyImmediately(Transform shot)
    {
        transform.SetPositionAndRotation(shot.position, shot.rotation);
        outputCamera.fieldOfView = GetFieldOfView(currentShotIndex);
    }

    private IEnumerator TransitionTo(Transform targetShot)
    {
        if (transitionDuration <= 0f)
        {
            ApplyImmediately(targetShot);
            yield break;
        }

        var startPosition = transform.position;
        var startRotation = transform.rotation;
        var startFov = outputCamera.fieldOfView;
        var targetFov = GetFieldOfView(currentShotIndex);
        var elapsed = 0f;

        while (elapsed < transitionDuration)
        {
            elapsed += Time.unscaledDeltaTime;
            var progress = Mathf.SmoothStep(0f, 1f, elapsed / transitionDuration);
            transform.SetPositionAndRotation(
                Vector3.Lerp(startPosition, targetShot.position, progress),
                Quaternion.Slerp(startRotation, targetShot.rotation, progress));
            outputCamera.fieldOfView = Mathf.Lerp(startFov, targetFov, progress);
            yield return null;
        }

        ApplyImmediately(targetShot);
        transition = null;
    }

    private float GetFieldOfView(int shotIndex)
    {
        if (shotIndex >= 0 && shotIndex < cameraShots.Length && cameraShots[shotIndex] != null
            && cameraShots[shotIndex].TryGetComponent<FixedCameraShot>(out var fixedCameraShot))
        {
            return fixedCameraShot.fieldOfView;
        }

        return shotIndex >= 0 && shotIndex < fieldOfViews.Length
            ? fieldOfViews[shotIndex]
            : outputCamera.fieldOfView;
    }
}
