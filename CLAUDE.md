static-sitesは簡易的なwebページの公開のためのレポジトリ

### ディレクトリ構造
原則的に {name}.htmlが static-sites/直下に置かれる

### 記録
static-sites/docs内にfindings, DECISIONS, GUIDELINES, discussionsが置かれる．
各ファイルの役割と記録の方法はthinkx-system/CLAUDE_GENERAL.mdなどを参照

### 公開手順
オーナーがhtmlを置いて「公開して」などと号令をかければ
Claudeが`bash publish.sh`を実行し
https://thinkxinc.github.io/static-sites/{name}.html
として公開される

### セキュリティ
アクセス権限はURLを知っているか人のみがアクセスできるというシンプルな方法で制限される
