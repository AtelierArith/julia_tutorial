# Debugger.jl

REPL を開いて下記をコピペする．

```julia
using Debugger
include("mylib.jl")
@enter main()
```

Replay による再生は次のようにすれば良い:

```console
$ julia --project script.jl
```
