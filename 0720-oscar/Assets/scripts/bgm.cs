using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class bgm : MonoBehaviour
{
    public AudioSource background_music;
    public static bgm Instance;
    public bool musicIsPlaying = true;
    void Awake()
    {
        if (Instance == null)
        {
            Instance = this;
            DontDestroyOnLoad(gameObject); // Optional: Keep music across scenes
        }
        else
        {
            Destroy(gameObject); // Prevent duplicates
        }
    }
    // Start is called before the first frame update
    void Start()
    {
        background_music.Play();
    }

    // Update is called once per frame
    void Update()
    {
        if (!musicIsPlaying && background_music.isPlaying)
        {
            background_music.Stop();
        }
    }
}
