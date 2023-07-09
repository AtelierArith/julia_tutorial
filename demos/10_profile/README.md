# 10

- プロファイルを取得する．`svg` ファイルとして出力しどの部分に時間を取られているか確認することができる．

```console
$ julia --project script.jl
```

- これで `main1` 関数のプロファイルを `main1.svg` として取得できる. `main3` についても同様．`main1` 関数は型不安定な実装になっており赤色バーが目立つ．何回も呼び出される箇所が赤色だとパフォーマンスに対して悪い影響を及ぼす．ポジティブな見方をすれば高速化の余地がそこにあるはず．

