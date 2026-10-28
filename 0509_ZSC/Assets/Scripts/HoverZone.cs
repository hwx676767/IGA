using UnityEngine;

public class HoverZone : MonoBehaviour
{
    private void OnTriggerEnter2D(Collider2D other)
    {
        if (other.CompareTag("Player"))
        {
            // Use current object's Y position as hover height
            other.GetComponent<PlayerController>().EnterHoverZone(transform.position.y);
        }
    }

    private void OnTriggerExit2D(Collider2D other)
    {
        if (other.CompareTag("Player"))
        {
            other.GetComponent<PlayerController>().ExitHoverZone();
        }
    }

    // Visualize hover height with a horizontal line
    private void OnDrawGizmos()
    {
        Gizmos.color = Color.cyan;
        Gizmos.DrawLine(
            new Vector3(transform.position.x - 2f, transform.position.y, 0),
            new Vector3(transform.position.x + 2f, transform.position.y, 0)
        );
    }
}