using UnityEngine;

public class MemoryItem : MonoBehaviour
{
    [Header("物品名称")]
    public string itemName;

    [Header("是否已收纳")]
    public bool collected = false;

    [Header("飞入箱子速度")]
    public float moveSpeed = 5f;

    private Transform targetBox;

    private bool isMoving = false;

    private void Update()
    {
        if (isMoving && targetBox != null)
        {
            transform.position = Vector3.Lerp(
                transform.position,
                targetBox.position,
                Time.deltaTime * moveSpeed
            );

            transform.localScale = Vector3.Lerp(
                transform.localScale,
                Vector3.zero,
                Time.deltaTime * moveSpeed
            );

            // move to box
            if (Vector3.Distance(transform.position, targetBox.position) < 0.1f)
            {
                FinishCollect();
            }
        }
    }

    public void Collect(Transform box)
    {
        if (collected) return;

        collected = true;

        targetBox = box;

        isMoving = true;

        Collider col = GetComponent<Collider>();
        if (col != null)
            col.enabled = false;
    }

    void FinishCollect()
    {
        isMoving = false;
        Debug.Log(itemName + " put inside already");
        Destroy(gameObject);
    }
}