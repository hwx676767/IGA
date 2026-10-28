using System.Collections;
using UnityEngine;

public class Throwable : MonoBehaviour
{
    [Header("Throw Settings")]
    [SerializeField] private float throwForceMultiplier = 100f;
    [SerializeField] private float maxThrowForce = 500f;
    [SerializeField] private Camera targetCamera;
    
    [Header("Arrow")]
    [SerializeField] private float arrowLength = 2f;
    [SerializeField] private Color arrowColor = Color.red;
    
    [Header("Collider Settings")]
    [SerializeField] private CircleCollider2D physicsCollider;  // Physics collision
    [SerializeField] private CircleCollider2D clickCollider;    // Click detection
    
    private Vector3 throwVector;
    private Rigidbody2D rb;
    private LineRenderer lr;
    public bool isDragging = false;        // Currently dragging
    public bool hasBeenDragged = false;    // Has ever been dragged (permanent record)
    private bool isFloating = false;        // Whether in floating state
    private bool isThrown = false;          // Whether has been thrown
    
    // Player reference for floating state
    private Player ownerPlayer;
    
    void Awake()
    {
        rb = GetComponent<Rigidbody2D>();
        lr = GetComponent<LineRenderer>();
        //Debug.Log("stone awake");
        
        // Auto-detect colliders
        CircleCollider2D[] colliders = GetComponents<CircleCollider2D>();
        
        foreach (var col in colliders)
        {
            if (col.isTrigger)
                clickCollider = col;  // Trigger for click detection
            else
                physicsCollider = col;  // Non-trigger for physics
        }
        
        // Auto-get camera
        if (targetCamera == null)
        {
            targetCamera = Camera.main;
        }
    }
    
    void Start()
    {
        // If not in floating state, enable physics
        if (!isFloating)
        {
            EnablePhysics();
        }
    }
    
    void Update()
    {
        // Only handle mouse input in floating state
        if (!isFloating || targetCamera == null) return;
        
        HandleMouseInput();
    }
    
    void HandleMouseInput()
    {
        Vector3 mouseWorldPos = targetCamera.ScreenToWorldPoint(Input.mousePosition);
        mouseWorldPos.z = transform.position.z;
        
        // Check if mouse is over click collider
        bool mouseOverClickArea = clickCollider.OverlapPoint(mouseWorldPos);
        
        // Mouse down
        if (Input.GetMouseButtonDown(0) && mouseOverClickArea)
        {
            isDragging = true;
            hasBeenDragged = true; // Mark as dragged once clicked
            CalculateThrowVector();
            SetArrow();
            Debug.Log("Start dragging floating ball");
        }
        
        // Mouse drag
        if (isDragging && Input.GetMouseButton(0))
        {
            CalculateThrowVector();
            SetArrow();
        }
        
        // Mouse up
        if (isDragging && Input.GetMouseButtonUp(0))
        {
            isDragging = false;
            RemoveArrow();
            
            if (ownerPlayer != null)
            {
                Debug.Log("ownerPlayer");
                ownerPlayer.OnBallThrown(); // Player will change to ThrowState2
            }
            
            // Immediately throw the ball and notify player to change state
            PerformThrow();
            
            Debug.Log("Ball thrown immediately on mouse release");
        }
    }
    
    void CalculateThrowVector()
    {
        Vector3 mousePos = targetCamera.ScreenToWorldPoint(Input.mousePosition);
        mousePos.z = transform.position.z; // Ensure z-axis consistency
        
        Vector2 distance = mousePos - transform.position;
        
        // Limit maximum throw force
        float magnitude = Mathf.Clamp(distance.magnitude * throwForceMultiplier, 0f, maxThrowForce);
        throwVector = -distance.normalized * magnitude;
    }
    
    void SetArrow()
    {
        if (lr == null) return;
        
        lr.positionCount = 2;
        lr.SetPosition(0, Vector3.zero);
        lr.SetPosition(1, throwVector.normalized * arrowLength);
        lr.enabled = true;
    }
    
    void RemoveArrow()
    {
        if (lr != null)
            lr.enabled = false;
    }
    
    public void Throw()
    {
        if (rb != null)
        {
            rb.AddForce(throwVector);
        }
    }
    
    // Set to floating mode (called by Player)
    public void SetFloatingMode(Player player)
    {
        ownerPlayer = player;
        isFloating = true;
        isThrown = false;
        hasBeenDragged = false; // Reset drag state
        
        // Disable physics for floating
        DisablePhysics();
        
        Debug.Log("Ball set to floating mode");
    }
    
    // Disable physics (floating state)
    void DisablePhysics()
    {
        if (rb != null)
        {
            rb.simulated = false;
        }
        
        if (physicsCollider != null)
        {
            physicsCollider.enabled = false;
        }
    }
    
    // Enable physics (normal state)
    void EnablePhysics()
    {
        if (rb != null)
        {
            rb.simulated = true;
        }
        
        if (physicsCollider != null)
        {
            physicsCollider.enabled = true;
        }
    }
    
    // Perform throw
    public void PerformThrow()
    {
        if (isThrown) return;
        
        isFloating = false;
        isThrown = true;
        ownerPlayer = null; // Clear player reference, ball is now independent
        
        EnablePhysics();
        Throw();
        
        Debug.Log("Ball thrown!");
    }
    
    // Public method for Player to check drag status
    public bool HasBeenDragged()
    {
        return hasBeenDragged;
    }
    
    // Unity 6 recommended camera null check
    void OnValidate()
    {
        if (targetCamera == null && Application.isPlaying)
            targetCamera = Camera.main;
    }
}