# product-craft

[English](README.md) | [简体中文](README.zh-CN.md) | [繁體中文](README.zh-TW.md) | [日本語](README.ja.md) | 한국어

제품을 정성껏 만들기 위한 가벼운 agent skill 모음입니다. **Claude Code**와 **Codex**에서 모두 사용할 수 있습니다.

## Skills

| Skill | 하는 일 |
|---|---|
| [spec](skills/spec/SKILL.md) | 한 줄짜리 기능 아이디어를 현재 프로젝트에 기반한, AI가 읽기 쉬운 완전한 명세로 확장한 뒤 그대로 구현합니다 |

## spec

AI 코딩에서 가장 큰 낭비는 요구사항을 잘못 추측하는 데서 나옵니다. `spec`은 코드를 쓰기 전에 몇 가지 정확한 질문으로 핵심 결정을 확정하고 그 결과를 파일로 저장합니다. 이후의 어떤 세션이나 다른 agent도 그 파일에서 이어서 작업할 수 있습니다.

**워크플로**

1. **프로젝트 읽기**: README, CLAUDE.md / AGENTS.md, 의존성 정의, 기존 명세, 아이디어와 관련된 코드를 읽습니다. 관련 기능에 대해서는 데이터 저장 방식, 처리 흐름, 사용 중인 UI 컴포넌트를 파악합니다.
2. **비교 대상 찾기**: 같은 분야에서 이 기능을 가진 제품이나 오픈소스 프로젝트 2~4개를 찾아 어떻게 구현했는지, 무엇을 참고할지, 무엇이 맞지 않는지 정리합니다.
3. **한 번에 한 질문**: 질문마다 2~4개의 선택지를 주고 첫 번째를 추천안으로 둡니다. 코드에서 알 수 있는 것은 묻지 않습니다. 보통 3~8개이며, "추천대로"라고 하면 나머지를 건너뜁니다.
4. **명세 작성**: `docs/specs/<날짜>-<이름>.md`에 현재 상태, 비교 대상, 목표와 비목표, Given/When/Then 인수 조건이 붙은 번호 매긴 요구사항, 재사용 / 수정 / 추가로 나눈 기술 계획을 씁니다.
5. **확인**: 코드를 쓰기 전에 반드시 확인합니다.
6. **구현**: 작업을 하나씩 진행하며 명세에 체크하고, 마지막에 모든 인수 조건을 점검합니다.

**설계 원칙**: 새 기능은 프로젝트에 이미 있는 것 위에 쌓습니다. 기존 모듈을 확장하고 기존 데이터 구조, 컴포넌트, 관례를 재사용합니다. 별도 체계를 새로 만들거나 기존 동작을 바꿔야 할 때는 명세에 이유를 적고 먼저 묻습니다.

**사용법**

| 도구 | 호출 방법 |
|---|---|
| Claude Code | `/spec 친구 랭킹 추가` |
| Codex | `$spec 친구 랭킹 추가` |

"랭킹을 만들고 싶은데 먼저 요구사항을 정리해 줘"처럼 아이디어만 말해도 자동으로 실행됩니다. 진행 중인 명세를 이어가려면 "continue spec" 또는 "spec 이어서"라고 말하세요.

명세는 대화에서 사용하는 언어로 작성됩니다.

## 설치

```bash
git clone https://github.com/daemonx666/product-craft.git
cd product-craft
./install.sh
```

`install.sh`는 `skills/` 아래의 각 폴더를 다음 위치에 심볼릭 링크로 연결합니다.

- `~/.claude/skills/`: Claude Code
- `~/.agents/skills/`: Codex

심볼릭 링크이므로 `git pull`만 하면 skill이 최신 상태가 됩니다. skill을 추가한 뒤에는 스크립트를 다시 실행하세요.

## 저장소 구조

```
product-craft/
├── install.sh
└── skills/
    └── spec/
        ├── SKILL.md
        └── references/spec-template.md
```

skill을 추가하려면 `skills/<name>/SKILL.md`를 만들고 frontmatter에 `name`과 `description`을 적습니다. 긴 참고 자료는 `references/`에 두고, 언제 읽어야 하는지 SKILL.md에 적어 주세요.

## 라이선스

[MIT](LICENSE)
