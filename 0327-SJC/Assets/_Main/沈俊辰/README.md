# Life Match · Unity Scripts（沈俊辰）

基于 Figma 设计文档 `197:255` 生成的 Unity C# 脚本骨架，对应 **Life Match**（玩家扮演 scammer 的叙事策略游戏）。

## 目录结构

```
沈俊辰/
├── Core/           GameBootstrap, GameSaveManager
├── Data/           数据模型 + LocalTextDataLoader
├── UI/             面板过渡、聊天、语音、升级 HUD
├── Voice/          夹子音 / 气泡音检测
├── Progression/    数值、升级、章节、场景切换
├── Systems/        双身份、怀疑/丑闻、关系、课程、曝光
└── StreamingAssets/LifeMatch/   本地 JSON 文稿与配置
```

## 使用方式

1. 将 `沈俊辰` 文件夹复制到 Unity 项目的 `Assets/` 下
2. 将 `StreamingAssets/LifeMatch/` 复制到 Unity 项目的 `Assets/StreamingAssets/LifeMatch/`
3. 在首个场景创建空物体，挂载 `GameBootstrap`
4. 搭建 UI Canvas，挂载：
   - `UIManager` + `UITransitionController`
   - `ChatUIController`
   - `VoiceUIController` + `VoiceRecorder`
   - `StatsHUDController`
   - `UpgradeUIController`
5. 创建场景并在 Build Settings 中注册：`scene_home`, `scene_fake_apartment`, `scene_voice_room`, `scene_luxury_chat`

## 已实现的核心需求

### 1. UI 交互 + 本地文稿
- `UITransitionController`：面板淡入淡出 / 滑动过渡
- `UIManager`：面板路由、返回栈、角色列表填充
- `LocalTextDataLoader`：从 StreamingAssets 加载角色、聊天、升级、课程 JSON
- `ChatUIController`：打字机效果、选项分支、触发关系/丑闻变化

### 2. 语音识别（夹子音 / 气泡音）
- `VoiceRecorder`：麦克风录音
- `VoiceTypeAnalyzer`：基于基频、频谱重心、频段能量比的启发式分析
  - **ClipVoice（夹子音）**：偏高 pitch + 偏亮高频
  - **BubbleVoice（气泡音）**：偏低频能量 + 鼻腔共振带
- 分析结果会影响好感 / 怀疑 / 暴露风险

> 说明：当前为轻量 heuristic 版本，适合原型验证。若要更高精度，可替换为 ONNX / 第三方语音分类 SDK。

### 3. 升级系统
- `UpgradeSystem`：读取本地 upgrades.json，支持：
  - **SwitchScene**：直接切换场景（如租更好背景房间）
  - **ModifyStats**：修改 detectability / deceptionPower / beautyScore 等
  - **Combined**：场景 + 数值同时变化
- 示例升级：
  - 更容易被骗 ↔ `deceptionPower` 上升
  - 更容易被发现 ↔ `detectability` 上升

## 根据 Figma 设计额外建议的脚本（已部分实现）

| 设计系统 | 脚本 | 作用 |
|---|---|---|
| 双身份系统 | `DualIdentityManager` | 真实身份 vs 网络人设，矛盾检测 |
| 资源系统 | `PlayerStats`, `TargetRelationshipManager` | 金钱、好感 |
| 风险系统 | `SuspicionScandalManager`, `ExposureEventManager` | 全局丑闻 + 个体怀疑 |
| 课程系统 | `CourseLearningSystem` | 可能本身是骗局的技能课 |
| 章节推进 | `ChapterProgressionManager` | 起步→扩张→巅峰→崩塌 |
| 存档 | `GameSaveManager` | 本地 JSON 存档 |

## 还可继续扩展的脚本（建议）

以下脚本尚未生成，但和 Figma 核心循环高度匹配，建议下一步实现：

1. **`SocialMediaFeedManager`** — 「社交媒体广撒网」：生成目标候选、发帖、维护假动态
2. **`CashOutEventManager`** — 「索取资源」：根据好感触发转账/礼物事件
3. **`TimePressureManager`** — 第二章多线聊天的时间压力与回复超时惩罚
4. **`ContradictionTracker`** — 记录玩家前后发言矛盾，自动抬高怀疑值
5. **`MiniCrisisEventRouter`** — 第三章随机 mini-crisis（查岗、视频验证、撞人设）
6. **`EmotionalArcDirector`** — 驱动情绪曲线：希望→空心巅峰→崩塌
7. **`PersonaPhotoAssetManager`** — 管理购买/伪造的照片素材与 EXIF 风险
8. **`EndingBranchManager`** — 社交死亡 / 被捕 / 自骗 / 曝光等终局分支

## 关键数值字段

`PlayerStatsData` 中与玩法直接相关的字段：

- `detectability` — 越高越容易被发现
- `deceptionPower` — 越高越容易骗人
- `globalScandalLevel` — 全局丑闻压力
- `beautyScore` / `socialClassRank` — 假人设等级
- `communicationSkill` / `emotionalIntelligence` / `crisisManagement` — 技能

## 示例：从 UI 打开聊天

```csharp
UIManager.Instance.OpenChatWithTarget("target_lin", "chat_lin_intro");
ChatConversationManager.Instance.BeginConversation("target_lin", "chat_lin_intro");
```

## 示例：手动触发升级

```csharp
UpgradeSystem.Instance.TryApplyUpgrade("upgrade_fake_apartment");
```

## 示例：录音并分析

```csharp
VoiceRecorder recorder = FindObjectOfType<VoiceRecorder>();
recorder.StartRecording();
// 或在 VoiceUIController 中绑定按钮
```

---

*脚本依据 Figma Frame 197:255（Life Match 核心机制 / 章节 / 情绪曲线）整理。*
