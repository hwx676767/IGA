using UnityEngine;

public class WheelControl : MonoBehaviour
{
    public WheelCollider WColForward;
    public WheelCollider WColBack;

    public Transform wheelF;
    public Transform wheelB;
    public float maxMotorTorque = 500;
    public float maxForwardBrake = 400;
    public float maxBackBrake = 400;

    private WheelData[] wheels;
    private Transform thisTransform;
    private Rigidbody rb;

    public class WheelData
    {
        public WheelData(Transform transform, WheelCollider collider)
        {
            wheelTransform = transform;
            wheelCollider = collider;
        }

        public Transform wheelTransform;
        public WheelCollider wheelCollider;
    }

    void Start()
    {
        wheels = new WheelData[2];
        wheels[0] = new WheelData(wheelF, WColForward);
        wheels[1] = new WheelData(wheelB, WColBack);

        thisTransform = GetComponent<Transform>();
        rb = GetComponent<Rigidbody>();
    }

    void FixedUpdate()
    {
        HandleMovement();
        UpdateWheels();
        ApplyDirectionalForces();
    }

    private void HandleMovement()
    {
        float acceleration = 0;
        float brakeForward = 0;
        float brakeBack = 0;

        if (Input.GetKey(KeyCode.A)) // Move backward
        {
            acceleration = -1;
        }
        if (Input.GetKey(KeyCode.D)) // Move forward
        {
            acceleration = 1;
        }
        if (Input.GetKey(KeyCode.Space)) // Brake
        {
            brakeForward = 1f;
        }

        WColBack.motorTorque = maxMotorTorque * acceleration;
        WColForward.brakeTorque = maxForwardBrake * brakeForward;
        WColBack.brakeTorque = maxBackBrake * brakeBack;
    }

    private void UpdateWheels()
    {
        foreach (WheelData w in wheels)
        {
            WheelHit hit;

            Vector3 localPos = w.wheelTransform.localPosition;
            if (w.wheelCollider.GetGroundHit(out hit))
            {
                localPos.y = -w.wheelCollider.transform.position.y + hit.point.y - w.wheelCollider.radius;
                w.wheelTransform.localPosition = localPos;
            }
        }
    }

    private void ApplyDirectionalForces()
    {
        Vector3 forwardForce = transform.forward * rb.velocity.magnitude;
        Vector3 upForce = Vector3.up * Physics.gravity.y * rb.mass;

        rb.AddForce(forwardForce, ForceMode.Force);
        rb.AddForce(upForce, ForceMode.Force);
    }
}
