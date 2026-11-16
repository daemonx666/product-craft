# product-craft

[English](README.md) | [简体中文](README.zh-CN.md) | 繁體中文 | [日本語](README.ja.md) | [한국어](README.ko.md)

用來用心打磨產品的輕量 agent skill 集合，**Claude Code** 和 **Codex** 通用。

## Skills

| Skill | 作用 |
|---|---|
| [spec](skills/spec/SKILL.md) | 把一句話需求擴展成以目前專案為基礎、方便 AI 閱讀的完整規格文件，然後依照文件開發 |

## spec

AI 寫程式時最大的浪費是猜錯需求。`spec` 在寫程式之前用少量精準的問題把關鍵決定問清楚，並存成檔案。之後的任何工作階段或其他 agent 都能從這個檔案接著做。

**流程**

1. **讀專案**：讀 README、CLAUDE.md / AGENTS.md、相依套件清單、既有規格和與需求相關的程式碼。對相關功能，弄清楚資料怎麼存、流程怎麼走、介面用了哪些元件。
2. **找對標**：找 2～4 個同領域、有這個功能的產品或開源專案：它們怎麼做、借鏡什麼、哪些不適合。
3. **一次一個問題**：每個問題給 2～4 個選項，第一個是推薦項。程式碼裡已經有答案的不問。一般 3～8 個問題，隨時說「照推薦」可以跳過剩下的。
4. **寫規格**：寫到 `docs/specs/<日期>-<名稱>.md`，包括現狀、對標、目標與非目標、附 Given/When/Then 驗收標準的編號需求，以及分成重用 / 修改 / 新增三類的技術方案。
5. **確認**：寫程式之前先和你確認。
6. **開發**：依任務逐項完成並在文件裡勾選，最後逐條對照驗收標準。

**設計原則**：新功能長在專案既有的東西上，優先擴充既有模組，重用既有的資料結構、元件和慣例。需要另起一套或改變既有行為時，會在文件裡寫明理由並先問你。

**用法**

| 工具 | 呼叫方式 |
|---|---|
| Claude Code | `/spec 加個好友排行榜` |
| Codex | `$spec 加個好友排行榜` |

也可以直接描述想法，例如「我想做個排行榜，先幫我理清需求」，skill 會自動觸發。要繼續沒做完的規格，說「繼續 spec」。

規格文件使用你在對話中使用的語言。

## 安裝

```bash
git clone https://github.com/daemonx666/product-craft.git
cd product-craft
./install.sh
```

`install.sh` 會把 `skills/` 下的每個資料夾以符號連結建立到：

- `~/.claude/skills/`：Claude Code
- `~/.agents/skills/`：Codex

因為是符號連結，`git pull` 之後 skill 就是最新的。新增 skill 後重新執行一次腳本即可。

## 儲存庫結構

```
product-craft/
├── install.sh
└── skills/
    └── spec/
        ├── SKILL.md
        └── references/spec-template.md
```

新增 skill：建立 `skills/<name>/SKILL.md`，在 frontmatter 裡寫 `name` 和 `description`。較長的參考資料放進 `references/`，並在 SKILL.md 裡寫明什麼時候去讀。

## 授權條款

[MIT](LICENSE)
