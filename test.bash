#!/bin/bash
# SPDX-FileCopyrightText: 2025 zuiyuki-ctrl
# SPDX-License-Identifier: GPL-3.0-only
ng () {
        echo ${1}行目が違うよ
        res=1
}

res=0    

out=$(seq 5 | ./plus.py)
[ "${out}" = 15 ] || ng "$LINENO"

### NORMAL INPUT ###
out=$(seq 5 | ./plus.py)
[ "${out}" = 15 ] || ng "$LINENO"

### STRANGE INPUT ###
out=$(echo あ | ./plus.py)           #計算できない値を入力してみる
[ "$?" = 1 ]      || ng "$LINENO" #終了ステータスが1なのを確認
[ "${out}" = "" ] || ng "$LINENO" #この行と上の行は入れ替えるとダメです

out=$(echo | ./plus.py)              #なにも入力しない
[ "$?" = 1 ]      || ng "$LINENO" #これも異常終了する
[ "${out}" = "" ] || ng "$LINENO"
 
[ "${res}" = 0 ] && echo OK #通ったのが（人間に）分かるように表示
exit $res
