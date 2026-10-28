/*========================================================
 * CharacterButton.cs
 * 挂在每个角色按钮上
 * 点击后更新公用UI
 ========================================================*/
using UnityEngine;
using UnityEngine.UI;

[RequireComponent(typeof(Button))]
public class CharacterButton : MonoBehaviour
{
    public CharacterData characterData;

    private Button button;

    private void Start()
    {
        button = GetComponent<Button>();
        button.onClick.AddListener(OnButtonClick);
    }

    private void OnButtonClick()
    {
        if (CharacterUIManager.Instance != null)
        {
            CharacterUIManager.Instance.UpdateUI(characterData);
        }
    }
}