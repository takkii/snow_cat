[![License: Unlicense](https://img.shields.io/badge/license-Unlicense-blue.svg)](http://unlicense.org/)

### 暗号化・復号化ツール

[プロジェクト名: snow_cat]

[正式版: ゆきねこ]

```txt
フォルダ構成

neko
lib/snow.rb
nagakutu/version.rb

[動作環境]

Ruby 2.5.1 (確認済)
JRuby 9.2.0.0 (確認済)

WARNING: An illegal reflective access operation has occurred
...

※ jrubyで警告文が流れるのは、open-sslがnon-publicクラスにアクセスしているからです。
それでも、出力結果は変わりません。
```

> *それぞれの使い方*

[実行手順 ①]

```txt
 -------------------------------------------------------

 git clone http://www.nyasocom.site/takkii/snow_cat.git

 cd snow_cat

 ./neko

 ----------------------------------------------------- <
```

[実行手順 ②]

```txt
 > -----------------------------------------------------

 git clone http://www.nyasocom.site/takkii/snow_cat.git

 cd snow_cat 

 (例) ruby decrypt.rb アルゴリズム名 入力ファイル名 (Digest名)

 ./cat aes-256-cbc neko sha256

 -------------------------------------------------------
```

[出力抜粋]

```txt
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA3wtEsxpYyxX7CBKsCYxr
WR1BwAPp9HZuO2WtrnklGELg5aSrq4E4TyrfnF2NvpKGrg6NhCarTgCUlrt/Eksy
N0IgiW9j42ZpGKQEKtx9meg68LjL70OoiAIz3ItJhAKcWy1MgxSMQ9NAnnyUBMtd
UBp8+WaZNY32BwhRUepe1KdtmLq7vAmOJkRmcjQdTzLyCTG02qoBzZZOOlahbczg
lRu3pZdqtM96Pnh1nbIqWOT7fTgxu9PbFIDfL5rctj8RdwFhLakx0HXP6XGvFYuX
r2jgddfiKGCR6XGTS69H4bX6oHONNBALzvtb/2T6vwiw5wBihBUfqTGrtRoRy7Vo
3QIDAQAB
-----END PUBLIC KEY-----
```

*個人プロジェクト、Rubyで作るツールシリーズ*