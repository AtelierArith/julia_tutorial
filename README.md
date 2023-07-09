# julia_tutorial

Julia 1.9 系で動作を確認しております．

## セットアップ

```console
$ git clone https://github.com/AtelierArith/julia_tutorial.git
$ cd julia_tutorial
$ julia --project=@. -e 'using Pkg; Pkg.instantiate()'
```

上記の 3 行は 1 回すれば良い.

# demos

- [demos/README.md](demos/README.md) の説明を読んでください．

# Page

## デプロイ済みのページ

https://atelierarith.github.io/julia_tutorial/

## ローカルでの表示

```console
$ make web
```

個々のスライドを表示する場合は次のようにする:

```console
$ cd slideshow/tutorial_part1
$ julia --project -e 'using Pkg; Pkg.instantiate()'
$ julia --project make.jl
```

もう一つターミナルを開いて次を実行する．

```console
$ cd slideshow/tutorial_part1
$ julia --project -e 'using LiveServer; serve(dir="build")' 
```

`localhost:8000` に移動する．


# ライセンス

- 個人の学習のために使用することができます．
- 営利目的で本資料の利用・組織内の勉強会で再配布することはご遠慮ください．としておきます．
  - どうしてもという場合はご一報いただけますと幸いです．
