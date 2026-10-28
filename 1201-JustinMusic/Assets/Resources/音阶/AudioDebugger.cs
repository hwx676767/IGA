using UnityEngine;

public class AudioDebugger : MonoBehaviour
{
    void Start()
    {
        AudioSource audioSource = GetComponent<AudioSource>();
        
        Debug.Log("AudioClip: " + (audioSource.clip != null));
        Debug.Log("Is Playing: " + audioSource.isPlaying);
        Debug.Log("Volume: " + audioSource.volume);
        Debug.Log("Mute: " + audioSource.mute);
        Debug.Log("Enabled: " + audioSource.enabled);
        
        // 强制测试播放
        audioSource.Play();
        Debug.Log("After Play - Is Playing: " + audioSource.isPlaying);
    }
}