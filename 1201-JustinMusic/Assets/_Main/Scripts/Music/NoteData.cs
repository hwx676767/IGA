using UnityEngine;
using UnityEngine.UI;

public class NoteData : MonoBehaviour
{
    public NoteDirection direction;

    public Sprite upSprite;
    public Sprite downSprite;
    public Sprite leftSprite;
    public Sprite rightSprite;
    public Sprite circleSprite;

    private Image image;

    void Awake()
    {
        image = GetComponent<Image>();
    }

    void Start()
    {
        switch (direction)
        {
            case NoteDirection.Up:
                image.sprite = upSprite; break;
            case NoteDirection.Down:
                image.sprite = downSprite; break;
            case NoteDirection.Left:
                image.sprite = leftSprite; break;
            case NoteDirection.Right:
                image.sprite = rightSprite; break;
            case NoteDirection.Circle:
                image.sprite = circleSprite; break;
        }
    }
}