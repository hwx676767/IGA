using UnityEngine;

public class OnlyShadow : MonoBehaviour
{
    void Start()
    {
        GetComponent<Renderer>().shadowCastingMode = UnityEngine.Rendering.ShadowCastingMode.ShadowsOnly;
    }
}
