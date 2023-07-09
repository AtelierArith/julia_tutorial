# 04

試行錯誤すると同じことを繰り返すのが苦痛になってくる．そこで `mylib.jl` というファイルに準備のためのコードを書いておいてそれを読み込んだ後から作業を開始しよう．

```julia
julia> include("mylib.jl")
main (generic function with 1 method)

julia> main()
"私は mylib.jl の中にいる関数です"

julia>
```

`mylib.jl` を次のように `-L` オプションの引数に指定しても良い：

```console
$ julia -L mylib.jl
               _
   _       _ _(_)_     |  Documentation: https://docs.julialang.org
  (_)     | (_) (_)    |
   _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 1.9.1 (2023-06-07)
 _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
|__/                   |

julia> main()
```

`-L` の代わりに `--load` でも良い.

```console
$ julia --project script.jl
```
