using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class CollectManager : MonoBehaviour
{
    //单例模式
    
    private int count = 0;
    public Text countText;
    
    // Start is called before the first frame update
    void Start()
    {
        countText.text = count.ToString();
    }

    public void Collect(int scroll)
    {
        count += scroll;
        UpdateUI();
    }

    private void UpdateUI()
    {
        countText.text = count.ToString();
    }
}
