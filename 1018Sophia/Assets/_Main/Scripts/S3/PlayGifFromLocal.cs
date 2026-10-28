using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using UnityEngine.UI;

public class PlayGifFromLocal : MonoBehaviour
{
    [Tooltip("相对于项目的路径，例如: Assets/Gif/test.gif")]
    public string gifFilePath = "Assets/Gif/test.gif";

    [SerializeField]private RawImage rawImage;
    private Coroutine playCoroutine;

    IEnumerator Start()
    {
        /*
        rawImage = GetComponent<RawImage>();
        if (rawImage == null)
        {
            Debug.LogError("需要 RawImage 组件");
            yield break;
        }*/

        if (!File.Exists(gifFilePath))
        {
            Debug.LogError("have no GIF: " + gifFilePath);
            yield break;
        }

        byte[] bytes = File.ReadAllBytes(gifFilePath);

        yield return StartCoroutine(UniGif.GetTextureListCoroutine(bytes, 
            delegate(List<UniGif.GifTexture> gifTexList, int loopCount, int width, int height)
        {
            // start
            playCoroutine = StartCoroutine(PlayGif(gifTexList));
        }));
    }

    IEnumerator PlayGif(List<UniGif.GifTexture> gifTexList)
    {
        int index = 0;
        while (true)
        {
            rawImage.texture = gifTexList[index].m_texture2d;
            yield return new WaitForSeconds(gifTexList[index].m_delaySec);
            index = (index + 1) % gifTexList.Count;
        }
    }

    public void StopPlaying()
    {
        if (playCoroutine != null) StopCoroutine(playCoroutine);
    }
}