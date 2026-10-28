using UnityEngine;
using System.Collections.Generic;

public class CheckingPlayerAndKill : MonoBehaviour
{
    [Header("Damage Settings")]
    [SerializeField] private float damage = 10000f;
    [SerializeField] private string playerTag = "Player";
    [SerializeField] private string targetTag = "throwedStone";
    
    [Header("Capture Settings")]
    [SerializeField] private int captureLayerOrder = -1;
    [SerializeField] private Transform capturePosition; // Capture position transform
    [SerializeField] private float captureScaleMultiplier = 2f; // Scale multiplier when captured
    
    [Header("Mouth Item Settings")]
    [SerializeField] private GameObject mouthItemPrefab; // Prefab of item originally in mouth
    [SerializeField] private Transform spitOutPosition; // Position where mouth item will be spit out
    [SerializeField] private float spitForce = 5f; // Force applied when spitting out
    
    private List<Collider2D> detectedColliders = new List<Collider2D>();
    
    // Dictionary to store original scales of captured objects
    private Dictionary<Transform, Vector3> originalScales = new Dictionary<Transform, Vector3>();
    
    // Reference to current mouth item instance
    private GameObject currentMouthItem;
    
    void Start()
    {
        // Create initial mouth item if prefab is assigned
        if (mouthItemPrefab != null)
        {
            CreateMouthItem();
        }
    }
    
    void OnTriggerEnter2D(Collider2D other)
    {
        if (other.CompareTag(playerTag))
        {
            if (!detectedColliders.Contains(other))
            {
                detectedColliders.Add(other);
            }

            if (damage != 0)
            {
                PerformAttack();
            }
        }

        if (other.CompareTag(targetTag))
        {
            damage = 0;
            
            // Spit out mouth item before capturing new target
            if (currentMouthItem != null)
            {
                SpitOutMouthItem();
            }
            
            CaptureTarget(other.gameObject);
            targetTag = "DoNothing";
        }
    }
    
    void OnTriggerExit2D(Collider2D other)
    {
        if (other.CompareTag(playerTag))
        {
            if (detectedColliders.Contains(other))
            {
                detectedColliders.Remove(other);
            }
        }
    }
    
    void CreateMouthItem()
    {
        if (mouthItemPrefab != null)
        {
            Vector3 mouthPosition = capturePosition != null ? capturePosition.position : transform.position;
            currentMouthItem = Instantiate(mouthItemPrefab, mouthPosition, Quaternion.identity);
            
            // Disable physics and collider for mouth item
            Rigidbody2D rb = currentMouthItem.GetComponent<Rigidbody2D>();
            if (rb != null)
            {
                rb.simulated = false;
            }
            
            Collider2D col = currentMouthItem.GetComponent<Collider2D>();
            if (col != null)
            {
                col.enabled = false;
            }
            
            // Set mouth item as child and apply capture scale
            Transform parentTransform = capturePosition != null ? capturePosition : transform;
            currentMouthItem.transform.SetParent(parentTransform);
            currentMouthItem.transform.localScale = currentMouthItem.transform.localScale * captureScaleMultiplier;
            
            // Set sorting order
            SpriteRenderer mouthRenderer = currentMouthItem.GetComponent<SpriteRenderer>();
            if (mouthRenderer != null)
            {
                SpriteRenderer basketRenderer = GetComponent<SpriteRenderer>();
                if (basketRenderer != null)
                {
                    mouthRenderer.sortingLayerName = basketRenderer.sortingLayerName;
                    mouthRenderer.sortingOrder = basketRenderer.sortingOrder + captureLayerOrder;
                }
                else
                {
                    mouthRenderer.sortingOrder = captureLayerOrder;
                }
            }
            
            Debug.Log($"Mouth item {currentMouthItem.name} created!");
        }
    }
    
    void SpitOutMouthItem()
    {
        if (currentMouthItem != null)
        {
            // Restore original scale (assuming it was scaled by captureScaleMultiplier)
            currentMouthItem.transform.localScale = currentMouthItem.transform.localScale / captureScaleMultiplier;
            
            // Remove from parent
            currentMouthItem.transform.SetParent(null);
            
            // Set position where to spit out
            Vector3 spitPosition = spitOutPosition != null ? spitOutPosition.position : transform.position + Vector3.right;
            currentMouthItem.transform.position = spitPosition;
            
            // Enable physics and collider
            Rigidbody2D rb = currentMouthItem.GetComponent<Rigidbody2D>();
            if (rb != null)
            {
                rb.simulated = true;
                // Add force to spit out the item
                Vector2 spitDirection = spitOutPosition != null ? 
                    (spitOutPosition.position - transform.position).normalized : Vector2.right;
                rb.AddForce(spitDirection * spitForce, ForceMode2D.Impulse);
            }
            
            Collider2D col = currentMouthItem.GetComponent<Collider2D>();
            if (col != null)
            {
                col.enabled = true;
            }
            
            // Enable all scripts
            MonoBehaviour[] scripts = currentMouthItem.GetComponents<MonoBehaviour>();
            foreach (MonoBehaviour script in scripts)
            {
                script.enabled = true;
            }
            
            // Reset sorting order
            SpriteRenderer renderer = currentMouthItem.GetComponent<SpriteRenderer>();
            if (renderer != null)
            {
                renderer.sortingOrder = 0;
            }
            
            Debug.Log($"Mouth item {currentMouthItem.name} spit out!");
            currentMouthItem = null;
        }
    }
    
