using UnityEngine;

public class PlayerBlock : MonoBehaviour
{
    [Header("Key Settings")]
    public KeyCode blockKey = KeyCode.T;         // Key to block
    public KeyCode cancelBlockKey = KeyCode.Y;   // Key to cancel block
    public float perfectBlockDuration = 0.3f;    // Duration window for perfect block
    public float blockCooldown = 1f;             // Cooldown between blocks

    [Header("States")]
    [SerializeField] private bool isBlocking = false;          // Is currently blocking
    [SerializeField] private bool isPerfectBlocking = false;   // Is in perfect block state

    [Header("References")]
    public MonoBehaviour playerMovementScript;   // Reference to player movement script

    private float blockStartTime;   // Time when block started
    private float lastBlockTime;    // Last time block was used
    private bool canBlock = true;   // Whether blocking is allowed

    public bool IsBlocking => isBlocking;
    public bool IsPerfectBlocking => isPerfectBlocking;

    void Update()
    {
        HandleBlockInput();
        UpdatePerfectBlockState();
    }

    // Handle input keys
    void HandleBlockInput()
    {
        if ((Input.GetKeyDown(blockKey)) && canBlock && Time.time - lastBlockTime >= blockCooldown)
        {
            StartBlocking();
        }

        if ((Input.GetKeyDown(cancelBlockKey)) && isBlocking)
        {
            StopBlocking();
        }
    }

    // Start blocking
    void StartBlocking()
    {
        isBlocking = true;
        isPerfectBlocking = true;
        blockStartTime = Time.time;

        // Disable movement script
        if (playerMovementScript != null)
        {
            playerMovementScript.enabled = false;
        }
    }

    // Stop blocking
    void StopBlocking()
    {
        isBlocking = false;
        isPerfectBlocking = false;
        lastBlockTime = Time.time;

        // Re-enable movement script
        if (playerMovementScript != null)
        {
            playerMovementScript.enabled = true;
        }
    }

    // Update perfect block state
    void UpdatePerfectBlockState()
    {
        if (isBlocking && Time.time - blockStartTime > perfectBlockDuration)
        {
            isPerfectBlocking = false;
        }
    }

    /// <summary>
    /// Process attack: return damage multiplier
    /// 1f = Not blocking, full damage
    /// 0f = Perfect block, no damage
    /// 0.5f = Normal block, reduced damage
    /// </summary>
    public float ProcessAttack()
    {
        if (!isBlocking) return 1f;

        if (isPerfectBlocking)
        {
            StopBlocking();
            return 0f;
        }
        else
        {
            StopBlocking();
            return 0.5f;
        }
    }
}
