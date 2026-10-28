using UnityEngine;
using System.Collections;

public class CoachScript : MonoBehaviour
{
    // Enum for coach instructions (actions)
    public enum CoachAction
    {
        RightPunch,  // 右拳
        LeftPunch,   // 左拳
        Jab,         // 直拳 (or StraightPunch)
        Dodge,       // 闪避
        Backstep,    // 后退 (or Retreat)
        Block        // 格挡
    }

    // Struct to hold action, animation value (int), and key mapping
    [System.Serializable]
    public struct ActionAnimKey
    {
        public CoachAction action;
        public int animationValue; // Animator int value for this action (e.g., 1 for RightPunch)
        public KeyCode key;
    }

    // List of action-animation-key mappings
    [SerializeField] private ActionAnimKey[] actionMappings;

    // Public bool for fake punch detection, used in settlement
    public bool isFakePunchDetected = false;

    // Time ranges for random appearance
    private float minInterval = 15f;
    private float maxInterval = 25f;

    // Duration the coach is visible and instruction is active
    private float visibleDuration = 8f;

    // Current active action
    private CoachAction currentAction;

    // Flag to check if coach is currently active
    private bool isCoachActive = false;

    // Reference to the 3D coach GameObject with Animator
    [SerializeField] private GameObject coachObject; // Assign in Inspector, 3D model with Animator

    // Animator reference
    private Animator coachAnimator;

    // Animator parameter name for the int state
    private string actionParam = "ActionState"; // Assuming this is the int parameter in Animator Controller (0 = Idle)

    public PunchController player; 
    public OpponentController opponent; 

    void Start()
    {
        // Validate mappings
        if (actionMappings.Length != System.Enum.GetValues(typeof(CoachAction)).Length)
        {
            Debug.LogWarning("Action mappings count does not match number of actions!");
        }

        // Get Animator
        if (coachObject != null)
        {
            coachAnimator = coachObject.GetComponent<Animator>();
            if (coachAnimator == null)
            {
                Debug.LogError("No Animator component found on coachObject!");
            }
            // Set to Idle initially
            coachAnimator.SetInteger(actionParam, 0);
        }

        if (player.isDead || opponent.isDead)
        {
            return; 
        }
        else
        {
            // Start the coroutine for random appearances
            StartCoroutine(RandomCoachAppearance());
        }
    }

    private IEnumerator RandomCoachAppearance()
    {
        while (true)
        {
            // Wait for random interval
            float waitTime = Random.Range(minInterval, maxInterval);
            yield return new WaitForSeconds(waitTime);

            // Activate coach
            ActivateCoach();
        }
    }

    private void ActivateCoach()
    {
        if (isCoachActive) return; // Prevent overlapping activations

        isCoachActive = true;

        // Randomly select an action
        currentAction = (CoachAction)Random.Range(0, System.Enum.GetValues(typeof(CoachAction)).Length);

        // Find the corresponding animation value and set it
        foreach (var mapping in actionMappings)
        {
            if (mapping.action == currentAction && coachAnimator != null)
            {
                // Set the int parameter to play the specific action animation
                coachAnimator.SetInteger(actionParam, mapping.animationValue);

                Debug.Log("Coach Instruction: " + currentAction.ToString()); // For testing
                break;
            }
        }

        // Start the timer for visible duration
        StartCoroutine(DeactivateCoachAfterTime());
    }

    private IEnumerator DeactivateCoachAfterTime()
    {
        yield return new WaitForSeconds(visibleDuration);

        // Deactivate coach
        DeactivateCoach();
    }

    private void DeactivateCoach()
    {
        isCoachActive = false;

        // Reset to idle state
        if (coachAnimator != null)
        {
            coachAnimator.SetInteger(actionParam, 0); // Assuming 0 is Idle
        }
    }

    void Update()
    {
        if (isCoachActive)
        {
            // Check player input against the key for the current action
            foreach (var mapping in actionMappings)
            {
                if (mapping.action == currentAction && Input.GetKeyDown(mapping.key))
                {
                    HandleCorrectResponse();
                    break;
                }
            }
        }
    }

    private void HandleCorrectResponse()
    {
        // Set the bool to true
        isFakePunchDetected = true;

        // Provide feedback
        Debug.Log("Fake Punch Detected! Correct response to " + currentAction);

        // Deactivate coach immediately since responded
        StopCoroutine(DeactivateCoachAfterTime());
        DeactivateCoach();
    }
}