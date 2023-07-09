# VS Code の統合ターミナルで遊ぶ

- VS Code 1.80 から統合ターミナルで画像を表示できるようになりました．
  - https://github.com/microsoft/vscode/releases/tag/1.80.0

例えば下記のコードを VS Code の統合ターミナル内で起動した Julia REPL へコピーアンドペーストします:

```julia
using FileIO, Sixel, Plots
gr()
buf = IOBuffer()
show(buf, MIME("image/png"), plot(sin, size=(500, 300)))
buf |> load |> sixel_encode
```

サインカーブが表示されるはずです．

次の例はマンドリルが表示されるはずです．

```julia
using ImageInTerminal
using TestImages

testimage("mandril_color")
```