    void CaptureTarget(GameObject target)
    {
        MonoBehaviour[] scripts = target.GetComponents<MonoBehaviour>();
        foreach (MonoBehaviour script in scripts)
        {
            script.enabled = false;
        }
        
        Rigidbody2D rb = target.GetComponent<Rigidbody2D>();
        if (rb != null)
        {
            rb.simulated = false;
        }
        
        Collider2D col = target.GetComponent<Collider2D>();
        if (col != null)
        {
            col.enabled = false;
        }
        
        // Store original scale before modifying
        originalScales[target.transform] = target.transform.localScale;
        
        // Apply scale multiplier
        target.transform.localScale = target.transform.localScale * captureScaleMultiplier;
        
        // Use capture position transform if available, otherwise use this object's position
        Vector3 targetPosition = capturePosition != null ? capturePosition.position : transform.position;
        target.transform.position = targetPosition;
        
        SpriteRenderer targetRenderer = target.GetComponent<SpriteRenderer>();
        if (targetRenderer != null)
        {
            SpriteRenderer basketRenderer = GetComponent<SpriteRenderer>();
            if (basketRenderer != null)
            {
                targetRenderer.sortingLayerName = basketRenderer.sortingLayerName;
                targetRenderer.sortingOrder = basketRenderer.sortingOrder + captureLayerOrder;
            }
            else
            {
                targetRenderer.sortingOrder = captureLayerOrder;
            }
        }
        
        // Parent to capture position transform if available, otherwise to this object
        Transform parentTransform = capturePosition != null ? capturePosition : transform;
        target.transform.SetParent(parentTransform);
        
        // Set the captured target as the new mouth item
        currentMouthItem = target;
        
        Debug.Log($"{target.name} captured to basket at position {targetPosition} with scale multiplier {captureScaleMultiplier}!");
    }
    
    public void PerformAttack()
    {
        foreach(var target in GetDetectedColliders())
        {
            IDamgable damgable = target.GetComponent<IDamgable>();

            if (damgable == null)
                continue;

            damgable.TakeDamage(damage, transform);
        }
    }
    
    public List<Collider2D> GetDetectedColliders()
    {
        detectedColliders.RemoveAll(collider => collider == null);
        return detectedColliders;
    }
    
    public void SetDamage(float newDamage)
    {
        damage = newDamage;
    }
    
    public float GetDamage()
    {
        return damage;
    }
    
    public void ReleaseCapturedObjects()
    {
        // Spit out current mouth item
        if (currentMouthItem != null)
        {
            SpitOutMouthItem();
        }
        
        // Get the parent transform where captured objects are stored
        Transform parentToCheck = capturePosition != null ? capturePosition : transform;
        
        for (int i = parentToCheck.childCount - 1; i >= 0; i--)
        {
            Transform child = parentToCheck.GetChild(i);
            
            // Restore original scale
            if (originalScales.ContainsKey(child))
            {
                child.localScale = originalScales[child];
                originalScales.Remove(child); // Clean up dictionary
            }
            
            MonoBehaviour[] scripts = child.GetComponents<MonoBehaviour>();
            foreach (MonoBehaviour script in scripts)
            {
                script.enabled = true;
            }
            
            Rigidbody2D rb = child.GetComponent<Rigidbody2D>();
            if (rb != null)
            {
                rb.simulated = true;
            }
            
            Collider2D col = child.GetComponent<Collider2D>();
            if (col != null)
            {
                col.enabled = true;
            }
            
            SpriteRenderer renderer = child.GetComponent<SpriteRenderer>();
            if (renderer != null)
            {
                renderer.sortingOrder = 0;
            }
            
            child.SetParent(null);
        }
        
        // Recreate mouth item after releasing everything
        if (mouthItemPrefab != null)
        {
            CreateMouthItem();
        }
    }
    
    // Optional: Method to manually spit out mouth item
    public void ManualSpitOut()
    {
        if (currentMouthItem != null)
        {
            SpitOutMouthItem();
            
            // Recreate new mouth item
            if (mouthItemPrefab != null)
            {
                CreateMouthItem();
            }
        }
    }
    
    // Optional: Method to set capture position at runtime
    public void SetCapturePosition(Transform newCapturePosition)
    {
        capturePosition = newCapturePosition;
    }
    
    // Optional: Method to set scale multiplier at runtime
    public void SetCaptureScaleMultiplier(float newMultiplier)
    {
        captureScaleMultiplier = newMultiplier;
    }
    
    // Optional: Method to set spit out position at runtime
    public void SetSpitOutPosition(Transform newSpitOutPosition)
    {
        spitOutPosition = newSpitOutPosition;
    }
}