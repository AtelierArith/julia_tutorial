# REPL でタイムテーブルを眺めるツール

## 初回実行

```console
$ julia --project -e 'using Pkg; Pkg.instantiate()'
```

## 次回以降

スケジュール表を見る

```console
$ julia table.jl
```

```console
$ julia table.jl <番号>
```

講演者に紐づいているアンカーの番号を指定する．番号はスケジュール表を確認する．`0` はチュートリアル講演．負の値など対応していない値がくるとスケジュール表の表示にフォールバックする．

