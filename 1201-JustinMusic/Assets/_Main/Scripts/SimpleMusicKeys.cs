using UnityEngine;

public class SimpleMusicKeys : MonoBehaviour
{
    public AudioSource audioSource;

    public AudioClip doClip;
    public AudioClip reClip;
    public AudioClip miClip;
    public AudioClip faClip;
    public AudioClip soClip;

    public GameObject animatedObject; 

    private float lastKeyPressTime = -Mathf.Infinity; 

    void Update()
    {
        bool keyPressed = false; 

        if (Input.GetKeyDown(KeyCode.UpArrow))
        {
            Play(doClip);
            keyPressed = true;
        }

        if (Input.GetKeyDown(KeyCode.DownArrow))
        {
            Play(reClip);
            keyPressed = true;
        }

        if (Input.GetKeyDown(KeyCode.LeftArrow))
        {
            Play(miClip);
            keyPressed = true;
        }

        if (Input.GetKeyDown(KeyCode.RightArrow))
        {
            Play(faClip);
            keyPressed = true;
        }

        if (Input.GetKeyDown(KeyCode.Space))
        {
            Play(soClip);
            keyPressed = true;
        }

        if (keyPressed)
        {
            if (animatedObject != null)
            {
                animatedObject.SetActive(true);
            }
            lastKeyPressTime = Time.time;
        }

        if (Time.time - lastKeyPressTime > 1f && animatedObject != null && animatedObject.activeSelf)
        {
            animatedObject.SetActive(false);
        }
    }

    void Play(AudioClip clip)
    {
        audioSource.clip = clip;
        audioSource.Play();
    }
}