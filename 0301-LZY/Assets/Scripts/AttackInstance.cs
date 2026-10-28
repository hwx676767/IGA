using UnityEngine;

[System.Serializable]
public class AttackInstance
{
    public AttackData data;
    public float startTime;
    public bool allowMove = false;
    public bool isActive = true;

    public AttackInstance(AttackData d)
    {
        data = d;
        startTime = Time.time;
    }

    public bool CanCancel() =>
        isActive && (Time.time - startTime) < data.cancelWindow;

    public void End() => isActive = false;

    public void EndCancelWindow() { }
}