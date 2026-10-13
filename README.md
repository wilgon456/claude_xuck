<div align="center">

![Plain Korean Replies](docs/readme-banner.svg)

# Plain Korean Replies

A Claude Code plugin for short, natural Korean answers and careful prose editing.

**English** · [한국어](README.ko.md)

![project: plugin](https://img.shields.io/badge/project-plugin-fb923c?style=flat-square) ![stack: Claude Code](https://img.shields.io/badge/stack-Claude%20Code-fb923c?style=flat-square) [![License](https://img.shields.io/badge/license-MIT-fb923c?style=flat-square)](LICENSE)

[Install](#install) · [Examples](#examples) · [Customize](#customize)

</div>

---

## Why this exists

Korean replies can become stiff, translated-sounding or full of unexplained technical terms. `plain-korean-reply` adds an output style that asks Claude Code to answer plainly, lead with the result and explain what a concept actually does.

The rules intentionally reflect one person's writing preferences. You can edit them to match yours.

## Install

Run these commands inside **Claude Code**:

```text
/plugin marketplace add wilgon456/claude_xuck
/plugin install plain-korean-reply
```

Start a **new conversation** to use the plugin. Existing conversations do not pick it up automatically.

To remove it:

```text
/plugin uninstall plain-korean-reply
```

## Two ways to use it

| Component | Use |
| --- | --- |
| Output style | Guides everyday Korean replies without invoking a skill |
| Editing skill | Revises your own reports, messages, emails and proposal copy when requested |

The editing workflow returns the revised text first and explains the edits afterward. It preserves numbers, dates, proper names and the intended level of politeness.

## Examples

These pairs are intentionally in Korean: the plugin changes **Korean writing**, not the language of your code.

| Before | After |
| --- | --- |
| “멱등성을 보장합니다” | “두 번 눌러도 한 번만 처리됩니다” |
| “캐시를 무효화합니다” | “저장해 둔 것을 버려서 다음에 새로 가져옵니다” |
| “처리 완료되었습니다” | “끝났습니다” |
| “코드 30이 떴습니다” | “우리 열쇠로는 그 자료가 안 열립니다” |

## Writing rules

1. Keep replies short and check whether five sentences are enough.
2. Use tables for real comparisons and avoid excessive bold text.
3. Lead with the conclusion; give the investigation when requested.
4. Explain what happens instead of only naming a difficult concept.
5. Explain failures in human terms rather than copying error codes alone.
6. Avoid bureaucratic phrasing.
7. Avoid English sentence structures dressed in Korean words.
8. Avoid invented words.
9. Avoid decorative jargon from mathematics, economics or formal Chinese-derived vocabulary.
10. Acknowledge a correction briefly and provide the corrected answer.
11. Read the reply aloud to check whether it sounds natural.

Read the full Korean rules and examples in [rules.ko.md](plugins/plain-korean-reply/references/rules.ko.md).

## Customize

Edit [plain-korean.md](plugins/plain-korean-reply/output-styles/plain-korean.md), then run `/clear` in Claude Code. The output style keeps the default coding instructions through `keep-coding-instructions`; it changes prose guidance.

For other agents, reuse the rules in an instruction file that the agent reads on every conversation, such as `AGENTS.md` or its system prompt. The packaged plugin itself is for Claude Code.

## License

[MIT](LICENSE). Adapt the rules freely.
