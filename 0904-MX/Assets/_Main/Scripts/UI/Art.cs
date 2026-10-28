using UnityEngine;

namespace Mahou.UI
{
    public static class Art
    {
        const string ResourcesRoot = "MahouUI/";
        const string AssetFolder = "Assets/_Main/Resources/MahouUI/";

        /// <summary>
        /// Load a persistent Sprite asset (never creates runtime sprites — those break after scene save).
        /// </summary>
        public static Sprite Get(string path)
        {
            if (string.IsNullOrEmpty(path)) return null;

            // Prefer Resources sprite sub-asset
            var sprites = Resources.LoadAll<Sprite>(ResourcesRoot + path);
            if (sprites != null && sprites.Length > 0)
                return sprites[0];

            var single = Resources.Load<Sprite>(ResourcesRoot + path);
            if (single != null)
                return single;

#if UNITY_EDITOR
            var editorSprite = LoadEditorSprite(path);
            if (editorSprite != null)
                return editorSprite;
#endif

            Debug.LogWarning($"[Mahou.Art] Missing sprite: {path}. Run Mahou Circle → 1. Reimport UI Sprites");
            return null;
        }

#if UNITY_EDITOR
        static Sprite LoadEditorSprite(string path)
        {
            string[] exts = { ".png", ".jpg", ".jpeg", ".PNG", ".JPG" };
            var candidates = new System.Collections.Generic.List<string>();
            foreach (var ext in exts)
            {
                candidates.Add(AssetFolder + path + ext);
                if (path.StartsWith("FanArt/"))
                    candidates.Add("Assets/_Main/ART/mahou circle/ArtWork/" + path.Substring("FanArt/".Length) + ext);
            }

            foreach (var assetPath in candidates)
            {
                var sprite = UnityEditor.AssetDatabase.LoadAssetAtPath<Sprite>(assetPath);
                if (sprite != null) return sprite;

                var all = UnityEditor.AssetDatabase.LoadAllAssetsAtPath(assetPath);
                if (all == null) continue;
                foreach (var o in all)
                {
                    if (o is Sprite s)
                        return s;
                }
            }
            return null;
        }
#endif

        public static Sprite Avatar(string key)
        {
            if (string.IsNullOrEmpty(key)) key = "anon";
            switch (key)
            {
                case "owner": return Get("avatar_owner");
                case "admin": return Get("avatar_admin");
                case "anon": return Get("avatar_anon");
                default:
                    var letter = key.Length == 1 ? key.ToUpperInvariant() : key;
                    return Get($"Avatars/avatar_{letter}") ?? Get("avatar_anon");
            }
        }

        public static Sprite IconComment => Get("Icons/icon_comment_ui") ?? Get("Icons/icon_comment_clean") ?? Get("Icons/icon_comment");
        // Prefer UI white hearts; avoid dark outline sprites that read as a black heart.
        public static Sprite IconLikeOn => Get("Icons/icon_like_on_ui") ?? Get("Icons/icon_like_filled") ?? Get("Icons/icon_like_filled_clean");
        public static Sprite IconLikeOff => Get("Icons/icon_like_off_ui") ?? Get("Icons/icon_like_outline") ?? Get("Icons/icon_like_outline_clean");
    }
}
