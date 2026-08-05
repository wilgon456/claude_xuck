# plain-korean-reply

한국어를 한국어답게 쓰게 하는 플러그인. 두 가지가 들어 있다.

| | 무엇 | 언제 |
| --- | --- | --- |
| 출력 스타일 「한국어 평문」 | Claude가 **자기 답을** 짧고 평범하게 쓴다 | 깔면 자동, 매번 |
| `korean-polish` 스킬 | **내가 쓴 글**을 다듬어 준다 | 「다듬어줘」라고 할 때 |

규칙 아홉 개와 예시: [references/rules.ko.md](references/rules.ko.md)

## 설치

```
/plugin marketplace add wilgon456/claude_xuck
/plugin install plain-korean-reply
```

`/clear` 하거나 새 대화를 시작하면 적용된다. 출력 스타일은 시스템 프롬프트의 일부여서
Claude Code가 **대화 시작 때 한 번 읽는다.**

## 왜 출력 스타일인가

세 자리를 다 써 보고 정했다.

| 자리 | 어떻게 들어가나 |
| --- | --- |
| 스킬 | **불러야** 열린다. 평소 대화에는 안 들어간다 |
| `CLAUDE.md` | 시스템 프롬프트 **뒤에 붙는 사용자 메시지**. 대화가 길어지면 묻힌다 |
| **출력 스타일** | **시스템 프롬프트를 직접 바꾸고, 대화 중에도 계속 상기시킨다** |

공식 문서 : "All output styles trigger reminders for Claude to adhere to the output style
instructions **during the conversation**." 대화가 길어져도 묻히지 않는 이유다.

윤문은 반대다. **필요할 때만** 쓰는 기능이라 스킬이 맞다. 그래서 한 플러그인에 둘이 같이 있다.

## 설정 두 개를 이렇게 뒀다

- `keep-coding-instructions: true` — Claude Code의 기본 개발 지침을 **살려 둔다.** 이걸 빼면
  말투는 바뀌지만 코드 다루는 방식까지 사라진다. 우리는 말투만 바꾸는 것이다.
- `force-for-plugin: true` — 플러그인을 켜면 **사용자가 고르지 않아도 자동 적용**된다.
  직접 고르고 싶으면 이 줄을 지우고 `/config`에서 「한국어 평문」을 선택하면 된다.

## 파일

| 파일 | 역할 |
| --- | --- |
| `output-styles/plain-korean.md` | 실제로 적용되는 규칙. **고칠 곳은 여기** |
| `references/rules.ko.md` | 같은 규칙의 사람이 읽는 설명본 |
| `skills/korean-polish/SKILL.md` | 윤문 스킬 |

## 규칙을 고친 뒤

`output-styles/plain-korean.md`를 고치고 `/clear` 하거나 새 대화를 시작하면 된다. 만들거나
검사할 게 없다.

프론트매터(`---` 사이)의 `name`·`description`은 `/config` 목록에 뜨는 이름이다. 지우면 파일
이름이 스타일 이름이 된다.

## 내 컴퓨터에만 쓰고 싶으면

플러그인 없이도 된다. `output-styles/plain-korean.md`를 `~/.claude/output-styles/`에 복사하고
`/config`에서 고르면 끝이다.
