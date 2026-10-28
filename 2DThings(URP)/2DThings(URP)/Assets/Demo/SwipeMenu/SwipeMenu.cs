using UnityEngine;
using UnityEngine.UI;

public class SwipeMenu : MonoBehaviour
{
    public GameObject scrollbar;
    float scroll_pos = 0;
    float[] pos;
    float distance;

    private void Start()
    {
        // Initialize the pos array and calculate distance
        int childCount = transform.childCount;
        pos = new float[childCount];
        distance = 1f / (childCount - 1f);

        for (int i = 0; i < pos.Length; i++)
        {
            pos[i] = distance * i;
        }
    }

    private void Update()
    {
        Scrollbar scrollbarComponent = scrollbar.GetComponent<Scrollbar>();
        float scrollbarValue = scrollbarComponent.value;

        if (Input.GetMouseButtonDown(0))
        {
            scroll_pos = scrollbarValue; // Record the current scrollbar position
        }

        if (Input.GetMouseButtonUp(0))
        {
            // Find the closest target position
            float closestPos = pos[0];
            float minDistance = Mathf.Abs(scrollbarValue - pos[0]);

            for (int i = 1; i < pos.Length; i++)
            {
                float currentDistance = Mathf.Abs(scrollbarValue - pos[i]);
                if (currentDistance < minDistance)
                {
                    minDistance = currentDistance;
                    closestPos = pos[i];
                }
            }

            // Smoothly move to the closest position
            scrollbarComponent.value = Mathf.Lerp(scrollbarValue, closestPos, 0.1f);
        }
    }
}
