using UnityEngine;

public class SeasonPortal : MonoBehaviour
{
    public EndlessParkourGenerator.Season targetSeason;
    private bool hasTriggered = false;

    private void Reset()
    {
        // 自动尝试把 collider 设为 Trigger（仅在编辑器中生效）
#if UNITY_EDITOR
        Collider c = GetComponent<Collider>();
        if (c == null)
        {
            gameObject.AddComponent<BoxCollider>().isTrigger = true;
        }
        else
        {
            c.isTrigger = true;
        }
#endif
    }

    private void OnTriggerEnter(Collider other)
    {
        if (hasTriggered) return;

        // 依赖 Player 贴上 Tag("Player")
        if (other.CompareTag("Player"))
        {
            hasTriggered = true;
            EndlessParkourGenerator generator = FindObjectOfType<EndlessParkourGenerator>();
            if (generator != null)
            {
                generator.SwitchSeason(targetSeason);
            }
            else
            {
                Debug.LogError("SeasonPortal: 场景中找不到 EndlessParkourGenerator！");
            }

            // 加个短延迟再销毁，以便触发音效/粒子
            Destroy(gameObject, 0.1f);
        }
    }
}