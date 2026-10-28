using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class NPCGenerator : MonoBehaviour
{
    public List<GameObject> npcPrefabs;
    public Transform spawnPoint; 
    public Transform targetPoint; 
    public float spawnInterval = 30f; 
    public int maxNPCs = 5; 

    private List<GameObject> activeNPCs = new List<GameObject>(); // Store currently active NPCs
    private bool isSpawning = false; 

    void Start()
    {
        StartCoroutine(SpawnNPCs());
    }

    IEnumerator SpawnNPCs()
    {
        while (true)
        {
            if (activeNPCs.Count < maxNPCs && !isSpawning)
            {
                isSpawning = true;

                GameObject npcPrefab = npcPrefabs[Random.Range(0, npcPrefabs.Count)];

                GameObject npc = Instantiate(npcPrefab, spawnPoint.position, Quaternion.identity);
                activeNPCs.Add(npc);

                NPCMovement npcMovement = npc.GetComponent<NPCMovement>();
                if (npcMovement != null)
                {
                    npcMovement.Initialize(spawnPoint.position, targetPoint.position);
                    npcMovement.OnNPCDestroyed += HandleNPCDestroyed; // Subscribe to NPC destroyed event
                }

                yield return new WaitForSeconds(spawnInterval);
                isSpawning = false;
            }

            yield return null;
        }
    }

    // Handle NPC destroyed event
    private void HandleNPCDestroyed(GameObject npc)
    {
        if (activeNPCs.Contains(npc))
        {
            activeNPCs.Remove(npc);
        }
    }

    // Remove NPC (e.g., when NPC completes its task)
    public void RemoveNPC(GameObject npc)
    {
        if (activeNPCs.Contains(npc))
        {
            activeNPCs.Remove(npc);
            Destroy(npc);
        }
    }
}