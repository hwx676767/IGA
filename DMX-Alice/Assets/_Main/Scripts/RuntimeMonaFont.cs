using UnityEngine;
#if UNITY_EDITOR
using UnityEditor;
#endif

/// <summary>
/// Font used only for runtime-created UI. Scene-authored Text is left alone.
/// </summary>
public static class RuntimeMonaFont
{
    private const string AssetPath = "Assets/_Main/Mona-Medium-2.ttf";
    private static Font _font;

    public static Font Load()
    {
        if (_font != null) return _font;
#if UNITY_EDITOR
        _font = AssetDatabase.LoadAssetAtPath<Font>(AssetPath);
        if (_font != null) return _font;
#endif
        _font = Resources.Load<Font>("Mona-Medium-2");
        if (_font != null) return _font;

        Font[] loaded = Resources.FindObjectsOfTypeAll<Font>();
        for (int i = 0; i < loaded.Length; i++)
        {
            Font candidate = loaded[i];
            if (candidate != null && candidate.name.IndexOf("Mona-Medium-2") >= 0)
            {
                _font = candidate;
                return _font;
            }
        }

        _font = Resources.GetBuiltinResource<Font>("Arial.ttf");
        return _font;
    }
}
