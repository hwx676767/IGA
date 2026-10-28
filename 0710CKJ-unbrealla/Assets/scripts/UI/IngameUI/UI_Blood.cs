using UnityEngine;
using UnityEngine.UI;

public class UI_Blood : MonoBehaviour
{
    [SerializeField] private Image imageA;
    [SerializeField] private Image imageB;
    [SerializeField] private bool showImageA = true;

    private void Awake()
    {
        UpdateImageDisplay();
    }

    public void SetImageState(bool showA)
    {
        showImageA = showA;
        UpdateImageDisplay();
    }

    public void ToggleImage()
    {
        showImageA = !showImageA;
        UpdateImageDisplay();
    }

    private void UpdateImageDisplay()
    {
        if (imageA != null)
            imageA.gameObject.SetActive(showImageA);
            
        if (imageB != null)
            imageB.gameObject.SetActive(!showImageA);
    }

    // Optional: Update in inspector when value changes
    private void OnValidate()
    {
        if (Application.isPlaying)
            UpdateImageDisplay();
    }
}