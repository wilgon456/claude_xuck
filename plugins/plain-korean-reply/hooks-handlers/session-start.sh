#!/usr/bin/env bash

# 대화가 시작될 때 한국어 답변 규칙을 컨텍스트에 넣는다.
#
# 규칙 본문을 이 스크립트에 직접 적지 않고 옆 JSON 파일을 그대로 내보낸다.
# 한국어 여러 줄을 셸 안에서 JSON으로 감싸면 줄바꿈·따옴표 탈출을 손으로 맞춰야 하고,
# 한 글자만 틀려도 훅이 조용히 무시된다.

cat "${CLAUDE_PLUGIN_ROOT}/hooks-handlers/context.json"
exit 0
