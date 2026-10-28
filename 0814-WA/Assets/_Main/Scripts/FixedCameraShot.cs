using UnityEngine;

/// <summary>
/// A fixed camera pose. Move or rotate this GameObject to compose the shot.
/// </summary>
public sealed class FixedCameraShot : MonoBehaviour
{
    [Min(1f)] public float fieldOfView = 60f;
}
