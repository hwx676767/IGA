using System;

[Flags]
public enum CampusItemStage
{
    Elementary = 1,
    Middle = 2,
    High = 4,
    All = Elementary | Middle | High
}

/// <summary>
/// One sellable / restockable item. Add new goods by appending to <see cref="CampusItemCatalog.Items"/>.
/// </summary>
public sealed class CampusTradeItem
{
    public readonly string Id;
    public readonly string Name;
    public readonly string SpriteResource;
    public readonly int BuyPrice;
    public readonly int SellPrice;
    public readonly int StartingStock;
    public readonly int UnlockDay;
    public readonly CampusItemStage Stages;

    public CampusTradeItem(string id, string name, string spriteResource, int buyPrice, int sellPrice, int startingStock, int unlockDay, CampusItemStage stages)
    {
        Id = id;
        Name = name;
        SpriteResource = spriteResource;
        BuyPrice = buyPrice;
        SellPrice = sellPrice;
        StartingStock = startingStock;
        UnlockDay = unlockDay;
        Stages = stages;
    }

    public bool Fits(CampusItemStage stage)
    {
        return (Stages & stage) != 0;
    }
}

/// <summary>
/// Classroom shop catalog.
/// To add a product later: put the PNG in Assets/Resources, then append one Items entry.
/// UnlockDay 1 = on the shelf at start of that school stage. Higher days appear after End Day.
/// Stages limits which Elementary/Middle/High identity can stock the item. Switching identity does not graduate the player.
/// </summary>
public static class CampusItemCatalog
{
    public const int MaxStackPerItem = 9;
    public const int StartingMoney = 20;

    public static readonly CampusTradeItem[] Items =
    {
        new CampusTradeItem("chips", "Cucumber Chips", "image 16", 4, 8, 3, 1, CampusItemStage.All),
        new CampusTradeItem("spicy-gluten", "Spicy Gluten Snacks", "image 17", 3, 6, 3, 1, CampusItemStage.All),
        new CampusTradeItem("diamond-sword", "Diamond Sword Toy", "image 18", 14, 25, 2, 1, CampusItemStage.Elementary),
        new CampusTradeItem("transformer", "Transforming Robot", "image 19", 18, 32, 1, 1, CampusItemStage.Elementary),
        new CampusTradeItem("ninja-bricks", "Ninja Building Blocks", "image 20", 24, 45, 1, 1, CampusItemStage.Elementary),
        new CampusTradeItem("rc-car", "RC Off-Road Truck", "image 22", 16, 28, 2, 1, CampusItemStage.Middle),
        new CampusTradeItem("wood-turtle", "Wood-Grain Turtle", "image 23", 20, 36, 0, 2, CampusItemStage.Elementary | CampusItemStage.Middle),
        new CampusTradeItem("limited-standee", "Limited Standee", "image 24", 40, 70, 0, 3, CampusItemStage.Middle | CampusItemStage.High),
        new CampusTradeItem("handheld", "Handheld Game Console", "image 25", 80, 140, 0, 2, CampusItemStage.High),
        new CampusTradeItem("comics", "Old Comic Stack", "image 26", 12, 22, 1, 1, CampusItemStage.Elementary | CampusItemStage.Middle),
        new CampusTradeItem("english-book", "English Textbook", "image 27", 8, 15, 0, 1, CampusItemStage.Elementary | CampusItemStage.Middle),
        new CampusTradeItem("basketball", "Basketball", "image 28", 18, 32, 0, 1, CampusItemStage.All),
        new CampusTradeItem("correction-tape", "Correction Tape", "image 29", 5, 10, 1, 1, CampusItemStage.Middle | CampusItemStage.High),
        new CampusTradeItem("coffee", "Instant Coffee", "image 30", 6, 12, 2, 1, CampusItemStage.High),
        new CampusTradeItem("fountain-pen", "Gold-Nib Fountain Pen", "image 31", 28, 50, 0, 1, CampusItemStage.High),
        new CampusTradeItem("fidget-spinner", "Fidget Spinner", "image 32", 10, 18, 1, 1, CampusItemStage.Middle | CampusItemStage.High)
    };

    public static CampusTradeItem Find(string id)
    {
        if (string.IsNullOrEmpty(id))
            return null;
        foreach (var item in Items)
        {
            if (item.Id == id)
                return item;
        }

        return null;
    }
}
