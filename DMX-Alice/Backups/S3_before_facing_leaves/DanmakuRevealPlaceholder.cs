using UnityEngine;

/// <summary>
/// Scene-owned keyword artwork. Sprites come from Resources/image/{keyword}.
/// Position and scale stay authored; runtime only toggles visibility.
/// </summary>
[RequireComponent(typeof(SpriteRenderer))]
public class DanmakuRevealPlaceholder : MonoBehaviour
{
    [SerializeField] private string keyword;
    [SerializeField] private bool isHelpful;
    [Tooltip("Completely unrelated keywords use a quick sound/visual cue and do not pause gameplay.")]
    [SerializeField] private bool isIrrelevant;
    [SerializeField] private string feedback;
    [SerializeField] private Sprite artwork;

    public string Keyword => keyword;
    public bool IsHelpful => isHelpful;
    public bool IsIrrelevant => !isHelpful && isIrrelevant;
    public string Feedback => DisplayFeedback();
    public string DisplayKeyword => TranslateKeyword(keyword);

    private void Awake()
    {
        BindArtwork();
    }

    private void OnEnable()
    {
        BindArtwork();
    }

    public void BindArtwork()
    {
        SpriteRenderer renderer = GetComponent<SpriteRenderer>();
        if (renderer == null) renderer = gameObject.AddComponent<SpriteRenderer>();

        if (artwork == null && !string.IsNullOrEmpty(keyword))
            artwork = Resources.Load<Sprite>("image/" + keyword);

        if (artwork != null) renderer.sprite = artwork;
        renderer.color = Color.white;
        renderer.sortingOrder = 5;
    }

    public System.Collections.IEnumerator FadeOut(float duration)
    {
        SpriteRenderer renderer = GetComponent<SpriteRenderer>();
        if (renderer == null)
        {
            gameObject.SetActive(false);
            yield break;
        }

        Color color = renderer.color;
        float start = color.a;
        float elapsed = 0f;
        duration = Mathf.Max(.01f, duration);
        while (elapsed < duration)
        {
            elapsed += Time.deltaTime;
            color.a = Mathf.Lerp(start, 0f, elapsed / duration);
            renderer.color = color;
            yield return null;
        }

        color.a = 0f;
        renderer.color = color;
        gameObject.SetActive(false);
    }

    public string DisplayFeedback()
    {
        switch (keyword)
        {
            case "中世纪城堡": return "It sets the era and the main location.";
            case "骑士盔甲": return "It can shape a guard's look and costume.";
            case "哥特拱门": return "It strengthens the architecture and the drama of the stage.";
            case "羊皮卷": return "It suits old covenants, prophecy, and plot threads.";
            case "现代麦克风": return "Too modern. It breaks the medieval stage.";
            case "霓虹灯牌": return "The color language belongs to a city night, not this play.";
            case "宇宙飞船": return "Sci-fi pulls the opera away from its medieval setting.";
            case "手机直播": return "A present-day broadcast form. It cannot help this stage.";
            case "烛台与火炬": return "It can build a dark, old, and tense atmosphere.";
            case "木制长桌": return "It suits banquet, council, and castle interiors.";
            case "王座": return "It can mark a clash of power and a core identity.";
            case "彩绘玻璃": return "It can add color and mystery to a chapel-like stage.";
            case "古希腊石柱": return "It belongs to an earlier classical world, not medieval architecture.";
            case "罗马斗兽场": return "It leans toward ancient Rome and muddies the period.";
            case "文艺复兴油画": return "The period and style are too late for this stage.";
            case "巴洛克水晶吊灯": return "Too ornate, and later than a medieval set.";
            case "维多利亚蒸汽机": return "Industrial machinery would break the medieval mood.";
            case "日式鸟居": return "The cultural frame does not match. Save it for another production.";
            case "沙滩遮阳伞": return "Unrelated to the current theme.";
            case "自动售货机": return "Unrelated to the current theme.";
            default: return feedback;
        }
    }

    public static string TranslateKeyword(string value)
    {
        switch (value)
        {
            case "中世纪城堡": return "Medieval Castle";
            case "骑士盔甲": return "Knight Armor";
            case "哥特拱门": return "Gothic Arch";
            case "羊皮卷": return "Parchment";
            case "现代麦克风": return "Modern Microphone";
            case "霓虹灯牌": return "Neon Sign";
            case "宇宙飞船": return "Spaceship";
            case "手机直播": return "Livestream";
            case "烛台与火炬": return "Candles and Torches";
            case "木制长桌": return "Wooden Table";
            case "王座": return "Throne";
            case "彩绘玻璃": return "Stained Glass";
            case "古希腊石柱": return "Greek Columns";
            case "罗马斗兽场": return "Colosseum";
            case "文艺复兴油画": return "Renaissance Painting";
            case "巴洛克水晶吊灯": return "Baroque Chandelier";
            case "维多利亚蒸汽机": return "Victorian Steam Engine";
            case "日式鸟居": return "Torii Gate";
            case "沙滩遮阳伞": return "Beach Umbrella";
            case "自动售货机": return "Vending Machine";
            default: return value;
        }
    }
}
