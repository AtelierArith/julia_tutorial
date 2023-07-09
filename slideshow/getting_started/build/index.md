
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
更新日: 2023-07-09T01:57:43.605
```


お勉強会資料はこちら `TODO 後で追記`


---


class: middle, center






# Julia のインストール






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






# Appendix: Julia 自体のアップデート


  * [Julia v1.9.2 has been released](https://discourse.julialang.org/t/julia-v1-9-2-has-been-released/101229) というアナウンスが出ました．
  * Juliaup 経由で入れていると次のような通知が出るはずです．


```console
$ julia
The latest version of Julia in the `1.9` channel is 1.9.2+0.x64.apple.darwin14. You currently have `1.9.1+0.x64.apple.darwin14` installed. Run:

  juliaup update

to install Julia 1.9.2+0.x64.apple.darwin14 and update the `1.9` channel to that version.
```


  * [Julia’s Release Process](https://julialang.org/blog/2019/08/release-process/)


---






# Appendix: Juliaup 以外の選択肢


  * [abelsiqueira/jill](https://github.com/abelsiqueira/jill)

      * jill - Julia Installer 4 Linux - Light
  * [johnnychen94/jill.py](https://github.com/johnnychen94/jill.py)
  * [Docker](https://www.docker.com/) を用いて `docker run -it --rm julia:1.9.1` のようにしてコンテナを起動する

