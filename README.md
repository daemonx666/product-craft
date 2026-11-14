# product-craft

English | [简体中文](README.zh-CN.md) | [繁體中文](README.zh-TW.md) | [日本語](README.ja.md) | [한국어](README.ko.md)

Lightweight agent skills for building products with care. Works with both **Claude Code** and **Codex**.

## Skills

| Skill | What it does |
|---|---|
| [spec](skills/spec/SKILL.md) | Turns a one-line feature idea into a complete, AI-readable spec grounded in your current project, then builds it |

## spec

Most wasted AI coding time comes from guessing requirements wrong. `spec` asks a few precise questions before any code is written and saves the answers to a file. Any later session, or another agent, can pick up from that file.

**Workflow**

1. **Read the project.** Reads the README, CLAUDE.md / AGENTS.md, manifests, existing specs and the code related to the idea. For related features it learns how data is stored, how the flow works and which UI components are used.
2. **Find comparable products.** Two to four products or open-source projects in the same niche that have this feature: how they do it, what to borrow, what doesn't fit.
3. **Ask one question at a time.** Each question offers 2–4 options with a recommended default. It skips anything the code already answers. Usually 3–8 questions; say "use the defaults" at any point to skip the rest.
4. **Write the spec** to `docs/specs/<date>-<slug>.md`: current state, comparable products, goals and non-goals, numbered requirements with Given/When/Then acceptance criteria, and a technical plan split into reuse / modify / add.
5. **Confirm** with you before writing any code.
6. **Build** task by task, checking items off in the spec, and finish by checking every acceptance criterion.

**Design principle.** New features grow on what the project already has: extend existing modules, reuse existing data structures, components and conventions. Anything that builds a parallel system or changes existing behavior is explained in the spec and asked about first.

**Usage**

| Tool | Invoke |
|---|---|
| Claude Code | `/spec add a friends leaderboard` |
| Codex | `$spec add a friends leaderboard` |

You can also just describe the idea ("I want a leaderboard, help me work out the requirements first"); the skill triggers on its own. To resume an unfinished spec, say "continue spec".

The spec is written in the language you use in the conversation.

## Install

```bash
git clone https://github.com/felix-xqs/product-craft.git
cd product-craft
./install.sh
```

`install.sh` symlinks every folder under `skills/` into:

- `~/.claude/skills/` for Claude Code
- `~/.agents/skills/` for Codex

Because they are symlinks, `git pull` updates the skills in place. Run the script again after adding a new skill.

## Repository layout

```
product-craft/
├── install.sh
└── skills/
    └── spec/
        ├── SKILL.md
        └── references/spec-template.md
```

To add a skill, create `skills/<name>/SKILL.md` with `name` and `description` in its frontmatter. Put longer reference material in `references/` and say in SKILL.md when to read it.
