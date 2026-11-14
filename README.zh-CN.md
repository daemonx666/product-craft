# product-craft

[English](README.md) | 简体中文 | [繁體中文](README.zh-TW.md) | [日本語](README.ja.md) | [한국어](README.ko.md)

用来用心打磨产品的轻量 agent skill 集合，**Claude Code** 和 **Codex** 通用。

## Skills

| Skill | 作用 |
|---|---|
| [spec](skills/spec/SKILL.md) | 把一句话需求扩展成基于当前项目、方便 AI 阅读的完整规格文档，然后按文档开发 |

## spec

AI 写代码时最大的浪费是猜错需求。`spec` 在写代码之前用少量精准的问题把关键决定问清楚，并保存成文件。之后的任何会话或其他 agent 都能从这个文件接着做。

**流程**

1. **读项目**：读 README、CLAUDE.md / AGENTS.md、依赖清单、已有规格和与需求相关的代码。对相关功能，弄清数据怎么存、流程怎么走、界面用了哪些组件。
2. **找对标**：找 2～4 个同领域、有这个功能的产品或开源项目：它们怎么做、借鉴什么、哪些不适合。
3. **一次一个问题**：每个问题给 2～4 个选项，第一个是推荐项。代码里已经有答案的不问。一般 3～8 个问题，随时说“按推荐”可以跳过剩下的。
4. **写规格**：写到 `docs/specs/<日期>-<名称>.md`，包括现状、对标、目标与非目标、带 Given/When/Then 验收标准的编号需求，以及分成复用 / 修改 / 新增三类的技术方案。
5. **确认**：写代码之前先和你确认。
6. **开发**：按任务逐个完成并在文档里勾掉，最后逐条对照验收标准。

**设计原则**：新功能长在项目已有的东西上，优先扩展现有模块，复用现有的数据结构、组件和习惯。要另起一套或改变现有行为时，会在文档里写明理由并先问你。

**用法**

| 工具 | 调用方式 |
|---|---|
| Claude Code | `/spec 加个好友排行榜` |
| Codex | `$spec 加个好友排行榜` |

也可以直接描述想法，比如“我想做个排行榜，先帮我理清需求”，skill 会自动触发。要继续没做完的规格，说“继续 spec”。

规格文档使用你在对话中使用的语言。

## 安装

```bash
git clone https://github.com/felix-xqs/product-craft.git
cd product-craft
./install.sh
```

`install.sh` 会把 `skills/` 下的每个文件夹软链接到：

- `~/.claude/skills/`：Claude Code
- `~/.agents/skills/`：Codex

因为是软链接，`git pull` 之后 skill 就是最新的。新增 skill 后重新运行一次脚本即可。

## 仓库结构

```
product-craft/
├── install.sh
└── skills/
    └── spec/
        ├── SKILL.md
        └── references/spec-template.md
```

新增 skill：创建 `skills/<name>/SKILL.md`，在 frontmatter 里写 `name` 和 `description`。较长的参考资料放进 `references/`，并在 SKILL.md 里写明什么时候去读。
