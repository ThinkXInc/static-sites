#!/usr/bin/env bash
# 変更系: static-sites 内の HTML を GitHub Pages へ公開する
# 使い方: bash publish.sh
# やること: フォルダ内の変更を全て commit して main へ push し、各 HTML の公開 URL を表示する
# 前提: 直接実行する(source しない)。初回セットアップ(git init・gh repo create・Pages 有効化)済みであること
set -euo pipefail

cd "$(dirname "$0")"

git add -A
if git diff --cached --quiet; then
  echo "変更なし(公開済みの内容から差分がない)"
else
  git commit -m "publish: $(git diff --cached --name-only | tr '\n' ' ')"
  git push origin main
  echo "push 完了。公開反映まで 1〜2 分かかることがある"
fi

echo "公開 URL:"
found=0
for f in *.html; do
  [ -e "$f" ] || continue
  found=1
  enc=$(python3 -c 'import sys, urllib.parse; print(urllib.parse.quote(sys.argv[1]))' "$f")
  echo "  https://kazukiotsuka.github.io/static-sites/$enc"
done
if [ "$found" -eq 0 ]; then
  echo "  HTML ファイルがまだ無い。このフォルダに .html を置いてから再実行する"
fi
