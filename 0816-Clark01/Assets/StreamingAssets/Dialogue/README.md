# Dialogue data (edit without code)

File: `campus_story.json`

## How to edit
1. Open this JSON in any text editor (VS Code / Notepad).
2. Change `lines`, `choices.label`, `choices.result` text.
3. Save. Enter Play Mode again (no script recompile needed).
4. Built game: edit the same file under the build's `StreamingAssets/Dialogue/` folder.

## Placeholders (replaced at runtime)
- `{itemName}` — requested item display name
- `{stageLabel}` — Elementary / Middle / High
- `{trust}` — finale trust line (from `trustEnough` / `trustNotEnough`)
- `{itemId}` — catalog id (rarely needed in text)

## Beat kinds
| kind | When used |
|------|-----------|
| `intro` | First meeting |
| `quest_ready` | Quest active and item is in stock |
| `quest_missing` | Quest active but item missing |
| `daily_waiting` | Waiting for item (optional flag) |
| `daily_done` | Quest already delivered |
| `daily_idle` | Normal daily chat |
| `finale` | Day 5 ending preview |

## Choices
- `requestWantedItem: true` — records the wanted item quest for that actor
- `favorChange` — favor delta when the choice is resolved
