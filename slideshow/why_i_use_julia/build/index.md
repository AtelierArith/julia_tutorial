
class: middle, center






# チュートリアル講演






## Julia 入門 ( Why I use Julia )


`Satoshi Terasaki @ AtelierArith`


---






# この資料について


  * この資料は何？
  * [数学と物理におけるJuliaの活用](https://akio-tomiya.github.io/julia_imi_workshop2023/) でのチュートリアル講演資料で（時間的な制約で）話せなさそうなことを書いたもの
  * [piever/Remark.jl](https://github.com/piever/Remark.jl) を使って Markdown 原稿をスライドとして表示させています.


```
更新日: 2023-07-09T13:37:17.663
```


お勉強会資料はこちら `TODO 後で追記`


---






# ここでの Julia とは


  * プログラミング言語の一つ
  * 2012 年 [Why We Created Julia](https://julialang.org/blog/2012/02/why-we-created-julia/) に発表. 開発は 2009 年ごろから.

      * [Jeff Bezanson](https://github.com/JeffBezanson/), [Stefan Karpinski](https://karpinski.org/), [Viral B. Shah](https://github.com/ViralBShah/), and [Alan Edelman](https://math.mit.edu/~edelman/)
      * 冒頭で `In short, because we are greedy.` とあるように既存のプログラミング言語の良いところを取り入れた言語
  * 個人的に好きな箇所

      * `We want the speed of C with the dynamism of Ruby`
      * `We want something as usable for general programming as Python`
      * `Something that is dirt simple to learn, yet keeps the most serious hackers happy.`
      * `(Did we mention it should be as fast as C?)`
  * 要するに

      * 高級言語のように使いやすく計算機の上で高速に動作する
      * 素早く速いコードを書くことができる


---






# Why We Use Julia, 10 Years Later


  * 2022 年は 10 周年記念 🎉 [Why We Use Julia, 10 Years Later](https://julialang.org/blog/2022/02/10years/) が公開

      * [JuliaLang/www.julialang.org](https://github.com/JuliaLang/www.julialang.org/tree/main) リポジトリで管理されている.
      * [この原稿](https://github.com/JuliaLang/www.julialang.org/blob/main/blog/2022/02/10years.md) にみんなが集まって書いたもの.

          * 例: miguelraz さんの [Pull Request](https://github.com/JuliaLang/www.julialang.org/pull/1646) など
  * Julia というプログラミング言語に出会ったきっかけが紹介されている

      * [Why We Created Julia](https://julialang.org/blog/2012/02/why-we-created-julia/) を読んでソースをビルドした
      * 同僚，職場，講義で出会った
      * C/C++/Fortran は難しい..., Python は簡単に使えるけれど遅い...
      * 気づいたら特定のパッケージのメンテナになっていた


---






## Star History


[![Star History Chart](https://api.star-history.com/svg?repos=JuliaLang/julia&type=Date)](https://star-history.com/#JuliaLang/julia&Date)


---






# Why 私 Use Julia, 10 Years Later (1)


  * 子供の時から式は立てられるんだけれど，代入の時点で計算をミスる．字が汚かったの．許して．
  * 線形代数の講義で $n$行$n$列の行列 $X\in\mathrm{Mat}_{n, n}(\mathbb{R})$ の行列式 $\det X$ where $n=2,3,4$ が手計算できず泣いた．

      * 対称群 $\frak{S}_n$ を使った定義式と余因子による方法しか教えてくれなかった鬼
  * どうやらコンピュータで計算ができるらしいぞ？大学の夏の集中講義 で C++ (実質 C 言語) を履修

      * 手元の Windows でビルドってどうするんだ？

          * [小林 健一郎, これならわかるC++ : 挫折しないプログラミング入門](https://iss.ndl.go.jp/books/R100000002-I000002989852-00) を買って bcc を入れた記憶
      * コンパイルエラーが出て辛い．時間が溶ける．なんとか単位は取れた
      * あれ？💡 コード書く時間で数学できるじゃん?
      * 将来は絶対プログラムを書く仕事をしない!!! と誓う (Remark: 学生時代の話です)


---






# Why 私 Use Julia, 10 Years Later (2)


  * 専門課程に入って抽象論を扱う講義が増えていく

      * あれ ? 💡 講義で必要な知識身につけて演習の時間で証明をあーだこーだと考えればいいのでは？
      * 紙と鉛筆さえ持っていれば生活できるんじゃない ?
      * [GRAPES](https://www.criced.tsukuba.ac.jp/grapes/) で印刷したグラフをレポートに書いたら TA から「これぐらい手でかけ」と怒られる
      * え?! $\LaTeX$ ってのがあるの? 最高じゃん! これだけ知ってればいいや♪ (堕落への道)
  * ベンチャー企業の就職説明会へ参加

      * 私: 「色々あって人生が疲れていて就活しています．プログラムわからないんですけれどいいですか？ 」
      * 社長:「いいよ！」私: 「やった！」
  * 社会人の私

      * 会社の先輩「こんにちは，あなたはソフトウェア技術者として働いてもらいます．これは C++ のコードです．設計書はありません．高速化してください．」
      * 私「どーーーーーしてだよぉぉぉぉぉぉぉ」


---






# Why 私 Use Julia, 10 Years Later (3)


  * 社会人の私

      * 読めない．そして何が書いてあるのかわからない(つらい)
      * 動かせない．どこか間違っているとビルドができない(つらい)
      * 自分が書いたものが理解できない．式とコードの対応ができない(つらい)
      * どう実装すればいいのかわからない(つらい)
      * もうダメかもしれない(つらい)
  * 機械学習ってのが流行ってるらしい．

      * Python ってのがあるらしい．ライブラリってのがあるらしい．
      * ファイルからデータを読み込んでグラフも書けるらしい．
      * [ITエンジニアのための機械学習理論入門](https://gihyo.jp/book/2015/978-4-7741-7698-7) をする．

          * 社員「ごめん, 最小二乗法の時点で数式わからない」
          * 私「わかりました．勉強会中止します(どーーーーーしてだよぉぉぉぉぉぉぉ)」


---






# Why 私 Use Julia, 10 Years Later (4)


  * 人生，辛さしかない．それでも生きていくしかない
  * (2016 年の時点で)自分にとって快適な仕事道具を探したい. こんな感じのものはないのか？

      * インストールが簡単にできて
      * 自分そして他人(未来の自分)にも読みやすく
      * データを読み込む操作が簡単で，分析，データの可視化ができて
      * ベクトル，行列，もっと一般に多次元配列を簡単にセットアップできて
      * 大学の数学で学んだ話を元に数学的な概念を表記でき
      * Windows, macOS, Linux で動作し
      * 趣味に限らず本業での使用に耐えうる汎用性を持っていて
      * 事前にコンパイルせず動作し，試行錯誤しやすい
      * Jupyter Notebook ってやつで動かせる
      * そして高速に実行できる
  * Python かな? 速度は Cython, Numba ってやつでなんとかなるかも！


---






# Why 私 Use Julia, 10 Years Later (5)


  * SNS で Julia を知る

      * いつからかは忘れたけれど [Julia 0.6 Release Announcement](https://julialang.org/blog/2017/06/julia-0.6-release/) が 27 June 2017 なのでそのあたり
      * [どうやら Ising 模型ってのがあるらしいぞ](https://twitter.com/MathSorcerer/status/953210293580005376?s=20)
      * 自分が勉強した範囲内では Julia の実行速度を超えることができなかった.
  * 円周率 $\pi$ を `\pi + <TAB>` で入力できる
  * ゼータ関数 $\zeta(s)\vert_{s=2}$ を `julia> using SpecialFunctions; ζ(s) = zeta(s); ζ(2)` で表記できる
  * 自分が求めたものはこれでは???
  * 開発者に数学や物理のバックグラウンドの方が多くいらっしゃる
  * 仕事で使えないだろうか?(やる気が出る)


---






# Why 私 Use Julia, 10 Years Later (6)


  * [Announcing the release of Julia 1.0](https://julialang.org/blog/2018/08/one-point-zero/)
  * 当時の感想

      * Jupyter は使える(よっしゃ)
      * どうやらオブジェクト指向じゃないっぽい. 多重ディスパッチってなんで必要なんだ？
      * ライブラリのインストールに失敗する
      * Python にあったあの機能が欲しい
      * `using Plots` とか `using Flux` がすごい時間がかかる (TTFX 問題)

          * カーネルの再起動で試行錯誤で思考が止まる.
          * 確かに*速い*けれど Python で書いた方が*早い*.
      * 辛くて．諦めた． Back to the Python を宣言. とはいえ Julia は気になる


---






# Why 私 Use Julia, 10 Years Later (7)


  * なんとか少なくとも自分が快適に使えるようにしよう
  * 懸念点を突っ込まれたらコレですと指し示すリソースを作っていった
  * 環境構築を簡単にしたい
  * 他言語との連携
  * 簡単な数学をプログラミングで表現する方法から作っていこう
  * Issue にバグレポートを投稿，同じ現象で困ってる人がいたら助言する
  * 知見を個人の技術ブログを書いていく

      * 職場ではどうせ自分以外使ってないんだし，公開しても知財に影響はないだろう．
      * 今後数年間生きれる保証がどこにもなかったためもある
  * グラフや画像データを表示するのが楽しくなってくる
  * Julia 1.6 が出てインストールが作業が快適になった
  * Franklin.jl が楽しい


---






# Why 私 Use Julia, 10 Years Later (8)


  * なんとなく Julia がわかってきた
  * 今までは人様のライブラリを使うだけだったが，作る側に回れた
  * 作る側の大変さを知る
  * 日本語の解説書が出てくるようになった
  * 仕事で使いたい．でも使う機会が無い (´・ω・｀)
  * 物理的な近さで同じ境遇の人（＝価値観を理解する人）がいない (´・ω・｀)
  * PyCall.jl でもなんでもいいから Python のライブラリを Julia で使えるように整備するツールを書く
  * 仕事で使おうとしても TTFX 問題で自分自身がストレス溜まる
  * ここまでで何回か心が折れる


---






# Why 私 Use Julia, 10 Years Later (9)


  * Julia 1.8 が出て使いやすくなってきた
  * GomalizingFlow.jl のデビュー
  * 研究者の楽しさ辛さがなんとなくわかってきた
  * Julia なんとなくわかってきた
  * 一方でお生活できる程度に金も欲しい(´・ω・｀)
  * PythonCall.jl が便利


---






# Why 私 Use Julia, 10 Years Later (10)


  * Juila 1.9 からリリース

      * TTFX 問題が改善される !!!
  * Pluto.jl が使いやすくなった
  * デバッグまわりのツールが増えてきた
  * 鈍器と呼ばれる 実践Julia入門， Julia大全が登場してきた
  * いろんな本が今年は出版されるらしい


---






# 時代は Julia なのでは？






## そこで[チュートリアル講演](https://akio-tomiya.github.io/julia_imi_workshop2023/) です


概要: ライトユースにも使いたい、けれどもそれで高速性を犠牲にしたくない。総合的に開発できるものにしたい。超初心者にも習得は容易でありながら、ハッカーの満足にも応えられるものがほしい。」そういった願いからプログラミング言語 Julia が誕生しました。直近では v1.9 がリリースされ、長年課題であったパッケージの読み込み時間の短縮など、開発体験の改善が行われました。さらに和書の入門書も充実してきており、学習を始めるには絶好のタイミングといえるでしょう。本チュートリアル講演では Julia の入門として 


1. インストールと基本的な使い方 (<– このスライドの担当箇所)
2. 型と多重ディスパッチ
3. スレッド並列の基礎


3 つのトピックを解説します。この機会に Julia に入門し、新しい体験を始めてみませんか。


---


class: middle, center






# 以上

