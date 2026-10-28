# Patch scene fonts + visible cover/HUD text. Does not rename objects.
from pathlib import Path

font_ref = "{fileID: 12800000, guid: c4d7fb4b7fcbe864faa7eaa3f390c8bc, type: 3}"
old_font = "{fileID: 10102, guid: 0000000000000000e000000000000000, type: 0}"

replacements = {
    Path(r"E:\Workspace\unityWorkspace\1005-alice\Assets\Scenes\S1.unity"): {
        '"\\u5E55\\u540E\\u5267\\u56E2"': "Backstage Troupe",
        '"\\u4ECE\\u4E00\\u6B21\\u5931\\u8D25\\u7684\\u6F14\\u5458\\u9762\\u8BD5\\u5F00\\u59CB"': "It starts with a failed acting audition",
        '"\\u5F00\\u59CB\\u6E38\\u620F"': "Start Game",
    },
    Path(r"E:\Workspace\unityWorkspace\1005-alice\Assets\Scenes\S3.unity"): {
        '"\\u6F14\\u5458 \\xB7 \\u6D1B\\u6069"': "Actor · Lorne",
        '"S3  \\u6392\\u7EC3\\u5E03\\u666F \\xB7 \\u300A\\u6708\\u4E0B\\u5BC6\\u7EA6\\u300B"': "S3 Rehearsal · Moonlit Tryst",
        '"\\u6F14\\u5458\\u4F1A\\u9762 / \\u8D70\\u4F4D\\u901A\\u9053\\uFF08\\u4FDD\\u6301\\u4E2D\\u592E\\u5F00\\u9614\\uFF09"': "Actor crossing / keep the center clear",
        '"\\u5F53\\u524D\\u8D70\\u4F4D\\uFF1A\\u4E2D\\u592E\\u901A\\u9053\\u7545\\u901A"': "Current route: center aisle clear",
        '"\\u6F14\\u51FA\\u51C6\\u5907\\u5EA6  0%"': "Performance readiness  0%",
        '"\\u8D70\\u4F4D\\u4E2D"': "On route",
        '"\\u4EFB\\u52A1\\uFF1A\\u628A\\u4E0B\\u65B9\\u9053\\u5177\\u62D6\\u5230\\u821E\\u53F0\\u63D0\\u793A\\u4F4D\\u3002\\u9519\\u8BEF\\u6446\\u653E\\u53EF\\u4FDD\\u7559\\uFF0C\\u4F46\\u4F1A\\u5F71\\u54CD\\u6F14\\u5458\\u8D70\\u4F4D\\u4E0E\\u6F14\\u51FA\\u8BC4\\u5206\\u3002"': "Task: drag props from below onto the stage marks. Wrong placement can stay, but it can block the actor and hurt the score.",
        '"\\u6536\\u56DE\\u5168\\u90E8"': "Recall all",
        '"\\u9884\\u6F14\\u8D70\\u4F4D"': "Preview route",
    },
}

for path in replacements:
    text = path.read_text(encoding="utf-8")
    text = text.replace(f"    m_Font: {old_font}", f"    m_Font: {font_ref}")
    for src, dst in replacements[path].items():
        needle = f"  m_Text: {src}"
        if needle not in text:
            print("MISSING", path.name, src)
        else:
            text = text.replace(needle, f"  m_Text: {dst}")
    path.write_text(text, encoding="utf-8")
    print("patched", path.name)
