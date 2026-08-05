# claude_xuck

Claude Code 플러그인 모음. 지금은 하나 있다.

## plain-korean-reply

한국어로 답할 때 **짧고 평범한 문장**으로 쓰게 한다.

번역투("B가 더 아프다"), 짧게 쓰려고 지어낸 말("쟀습니다"), 표와 굵은 글씨 도배, 응답 코드 같은
기계 용어 노출, 묻지도 않은 작업 과정 늘어놓기를 막는다.

규칙 아홉 개 전문: [plugins/plain-korean-reply/references/rules.ko.md](plugins/plain-korean-reply/references/rules.ko.md)

### 설치

```
/plugin marketplace add wilgon456/claude_xuck
/plugin install plain-korean-reply
```

새 대화를 시작하면 적용된다. 끄려면 `/plugin uninstall plain-korean-reply`.

### 어떻게 동작하나

대화가 시작될 때 규칙을 컨텍스트에 자동으로 넣는다(`SessionStart` 훅). 공식
`explanatory-output-style` 플러그인과 같은 방식이다.

**스킬로 만들지 않은 이유**가 있다. 스킬은 불러야 본문이 열린다. 말투가 망가지는 건 평소 대화
전부에서 일어나는데 그때는 스킬이 열려 있지 않다. 규칙을 기억 파일이나 스킬에 적어 두면 결국
안 지켜진다.

### 취향에 맞게 고치기

규칙은 한 사람의 취향이다. 표를 좋아하면 2번을 지우면 된다. 고치는 방법은
[플러그인 README](plugins/plain-korean-reply/README.md)에 있다.

### Claude Code 전용이다

Codex·Grok·OpenCode 등에는 플러그인이 없다. 그 도구들에서는 `rules.ko.md`의 1~9번을 그 도구가
**매번 읽는 파일**에 붙여 넣으면 된다(`AGENTS.md`, 시스템 프롬프트 등). 불러야 열리는 곳에
두면 안 지켜진다.

## 라이선스

MIT. 가져다 쓰고 고쳐 쓰셔도 된다.
