using UnityEngine;
using UnityEngine.UI;

public class UI_Options : MonoBehaviour
{
    private Player player;

    private void Start()
    {
        player = FindFirstObjectByType<Player>();

    }

}