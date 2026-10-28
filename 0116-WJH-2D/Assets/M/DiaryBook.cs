using UnityEngine;

public class DiaryBook : MonoBehaviour
{
    private void OnMouseDown()
    {
        // 点击日记本，打开日记面板
        GameManager.Instance.OpenDiary();
    }
}