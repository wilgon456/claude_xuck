# plain-korean-reply

한국어로 답할 때 짧고 평범한 문장으로 쓰게 하는 플러그인. 규칙 전문은
[references/rules.ko.md](references/rules.ko.md).

## 설치

```
/plugin marketplace add wilgon456/claude_xuck
/plugin install plain-korean-reply
```

## 파일

| 파일 | 역할 |
|---|---|
| `references/rules.ko.md` | 규칙 원본. 고칠 곳은 여기 |
| `hooks-handlers/context.json` | 훅이 내보내는 것. 위 파일에서 만든다 |
| `hooks-handlers/session-start.sh` | JSON을 그대로 내보낸다 |

규칙을 셸 스크립트에 직접 적지 않았다. 한국어 여러 줄을 셸에서 JSON으로 감싸면 줄바꿈·따옴표
탈출을 손으로 맞춰야 하고 **한 글자만 틀려도 훅이 조용히 무시된다.**

## 규칙을 고친 뒤

```bash
cd plugins/plain-korean-reply
python - <<'PY'
import io, json, re
src = io.open("references/rules.ko.md", encoding="utf-8").read()
body = re.sub(r"\*\*", "", src.split("---\n\n## 이 규칙은")[0].rstrip())
ctx = ("당신은 plain-korean-reply 모드다. 사용자에게 한국어로 답할 때 아래 규칙을 지킨다.\n\n"
       + body + "\n\n(코드 주석·커밋 메시지·문서 파일에는 정확한 기술 용어를 쓴다. "
       "위 규칙은 사람에게 보내는 답에만 적용한다.)")
out = {"hookSpecificOutput": {"hookEventName": "SessionStart", "additionalContext": ctx}}
io.open("hooks-handlers/context.json", "w", encoding="utf-8", newline="\n").write(
    json.dumps(out, ensure_ascii=False, indent=2) + "\n")
PY
CLAUDE_PLUGIN_ROOT="$PWD" bash hooks-handlers/session-start.sh | python -m json.tool > /dev/null && echo OK
```

마지막 줄이 검사다. `OK`가 안 나오면 훅이 조용히 무시되므로 고칠 때마다 한 번 돌려 본다.
