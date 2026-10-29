using UnityEngine;

public class KeyPressSoundPlayer : MonoBehaviour
{
    [Header("音效设置")]
    [SerializeField] private AudioClip pressSound;
    [SerializeField][Range(0f, 1f)] private float volume = 0.8f;
    [SerializeField] private KeyCode keyToPress = KeyCode.E;
    [SerializeField] private bool destroyAfterPlay = false;

    private AudioSource audioSource;

    private void Start()
    {
        // 确保有AudioSource组件
        if (!TryGetComponent(out audioSource))
        {
            audioSource = gameObject.AddComponent<AudioSource>();
            audioSource.playOnAwake = false;
        }
    }

    private void Update()
    {
        // 检查按键并播放音效
        if (Input.GetKeyDown(keyToPress))
        {
            PlaySound();
        }
    }

    public void PlaySound()
    {
        if (pressSound != null)
        {
            audioSource.PlayOneShot(pressSound, volume);

            if (destroyAfterPlay)
                Destroy(gameObject, pressSound.length);
        }
    }
}