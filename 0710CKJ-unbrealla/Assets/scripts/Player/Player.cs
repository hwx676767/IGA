using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Player : Entity
{
    public static Player instance;
    public static event Action OnPlayerDeath;
    private UI ui;
    
    #region Jump Control
    [Header("Jump Info")] 
    public float[] jumpForce = { 60,35, 27, 23, 20, 18, 16 };
    public float[] quickFallTimer;
    public float MaxFallSpeed;
    public float InitialMass = 3;
    #endregion

    #region States
    public PlayerState IdleState {get; private set;}
    public PlayerState MoveState {get; private set;}
    public PlayerState JumpState {get; private set;}
    public PlayerState WallState {get; private set;}
    public PlayerState AirState {get; private set;}
    public PlayerGlideState GlideState {get; private set;}
    public PlayerIdle2State Idle2State {get; private set;}
    public PlayerAttack AttackState {get; private set; }
    public PlayerDashState DashState {get; private set;}
    public PlayerParryState ParryState {get; private set;}
    public PlayerDeadState DeadState {get; private set;}
    public PlayerBackPositionState BackPositionState {get; private set;}
    public PlayerDrownState DrownState {get; private set;}
    public PlayerThrowState1 ThrowState1 {get; private set;}
    public PlayerThrowState2 ThrowState2 {get; private set;}
    public PlayerFailThrowState FailThrowState {get; private set;}
    #endregion

    #region Parameters
    [Header("Move Info")]
    public float maxHeight;
    public float weight;
    public float glideSpeed = 1f;
    public float restTimer = 3f;
    public float dashTimer = 0.3f;
    public float dashCooldown = 7f;
    public float dashCooldownTimer = 7f;
    public float dashSpeed = 13f;
    public Vector2 moveInput { get; private set; }
    #endregion
    
    #region Water Detection
    [Header("Water Detection")]
    [SerializeField] private LayerMask waterLayer;
    [SerializeField] private float drownCheckRadius = 0.5f;
    [SerializeField] private float fullSubmergeOffset = 0.8f;
    
    private bool isInWater = false;
    #endregion
    
    #region Throw
    [Header("Throw thing information")]
    [SerializeField] public Transform throwPoint;
    [SerializeField] public GameObject itemPickupPrefab; // Prefab for creating thrown items
    
    // Ball summoning management - HIGHEST PRIORITY
    private GameObject currentSummonedBall;
    private bool isBallSummoned = false;
    #endregion
    
    #region Components
    public PlayerInputSet input { get; private set; }
    public Entity_Health health { get; private set; }
    public Player_Combat combat { get; private set; }
    public Inventory_Player inventory { get; private set; }
    #endregion
    
    public void PlayerTriggerCalled() => StateMachine.CurrentState.CheckTriggerCalled();
    public void TeleportPlayer(Vector3 position) => transform.position = position;
    
    protected override void Awake()
    {
        base.Awake();
        instance = this;
        
        ui = FindAnyObjectByType<UI>();//can't find if the object is not active in the beginning.
        ui.inventoryUI.gameObject.SetActive(false);
        
        input = new PlayerInputSet();
        ui.SetupControlsUI(input);
        
        health = GetComponent<Entity_Health>();
        combat = GetComponent<Player_Combat>();
        inventory = GetComponent<Inventory_Player>();
        
        IdleState = new PlayerIdleState(this, StateMachine, "idle");
        Idle2State = new PlayerIdle2State(this, StateMachine, "idle2");
        MoveState = new PlayerMoveState(this, StateMachine, "move");
        JumpState = new PlayerJumpState(this, StateMachine, "jump");
        AirState = new PlayerAirState(this, StateMachine, "jump");
        GlideState = new PlayerGlideState(this, StateMachine, "glide");
        AttackState = new PlayerAttack(this, StateMachine, "attack");
        DashState = new PlayerDashState(this, StateMachine, "dash");
        ParryState = new PlayerParryState(this, StateMachine, "parry");
        DeadState = new PlayerDeadState(this, StateMachine, "die");
        BackPositionState = new PlayerBackPositionState(this, StateMachine, "back_position");
        DrownState = new PlayerDrownState(this, StateMachine, "drown");
        ThrowState1 = new PlayerThrowState1(this, StateMachine, "throw1");
        ThrowState2 = new PlayerThrowState2(this, StateMachine, "throw2");
        FailThrowState = new PlayerFailThrowState(this, StateMachine, "failthrow");
    }
    
    public override void EntityDeath()
    {
        base.EntityDeath();
        CleanupSummonedBall(); // Clean up ball on death
        OnPlayerDeath?.Invoke();
        StateMachine.ChangeState(DeadState);
    }

    public void OnEnable()
    {
        input.Enable();
        
        input.Player.Move.performed += ctx => moveInput = ctx.ReadValue<Vector2>();
        input.Player.Move.canceled += ctx => moveInput = Vector2.zero;
        
    }

    public void OnDisable()
    {
        input.Disable();
    }

    protected override void Start()
    {
        base.Start();
        
        StateMachine.Initialize(IdleState);
        RigidBody.mass = mass;
    }

    protected override void Update()
    {
        base.Update();
        
        // HIGHEST PRIORITY: Handle ball summoning and management
        if (StateMachine.CurrentState.GetType() == typeof(PlayerIdleState) ||
            StateMachine.CurrentState.GetType() == typeof(PlayerIdle2State))
        {
            HandleBallSummoning();
        }
        
        // Only check drowning state if mass is heavy enough and not already in drown state
        if (mass >= 1f && StateMachine.CurrentState.GetType() != typeof(PlayerDrownState))
        {
            CheckDrowningState();
        }
        
        if (input.Player.Attack.WasPressedThisFrame() && StateMachine.CurrentState.GetType() != typeof(PlayerDrownState))
        {
            StateMachine.ChangeState(AttackState);
        }
        
        else if (!IsGrounded() && RigidBody.linearVelocity.y < 0 && StateMachine.CurrentState.GetType() != typeof(PlayerGlideState) && StateMachine.CurrentState.GetType() != typeof(PlayerAttack) &&
        StateMachine.CurrentState.GetType() != typeof(PlayerDrownState))
        {
            StateMachine.ChangeState(AirState);
        }
    }
    
    private void TryInteract()
    {
        Transform closest = null;
        float closestDistance = Mathf.Infinity;
        Collider2D[] objectsAround = Physics2D.OverlapCircleAll(transform.position, 1f);

        foreach (var target in objectsAround)
        {
            IInteractable interactable = target.GetComponent<IInteractable>();
            if (interactable == null) continue;

            float distance = Vector2.Distance(transform.position, target.transform.position);

            if (distance < closestDistance)
            {
                closestDistance = distance;
                closest = target.transform;
            }
        }

        if (closest == null)
            return;

        closest.GetComponent<IInteractable>().Interact();
    }

    public void DropItem(Inventory_Item item)
    {
        if (item == null || item.itemData == null)
        {
            Debug.LogWarning("Trying to drop null item");
            return;
        }

        // Check if dropPrefab exists
        if (item.itemData.dropPrefab == null)
        {
            Debug.LogWarning($"Item {item.itemData.itemName} doesn't have dropPrefab set");
            return;
        }

        // Calculate drop position (slightly in front of player)
        float dropDistance = FacingDir * 1.5f;
        Vector3 dropPosition = transform.position + new Vector3(dropDistance, 0.5f, 0);
    
        // Instantiate item using dropPrefab from ItemDataSO
        GameObject droppedItemObject = Instantiate(item.itemData.dropPrefab, dropPosition, Quaternion.identity);
    
        // Set item data (if prefab has Object_ItemPickup component)
        Object_ItemPickup itemPickup = droppedItemObject.GetComponent<Object_ItemPickup>();
        if (itemPickup != null)
        {
            itemPickup.itemData = item.itemData;
        }
    
        // Add throw force (if has Rigidbody2D)
        Rigidbody2D rb = droppedItemObject.GetComponent<Rigidbody2D>();
        if (rb != null)
        {
            Vector2 throwForce = new Vector2(0, 0.5f);
            rb.AddForce(throwForce, ForceMode2D.Impulse);
        }
    
        Debug.Log($"Dropped item: {item.itemData.itemName}");
    }

    #region Ball Summoning Management - HIGHEST PRIORITY
    void HandleBallSummoning()
    {
        // Check Throw key press for summoning ball
        if (input.Player.Throw.WasPressedThisFrame())
        {
            if (!isBallSummoned)
            {
                Debug.Log("I'm summoning.");
                StateMachine.ChangeState(ThrowState1);
            }
        }
    
        // Check Throw key release - only matters if ball hasn't been thrown yet
        if (input.Player.Throw.WasReleasedThisFrame())
        {
            Debug.Log("I'm released.");
            if (currentSummonedBall != null)
            {
                Throwable throwable = currentSummonedBall.GetComponent<Throwable>();
                if (throwable != null && !throwable.HasBeenDragged())
                {
                    // Ball was never dragged, destroy it
                    Destroy(currentSummonedBall);
                    currentSummonedBall = null;
                    isBallSummoned = false;
                    Debug.Log("Ball destroyed - never dragged");
                    StateMachine.ChangeState(FailThrowState);
                }
                // If ball was dragged, it has already been thrown and player is in ThrowState2
            }
        }
    }
    
    // Add this method to Player class
    public void OnBallThrown()
    {
        // Ball has been thrown, change to ThrowState2
        StateMachine.ChangeState(ThrowState2);
    
        // Clear the summoned ball reference since it's now independent
        currentSummonedBall = null;
        isBallSummoned = false;
    
        Debug.Log("Player notified that ball was thrown, changing to ThrowState2");
    }

    public void SummonBall()
    {
        // Check if inventory has items
        if (inventory.itemList.Count == 0)
        {
            // Show empty inventory warning
            // UI.ShowWarning("Inventory is empty!");
            // AudioManager.PlaySound("EmptyInventorySound");
            // StartCoroutine(ShowEmptyInventoryEffect());
            Debug.Log("Cannot summon - inventory is empty!");
            StateMachine.ChangeState(FailThrowState);
            return;
        }

        // Destroy current summoned ball if exists
        if (currentSummonedBall != null)
        {
            Destroy(currentSummonedBall);
        }
    
        // Get first item from inventory
        Inventory_Item firstItem = inventory.itemList[0];
    
        // Create throwable object based on the item's prefab
        if (firstItem.itemData.dropPrefab != null)
        {
            Vector3 spawnPosition = throwPoint != null ? throwPoint.position : 
                transform.position + Vector3.up * 2f + Vector3.right * 1f;
        
            // Instantiate the actual item prefab
            currentSummonedBall = Instantiate(firstItem.itemData.dropPrefab, spawnPosition, Quaternion.identity);
        
            Throwable throwable = currentSummonedBall.GetComponent<Throwable>();
            if (throwable != null)
            {
                throwable.SetFloatingMode(this);
            }
        
            // Remove one item from inventory
            inventory.RemoveOneItem(firstItem);
        
            isBallSummoned = true;
            Debug.Log($"Summoned item: {firstItem.itemData.itemName}");
        }
        else
        {
            Debug.LogWarning($"Item {firstItem.itemData.itemName} has no prefab to instantiate!");
        }
    }
    
    public void BackSummonBall()
    {
        if (currentSummonedBall == null)
        {
            Debug.Log("No summoned ball to recall");
            return;
        }

        // Get the item data from the summoned ball
        Object_ItemPickup pickup = currentSummonedBall.GetComponent<Object_ItemPickup>();
        Inventory_Item itemToReturn = new Inventory_Item(pickup.itemData);
    
        // Insert at the first position of inventory
        inventory.itemList.Insert(0, itemToReturn);
    
        // Destroy the summoned ball
        Destroy(currentSummonedBall);
        currentSummonedBall = null;
        isBallSummoned = false;
    
        //Debug.Log("Ball recalled to inventory");
    }
    
    // Public methods for states to check ball status
    public bool HasSummonedBall()
    {
        return currentSummonedBall != null;
    }
    
    public GameObject GetCurrentSummonedBall()
    {
        return currentSummonedBall;
    }
    
    // Clean up ball when needed
    public void CleanupSummonedBall()
    {
        if (currentSummonedBall != null)
        {
            Destroy(currentSummonedBall);
            currentSummonedBall = null;
            isBallSummoned = false;
        }
    }
    #endregion

    #region Water Interactive
    private void CheckDrowningState()
    {
        bool wasInWater = isInWater;
        
        isInWater = IsPlayerInWater();
        
        if (isInWater && !wasInWater)
        {
            Debug.Log("Player starts drowning!");
            StateMachine.ChangeState(DrownState);
        }
        
        if (!isInWater && wasInWater)
        {
            Debug.Log("Player leaves water surface!");
        }
    }
    
    private bool IsPlayerInWater()
    {
        Vector2 checkPosition = transform.position;
        Collider2D waterContact = Physics2D.OverlapCircle(checkPosition, drownCheckRadius, waterLayer);
        return waterContact != null;
    }
    
    public bool IsPlayerCompletelySubmerged()
    {
        Vector2 headPosition = (Vector2)transform.position + Vector2.up * fullSubmergeOffset;
        Collider2D waterContactAtHead = Physics2D.OverlapCircle(headPosition, drownCheckRadius * 0.5f, waterLayer);
        
        return waterContactAtHead != null;
    }
    
    private void OnDrawGizmosSelected()
    {
        Gizmos.color = Color.blue;
        Gizmos.DrawWireSphere(transform.position, drownCheckRadius);
        
        Gizmos.color = Color.red;
        Vector3 headPos = transform.position + Vector3.up * fullSubmergeOffset;
        Gizmos.DrawWireSphere(headPos, drownCheckRadius * 0.5f);
    }
    #endregion
    
    
}