using System.Collections;
using UnityEngine;

public class LightSwitchTrigger : MonoBehaviour
{
    private bool isPlayer = false;

    private Light[] lights;
    [SerializeField]
    private BoxCollider boxCollider;
    public float transitionDuration = 1.0f;
    private float[] targetAngles = new float[] { 15.6f, 37.5f };

    void Start()
    {
        if (transform.childCount >= 2)
        {
            lights = new Light[2];
            for (int i = 0; i < 2; i++)
            {
                var child = transform.GetChild(i).gameObject;
                lights[i] = child.GetComponent<Light>();
                child.SetActive(false);
            }
        }
        else
        {
            Debug.LogWarning("需要至少两个子物体，每个包含一个 Light 组件");
        }
        var childCollider = transform.GetChild(2).gameObject;
        boxCollider = childCollider.GetComponent<BoxCollider>();
        // Initialize collider size
        boxCollider.size = new Vector3(0.1f, 0.1f, 0.1f);
    }

    void Update()
    {
        if (isPlayer && Input.GetKeyDown(KeyCode.L))
        {
            for (int i = 0; i < lights.Length; i++)
            {
                lights[i].gameObject.SetActive(true);
                lights[i].innerSpotAngle = 0f;
                lights[i].spotAngle = 0f;
                StartCoroutine(GrowLightAngle(lights[i], targetAngles[i]));
            }
        }
    }

    private IEnumerator GrowLightAngle(Light light, float target)
    {
        float time = 0f;
        Vector3 initialSize = new Vector3(0.1f, 0.1f, 0.1f);
        Vector3 targetSize = new Vector3(5f, 5f, 5f);

        while (time < transitionDuration)
        {
            time += Time.deltaTime;
            float t = time / transitionDuration;
            float angle = Mathf.Lerp(0f, target, t);
            light.innerSpotAngle = angle;
            light.spotAngle = angle;
            boxCollider.size = Vector3.Lerp(initialSize, targetSize, t);
            
            yield return null;
        }

        light.innerSpotAngle = target;
        light.spotAngle = target;
        boxCollider.size = targetSize;
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            isPlayer = true;
            Debug.Log("ui-按L电灯");
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("Player"))
            isPlayer = false;
    }
}