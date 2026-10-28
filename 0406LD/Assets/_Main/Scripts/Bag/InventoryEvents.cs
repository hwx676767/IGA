using UnityEngine.Events;

public static class InventoryEvents
{
    public static UnityEvent OnInventoryChanged = new UnityEvent();
    
    public static void NotifyChange() => OnInventoryChanged.Invoke();
}