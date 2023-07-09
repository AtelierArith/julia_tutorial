# 07

## script1.jl

`@code_lowered, @code_typed, @code_llvm, @code_native` マクロを動かす

```console
$ julia --project script1.jl
```

## script2.jl

型不安定な `main1` 関数と型安定な `main3` 関数の違いを `code_warntype` マクロから眺めることにする．

```console
$ julia --project script2.jl
```
