# REPL で動かして遊ぶ Julia

# ディレクトリ構造

大まかに次のような構造になっています:

```console
$ tree -d
.
├── 01_versioninfo
├── 02_println_hello
├── 03_repl
├── 04_include
├── 05_revise
├── 06_debugger
├── 07_codemacros
└── 08_benchmark
```

各々のディレクトリには Replay.jl v0.4 を用いてあらかじめ指定した命令（文字列）を REPL に送りそれを実行した結果を逐次表示します。

ユーザは各ディレクトリに移動して `julia script.jl` を実行することを期待します。例えば `01_versioninfo` を試すためには次のようにします。

```console
$ julia --project -e 'using Pkg; Pkg.instantiate()' # 初回だけ
$ cd 01_versioninfo
$ julia --project script.jl
```

# 制限事項

技術的な制約のため Windows 上では動作をしません。WSL など Linux の環境では動くはずです。普段は CPU が Intel の macOS マシンで開発しています。
