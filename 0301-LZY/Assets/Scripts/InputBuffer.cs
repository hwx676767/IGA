using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

[System.Serializable]
public class InputBuffer
{
    private Queue<string> buffer = new Queue<string>(5);

    public void Add(string input) => buffer.Enqueue(input);

    public void Clear() => buffer.Clear();

    public bool Matches(string pattern)
    {
        if (buffer.Count < pattern.Length) return false;
        return string.Join("", buffer.TakeLast(pattern.Length)) == pattern;
    }

    public IEnumerator ClearOldInputs(float time)
    {
        while (true)
        {
            yield return new WaitForSeconds(time);
            while (buffer.Count > 5) buffer.Dequeue();
        }
    }
}