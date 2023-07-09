# 05

`include("mylib.jl")`, もっと一般にパッケージ内のファイルを変更する度に Julia のセッションを再起動するのは効率が悪い．そこで Revise.jl を使うことにする．

```console
$ julia --project script.jl
```
