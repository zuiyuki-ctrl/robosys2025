# robosys2025

for robot system class

## 概要

このリポジトリには、標準入出力を使用するコマンドラインツールが含まれています。

## コマンド一覧

### plus.py

標準入力から数値を読み込み、それらの合計を計算して標準出力に出力するコマンドです。

#### 使用方法

```bash
seq 5 | ./plus.py
```

この例では、1から5までの数値の合計（15）が出力されます。

#### 例

```bash
$ seq 5 | ./plus.py
15
```

### textstats.py

標準入力からテキストを読み込み、統計情報（行数、単語数、文字数、バイト数）を標準出力に出力するコマンドです。

#### 使用方法

```bash
echo -e "Hello world\nThis is a test" | ./textstats.py
```

または、ファイルから読み込む場合：

```bash
cat file.txt | ./textstats.py
```

#### 出力形式

```
Lines: <行数>
Words: <単語数>
Characters: <文字数>
Bytes: <バイト数>
```

#### 例

```bash
$ echo -e "Hello world\nThis is a test\nLine three" | ./textstats.py
Lines: 3
Words: 8
Characters: 38
Bytes: 38
```

#### 使用例

- ログファイルの統計情報を取得する
- テキストファイルのサイズや内容を確認する
- パイプラインでテキスト処理の前後に統計を取得する

## テスト

各コマンドには対応するテストスクリプトが用意されています：

- `test.bash`: `plus.py`のテスト
- `test_textstats.bash`: `textstats.py`のテスト

テストを実行するには：

```bash
./test.bash
./test_textstats.bash
```

## ライセンス

このプロジェクトはGNU General Public License version 3 (GPL-3.0)の下で公開されています。
詳細は`COPYING`ファイルを参照してください。

## 著作権

Copyright (C) 2025 zuiyuki-ctrl
