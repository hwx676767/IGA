/// <summary>Temporary hand-off data from the stage-management scene to S4.</summary>
public static class StageEndingResult
{
    public static string Title { get; private set; } = "Show over";
    public static string Detail { get; private set; } = "After curtain, the stage finally goes quiet.";
    public static int AccidentCount { get; private set; }
    public static bool RequiresAttention { get; private set; }

    public static void Set(string title, string detail, int accidentCount, bool requiresAttention)
    {
        Title = title;
        Detail = detail;
        AccidentCount = accidentCount;
        RequiresAttention = requiresAttention;
    }
}
