#!/bin/bash
# SPDX-FileCopyrightText: 2025 zuiyuki-ctrl
# SPDX-License-Identifier: GPL-3.0-only

ng () {
        echo ${1}行目が違うよ
        res=1
}

res=0

### NORMAL INPUT ###
out=$(echo -e "Hello world\nThis is a test\nLine three" | ./textstats.py)
expected_lines=$(echo "$out" | grep "Lines:" | awk '{print $2}')
expected_words=$(echo "$out" | grep "Words:" | awk '{print $2}')
expected_chars=$(echo "$out" | grep "Characters:" | awk '{print $2}')
expected_bytes=$(echo "$out" | grep "Bytes:" | awk '{print $2}')

[ "${expected_lines}" = "3" ] || ng "$LINENO"
[ "${expected_words}" = "8" ] || ng "$LINENO"
[ "${expected_chars}" = "38" ] || ng "$LINENO"
[ "${expected_bytes}" = "38" ] || ng "$LINENO"

### EMPTY INPUT ###
out=$(echo "" | ./textstats.py)
expected_lines=$(echo "$out" | grep "Lines:" | awk '{print $2}')
[ "${expected_lines}" = "1" ] || ng "$LINENO"

### SINGLE LINE INPUT ###
out=$(echo "Hello" | ./textstats.py)
expected_lines=$(echo "$out" | grep "Lines:" | awk '{print $2}')
expected_words=$(echo "$out" | grep "Words:" | awk '{print $2}')
[ "${expected_lines}" = "1" ] || ng "$LINENO"
[ "${expected_words}" = "1" ] || ng "$LINENO"

### MULTILINE INPUT ###
out=$(seq 5 | ./textstats.py)
expected_lines=$(echo "$out" | grep "Lines:" | awk '{print $2}')
[ "${expected_lines}" = "5" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit $res

