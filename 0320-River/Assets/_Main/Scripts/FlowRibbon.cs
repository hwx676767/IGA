using UnityEngine;

[RequireComponent(typeof(LineRenderer))]
public class FlowRibbon : MonoBehaviour
{
    public int pointCount = 30;

    public float length = 20f;

    public float width = 0.5f;

    public float waveAmplitude = 0.3f;

    public float waveFrequency = 1f;

    public float flowSpeed = 2f;

    private LineRenderer line;

    void Start()
    {
        line = GetComponent<LineRenderer>();

        line.positionCount = pointCount;
        line.startWidth = width;
        line.endWidth = width;
    }

    void Update()
    {
        for (int i = 0; i < pointCount; i++)
        {
            float t = (float)i / (pointCount - 1);

            float z = t * length;

            float x =
                Mathf.Sin(
                    Time.time * flowSpeed +
                    z * waveFrequency
                ) * waveAmplitude;

            line.SetPosition(
                i,
                new Vector3(x, 0, z)
            );
        }

        line.material.mainTextureOffset +=
            new Vector2(Time.deltaTime * flowSpeed, 0);
    }
}