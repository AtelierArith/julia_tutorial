
class: middle, center






# チュートリアル講演






## Julia 入門 (予習資料)


`Satoshi Terasaki @ AtelierArith`


---






# この資料について


  * この資料は何？
  * [数学と物理におけるJuliaの活用](https://akio-tomiya.github.io/julia_imi_workshop2023/) でのチュートリアル講演資料です．
  * [piever/Remark.jl](https://github.com/piever/Remark.jl) を使って Markdown 原稿をスライドとして表示させています.


```
更新日: 2023-07-06T03:04:55.101
```


お勉強会資料はこちら `TODO 後で追記`


---


class: middle, center






# Julia のインストール


---




# Julia のインストール


  * 要するに `julia` というコマンドが利用できれば良い．


```julia
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


  * すでに使える人はスキップする






### 素直な方法


  * Julia の公式サイトから入手 https://julialang.org/downloads/ 移動し[各自の環境に合わせて導入](https://julialang.org/downloads/platform/)


---






### それはそうだが


  * 任意の人間が「各自の環境に合わせて導入してください」ができれば苦労しない
  * 各自の環境が何とか, 環境変数とかパスを通すとか
  * バージョンが上がる度に手動でインストールしたいか?


--






### そんなあなたに Juliaup


<iframe width="45%" height="45%" src="https://www.youtube.com/embed/14zfdbzq5BM" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>


---






# [Juliaup - Julia version manager](https://github.com/JuliaLang/juliaup) を使う方法 (1)






## Windows


パワーシェルを開く．


```powershell
PS> winget install julia -s msstore
```


[Windows アプリケーションから](https://apps.microsoft.com/store/detail/julia/9NJNWW8PVKMN?hl=ja-jp&gl=jp) も入手ができる


<iframe width="30%" height="30%" src="https://www.youtube.com/embed/rFlbjWC6zYA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>


---






# [Juliaup - Julia version manager](https://github.com/JuliaLang/juliaup) を使う方法 (2)


[juliaup/deploy/shellscript /juliaup-init.sh](https://github.com/JuliaLang/juliaup/blob/main/deploy/shellscript/juliaup-init.sh) を叩いている．






## Mac and Linux


```bash
$ curl -fsSL https://install.julialang.org | sh
$ source ~/.bashrc
$ julia --version
julia version 1.9.1
```


`--yes` オプションを使えば途中の対話操作を省略し進めることができる. [command-line-arguments](https://github.com/JuliaLang/juliaup#command-line-arguments) をみよ．


```bash
$ curl -fsSL https://install.julialang.org | sh -s -- --yes
```


---






# 動作確認


インストールができたと仮定して進める．`julia` というコマンドを使うことができるか確認をする．


```console
$ julia --version
julia version 1.9.1
```


何も指定しない場合 REPL(Read-Eval-Print Loop) が起動する．


```julia
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


---






# Julia を動かす (REPL)


`versioninfo()` を使うと詳細な情報を得ることができる．バグレポートなどに添付すると良い．


```julia
$ julia
               _
   _       _ _(_)_     |  Documentation: https://docs.julialang.org
  (_)     | (_) (_)    |
   _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 1.9.1 (2023-06-07)
 _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
|__/                   |

julia> versioninfo()
Julia Version 1.9.1
Commit 147bdf428cd (2023-06-07 08:27 UTC)
Platform Info:
  OS: macOS (x86_64-apple-darwin22.4.0)
  CPU: 16 × Intel(R) Core(TM) i9-9900K CPU @ 3.60GHz
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-14.0.6 (ORCJIT, skylake)
  Threads: 1 on 16 virtual cores
Environment:
```


---






# Appendix: Juliaup 以外の選択肢


  * [abelsiqueira/jill](https://github.com/abelsiqueira/jill)

      * jill - Julia Installer 4 Linux - Light
  * [johnnychen94/jill.py](https://github.com/johnnychen94/jill.py)
