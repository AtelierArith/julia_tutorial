# Cthulhu.jl を触る。

# 環境セットアップ

```console
$ julia --project=@. -e 'using Pkg; Pkg.instantiate()'
```

`Pkg.add("Cthulhu")` でも良い。

# mylib.jl 内部にある main1() 調査。

`main1()` は型不安定な実装. まずは `julia` で REPL を起動する:

```console
$ julia
               _
   _       _ _(_)_     |  Documentation: https://docs.julialang.org
  (_)     | (_) (_)    |
   _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 1.9.1 (2023-06-07)
 _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
|__/                   |

julia>
```

次に先ほど開いた REPL で以下を実行する:

```julia
julia> using Cthulhu
julia> include("mylib.jl")
julia> N = 100000
julia> @descend main1()
```

怠け者は下記を実行するとよい.

```julia
julia> include("descend_main1.jl")
```

何にせよ次のような出力を得る

```
[ Info: This method only fills in default arguments; descend into the body method to see the full source.
46 function main1(N=10)::Any
Select a call to descend into or ↩ to ascend. [q]uit. [b]ookmark.
Toggles: [w]arn, [h]ide type-stable statements, [t]ype annotations, [s]yntax highlight for Source/LLVM/Native.
Show: [S]ource code, [A]ST, [T]yped code, [L]LVM IR, [N]ative code
Actions: [E]dit source code, [R]evise and redisplay
 • %1 = < constprop > main1(::Core.Const(10))::Any
```

一度 Enter キーを押す (迷子になったら `Ctrl-C` または `q` で戻る).

```
46 function main1(N::Int64=10)::Any
47     rng::MersenneTwister = MersenneTwister::Type{MersenneTwister}(0)::MersenneTwister
48     s::Float64 = 0.0::Float64
49     arr::Union{Vector{Float64}, Vector{Int64}, Vector{Real}} = [relu1(2rand(rng) - 1) for _ in (1:N::Int64)::UnitRange{Int64}::Base.Generator{UnitRange{Int64}, var"#3#4"{MersenneTwister}}]::Union{Vector{Float64}, Vector{Int64}, Vector{Real}}
50     for y::Real in arr::Union{Vector{Float64}, Vector{Int64}, Vector{Real}}::Union{Nothing, Tuple{Real, Int64}}
51         # s = s + y
52         (s::Any += y::Real)::Any
53     end
54     s::Any
55 end
Select a call to descend into or ↩ to ascend. [q]uit. [b]ookmark.
Toggles: [w]arn, [h]ide type-stable statements, [t]ype annotations, [s]yntax highlight for Source/LLVM/Native.
Show: [S]ource code, [A]ST, [T]yped code, [L]LVM IR, [N]ative code
Actions: [E]dit source code, [R]evise and redisplay
 • MersenneTwister::Type{MersenneTwister}(0)
    1:N::Int64
   relu1(2rand(rng) - 1) for _ in (1:N::Int64)::UnitRange{Int64}
   [relu1(2rand(rng) - 1) for _ in (1:N::Int64)::UnitRange{Int64}::Base.Generator{UnitRange{Int64}, var"#3#4"{MersenneTwister}}]
    y::Real in arr::Union{Vector{Float64}, Vector{Int64}, Vector{Real}}
   runtime s::Any += y::Real
   %20 = call → iterate(::Union{Vector{Float64}, Vector{Int64}, Vector{Real}},::Int64)::Union{Nothing, Tuple{Real, Int64}}
   ↩
```

`w` や `h` によって型不安定な部分を表示・ハイライトすることができる。

# mylib.jl 内部にある main３() 調査。

`main3()` は型安定な実装。 同様の操作で探掘してみよ。 上昇負荷は無いので安心されたし.
