#!/usr/bin/env bash
# 라온(계획안 피드백 앱)을 GitHub Pages용 완전한 웹페이지로 만든다.
# lesson-plan-feedback/index.html 은 claude.ai 아티팩트 형식(doctype·head 없음)이라,
# 배포할 때만 문서 머리말로 감싸 표준 모드로 렌더링되게 한다.
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
out="${1:-$root/_site}"
src="$root/lesson-plan-feedback/index.html"

mkdir -p "$out"
{
  printf '%s\n' \
    '<!doctype html>' \
    '<html lang="ko">' \
    '<head>' \
    '<meta charset="utf-8">' \
    '<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">' \
    '<meta name="description" content="모의수업 계획안 파일을 올리면 놀이중심 피드백 기준 6가지로 살펴보고 검토 보고서를 만들어 주는 라온">' \
    '</head>' \
    '<body>'
  cat "$src"
  printf '%s\n' '</body>' '</html>'
} > "$out/index.html"

echo "built $out/index.html"
