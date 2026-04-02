#!/usr/bin/env bash
# Claude Code Study — 一键构建 + 推送到 Vercel
set -e

export PATH="$HOME/Library/pnpm:$PATH"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$REPO_DIR"

echo "🔍 检查改动..."
if git diff --quiet && git diff --cached --quiet; then
  # 即便源文件未变，也检查 doc_build 是否过期
  echo "   源文件无改动，直接执行构建..."
fi

echo "📦 构建中..."
pnpm run build

echo "📝 提交..."
git add -A

if git diff --cached --quiet; then
  echo "✅ doc_build 与上次相同，无需推送"
  exit 0
fi

# 生成 commit message：列出改动的 md 文件
CHANGED=$(git diff --cached --name-only | grep "docs/" | sed 's|docs/guide/||;s|.md||' | tr '\n' ', ' | sed 's/,$//')
MSG="docs: rebuild"
[ -n "$CHANGED" ] && MSG="docs: update ${CHANGED}"

git commit -m "$MSG"

echo "🚀 推送到 GitHub..."
git push origin main

echo ""
echo "✅ 部署完成！Vercel 将在 ~30 秒内完成更新"
echo "   网站: https://claude-code-study.vercel.app"
